:- module(autom,_).

:- use_module(library(iso_char)).

main([State,Chain]):-
    (
        accepts(State,Chain) -> display('aceptada '),nl
        ;
            display('rechazada '),nl
        ).
main(_):- display('especificar estado y cadena '),nl.

accepts(State,String):-
        atom_chars(String, Chars),
        accepts_(State,Chars).

final(s3).

trans(s1,a,s1).
trans(s1,a,s2).
trans(s1,b,s1).
trans(s2,b,s3).
trans(s3,b,s4).

silent(s2,s4).
silent(s3,s1).

accepts_(State,[]):-
        final(State).

accepts_(State,[X|Rest]):-
        trans(State,X,State1),
        accepts_(State1,Rest).

accepts_(State,String):-
        silent(State,State1),
        accepts_(State1,String).
