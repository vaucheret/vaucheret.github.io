:- module(fibonaccix,[fibodialogo/0]).

:- use_module(library(pce)).

:- fibodialogo.

fibodialogo :-
    new(D,dialog('fibonacci')),
    send_list(D,append,
	      [
		  new(N1,text_item(numero)),
		  new(L,label),
		  new(L2,label),
		  button(calcular,message(@prolog,calcfib,L2,N1?selection)),
		  button(salir,message(D,destroy))
	      ]),
    send(L,selection('Resultado:')),
    send(D,default_button,calcular),
    send(D,open).




calcfib(L2,N1) :-
    atom_number(N1,N),
    fib(N,R),
    atom_number(A,R),
    send(L2,selection(A)).

    	    
	
fib(0,1).
fib(1,1).
fib(N,R) :-
    N #>= 2,
    fibaux(2,N,1,1,R).

fibaux(N,N,A1,A2,R) :-
    R #= A1 + A2.
fibaux(I,N,A1,A2,R) :-
    I1 #= I + 1,
    A3 #= A1 + A2,
    fibaux(I1,N,A2,A3,R).





     
