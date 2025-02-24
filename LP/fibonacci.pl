:- module(fibonacci,[f/2]).

f(0,1).
f(1,1).
f(N,R):-
    N #>= 2,
    N1 #= N - 1,
    N2 #= N - 2,
    f(N1,F1),
    f(N2,F2),
    R #= F1 + F2.
