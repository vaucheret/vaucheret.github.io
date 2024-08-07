:- module(append,[appe/3],[assertions] ) .


:- entry appe(A,B,C). 

appe(A,B,C) :- append([1,2,3|A],B,C).

append([],X,X).
append([H|X],Y, [H|Z]):- append(X,Y,Z) .