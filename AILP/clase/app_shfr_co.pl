:- module(_1,[app/3],[assertions,nativeprops]).

:- entry app(A,B,C)
   : ( list(A), list(B) ).

:- true pred app(A,B,C)
   : mshare([[A],[A,B],[A,B,C],[A,C],[B],[B,C],[C]])
   => mshare([[A,B,C],[A,C],[B,C]]).

app([],Y,Y).
app([X|Xs],Ys,[X|Zs]) :-
    app(Xs,Ys,Zs).


