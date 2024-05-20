:- module(two_clpfd,_).

:- use_package(library(clpfd)).
%% :- use_module(library(write), [write/1]).
%% :- use_module(engine(io_basic),[nl/0]).

   
ttf :- 
        Vars = [F,T,U,W,R,O],
        domain(Vars,0,9),
        all_different(Vars),
                   T*100 + W*10 + O +
                   T*100 + W*10 + O #=
         F*1000 + O*100 + U*10 + R,
       F #> 0, T #> 0,
           labeling([],Vars),
        print_out(Vars).


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
