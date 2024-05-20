:- module(fib,_,[functional,dcg]).

:- use_module(library(lists)).

%% f(0) := 1.
%% f(1) := 1.
%% f(N) := f(N-1) + f(N -2) :- N>=2.

f(0,1).
f(1,1).
f(N,R):-
    N>=2,
    N1 is N -1 ,
    N2 is N -2,
    f(N1,R1),
    f(N2,R2),
    R is R1 + R2.

fi(0,1).
fi(1,1).
fi(N,R) :-
    N>=2,
    fiaux(2,N,1,1,R).

fiaux(N,N,A2,A1,R) :-
    R is A2 + A1.
fiaux(I,N,A2,A1,R) :-
    I1 is I + 1,
    A is A2 + A1,
    fiaux(I1,N,A,A2,R).

    
    
rev([],[]).
rev([X|Y],R):-
    rev(Y,L),
    append(L,[X],R).

revi(L,R):-
    reviaux(L,R,[]).

reviaux([],A,A).
reviaux([X|Y],R,A):-
    reviaux(Y,R,[X|A]).

% ---------------------------------------

revd(L,R):-
   phrase(revda(L),R,[]).

revda([]) -->  [].
revda([X|Y]) --> revda(Y),[X].

revf([]) := [].
revf([X|Y]) := revf(Y) ++ [X].
