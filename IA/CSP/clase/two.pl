:- module(two,_).

:- use_module(engine(runtime_control), [statistics/2]).
:- use_module(library(write), [write/1]).
:- use_module(engine(io_basic),[nl/0]).

test:-
    solve(F,T,U,W,R,O),
    print_out([F,T,U,W,R,O]).

do(F,T,U,W,R,O) :-
    solve(F,T,U,W,R,O),
    print_out([F,T,U,W,R,O]).

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


go(fn(F,T,U,W,R,O)) :-
    solve(F,T,U,W,R,O),
    print_out([F,T,U,W,R,O]).


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


generate(F,T,U,W,R,O) :-
    digi(F),
    digi(T),
    digi(U),
    digi(W),
    digi(R),
    digi(O),
    difflist([F,T,U,W,R,O]).

print_out([F,T,U,W,R,O]) :-
    write('    TWO'),
    nl,
    write(' +  TWO'),
    nl,
    write(-----------),
    nl,
    write('   FOUR'),
    nl,
    nl,
    write('The solution is:'),
    nl,
    nl,
    write('   '),
    write(T),
    write(W),
    write(O),
    nl,
    write(' + '),
    write(T),
    write(W),
    write(O),
    nl,
    write(-----------),
    nl,
    write('  '),
    write(F),
    write(O),
    write(U),
    write(R),
    nl.

solve(F,T,U,W,R,O) :-
    carry(I,J,K),
    F=1,
    generate(F,T,U,W,R,O),
    T>0,
    A1 is O+O,
    B1 is R+10*I,
    A1=B1,
    A2 is I+W+W,
    B2 is U+10*J,
    A2=B2,
    A3 is J+T+T,
    B3 is O+10*K,
    A3=B3.

%%%%%%%%%%%%%%%%%%%%%

ourmain:-
    statistics(runtime,_),
    ourdo,
    statistics(runtime,[_,T1]),
    write(T1).

%:- determinate(ourdo,true).

ourdo:- solve(_A,_B,_C,_D,_E,_F), fail.
ourdo.
