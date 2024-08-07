:- module(prueba,[get_primes/2],[assertions,regtypes]).

:- entry get_primes(N,Primes) : (int(N),var(Primes)).

:- check pred get_primes(N,Primes) : (num(N),var(Primes)) => numlist(Primes).

:- regtype numlist(X)    # "@var{X} is a list of integers.".

numlist([]).
numlist([N|Ns]):-
    num(N),
    numlist(Ns).

get_primes(N,Primes):-
    get_primes_(0,N,2,[],Primes0),
    reverse(Primes0,Primes).

get_primes_(N,N,_,Primes,Primes):- !.
get_primes_(N0,N,Num,OldPrimes,Primes):-
    prime(OldPrimes,Num),!,
    NewPrimes = [Num|OldPrimes],
    N1 is N0 + 1,
    Num1 is Num + 1,
    get_primes_(N1,N,Num1,NewPrimes,Primes).
get_primes_(N0,N,Num,OldPrimes,Primes):-
    Num1 is Num + 1,
    get_primes_(N0,N,Num1,OldPrimes,Primes).


prime([],_).
prime([X|Primes],Num):-
    Mod is Num mod X,
    Mod > 0,
    prime(Primes,Num).


reverse(L,R):-
    revaux(L,[],R).

revaux([],R,R).
revaux([X|Xs],A,R):-
    revaux(Xs,[X|A],R).