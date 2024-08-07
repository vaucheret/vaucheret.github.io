:- module(_1,[app/3],[assertions,regtypes]).

:- entry app(A,B,C)
   : ( list(A), list(B) ).

:- true pred app(A,B,C)
   : ( list(A), list(B), term(C) )
   => ( list(A), list(B), list(C) ).

app([],Y,Y).
app([X|Xs],Ys,[X|Zs]) :-
    app(Xs,Ys,Zs).


