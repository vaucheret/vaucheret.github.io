:- module(_1,[get_primes/2],[assertions,regtypes,nativeprops]).

:- prop numlist(X)+regtype#"@var{X} is a list of integers.".

:- prop numlist(X)
   + regtype.

:- true pred numlist(X)
   : term(X)
   => numlist(X).

:- true pred numlist(X)
   : mshare([[X]])
   => ground([X]).

numlist([]).
numlist([N|Ns]) :-
    num(N),
    numlist(Ns).

%% %% :- check pred get_primes(N,Primes)
%% %%    : ( num(N), var(Primes) )
%% %%    => numlist(Primes).

:- entry get_primes(N,Primes)
   : ( int(N), var(Primes) ).

:- checked calls get_primes(N,Primes)
   : ( num(N), var(Primes) ).

:- checked success get_primes(N,Primes)
   : ( num(N), var(Primes) )
   => numlist(Primes).

:- true pred get_primes(N,Primes)
   : ( num(N), term(Primes) )
   => ( num(N), numlist(Primes) ).

:- true pred get_primes(N,Primes)
   : ( mshare([[Primes]]),
       var(Primes), ground([N]) )
   => ground([N,Primes]).

get_primes(N,Primes) :-
    get_primes_(0,N,2,[],Primes0),
    reverse(Primes0,Primes).

:- true pred get_primes_(N,_A,_1,Primes,_B)
   : ( num(N), num(_A), num(_1), numlist(Primes), term(_B) )
   => ( num(N), num(_A), num(_1), numlist(Primes), numlist(_B) ).

:- true pred get_primes_(N,_A,_1,Primes,_B)
   : ( mshare([[_B]]),
       var(_B), ground([N,_A,_1,Primes]) )
   => ground([N,_A,_1,Primes,_B]).

get_primes_(N,N,_1,Primes,Primes) :- !.
get_primes_(N0,N,Num,OldPrimes,Primes) :-
    prime(OldPrimes,Num),
    !,
    NewPrimes=[Num|OldPrimes],
    N1 is N0+1,
    Num1 is Num+1,
    get_primes_(N1,N,Num1,NewPrimes,Primes).
get_primes_(N0,N,Num,OldPrimes,Primes) :-
    Num1 is Num+1,
    get_primes_(N0,N,Num1,OldPrimes,Primes).

:- true pred prime(_A,_1)
   : ( numlist(_A), num(_1) )
   => ( numlist(_A), num(_1) ).

:- true pred prime(_A,_1)
   : ground([_A,_1])
   => ground([_A,_1]).

prime([],_1).
prime([X|Primes],Num) :-
    Mod is Num mod X,
    Mod>0,
    prime(Primes,Num).

:- true pred reverse(L,R)
   : ( numlist(L), term(R) )
   => ( numlist(L), numlist(R) ).

:- true pred reverse(L,R)
   : ( mshare([[R]]),
       var(R), ground([L]) )
   => ground([L,R]).

reverse(L,R) :-
    revaux(L,[],R).

:- true pred revaux(_A,R,_B)
   : ( numlist(_A), numlist(R), term(_B) )
   => ( numlist(_A), numlist(R), numlist(_B) ).

:- true pred revaux(_A,R,_B)
   : ( mshare([[_B]]),
       var(_B), ground([_A,R]) )
   => ground([_A,R,_B]).

revaux([],R,R).
revaux([X|Xs],A,R) :-
    revaux(Xs,[X|A],R).

