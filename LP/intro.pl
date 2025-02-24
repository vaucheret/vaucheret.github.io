file("introd").
title("Lenguajes Declarativos").
author("Claudio Vaucheret").
date("Introducción").
theme("night").
transition("slide").

slides -->
    lenguajesDeclarativos,
    prolog,
    sintaxis,
    listas,
    automata,
    maquina.






lenguajesDeclarativos -->
    section("Lenguajes Declarativos"),
    slide("Características",
	  item(appear,
	       [
		   col(green,"Programa es Lógica + Control (Kowalski)"),
		   col(yellow,"X = X + 1 ¿que significa?"),
		   col(green,"Semánticas equivalentes a la operacional"),
		   col(yellow,"Programa es Algoritmo + Estructura de Datos (Wirth)"),
		   col(green,"Debugging, Correctitud, Prueba de Programas"),
		   col(yellow,"Análisis de Programas, Web Semantics")
	       ]
	      )),
    slide("95%",col(brown,"Lenguajes"),
	  item(appear,
	       [
		   (   "Relacional (Prolog)",
		       item(
			   [
			       (   "Swi Prolog", link("http://www.swi-prolog.org/","http://www.swi-prolog.org/") ),
			       (   "Ciao Prolog", link("http://ciao-lang.org/","http://ciao-lang.org/") ) ,
			       (   "Scryer Prolog", link("https://www.scryer.pl/","https://www.scryer.pl/") )    
			   ]
		       )
		   ),
		   (   "Funcional",
		       item(
			   [
			       (   "scheme (lisp)", link("https://racket-lang.org/","https://racket-lang.org/")),
			       (   "erlang (concurrency)",
				   item(
				       [
					   link("https://www.erlang.org/","https://www.erlang.org/"),
					   link("https://adoptingerlang.org/","https://adoptingerlang.org/")
				       ]
				   )
			       )
			   ]
		       )
		   ),
		   (   "Typed declarative languages",
		       item(
			   [
			       (   "Haskell", link("https://www.haskell.org/","https://www.haskell.org/")),
			       (   "Mercury", link("https://mercurylang.org","https://mercurylang.org"))
			   ]
		       )
		   )
	       ]
	      )).




prolog -->
    section("Prolog"),
    slide(col(red,"Programación en Lógica"),
	  item(appear,
	       [
		   "Cláusulas de Horn",
		   "Resolución SLD (basado en resolución de Robinson)",
		   "Lógica como lenguaje de programación"
	       ]
	      )
	 ),
    slide("Ejemplo fibonacci",""),
    slide("",
	  (   
	      slide(col(lime,"Sucesion de Fibonacci"),
		    (
			 "En matemáticas, la sucesión de Fibonacci (a veces llamada erróneamente serie de Fibonacci) es la siguiente sucesión infinita de números naturales: ",
			 p(col(lime,"\\[1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597 \\ldots\\]")),
		     	(   "La sucesión comienza con los números 1 y 1 y a partir de estos,",b("cada término es la suma de los dos anteriores"),",es la relación de recurrencia que la define.")
		    )
		   ),
	      slide(col(lime,"Sucesion de Fibonacci"),
		    "A los elementos de esta sucesión se les llama números de Fibonacci. Esta sucesión fue descrita en Europa por Leonardo de Pisa, matemático italiano del siglo XIII también conocido como Fibonacci. Tiene numerosas aplicaciones en ciencias de la computación, matemáticas y teoría de juegos. También aparece en configuraciones biológicas, como por ejemplo en las ramas de los árboles, en la disposición de las hojas en el tallo, en las flores de alcachofas y girasoles, en las inflorescencias del brécol romanesco y en la configuración de las piñas de las coníferas."
		   ),
	      slide("Conejos",
		    (
			p("una forma de exponer la sucesión de fibonacci es presentando el crecimiento de una población de conejos con las siguientes reglas:"),
			item(
			    [
				col(purple,"un conejo adulto, cada mes se reproduce a si mismo generando un conejo joven."),
				col(purple,"un conejo joven se vuelve adulto en un mes.")
			    ]
			),
			table(
			    (
				tr((th("mes"),th("O"),th("1"),th("2"),th("3"),th("4"),th("5"),th("6"),th("7"))),
				tr((td("adultos"),td(" "),td("1"),td("1"),td("2"),td("3"),td("5"),td("8"),td("13"))),
				tr((td("jovenes"),td("1"),td(" "),td("1"),td("1"),td("2"),td("3"),td("5"),td(" 8"))),
				tr((td("total")  ,td("1"),td("1"),td("2"),td("3"),td("5"),td("8"),td("13"),td("21")))
			    )
			)
		    )
		   ),
	      slide("Programa",
		    code(
			(
			    ":- module(fibonacci,[f/2]).\n",
			    "\n",
			    "f(0,1).\n",
			    "f(1,1).\n",
			    "f(N,R):-\n",
			    "    N >= 2,\n",
			    "    N1 is N - 1,\n",
			    "    N2 is N - 2,\n",
			    "    f(N1,F1),\n",
			    "    f(N2,F2),\n",
			    "    R is F1 + F2."
			)
		    )
		   )
	  )
	 ).


		    
sintaxis -->
    slide("",
	  (   
	      slide(col(green,"Sintaxis"),
		    (
			p("Términos:"),
			item([ "Atomos","Numeros","Varibles","Términos Complejos"]),
			p("los caracteres válidos son:"),
			code(
			    (
				"A , B  ...  Z\n",
				"a , b  ...  z\n",
				"+ , - , * , / , < , > , = , : , . , & , ~\n"
			    ))
		    )
		   ),
	      slide("75%",col(yellow,"Atomos"),
		    (
			p("Un átomo es:"),
			item(
			    [
				(   "Una cadena de caracteres de letras mayúsculas, minusculas, digitos y guión bajo, que comience con una letra minúscula.",
				    p(col(yellow,"ejemplos")),
				    code(
					(
					    "casa trabajo alberto eLLio x21\n"
					))),
				(   "Una secuencia arbitraria de caracteres encerrado en comillas simples.",
				    p(col(yellow,"ejemplos:")),
				    code(
					(
					    "'Alberto' 'Dolar21' 'EL Paso' '&^%si'\n"
					)))
			    ])
		    )
		   ),
	      slide(col(yellow,"Atomos"),
		    (
			p("Un átomo es:"),
			item(
			    [
				(   "una cadena de solo caracteres especiales.",
				    p(col(yellow,"ejemplos:")),
				    code(
					(
					    "@= ===> :- \n"
					)))
			    ])
		    )
		   ),
	      slide(col(yellow,"Números"),
		    (
			p("Ejemplos:"),
			code(
			    (
				"-8 -1 34 23.98 10001 1697.877443\n"
			    )))
		   ),
	      slide(col(yellow,"Variables"),
		    (
			p("Una variable es una cadena de caracteres de letras mayúsculas, minúsculas, digitos, guión bajo, que comience con una letra mayúscula o con un guión bajo."),
			p(col(yellow,"ejemplos:")),
			code(
			    (
				"X Y Variable _etiqueta X_526 List HEAD\n"
			    )))
		   ),
	      slide("95%",col(yellow,"Términos Complejos"),
		    (
			p("Un término se compone de un functor seguido de cero a N argumentos entre paréntesis y separados por comas. Cada argumento es un término."),
			p(col(yellow,"ejemplos:")),
			code(
			    (
				"fecha(12,octubre,2016)\n",
			    	"animal_peligroso('Leon')\n",
				"arbol(23,arbol(12,nil,nil),nil)\n"
			    )),
			fig(img("compoundterms.png","auto","180"))
		    )
		   )
	  )
	 ).


listas -->
    slide(col(green,"Listas"),
	  item('highlight-current-green',
	       [
		   ".(1,.(2,.(3,.(4,[]))))   dos argumentos Cabeza y Cola ./2",
		   "[1|[2|[3|[4|[]]]]]    notacion alternativa [|]",
		   "[1,2|[3|[4|[]]]]  = [1,2,3|[4|[]]] = [1,2,3,4|[]] = [1,2,3,4]",
		   "Unificar [a,1,b,4,c] = [X,Y|Z] ---> X=a, Y=1, Z=[b,4,c]"
	       ]
	      )
	 ).


automata -->
    slide("",
	  (
	      slide("75%",col(red,"Ejemplo Autómata Finito"),
		    (
			fig(img("automata.png","auto","230")),
			item(
			    [
				(   
				    p("Ejemplos de cadenas aceptadas:"),
				    code((
						"aabbab, ab, aaab, babab\n"
					    ))
				),
				(   
				    p("Ejemplos de cadenas rechazadas:"),
				    code((
						"aabb, aa, bb, ababa\n"
					    ))
				)
			    ])
		    )),
	      slide("90%",col(red,"Código"),
		    (
			p("El código en prolog que representa el autómata es"),
			code((
				    "final(s3).\n",
				    "\n",
				    "trans(s1,a,s1).\n",
				    "trans(s1,a,s2).\n",
				    "trans(s1,b,s1).\n",
				    "trans(s2,b,s3).\n",
				    "trans(s3,b,s4).\n",
				    "\n",
				    "silent(s2,s4).\n",
				    "silent(s3,s1).\n"
				)),
			fig(img("automata.png","auto","200"))
		    )
		   ),
	      slide(col(red,"Código"),
		    (
			p("el código que representa el reconocedor de las cadenas es"),
			code((
				    "accepts(State,[]):-\n",
				    "       final(State).\n",
				    "\n",
				    "accepts(State,[X|Rest]):-\n",
				    "       trans(State,X,State1),\n",
				    "       accepts(State1,Rest).\n",
				    "\n",
				    "accepts(State,String):-\n",
				    "       silent(State,State1),\n",
				    "       accepts(State1,String).\n"
				))

		    )),
	      slide(col(red,"Código"),
	            (
	        	p("el código principal es:"),
	        	code((
	        		    "main:-\n",
                                    "    argv([State,Chain]),\n",
                                    "    atom_chars(S, State),\n",
	        		    "        ( accepts(S,Chain) -> format(\"aceptada \",[]),nl\n",
	        		    "        ;\n",
	        		    "            format(\"rechazada \",[]),nl\n",
	        		    "        ).\n",
	        		    "main:- format(\"especificar estado y cadena \",[]),nl.\n"
	        		    ))
			
	            )),
              slide(col(red,"Arbol SLD"),
                    (
                        code(("accept(s1,[a,a,b]).\n")),
                        fig(img("acceptaab.png","auto","400"))
                    )),
              slide(col(red,"Arbol SLD"),
                    (
                        code(("accept(s1,[a,b]).\n")),
                        fig(img("accepts1ab.png","auto","400"))
                    )),
              slide(col(red,"Arbol SLD"),
                    (
                        code(("accept(s1,[b]).\n")),
                        fig(img("accepts1b.png","auto","480"))
                    )),
              slide(col(red,"Arbol SLD"),
                    (
                        code(("accept(s2,[b]).\n")),
                        fig(img("accepts2b.png","auto","480"))
                    )),
              slide(col(red,"Arbol SLD"),
                    (
                        code(("accept(s4,[b]).\n")),
                        fig(img("accepts4b.png","auto","400"))
                    )),
              slide("80%",col(red,"\\(Tp^n\\)"),
                    (
                       p("\\(U = \\{ a,b,s1,s2,s3,s4,[],[a],[b],[s1],\\ldots,[a,a],[a,b],\\ldots\\}\\)"),
                       p( "\\(Bp = \\{final(a),final(b),\\ldots, trans(a,a,a) , trans(a,b,a) , \\ldots\\)"),
                       p("\\(accepts(a,a), accepts(a,[]) \\ldots \\}\\)"),
                       p("\\(Tp(\\{\\}) = \\{final(s3),trans(s1,a,s1),trans(s1,a,s2),trans(s1,b,s1),\\)"),
                       p("\\(trans(s2,b,s3),trans(s3,b,s4),silent(s2,s4),silent(s3,s1)\\}\\)") 
                    )),
              slide("80%",col(red,"\\(Tp^n\\)"),
                    (
                       p("\\(Tp^1(\\{\\}) = Tp(\\{\\}) \\cup \\{accepts(s3,[])\\}\\)"),
                       p( "\\(Tp^2(\\{\\}) = Tp^1(\\{\\}) \\cup \\{accepts(s2,[b]\\}\\)"),
                       p("\\(Tp^3(\\{\\}) = Tp^2(\\{\\}) \\cup \\{accepts(s1,[a,b])\\}\\)"),
                       p("\\(Tp^4(\\{\\}) = Tp^3(\\{\\}) \\cup \\{accepts(s3,[a,b])\\)"),
                       p("\\(accepts(s1,[a,a,b]),accepts(s1,[b,a,b])\\}\\)"),
                       p("\\(Tp^5(\\{\\}) = Tp^4(\\{\\}) \\cup \\{accepts(s2,[b,a,b])\\)"),
                       p("\\(accepts(s3,[a,a,b]),accepts(s3,[b,a,b]),accepts(s1,[a,a,a,b])\\)"),
                       p("\\(accepts(s1,[b,a,a,b]),accepts(s1,[a,b,a,b]),accepts(s1,[b,b,a,b])\\}\\)") 
                    ))
	  )
	 ).

maquina -->
    slide("",
          (
              slide("60%",col(blue,"Máquina de Turing"),
                    (
                        p("Una máquina de Turing con una sola cinta puede definirse como una \\(7-tupla\\):"),
                        p("\\[M=(Q,\\Sigma ,\\Gamma ,s,b,F,\\delta )\\]"),
                        p("donde:"),
                        item([
                                    "\\(Q\\) es un conjunto finito de estados.",
                                    "\\(\\Sigma\\) es un conjunto finito de símbolos distinto del espacio en blanco, denominado alfabeto de máquina o de entrada.",
                                    "\\(\\Gamma\\) es un conjunto finito de símbolos de cinta, denominado alfabeto de cinta",
                                    "\\(\\Sigma \\subseteq \\Gamma\\)",
                                    "\\(s\\in Q\\) es el estado inicial.",
                                    "\\(b\\in \\Gamma\\) es un símbolo denominado blanco, y es el único símbolo que se puede repetir un número infinito de veces.",
                                    "\\(F\\subseteq Q\\) es el conjunto de estados finales de aceptación.",
                                    (  "\\(\\delta :Q\\times \\Gamma \\rightarrow Q\\times \\Gamma \\times \\{L,R\\}\\) es una ",em("función parcial")," denominada función de transición, donde:" )
                                ]),
                        p("\\(L\\) es un movimiento a la izquierda y \\(R\\) es el movimiento a la derecha.")
                    )
                   ),
              slide(col(blue,"CÓDIGO"),
                    code((
"turing(Tape0, Tape) :-\n",
"       perform(q0, [], Ls, Tape0, Rs),\n",
"       reverse(Ls, Ls1),\n",
"       append(Ls1, Rs, Tape).\n",
"\n",
"perform(qf, Ls, Ls, Rs, Rs) :- !.\n",
"\n",
"perform(Q0, Ls0, Ls, Rs0, Rs) :-\n",
"       symbol(Rs0, Sym, RsRest),\n",
"       once(rule(Q0, Sym, Q1, NewSym, Action)),\n",
"       action(Action, Ls0, Ls1, [NewSym|RsRest], Rs1),\n",
"       perform(Q1, Ls1, Ls, Rs1, Rs).\n",
"\n",
"symbol([], b, []).\n",
"symbol([Sym|Rs], Sym, Rs).\n",
"\n",
"action(left, Ls0, Ls, Rs0, Rs) :- left(Ls0, Ls, Rs0, Rs).\n",
"action(stay, Ls, Ls, Rs, Rs).\n",
"action(right, Ls0, [Sym|Ls0], [Sym|Rs], Rs).\n",
"\n",
"left([], [], Rs0, [b|Rs0]).\n",
"left([L|Ls], Ls, Rs, [L|Rs]).\n",
"\n",
"rule(q0, 1, q0, 1, right).\n",
"rule(q0, b, qf, 1, stay).\n",
"\n",
"\n",
"%% rule(q0, 1, q0,  1,right).\n",
"%% rule(q0, 0, q0,  0,right).\n",
"%% rule(q0,b,q1,c,left).\n",
"\n",
"%% rule(q1, 0, q1,  0,left ).\n",
"%% rule(q1, 1, q1,  1,left ).\n",
"%% rule(q1,b,q2,b,right).\n",
"\n",
"%% rule(q2, 0, q3,y,right).\n",
"%% rule(q2, 1, q7,x,right).\n",
"%% rule(q2,c, q11,c,left).\n",
"\n",
"\n",
"%% rule(q3, 0, q3,  0,right).\n",
"%% rule(q3, 1, q3,  1,right).\n",
"%% rule(q3,c,q4,c,right).\n",
"\n",
"%% rule(q4,  0,q4,  0,right).\n",
"%% rule(q4,  1,q4,  1,right).\n",
"%% rule(q4,b,q5,  0,left ).\n",
"\n",
"%% rule(q5,  0,q5,  0,left ).\n",
"%% rule(q5,  1,q5,  1,left ).\n",
"%% rule(q5,c,q6,c,left ).\n",
"\n",
"%% rule(q6,  0,q6,  0,left ).\n",
"%% rule(q6,  1,q6,  1,left ).\n",
"%% rule(q6,y,q2,y,right).\n",
"\n",
"%% rule(q7, 0, q7,  0,right).\n",
"%% rule(q7, 1, q7,  1,right).\n",
"%% rule(q7,c,q8,c,right).\n",
"\n",
"%% rule(q8,  0,q8,  0,right).\n",
"%% rule(q8,  1,q8,  1,right).\n",
"%% rule(q8,b,q9,  1,left ).\n",
"\n",
"%% rule(q9,  0,q9,  0,left ).\n",
"%% rule(q9,  1,q9,  1,left ).\n",
"%% rule(q9,c,q10,c,left ).\n",
"\n",
"%% rule(q10,  0,q10,  0,left ).\n",
"%% rule(q10,  1,q10,  1,left ).\n",
"%% rule(q10,x,q2,x,right).\n",
"\n",
"%% rule(q11,x,q11,1,left).\n",
"%% rule(q11,y,q11,0,left).\n",
"%% rule(q11,b,qf,b,stay).\n"
                                ))
          ))
         ).




show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
	consult(slideprolog),
	file(File),
	append(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).
