:- use_module(library(clpz)).




f(0,1).
f(1,1).
f(N,R):-
    N #>= 2,
    N1 #= N - 1,
    N2 #= N - 2,
    f(N1,F1),
    f(N2,F2),
    R #= F1 + F2.

    












% versiones
% 1) reversible con clpz
% 2) tail recursivo (iterativo)
% 3) usando dynamic(f/2) y asserta
% 4) usando tabling y table(f/2)

    
