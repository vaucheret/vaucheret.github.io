:- use_module(etrace).

:- dynamic f/2.


f(0,1).
f(1,1).
f(N,R) :-
    N >= 2,
    N1 is N -1,
    N2 is N -2,
    f(N1,F1),
    f(N2,F2),
    R is F1 + F2,
    asserta(f(N,R)).



