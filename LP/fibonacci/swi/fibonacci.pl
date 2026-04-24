:- module(fibonacci,[f/2,fi/2]).

:- table f/2.
     

f(0,1).
f(1,1).
f(N,R):-
    N #>= 2,
    N1 #= N - 1,
    N2 #= N - 2,
    f(N1,F1),
    f(N2,F2),
    R #= F1 + F2.



fi(0,1).
fi(1,1).
fi(N,R):-
    N #>= 2,
    fi_aux(2,N,1,1,R).

fi_aux(N,N,A1,A2,R) :- R is A1 + A2.
fi_aux(I,N,A1,A2,R) :-
    I1 #= I + 1,
    A  #= A1 + A2,
    fi_aux(I1,N,A2,A,R).
