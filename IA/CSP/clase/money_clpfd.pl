:- module(money_clpfd,_).

:- use_package(library(clpfd)).
%% :- use_module(library(write), [write/1]).
%% :- use_module(engine(io_basic),[nl/0]).

   
smm :- 
        Vars = [S,E,N,D,M,O,R,Y],
        domain(Vars,0,9),
        all_different(Vars),
                  S*1000 + E*100 + N*10 + D +
                  M*1000 + O*100 + R*10 + E #=
        M*10000 + O*1000 + N*100 + E*10 + Y,
       M #> 0, S #> 0,
           labeling([],Vars),
        print_out(Vars).

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


