turing(Tape0, Tape) :-
       perform(q0, [], Ls, Tape0, Rs),
       reverse(Ls, Ls1),
       append(Ls1, Rs, Tape).

perform(qf, Ls, Ls, Rs, Rs) :- !.

perform(Q0, Ls0, Ls, Rs0, Rs) :-
       symbol(Rs0, Sym, RsRest),
       once(rule(Q0, Sym, Q1, NewSym, Action)),
       action(Action, Ls0, Ls1, [NewSym|RsRest], Rs1),
       perform(Q1, Ls1, Ls, Rs1, Rs).

symbol([], b, []).
symbol([Sym|Rs], Sym, Rs).

action(left, Ls0, Ls, Rs0, Rs) :- left(Ls0, Ls, Rs0, Rs).
action(stay, Ls, Ls, Rs, Rs).
action(right, Ls0, [Sym|Ls0], [Sym|Rs], Rs).

left([], [], Rs0, [b|Rs0]).
left([L|Ls], Ls, Rs, [L|Rs]).

rule(q0, 1, q0, 1, right).
rule(q0, b, qf, 1, stay).

%% rule(q0, 1, q0,  1,right).
%% rule(q0, 0, q0,  0,right).
%% rule(q0,b,q1,c,left).

%% rule(q1, 0, q1,  0,left ).
%% rule(q1, 1, q1,  1,left ).
%% rule(q1,b,q2,b,right).

%% rule(q2, 0, q3,y,right).
%% rule(q2, 1, q7,x,right).
%% rule(q2,c, q11,c,left).


%% rule(q3, 0, q3,  0,right).
%% rule(q3, 1, q3,  1,right).
%% rule(q3,c,q4,c,right).

%% rule(q4,  0,q4,  0,right).
%% rule(q4,  1,q4,  1,right).
%% rule(q4,b,q5,  0,left ).

%% rule(q5,  0,q5,  0,left ).
%% rule(q5,  1,q5,  1,left ).
%% rule(q5,c,q6,c,left ).

%% rule(q6,  0,q6,  0,left ).
%% rule(q6,  1,q6,  1,left ).
%% rule(q6,y,q2,y,right).

%% rule(q7, 0, q7,  0,right).
%% rule(q7, 1, q7,  1,right).
%% rule(q7,c,q8,c,right).

%% rule(q8,  0,q8,  0,right).
%% rule(q8,  1,q8,  1,right).
%% rule(q8,b,q9,  1,left ).

%% rule(q9,  0,q9,  0,left ).
%% rule(q9,  1,q9,  1,left ).
%% rule(q9,c,q10,c,left ).

%% rule(q10,  0,q10,  0,left ).
%% rule(q10,  1,q10,  1,left ).
%% rule(q10,x,q2,x,right).

%% rule(q11,x,q11,1,left).
%% rule(q11,y,q11,0,left).
%% rule(q11,b,qf,b,stay).
