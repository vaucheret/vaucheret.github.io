:- module(hello, [main/0], [assertions]).

:- use_module(library(write)). 

:- pred main/0 # "display hello world".

main :-
    write('hello world').