:- module(_1,[app/3],[assertions,regtypes,nativeprops]).

:- entry app(A,B,C)
   : ( list(A), list(B) ).

:- true pred app(A,B,C)
   : ( list(A), list(B), term(C) )
   => ( list(A), list(B), list(C) ).

:- true pred app(A,B,C)
   : mshare([[A],[A,B],[A,B,C],[A,C],[B],[B,C],[C]])
   => mshare([[A,B,C],[A,C],[B,C]]).

app([],Y,Y).
app([X|Xs],Ys,[X|Zs]) :-
    app(Xs,Ys,Zs).


