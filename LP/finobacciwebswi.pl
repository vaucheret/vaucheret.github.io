:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).
:- use_module(library(www_browser)).

:- http_handler(root(fibonacchi),handlerfibo,[]).


server(Port) :-
    http_server(http_dispatch, [port(Port)]).


:- server(6500).
:- www_open_url('http:/localhost:6500/fibonacchi').


handlerfibo(Request) :-
    http_parameters(Request,[numero(AN,[default('0')])]),
    atom_number(AN,N),
    f(N,F),number_chars(F,SF),
    reply_html_page([title("Numero de Fibonacci")],
		    [
			h1("Numero de Fibonacci"),\['<br>','<br>'],
			form([method="post",action="/fibonacchi"],
			     [
				 "El numero de Fibonacci de",
				 input([type="text",name="numero",placeholder="Entre el Numero",size="6",autofocus, required],[]),
                         \['<br>'],
                         "es el numero ",\['<b>~s</b>' - [SF]],
                         p(input([type="submit",value="Calcular"],[]))
			     ])
		    ]).


	


f(0,1).
f(1,1).
f(N,R):-
    N >=2,
    faux(2,N,1,1,R).

faux(N,N,A1,A2,R) :- R is A1 + A2.
faux(I,N,A1,A2,R) :-
    I1 is I + 1,
    A is A1 + A2,
    faux(I1,N,A2,A,R).




