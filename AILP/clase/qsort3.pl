:- module(qsort3, [qsort/2], [assertions,regtypes,nativeprops]).

:- entry qsort(A,B) : (list(num, A), var(B)).

:- calls qsort(A,B) : list(num, A).                        % A1
:- success qsort(A,B)  => (ground(B), sorted_num_list(B)). % A2
:- calls partition(A,B,C,D) : (ground(A), ground(B)).      % A3
:- success partition(A,B,C,D) => (list(num, C),ground(D)). % A4
:- calls append(A,B,C) : (list(num,A),list(num,B)).        % A5

:- prop sorted_num_list/1.
sorted_num_list([]).
sorted_num_list([X]):- number(X).
sorted_num_list([X,Y|Z]):- 
    number(X), number(Y), X=<Y, sorted_num_list([Y|Z]).

qsort([X|L],R) :-
    partition(L,X,L1,L2),
    qsort(L2,R2), qsort(L1,R1),
    append(R2,[X|R1],R).
qsort([],[]).

partition([],_B,[],[]).
partition([E|R],C,[E|Left1],Right):-
    E < C, !, partition(R,C,Left1,Right).
partition([E|R],C,Left,[E|Right1]):-
    E >= C, partition(R,C,Left,Right1).

append([],X,X).
append([H|X],Y,[H|Z]):- append(X,Y,Z).