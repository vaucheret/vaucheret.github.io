:- module(_1,[main/0],[assertions,regtypes,nativeprops]).

:- use_module(library(write)).

%% %% :- check pred main.

:- checked calls main.

:- true pred main.

:- true pred main.

main :-
    write('hello world').


