:- use_module(library(http/http_server)).

pagina(F) -->
    html(
        (   head(title("Numero de Fibonacci")),
            body(
                (   h1("Numero de Fibonacci"),
                    "<br>","<br>",
                    form((method="post",action="/fibonacchi"),
                         (   
                         "El numero de Fibonacci de\n",
                         input((type="text",name="numero",placeholder="Entre el Numero",size="6"," autofocus required"),""),
                         "<br>\n",
                         format_("es el numero <b>~s</b>\n",[F]),
                         p(input((type="submit",value="Calcular"),"")))))))).

                         

handlerfibo(Request, Response) :-
    http_body(Request,form(FORM)),
    (   (   member("numero"-SN,FORM), SN \= "")
    -> number_chars(N,SN),f(N,F),number_chars(F,SF)
    ; SF = ""
    ),
    http_status_code(Response, 200),
    phrase(pagina(SF),B),
    http_body(Response, text(B)).

handlerfibog(_Request, Response) :-
    http_status_code(Response, 200),
    phrase(pagina(""),B),
    http_body(Response, text(B)).

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


main :-
    consult(htmlscryer),
    shell("xdg-open http://localhost:7000/fibonacchi"),
    http_listen(7000, [get(fibonacchi,handlerfibog),post(fibonacchi,handlerfibo)]).

:- initialization(main).









