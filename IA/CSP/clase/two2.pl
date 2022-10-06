:- module(two2,_).

ttf :- solve(_F,_T,_U,_W,_R,_O).

solve(F,T,U,W,R,O) :- 
    Vars = [F,T,U,W,R,O],
    Digits = [0,1,2,3,4,5,6,7,8,9],
    assign_digits(Vars, Digits),
    T*100 + W*10 + O +
    T*100 + W*10 + O =:=
    F*1000 + O*100 + U*10 + R,
    F > 0, T > 0,
    print_out(Vars).


selecta(X, [X|R], R).
selecta(X, [Y|Xs], [Y|Ys]):- selecta(X, Xs, Ys).

assign_digits([], _List).
assign_digits([D|Ds], List):-
        selecta(D, List, NewList),
        assign_digits(Ds, NewList).

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
