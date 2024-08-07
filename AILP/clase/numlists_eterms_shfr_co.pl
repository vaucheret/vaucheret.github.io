:- module(_1,[get_primes/2,intlist/1,numlist/1,sum_list/2,sum_list/3,sum_list_of_lists/2,sum_list_of_lists/3],[assertions,regtypes,nativeprops]).

:- use_module(library(lists),[reverse/2]).

:- doc(title,"Lists of numbers").

:- doc(author,"The Ciao Development Team").

:- doc(module,"This module implements some kinds of lists of
   numbers.").

:- prop numlist(X)+regtype#"@var{X} is a list of numbers.".

:- prop intlist(X)+regtype#"@var{X} is a list of integers.".

:- push_prolog_flag(multi_arity_warnings,off).

:- pop_prolog_flag(multi_arity_warnings).

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

:- prop intlist(X)
   + regtype.

:- true pred intlist(X)
   : term(X)
   => list(int,X).

:- true pred intlist(X)
   : mshare([[X]])
   => ground([X]).

intlist([]).
intlist([N|Ns]) :-
    int(N),
    intlist(Ns).

%% %% :- check pred sum_list(List,N)
%% %%    : numlist(List)
%% %%    => num(N).

:- checked calls sum_list(List,N)
   : numlist(List).

:- checked success sum_list(List,N)
   : numlist(List)
   => num(N).

:- true pred sum_list(List,N)
   : ( numlist(List), term(N) )
   => ( numlist(List), num(N) ).

:- true pred sum_list(List,N)
   : ( mshare([[N]]),
       ground([List]) )
   => ground([List,N]).

sum_list(List,N) :-
    sum_list(List,0,N).

%% %% :- check pred sum_list(List,N0,N)
%% %%    : ( numlist(List), num(N0) )
%% %%    => num(N).

:- check calls sum_list(List,N0,N)
   : ( numlist(List), num(N0) ).

:- checked success sum_list(List,N0,N)
   : ( numlist(List), num(N0) )
   => num(N).

:- true pred sum_list(List,N0,N)
   : ( term(List), num(N0), term(N) )
   => ( list(arithexpression,List), num(N0), num(N) ).

:- true pred sum_list(List,N0,N)
   : ( mshare([[List],[N]]),
       ground([N0]) )
   => ground([List,N0,N]).

sum_list([],N,N).
sum_list([X|Xs],N0,N) :-
    N1 is N0+X,
    sum_list(Xs,N1,N).

%% %% :- check pred sum_list_of_lists(Lists,N)
%% %%    : list(numlist,List)
%% %%    => num(N).

:- check calls sum_list_of_lists(Lists,N)
   : list(numlist,List).

:- checked success sum_list_of_lists(Lists,N)
   : list(numlist,List)
   => num(N).

:- true pred sum_list_of_lists(Lists,N)
   : ( term(Lists), term(N) )
   => ( list(list(arithexpression),Lists), num(N) ).

:- true pred sum_list_of_lists(Lists,N)
   : mshare([[Lists],[Lists,N],[N]])
   => ground([Lists,N]).

sum_list_of_lists(Xss,N) :-
    sum_list_of_lists(Xss,0,N).

%% %% :- check pred sum_list_of_lists(Lists,N0,N)
%% %%    : ( list(numlist,List), num(N0) )
%% %%    => num(N).

:- check calls sum_list_of_lists(Lists,N0,N)
   : ( list(numlist,List), num(N0) ).

:- checked success sum_list_of_lists(Lists,N0,N)
   : ( list(numlist,List), num(N0) )
   => num(N).

:- true pred sum_list_of_lists(Lists,N0,N)
   : ( term(Lists), num(N0), term(N) )
   => ( list(list(arithexpression),Lists), num(N0), num(N) ).

:- true pred sum_list_of_lists(Lists,N0,N)
   : ( mshare([[Lists],[Lists,N],[N]]),
       ground([N0]) )
   => ground([Lists,N0,N]).

sum_list_of_lists([],N,N).
sum_list_of_lists([Xs|Xss],N0,N) :-
    sum_list(Xs,N0,N1),
    sum_list_of_lists(Xss,N1,N).

%% %% :- check pred get_primes(N,Primes)
%% %%    : int(N)
%% %%    => intlist(Primes).

:- check success get_primes(N,Primes)
   : int(N)
   => intlist(Primes).

:- checked calls get_primes(N,Primes)
   : int(N).

:- true pred get_primes(N,Primes)
   : ( int(N), term(Primes) )
   => ( int(N), list(Primes) ).

:- true pred get_primes(N,Primes)
   : ( mshare([[Primes]]),
       ground([N]) )
   => ( mshare([[Primes]]),
        ground([N]) ).

get_primes(N,Primes) :-
    get_primes(0,N,2,[],Primes0),
    reverse(Primes0,Primes).

:- true pred get_primes(N,_A,_1,Primes,_B)
   : ( num(N), int(_A), num(_1), numlist(Primes), term(_B) )
   => ( num(N), int(_A), num(_1), numlist(Primes), numlist(_B) ).

:- true pred get_primes(N,_A,_1,Primes,_B)
   : ( mshare([[_B]]),
       var(_B), ground([N,_A,_1,Primes]) )
   => ground([N,_A,_1,Primes,_B]).

get_primes(N,N,_1,Primes,Primes) :- !.
get_primes(N0,N,Num,OldPrimes,Primes) :-
    'get_primes/5/2/$disj/1'(N0,Num,OldPrimes,N1,NewPrimes),
    Num1 is Num+1,
    get_primes(N1,N,Num1,NewPrimes,Primes).

:- true pred 'get_primes/5/2/$disj/1'(N0,Num,OldPrimes,N1,NewPrimes)
   : ( num(N0), num(Num), numlist(OldPrimes), term(N1), term(NewPrimes) )
   => ( num(N0), num(Num), numlist(OldPrimes), num(N1), numlist(NewPrimes) ).

:- true pred 'get_primes/5/2/$disj/1'(N0,Num,OldPrimes,N1,NewPrimes)
   : ( mshare([[N1],[NewPrimes]]),
       var(N1), var(NewPrimes), ground([N0,Num,OldPrimes]) )
   => ground([N0,Num,OldPrimes,N1,NewPrimes]).

'get_primes/5/2/$disj/1'(N0,Num,OldPrimes,N1,NewPrimes) :-
    prime(OldPrimes,Num),
    !,
    N1 is N0+1,
    NewPrimes=[Num|OldPrimes].
'get_primes/5/2/$disj/1'(N0,Num,OldPrimes,N1,NewPrimes) :-
    N1=N0,
    NewPrimes=OldPrimes.

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


