:- module(dcg,_,[dcg]).

    
%% s --> ab,[a],[b].

%% ab --> [].
%% ab --> [a],ab.
%% ab --> [b],ab.

s(S1,SN) :- ab(S1,S2), S2 = [a|S3], S3 = [b|SN].
ab(S,S).
ab(S1,SN) :- S1 = [a|S2], ab(S2,SN).
ab(S1,SN) :- S1 = [b|S2], ab(S2,SN).

