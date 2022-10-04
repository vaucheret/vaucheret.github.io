:- module(money,_,_).

:- use_package(andorra).

:- use_module(engine(runtime_control), [statistics/2]).
:- use_module(library(write), [write/1]).
:- use_module(engine(io_basic),[nl/0]).

test:-
    solve(A,B,C,D,E,F,G,H),
    print_out([A,B,C,D,E,F,G,H]).

do(A,B,C,D,E,F,G,H) :-
    solve(A,B,C,D,E,F,G,H),
    print_out([A,B,C,D,E,F,G,H]).

%:- determinate(difflist(A),nonvar(A)).

difflist([A|B]) :-
    not_el(A,B),
    difflist(B).
difflist([]).

%:- determinate(digi(A),nonvar(A)).

digi(9).
digi(8).
digi(7).
digi(6).
digi(5).
digi(4).
digi(3).
digi(2).
digi(1).
digi(0).


go(fn(A,B,C,D,E,F,G,H)) :-
    solve(A,B,C,D,E,F,G,H),
    print_out([A,B,C,D,E,F,G,H]).


%:- determinate( not_el(X,A), nonvar(A) ).

not_el(_A,[]).
not_el(A,[B|C]) :-
    A\==B,
    not_el(A,C).

%:- determinate( carry(A,B,C), ( nonvar(A), nonvar(B), nonvar(C) ) ).

carry(1,1,1).
carry(1,1,0).
carry(1,0,1).
carry(1,0,0).
carry(0,1,1).
carry(0,1,0).
carry(0,0,1).
carry(0,0,0).


generate(A,B,C,D,E,F,G,H) :-
    digi(E),
    digi(A),
    digi(F),
    digi(B),
    digi(C),
    digi(G),
    digi(D),
    digi(H),
    difflist([A,B,C,D,E,F,G,H]).

print_out([S,E,N,D,M,O,R,Y]) :-
    write('    SEND'),
    nl,
    write(' +  MORE'),
    nl,
    write(-----------),
    nl,
    write('   MONEY'),
    nl,
    nl,
    write('The solution is:'),
    nl,
    nl,
    write('   '),
    write(S),
    write(E),
    write(N),
    write(D),
    nl,
    write(' + '),
    write(M),
    write(O),
    write(R),
    write(E),
    nl,
    write(-----------),
    nl,
    write('  '),
    write(M),
    write(O),
    write(N),
    write(E),
    write(Y),
    nl.

solve(S,E,N,D,M,O,R,Y) :-
    carry(I,J,K),
    M=1,
    generate(S,E,N,D,M,O,R,Y),
    S>0,
    A1 is D+E,
    B1 is Y+10*I,
    A1=B1,
    A2 is I+N+R,
    B2 is E+10*J,
    A2=B2,
    A3 is J+E+O,
    B3 is N+10*K,
    A3=B3,
    A4 is K+S+M,
    B4 is O+10*M,
    A4=B4.

%%%%%%%%%%%%%%%%%%%%%

ourmain:-
    statistics(runtime,_),
    ourdo,
    statistics(runtime,[_,T1]),
    write(T1).

%:- determinate(ourdo,true).

ourdo:- solve(_A,_B,_C,_D,_E,_F,_G,_H), fail.
ourdo.
