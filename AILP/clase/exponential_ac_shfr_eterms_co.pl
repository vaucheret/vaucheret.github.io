:- module(_1,[ent/2],[assertions,nativeprops,regtypes]).

:- entry ent(Base,_A)
   : int(Base).

:- true pred ent(Base,Res)
   : ( mshare([[Res]]),
       ground([Base]) )
   => ground([Base,Res]).

:- true pred ent(Base,Res)
   : ( int(Base), term(Res) )
   => ( int(Base), num(Res) ).

ent(Base,Res) :-
    exp(Base,3,Res).

:- true pred exp(Base,Exp,Res)
   : ( mshare([[Res]]),
       ground([Base,Exp]) )
   => ground([Base,Exp,Res]).

:- true pred exp(Base,Exp,Res)
   : ( int(Base), rt0(Exp), term(Res) )
   => ( int(Base), rt0(Exp), num(Res) ).

exp(Base,Exp,Res) :-
    exp_ac(Exp,Base,1,Res).

:- true pred exp_ac(Exp,_1,Res,_A)
   : ( mshare([[_A]]),
       ground([Exp,_1,Res]) )
   => ground([Exp,_1,Res,_A]).

:- true pred exp_ac(Exp,_1,Res,_A)
   : ( num(Exp), int(_1), num(Res), term(_A) )
   => ( num(Exp), int(_1), num(Res), num(_A) ).

exp_ac(0,_1,Res,Res).
exp_ac(Exp,Base,Tmp,Res) :-
    Exp>0,
    Expl is Exp-1,
    NTmp is Tmp*Base,
    exp_ac(Expl,Base,NTmp,Res).


:- regtype rt0/1.
rt0(3).

