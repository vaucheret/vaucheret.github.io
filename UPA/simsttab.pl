/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Simsttab -- Simplistic school time tabler
   Copyright (C) 2005-2022 Markus Triska triska@metalevel.at

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


   For more information about this program, visit:

          https://www.metalevel.at/simsttab/
          ==================================

   Tested with Scryer Prolog.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


:- use_module(library(clpz)).
:- use_module(library(dcgs)).
:- use_module(library(reif)).
:- use_module(library(pairs)).
:- use_module(library(lists)).
:- use_module(library(format)).
:- use_module(library(pio)).

:- dynamic(class_subject_teacher_times/4).
:- dynamic(coupling/4).
:- dynamic(same_class/3).
:- dynamic(teacher_freeday/2).
:- dynamic(slots_per_day/1).
:- dynamic(slots_per_week/1).
:- dynamic(days_week/1).
:- dynamic(class_freeslot/2).
:- dynamic(subject_freeslot/2).
:- dynamic(room_alloc/4).

:- discontiguous(class_subject_teacher_times/4).
:- discontiguous(class_freeslot/2).


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
			 Posting constraints

   The most important data structure in this CSP are pairs of the form

      Req-Vs

   where Req is a term of the form req(C,S,T,N) (see below), and Vs is
   a list of length N. The elements of Vs are finite domain variables
   that denote the *time slots* of the scheduled lessons of Req. We
   call this list of Req-Vs pairs the requirements.

   To break symmetry, the elements of Vs are constrained to be
   strictly ascending (it follows that they are all_different/1).

   Further, the time slots of each teacher are constrained to be
   all_different/1.

   For each requirement, the time slots divided by slots_per_day are
   constrained to be strictly ascending to enforce distinct days,
   except for coupled lessons.

   The time slots of each class, and of lessons occupying the same
   room, are constrained to be all_different/1.

   Labeling is performed on all slot variables.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


requirements(Rs) :-
        Goal = class_subject_teacher_times(Class,Subject,Teacher,Number),
        setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
        maplist(req_with_slots, Rs0, Rs),
	findall(s_c(I,S,C,_V),(same_class(I,S,L),member(C,L)),List),
        findall(I1,same_class(I1,_,_),Li1),
        samevariable(Li1,List),
	maplist(verify_same_class(List),Rs).

verify_same_class([],_).
verify_same_class([s_c(_,S,C,Slo)|L],req(Class,Subject,_,_)-Slots):-
    (
	(S == Subject,C == Class) ->
	Slo = Slots,
	verify_same_class(L,req(Class,Subject,_,_)-Slots)
    ;
    verify_same_class(L,req(Class,Subject,_,_)-Slots)
    ).

samevariable([],_).
samevariable([M|T],List):-
    maplist(apply_same_varible(M,_Var),List),
    samevariable(T,List).

apply_same_varible(M,Var,s_c(I,_,_,V)) :-
    (
        I == M ->  V = Var
    ;
        true
    ).
       

req_with_slots(R, R-Slots) :- R = req(_,_,_,N), length(Slots, N).

classes(Classes) :-
        setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), Classes).

subjects(Subjects) :-
        setof(S, C^N^T^class_subject_teacher_times(C,S,T,N), Subjects).

teachers(Teachers) :-
        setof(T, C^S^N^class_subject_teacher_times(C,S,T,N), Teachers).

rooms(Rooms) :-
        findall(Room, room_alloc(Room,_C,_S,_Slot), Rooms0),
        sort(Rooms0, Rooms).

requirements_variables(Rs, Vars) :-
        requirements(Rs),
        pairs_slots(Rs, Vars),
        slots_per_week(SPW),
        Max #= SPW - 1,
        Vars ins 0..Max,
        maplist(constrain_subject, Rs),
        classes(Classes),
        teachers(Teachers),
	subjects(Subjects),
        rooms(Rooms),
        maplist(constrain_teacher(Rs), Teachers),
        maplist(constrain_class(Rs), Classes),
	maplist(constrain_subject(Rs),Subjects),
        maplist(constrain_room(Rs), Rooms).

slot_quotient(S, Q) :-
        slots_per_day(SPD),
        Q #= S // SPD.


list_without_nths(Es0, Ws, Es) :-
        phrase(without_(Ws, 0, Es0), Es).

without_([], _, Es) --> seq(Es).
without_([W|Ws], Pos0, [E|Es]) -->
        { Pos #= Pos0 + 1,
          zcompare(R, W, Pos0) },
        without_at_pos0(R, E, [W|Ws], Ws1),
        without_(Ws1, Pos, Es).

without_at_pos0(=, _, [_|Ws], Ws) --> [].
without_at_pos0(>, E, Ws0, Ws0) --> [E].

%:- list_without_nths("abcd", [3], "abc").
%:- list_without_nths("abcd", [1,2], "ad").

slots_couplings(Slots, F-S) :-
        nth0(F, Slots, S1),
        nth0(S, Slots, S2),
        S2 #= S1 + 1,
        slot_quotient(S1, Q),
        slot_quotient(S2, Q).

constrain_subject(req(Class,Subj,_Teacher,_Num)-Slots) :-
        strictly_ascending(Slots), % break symmetry
        maplist(slot_quotient, Slots, Qs0),
        findall(F-S, coupling(Class,Subj,F,S), Cs),
        maplist(slots_couplings(Slots), Cs),
        pairs_values(Cs, Seconds0),
        sort(Seconds0, Seconds),
        list_without_nths(Qs0, Seconds, Qs),
        strictly_ascending(Qs).


all_diff_from(Vs, F) :- maplist(#\=(F), Vs).


constrain_subject(Rs, Subject) :-
        tfilter(subject_req(Subject), Rs, Sub),
        pairs_slots(Sub, Vs),
        findall(S, subject_freeslot(Subject,S), Frees),
        maplist(all_diff_from(Vs), Frees).



constrain_class(Rs, Class) :-
        tfilter(class_req(Class), Rs, Sub),
        pairs_slots(Sub, Vs),
	list_to_set(Vs,Vss),
        all_different(Vss),
        findall(S, class_freeslot(Class,S), Frees),
        maplist(all_diff_from(Vs), Frees).


constrain_teacher(Rs, Teacher) :-
        tfilter(teacher_req(Teacher), Rs, Sub),
        pairs_slots(Sub, Vs),
	list_to_set(Vs,Vss),
        all_different(Vss),
        findall(F, teacher_freeday(Teacher, F), Fs),
        maplist(slot_quotient, Vs, Qs),
        maplist(all_diff_from(Qs), Fs).

sameroom_var(Reqs, r(Class,Subject,Lesson), Var) :-
        memberchk(req(Class,Subject,_Teacher,_Num)-Slots, Reqs),
        nth0(Lesson, Slots, Var).

constrain_room(Reqs, Room) :-
        findall(r(Class,Subj,Less), room_alloc(Room,Class,Subj,Less), RReqs),
        maplist(sameroom_var(Reqs), RReqs, Roomvars),
	list_to_set(Roomvars,Roomvarss),
        all_different(Roomvarss).



strictly_ascending(Ls) :- chain(#<, Ls).

class_req(C0, req(C1,_S,_T,_N)-_, T) :- =(C0, C1, T).

subject_req(S0, req(_C,S1,_T,_N)-_, T) :- =(S0, S1, T). 

teacher_req(T0, req(_C,_S,T1,_N)-_, T) :- =(T0,T1,T).

pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Relate teachers and classes to list of days.

   Each day is a list of subjects (for classes), and a list of
   class/subject terms (for teachers). The predicate days_variables/2
   yields a list of days with the right dimensions, where each element
   is a free variable.

   We use the atom 'free' to denote a free slot, and the compound terms
   class_subject(C, S) and subject(S) to denote classes/subjects.
   This clean symbolic distinction is used to support subjects
   that are called 'free', and to improve generality and efficiency.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

days_variables(Days, Vs) :-
        slots_per_week(SPW),
        slots_per_day(SPD),
        NumDays #= SPW // SPD,
        length(Days, NumDays),
        length(Day, SPD),
        maplist(same_length(Day), Days),
        append(Days, Vs).

class_days(Rs, Class, Days) :-
        days_variables(Days, Vs),
        tfilter(class_req(Class), Rs, Sub),
        foldl(v(Sub), Vs, 0, _).

v(Rs, V, N0, N) :-
        (   member(req(_,Subject,_,_)-Times, Rs),
            member(N0, Times) -> V = subject(Subject)
        ;   V = free
        ),
        N #= N0 + 1.

teacher_days(Rs, Teacher, Days) :-
        days_variables(Days, Vs),
        tfilter(teacher_req(Teacher), Rs, Sub),
        foldl(v_teacher(Sub), Vs, 0, _).

v_teacher(Rs, V, N0, N) :-
        (   member(req(C,Subj,_,_)-Times, Rs),
            member(N0, Times) -> V = class_subject(C, Subj)
        ;   V = free
        ),
        N #= N0 + 1.

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   Print objects in roster.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

print_html_classes(Rs,T,File) :-
    append(File,".html",Filehtml),
    append(File,".css",Filecss),
    subjects(S),
    phrase_to_file(format_css_classes(S),Filecss),    
    classes(Cs),
    phrase_to_file(format_html_classes(Cs,Rs,T,Filecss),Filehtml).


format_css_classes(S) -->
    "body {\n",
    format_("~t~4+font-size: 15pt;\n",[]),
    "}\n\n",
    "table {\n",
    format_("~t~4+border-collapse: collapse;\n",[]),
    "}\n\n",
    "table, th, td {\n",
    format_("~t~4+border: 1px solid black;\n",[]),
    format_("~t~4+font-size: 14pt;\n",[]),
    format_("~t~4+text-align: center;\n",[]),
    format_("~t~4+padding-top: 7pt;\n",[]),
    format_("~t~4+padding-bottom: 7pt;\n",[]),
    "}\n\n",
    ".lesson {\n",
    format_("~t~4+width: 5em;\n",[]),
    format_("~t~4+display: inline-block;\n",[]),
    "}\n\n",
    { findall(C-B,color_and_back(C,B),ListColors) },
    format_css_classes_(S,ListColors).

format_css_classes_([],_) --> [].
format_css_classes_([S|Ss],[C-B|L]) -->
    format_("td.~w {\n",[S]),
    format_("~t~4+background-color: ~w;\n",[C]),
    format_("~t~4+color: ~w;\n",[B]),
    "}\n\n",
    format_css_classes_(Ss,L).


color_and_back(paleturquoise,black).
color_and_back(orangered,black).
color_and_back(green,white).
color_and_back(yellow,black).
color_and_back(blue,white).
color_and_back(cyan,black).
color_and_back(greenyellow,black).
color_and_back(violet,black).
color_and_back(lightyellow,black).
color_and_back(magenta,black).
color_and_back(red,white).
color_and_back(darkblue,white).
color_and_back(lightblue,black).
color_and_back(purple,white).
color_and_back(lime,black).
color_and_back(pink,black).
color_and_back(silver,black).
color_and_back(black,white).
color_and_back(maroon,white).
color_and_back(olive,black).
color_and_back(darkslateblue,white).
color_and_back(firebrick,white).
color_and_back(tomato,white).
color_and_back(darkgreen,white).
color_and_back(navy,white).
color_and_back(brown,white).
color_and_back(darkslategray,white).
color_and_back(mediumvioletred,white).
color_and_back(lightpink,black).
color_and_back(thistle,black).
color_and_back(lightsalmon,black).
color_and_back(gold,black).
color_and_back(aqua,black).
color_and_back(wheat,black).
color_and_back(mistyrose,black).
color_and_back(gainsboro,black).



format_html_classes(Cs,Rs,T,Filecss) -->
    "<!DOCTYPE html>\n",
    el(html,
       (
           el(head,
              (
                  el(title,"Tabla de Horarios"),
                  "<link rel=\"stylesheet\" type=\"text/css\" href=\"",Filecss,"\">\n\n",
                  "<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\n\n"
              )),
           el(body,
              (
                  el(center,
                     (
                         el(h1,"Tabla de Horarios")
                     )),
                  "<br>\n\n",
                  format_html_classes_(Cs,Rs),
                  format_html_teachers(Rs,T),
                  "<br>\n",
		  "<br>\n"
              ))
       )).



format_html_teachers(Rs,T) -->
    {
	(
	    T == true	-> teachers(Ts)
	;
	    Ts = []
	)
    },
    format_html_teachers_(Ts,Rs).

format_html_teachers_([], _) --> [].
format_html_teachers_([T|Ts], Rs) -->
    { teacher_days(Rs, T, Days0),
      transpose(Days0, Days) },
    el(center,
       el(table,[width='"80%"'],
          (   
              format_("<tr><td><span class=\"lesson\"><b>~w</b></span></td><td>~2n", [T]),
              el(center,
                 el(table,[width='"50%"'],
                    (   
                        weekdays_html_header,
                        html_rows(Days,17)
                    ))),
              "</td></tr>\n"
          ))),
    "<br>\n<br>\n\n",
    format_html_teachers_(Ts,Rs).


format_html_classes_([],_) --> [].
format_html_classes_([Class|Classes],Rs) -->
        { class_days(Rs, Class, Days0),
          transpose(Days0, Days) },
        el(center,
           el(table,[width='"80%"'],
              (   
	          format_("<tr><td><span class=\"lesson\"><b>~w</b></span></td><td>~2n", [Class]),
                  el(center,
                     el(table,[width='"50%"'],
                        (   
                            weekdays_html_header,
	                    html_rows(Days,17)
                        ))),
	          "</td></tr>\n"
              ))),
	"<br>\n<br>\n\n",
	format_html_classes_(Classes,Rs).

html_rows([],_) --> [].
html_rows([R|Rs],Hora) -->
    {
	number_chars(Hora,SH),
	append(SH,"hs",SH1),
	atom_chars(AHora,SH1),
	Hora1 #= Hora + 1
    },
    el(tr,html_row([hora(AHora)|R])),
    html_rows(Rs,Hora1).


html_row([]) --> [].
html_row([R|Rs]) -->
        html_(R),
        html_row(Rs).

html_(free)               --> format_("<td class=\"free\"><span class=\"lesson\"></span></td>", []).
%html_(class_subject(C,S)) --> html_(verbatim(C/S)).
html_(class_subject(_C,S)) --> html_(verbatim(S)).
html_(subject(S))         --> html_(verbatim(S)).
html_(bold(Element))      --> format_("<td><b>~w</b></td>", [Element]).
html_(verbatim(Element))  --> format_("<td class=\"~w\"><span class=\"lesson\">~w</span></td>", [Element,Element]).
html_(hora(Element)) --> format_("<td>~w</td>",[Element]).
    

weekdays_html_header -->
    {
	days_week(ListDays),
	maplist(with_bold,['hora'|ListDays],
%                  ['Lunes','Martes','Miercoles','Jueves','Viernes'],
%                  ['Jueves','Viernes','Sabado'],		  
                  Vs) },
        html_row(Vs).

with_bold(T, bold(T)).

el(Tag,Body) -->
     format_("<~w>",[Tag]),
     Body,
     format_("</~w>\n",[Tag]).

el(Tag,Opt,Body) -->
     format_("<~w",[Tag]),
     { length(Opt,N),
     listN(N," ~w","",Ss) },
     format_(Ss,Opt),
     format_(" >",[]),
     Body,
     format_("</~w>\n",[Tag]).

listN(0,_,A,A).
listN(N,A,Ac,S) :-
    N1 #= N - 1,
    append(Ac,A,Ac1),
    listN(N1,A,Ac1,S).


print_classes(Rs) :-
        classes(Cs),
        phrase_to_stream(format_classes(Cs, Rs), user_output).

format_classes([], _) --> [].
format_classes([Class|Classes], Rs) -->
        { class_days(Rs, Class, Days0),
          transpose(Days0, Days) },
        format_("Class: ~w~2n", [Class]),
        weekdays_header,
        align_rows(Days),
        format_classes(Classes, Rs).

align_rows([]) --> "\n\n\n".
align_rows([R|Rs]) -->
        align_row(R),
        "\n",
        align_rows(Rs).

align_row([]) --> [].
align_row([R|Rs]) -->
        align_(R),
        align_row(Rs).

align_(free)               --> align_(verbatim('')).
align_(class_subject(C,S)) --> align_(verbatim(C/S)).
align_(subject(S))         --> align_(verbatim(S)).
align_(verbatim(Element))  --> format_("~t~w~t~20+", [Element]).

print_teachers(Rs) :-
        teachers(Ts),
        phrase_to_stream(format_teachers(Ts, Rs), user_output).

format_teachers([], _) --> [].
format_teachers([T|Ts], Rs) -->
        { teacher_days(Rs, T, Days0),
          transpose(Days0, Days) },
        format_("Teacher: ~w~2n", [T]),
        weekdays_header,
        align_rows(Days),
        format_teachers(Ts, Rs).

weekdays_header -->
        { maplist(with_verbatim,
                  ['Mon','Tue','Wed','Thu','Fri'],
                  Vs) },
        align_row(Vs),
        format_("~n~`=t~100|~n", []).

with_verbatim(T, verbatim(T)).

/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   ?- consult('reqs_example.pl'),
      requirements_variables(Rs, Vs),
      labeling([ff], Vs),
      print_classes(Rs).
   %@ Class: 1a
   %@
   %@   Mon     Tue     Wed     Thu     Fri
   %@ ========================================
   %@   mat     mat     mat     mat     mat
   %@   eng     eng     eng
   %@    h       h

consult('primercuat.pl'),
      requirements_variables(Rs, Vs),
      labeling([ff], Vs),
      print_classes(Rs),print_teachers(Rs).

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */


resolver(Teacher,Html,File):-
    requirements_variables(Rs, Vs),
    labeling([ff], Vs),
    (
	Html == true -> print_html_classes(Rs,Teacher,File)
    ;
        print_classes(Rs),
	(
	    Teacher == true -> print_teachers(Rs)
	;   true)).
	
primercuat :- consult('primercuat.pl'), resolver(false,false,"primercuat").
primercuat_teachers :- consult('primercuat.pl'), resolver(true,false,"primercuat").
primercuat_html :- consult('primercuat.pl'), resolver(false,true,"primercuat").
primercuat_html_teachers :- consult('primercuat.pl'), resolver(true,true,"primercuat").

segundocuat :- consult('segundocuat.pl'), resolver(false,false,"segundocuat").
segundocuat_teachers :- consult('segundocuat.pl'), resolver(true,false,"segundocuat").
segundocuat_html :- consult('segundocuat.pl'), resolver(false,true,"segundocuat").
segundocuat_html_teachers :- consult('segundocuat.pl'), resolver(true,true,"segundocuat").

primercuating :- consult('primercuating.pl'), resolver(false,false,"primercuating").
primercuating_teachers :- consult('primercuating.pl'), resolver(true,false,"primercuating").
primercuating_html :- consult('primercuating.pl'), resolver(false,true,"primercuating").
primercuating_html_teachers :- consult('primercuating.pl'), resolver(true,true,"primercuating").

segundocuating :- consult('segundocuating.pl'), resolver(false,false,"segundocuating").
segundocuating_teachers :- consult('segundocuating.pl'), resolver(true,false,"segundocuating").
segundocuating_html :- consult('segundocuatinging.pl'), resolver(false,true,"segundocuating").
segundocuating_html_teachers :- consult('segundocuating.pl'), resolver(true,true,"segundocuating").

primecuatedufis :- consult('primecuatedufis.pl'), resolver(false,false,"primecuatedufis").
primecuatedufis_teachers :- consult('primecuatedufis.pl'), resolver(true,false,"primecuatedufis").
primecuatedufis_html :- consult('primecuatedufis.pl'), resolver(false,true,"primecuatedufis").
primecuatedufis_html_teachers :- consult('primecuatedufis.pl'), resolver(true,true,"primecuatedufis").

segundocuatedufis :- consult('segundocuatedufis.pl'), resolver(false,false,"segundocuatedufis").
segundocuatedufis_teachers :- consult('segundocuatedufis.pl'), resolver(true,false,"segundocuatedufis").
segundocuatedufis_html :- consult('segundocuatedufis.pl'), resolver(false,true,"segundocuatedufis").
segundocuatedufis_html_teachers :- consult('segundocuatedufis.pl'), resolver(true,true,"segundocuatedufis").

primecuatsocial :- consult('primecuatsocial.pl'), resolver(false,false,"primecuatsocial").
primecuatsocial_teachers :- consult('primecuatsocial.pl'), resolver(true,false,"primecuatsocial").
primecuatsocial_html :- consult('primecuatsocial.pl'), resolver(false,true,"primecuatsocial").
primecuatsocial_html_teachers :- consult('primecuatsocial.pl'), resolver(true,true,"primecuatsocial").

segundocuatsocial :- consult('segundocuatsocial.pl'), resolver(false,false,"segundocuatsocial").
segundocuatsocial_teachers :- consult('segundocuatsocial.pl'), resolver(true,false,"segundocuatsocial").
segundocuatsocial_html :- consult('segundocuatsocial.pl'), resolver(false,true,"segundocuatsocial").
segundocuatsocial_html_teachers :- consult('segundocuatsocial.pl'), resolver(true,true,"segundocuatsocial").

