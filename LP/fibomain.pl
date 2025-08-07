#!/usr/bin/env swipl

:- initialization(main, main).


main([Number]) :-
    atom_number(Number,N),
    f(N,F),
    format("El numero de fib correspondiente a ~d es ~d\n",[N,F]),
    halt.
main(_) :-
    format("debe ingresar un argumento\n",[]),halt.




f(0,1).
f(1,1).
f(N,R):-
    N >=2,
    faux(2,N,1,1,R).

faux(N,N,A1,A2,R) :- R is A1 + A2.
faux(I,N,A1,A2,R) :-
    I1 is I + 1,
    A is A1 + A2,
    faux(I1,N,A2,A,R).
