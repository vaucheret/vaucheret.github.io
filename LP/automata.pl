:- use_module(etrace).


final(s3).
trans(s1,a,s1).
trans(s1,a,s2).
trans(s1,b,s1).
trans(s2,b,s3).
trans(s3,b,s4).

silent(s2,s4).
silent(s3,s1).

accepts(State,[]) :-
    final(State).


accepts(State,[X|Rest]):-
	trans(State,X,State1),
	accepts(State1,Rest).

accepts(State,String):-
	silent(State,State1),
	accepts(State1,String).

main :-
    argv([State,Chain]),
    atom_chars(S, State),
	(   accepts(S,Chain) -> format("aceptada ",[]),nl
	;
	    format("rechazada ",[]),nl
	),
        halt.

main :- format("especificar estado y cadena ",[]),nl,halt.

% versiones
% 1) con dcg y estado
% 2) gramatica dcg

s1 -->
    ab,"ab".

ab -->
    [].
ab -->
    "a",ab.
ab -->
    "b",ab.

