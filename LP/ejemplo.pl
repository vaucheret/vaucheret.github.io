file("ejemplo").
title("Slides en Prolog").
author("Claudio Vaucheret").
date("17/8/2024").
theme("night").
transition("slide").


slides -->
    introduccion,
    contenido,
    otros,
    conclusion,
    semanticaGeneraldeLlamadayRetorno.


introduccion -->
    section("Introduccion"),
    slide(animate,"diapositiva",
	  (
	     p("Esto es muy importante"),
	     p( "Para mi")
	  )),
    slide(animate,"diapositiva",
	  (
	     p( "Para mi"),
	     p("Esto es muy importante")
	  )).

contenido -->
    section("Contenido"),
    slide("Dos Columnas",
	  split(
	      enum(appear,
		   [
		       col(orange,"uno"),
		       col(green,"dos"),
		       col(yellow,"tres")
		   ]),
	      item(appear,
		   [
		       col(blue,"cuatro"),
		       col(red,"cinco"),
		       col(brown,"seis")
		   ]))),
    	      slide("tabla",
		    	       table(
		     (	 
			tr(( th("Fuente"), th("Porcentaje"))),
			tr((td("Gas Natural"),td(style="text-align:right;","53,20%"))),
			tr((td("Petroleo"),td(style="text-align:right;","31,30%"))),
			tr((td("Biomasa"),td(style="text-align:right;","5,80%"))),
			tr((td("Hidroeléctrica"),td(style="text-align:right;","3,20%"))),
			tr((td("Nuclear"),td(style="text-align:right;","2,60%"))),
			tr((td("Renovables"),td(style="text-align:right;","2,30%"))),
			tr((td("Carbón"),td(style="text-align:right;","1,60%")))
		     )  
		     )),
    slide("horizontal slide",""),
    slide("",
	  (
	      slide("vertical slide","vertical slide"),
	      slide("vertical slide","another vertical slide")

	  )),

    slide(animate,"Imagen",
	  split(
	      fig(img("9dejulio.jpg","auto","400")),
	      enum(
		   [
		       "El obelisco",
		       col(red,"esta muy bien"),
		       col(brown,"<-"),
		       col(green,"\\( \\to \\)"),
		       col(green,"\\( \\leftarrow \\)")
		   ]))),
        slide(animate,"Imagen",
	  split(
	      fig(img("9dejulio.jpg","auto","400")),
	      enum(
		   [
		       col(green,"\\( \\to \\)"),
		       col(brown,"<-"),
		       "El obelisco",
		       col(green,"\\( \\leftarrow \\)"),
		       col(red,"esta muy bien")
		   ]))).


otros -->
    section("Otros"),
        slide("85%","Definición Formal de Lenguajes",
	  item(appear,
	       [
		   (
		       col(blue,b("Reconocedores")),
		       item(
			   [
			       "Un dispositivo de reconocimiento que lee cadenas del lenguaje y decide si las cadenas de entrada pertenecen al Lenguaje.",
			       "Ejemplo, el analizador sintáctico de un compilador."
			   ])
		   ),
		   (
		       col(green,b("Generadores")),
		       item(
			   [
			       "Un dispositivo que genera sentencias de un lenguaje",
			       "Se puede determinar si la sintaxis de una sentencia particular\
                                 es correcta comparándola con la estructura del generador."
			   ])
		   )
	       ])),
	    slide("90%",col(red,"BNF y Gramáticas Libres de Contexto"),
	  item(appear,
	       [
		   (
		      col(green,"Gramáticas libres de Contexto"),
		       item(appear,
			    [
				"Desarrollado por Noam Chomsky a mediados de 1950s",
				"Generadores de Lenguajes, medio de  describir la la sintaxis de lenguajes naturales",
				"Define clases de lenguajes"
			    ]
			   )
		   ),
		   (
		      col(green,"Forma Backus-Naur (1959)"),
		       item(appear,
			    [
				"Inventado por John Backus para describir Algol 58",
				"Árboles sintacticos - ambiguedad del lenguaje"
			    ]
			   )
		   )
	       ])
		 ),
	    slide("90%",col(green,"Gramáticas con atributos: Definición"),
	  item('highlight-current-green',
	      [
		  "Sea \\(X_0 \\to X_1 ... X_n\\) una regla de la gramática libre de contexto",
		  (   "Funciones de la forma \\(S(X_0) = f(A(X_1), ... , A(X_n))\\) definen ",col(yellow,em("atributos sintetizados")) ),
		  (   "Funciones de la forma \\(I(X_j) = f(A(X_0)), ... , f(A(X_{j-1}))\\) para \\(i <= j <= n\\), definen ", col(yellow,em("atributos heredados"))  ),
		  (   "Inicialmente hay ", col(yellow,em("atributos intrínsecos")), " en las hojas de los árboles sintácticos")
	      ])
		 ).



conclusion -->
    section("Conclusion"),
    slide("latex",
	  (   
	  p("\\[ a = f(z) \\left\\{ \\begin{array}{ll} 1    &  z \\ge 0 \\\\  0  &  z < 0  \\end{array}  \\right. \\]"),
    p("o sea en su definición mas simple con dos entradas"),
    p("\\[ a =  \\left\\{ \\begin{array}{ll} 1    &  \\mathrm{si\\ } b + w_1x_1 + w_2x_2  \\ge 0 \\\\  0  &  \\mathrm{si\\ } b + w_1x_1 + w_2x_2 < 0  \\end{array}  \\right. \\]")
	  )),
    slide("code",
	  code(
	      (
		  "main:- display('hola').\n",
		  "sort([X|Y]) :- sort(Y).\n",
		  "conclusion -->\n",
		  "    section(\"Conclusion\"),\n",
		  "    slide(\"latex\","
	      ))),
    slide("ultima diapositiva",
	  (
	      "Fin"
	  )).

semanticaGeneraldeLlamadayRetorno -->
    section(animate,"Semántica General de Llamada y Retorno"),
    section(animate,em(col(red,"Semántica General de Llamada y Retorno"))),
    slide("85%",col(red,"Semántica General de Llamada y Retorno"),
	  item('highlight-current-red',
	       [
		   "Semánticamente es como si el subprograma se insertara en el punto de su llamada (no es siempre asi)",
		   (   "En un lenguaje de Programación, las operaciones de llamado y retorno de subprogramas son llamadas en conjunto ",em("articulación de subprogramas")  ),
		       (   "La llamada a un subprograma tiene varias acciones asociadas con:",
			   item('highlight-current-red',
			       [
				   "El método de pasaje de parámetros",
				   "variables locales estáticas",
				   "Estado de ejecución del programa llamador",
				   "transferencia del control",
				   "Estructura de anidamiento de los subprogramas"
			       ])
		       )
	       ])).


show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
	consult(slideprolog),
	file(File),
	append(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).

