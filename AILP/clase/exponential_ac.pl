:- module(exponential_ac, [ent/2], [assertions]) .


:- entry ent(Base,_) : int(Base).

ent(Base,Res) :- exp(Base,3,Res).

exp(Base,Exp,Res):-
     exp_ac(Exp,Base,1,Res).

exp_ac(0,_,Res,Res).

exp_ac(Exp,Base,Tmp,Res) :-
    Exp > 0,
    Expl is Exp - 1,
    NTmp is Tmp * Base,
    exp_ac(Expl,Base,NTmp,Res).