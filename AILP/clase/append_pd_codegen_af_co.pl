:- module(_1,[appe/3],[assertions]).

:- entry appe(A,B,C).

appe([],A,[1,2,3|A]).
appe([B|C],A,[1,2,3,B|D]) :-
    append_1(C,A,D).

append_1([],A,A).
append_1([B|C],A,[B|D]) :-
    append_1(C,A,D).


