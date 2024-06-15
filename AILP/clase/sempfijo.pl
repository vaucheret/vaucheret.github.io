:- module(sempfijo,_,_).


p(a).
p(f(X)) :- p(X).
q(a).
q(b).

