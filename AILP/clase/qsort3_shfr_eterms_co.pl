:- module(_1,[qsort/2],[assertions,regtypes,nativeprops]).

:- prop sorted_num_list/1.

:- prop sorted_num_list(_A).

:- true pred sorted_num_list(_A)
   : mshare([[_A]])
   => ground([_A]).

:- true pred sorted_num_list(_A)
   : term(_A)
   => list(num,_A).

sorted_num_list([]).
sorted_num_list([X]) :-
    number(X).
sorted_num_list([X,Y|Z]) :-
    number(X),
    number(Y),
    X=<Y,
    sorted_num_list([Y|Z]).

:- check success qsort(A,B)
   => ( ground(B), sorted_num_list(B) ).

:- entry qsort(A,B)
   : ( list(num,A), var(B) ).

:- checked calls qsort(A,B)
   : list(num,A).

:- true pred qsort(A,B)
   : ( mshare([[B]]),
       ground([A]) )
   => ground([A,B]).

:- true pred qsort(A,B)
   : ( list(num,A), term(B) )
   => ( list(num,A), list(num,B) ).

qsort([X|L],R) :-
    partition(L,X,L1,L2),
    qsort(L2,R2),
    qsort(L1,R1),
    append(R2,[X|R1],R).
qsort([],[]).

:- checked calls partition(A,B,C,D)
   : ( ground(A), ground(B) ).

:- checked success partition(A,B,C,D)
   => ( list(num,C), ground(D) ).

:- true pred partition(A,B,C,D)
   : ( mshare([[C],[D]]),
       var(C), var(D), ground([A,B]) )
   => ground([A,B,C,D]).

:- true pred partition(A,B,C,D)
   : ( list(num,A), num(B), term(C), term(D) )
   => ( list(num,A), num(B), list(num,C), list(num,D) ).

partition([],_B,[],[]).
partition([E|R],C,[E|Left1],Right) :-
    E<C,
    !,
    partition(R,C,Left1,Right).
partition([E|R],C,Left,[E|Right1]) :-
    E>=C,
    partition(R,C,Left,Right1).

:- checked calls append(A,B,C)
   : ( list(num,A), list(num,B) ).

:- true pred append(A,B,C)
   : ( mshare([[C]]),
       ground([A,B]) )
   => ground([A,B,C]).

:- true pred append(A,B,C)
   : ( list(num,A), rt8(B), term(C) )
   => ( list(num,A), rt8(B), rt8(C) ).

append([],X,X).
append([H|X],Y,[H|Z]) :-
    append(X,Y,Z).


:- regtype rt8/1.
rt8([A|B]) :-
    num(A),
    list(num,B).

