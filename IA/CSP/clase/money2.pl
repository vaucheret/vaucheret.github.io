:- module(money2,_).


smm :-
        X = [S,E,N,D,M,O,R,Y],
        Digits = [0,1,2,3,4,5,6,7,8,9],
        assign_digits(X, Digits),
        1000*S + 100*E + 10*N + D +
        1000*M + 100*O + 10*R + E =:=
    10000*M + 1000*O + 100*N + 10*E + Y,
    M > 0, 
    S > 0,
    print_out(X).


selecta(X, [X|R], R).
selecta(X, [Y|Xs], [Y|Ys]):- selecta(X, Xs, Ys).

assign_digits([], _List).
assign_digits([D|Ds], List):-
        selecta(D, List, NewList),
        assign_digits(Ds, NewList).

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

