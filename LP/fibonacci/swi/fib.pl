:- module(fib, [fib/2,fibi/2]).



fib(0, 1).
fib(1, 1).
fib(N, R) :-
    N #>= 2,
    N1 #= N - 1,
    N2 #= N - 2,
    fib(N1, R1),
    fib(N2, R2),
    R #= R1 + R2.




fibi(0, 1).
fibi(1, 1).
fibi(N, R) :-
		N #>= 2,
		fi_aux(2, N, 1, 1, R).

fi_aux(N, N, A1, A2, R) :- !,R is A1 + A2.
fi_aux(I, N, A1, A2, R) :-
    I1 #= I + 1,
    A #= A1 + A2,!,
    fi_aux(I1, N, A2, A, R).

     
