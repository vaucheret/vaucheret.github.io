:- module(_1,[ent/2],[assertions]).

:- entry ent(Base,_A)
   : int(Base).

ent(A,B) :-
    C is A,
    D is C*A,
    E is D*A,
    exp_ac_1(A,E,B).

exp_ac_1(_1,A,A).


