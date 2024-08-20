file("semantic").
title("Semanticas").
author("C. A. L. P.").
date("Claudio Vaucheret").
theme("night").


slides -->
    introduccion,
    semanticaestatica,
    sematincadinamica.

introduccion -->
    section("Introducción"),
    slide("Introducción",
	  item(appear,
	       [
		   (   col(blue,el(b,"Sintaxis:")), "La forma y estructura de las expresiones, sentencias y unidades del programa." ),
                   (   col(green,el(b,"Semántica:")), "El significado de las expresiones, sentencias, y unidades del programa."),
		   (   "Sintaxis y Semántica proveen una Definición del Lenguaje",
		       item(appear,
			    [
				(
				    "Usuarios de una Definición del Lenguaje",
				    item(appear,
					 [
					     "Otros diseñadores del Lenguaje",
					     "Implementadores",
					     "Programadores"
					 ])
				)
			    ])
		   )
	       ])
	 ),
    slide("85%","Definición Formal de Lenguajes",
	  item(appear,
	       [
		   (
		       col(blue,el(b,"Reconocedores")),
		       item(
			   [
			       "Un dispositivo de reconocimiento que lee cadenas del lenguaje y decide si las cadenas de entrada pertenecen al Lenguaje.",
			       "Ejemplo, el analizador sintáctico de un compilador."
			   ])
		   ),
		   (
		       col(green,el(b,"Generadores")),
		       item(
			   [
			       "Un dispositivo que genera sentencias de un lenguaje",
			       "Se puede determinar si la sintaxis de una sentencia particular\
                                 es correcta comparándola con la estructura del generador."
			   ])
		   )
	       ])),
    slide(col(red,"Métodos Formales de Describir la Sintaxis"),
	  item(appear,
	       [
		   (
		      col(green,"Forma Backus-Naur y gramáticas libres de contexto"),
		       item(appear,
			    [
				"El método mas conocido para describir la sintaxis de un Lenguaje\
                                  de Programación."
			    ]
			   )
		   ),
		   (
		      col(green,"BNF Extendida"),
		       item(appear,
			    [
				"Mejora la legibilidad de BNF."
			    ]
			   )
		   ),
		      col(green,"Gramáticas y Reconocedores")
	       ])
	 ),
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
	 ).

		   
semanticaestatica -->
    section("Semántica Estática"),
    slide("Gramáticas con atributos",
	  item(appear,
	       [
		   col(orange,"Las Gramáticas Libres de Contexto (GLC) no pueden describir toda la sintaxis de los lenguajes de programación."),
		   col(brown,"Agregados a GLC para introducir información semántica en los árboles sintácticos"),
		   (   
		       col(yellow,"Principal aporte de las Gramáticas con atributos"),
		       item(
			   [
			       col(yellow,"Especificación de la semántica estática"),
			       col(yellow,"Diseño de Compiladores (chequeo de semántica estática)")
			   ])
		   )
	       ])
	 ),
    slide("80%",col(red,"Gramáticas con atributos: Definición"),
	  item(
	       [
		   (   
		       "Una Gramática con atributos es una gramática libre de contexto \\(G =  (S,N,T,P)\\) con los siguientes agregados:",
		       item('highlight-current-red',
			   [
			       "Por cada símbolo de gramática \\(x\\) hay un conjunto \\(A(x)\\) de valores de atributos",
			       "Cada regla tiene un conjunto de funciones que definen ciertos atributos de los no terminales en la regla",
			       "Cada regla tiene un conjunto posiblemente vacío de predicados para chequear la consistencia de los atributos"
			   ])
		   )
	       ])
	 ),
    slide("90%",col(green,"Gramáticas con atributos: Definición"),
	  item('highlight-current-green',
	      [
		  "Sea \\(X_0 \\to X_1 ... X_n\\) una regla de la gramática libre de contexto",
		  (   "Funciones de la forma \\(S(X_0) = f(A(X_1), ... , A(X_n))\\) definen ",col(yellow,el(em,"atributos sintetizados")) ),
		  (   "Funciones de la forma \\(I(X_j) = f(A(X_0)), ... , f(A(X_{j-1}))\\) para \\(i <= j <= n\\), definen ", col(yellow,el(em,"atributos heredados"))  ),
		  (   "Inicialmente hay ", col(yellow,el(em,"atributos intrínsecos")), " en las hojas de los árboles sintácticos")
	      ])
	 ),
    slide("65%","Gramáticas con atributos: Un Ejemplo",
	  (   
	      item(
		  [
		      (   
			  "Sintaxis",
			  item(
			      [
				  "\\( < assign > \\to < var > = < expr > \\)",
				  "\\( < expr > \\to < var > + < var > | < var > \\)",
				  "\\( < var > \\to A | B | C \\)"
			      ])
		      ),
		      "tipo-real: sintetizado por < var > y < expr >",
		      "tipo-esperado: heredado por < expr >"
		  ]),
	      fig(img("attribgram1.png","auto","auto"))
	  )),
    slide("65%","Gramáticas con atributos: Un Ejemplo",
	      enum(
		  [
		      (
			  "Regla sintáctica: \\( < assign > \\to < var > = < expr > \\)",
			  item(
			      [
				 "Regla semántica: \\( < expr >.tipo-esperado \\leftarrow < var >.tipo-real \\)"
			      ])
		      ),
		      (
			  "Regla sintáctica: \\( < expr > \\to < var > [2] + < var > [3] \\)",
			  item(
			      [
				  (
				      "Regla semántica: \\( < expr >.tipo-real \\leftarrow \\)", 
				      el(p, 
					 "if \\( < var >[2].tipo-real = int \\)  and \\( < var >[3].tipo-real = int \\)  then \\( int \\) else \\( real \\)  end if  ")
				  ),
				  "Predicado: \\( < expr >.tipo-real = < expr >.tipo-esperado \\)"
			      ])
			  
		      ),
		      (
			  "Regla sintáctica: \\( < expr > \\to < var > \\)",
			  item(
			      [
				      "Regla semántica: \\( < expr >.tipo-real \\leftarrow < var >.tipo-real \\)", 
				      "Predicado: \\( < expr >.tipo-real = < expr >.tipo-esperado \\)"
			      ])
		      ),
		      (
			  "Regla sintáctica: \\( < var > \\to A | B | C \\)",
			  item(
			      [
				      "Regla semántica: \\( < var >.tipo-real \\leftarrow \\) lookup \\( ( < var >.string) \\)"

			      ])
		      )
		  ])
	 ),
    slide("65%","Gramáticas con atributos",
	  (
	      el(p,col(red,"¿Cómo se computan los valores de atributos?")),
	      item(
		  [
		      (	  "Si todos los atributos fueran heredados, el árbol podría ser completado en un orden ", el(em,"top-down") ),
		      (	  "Si todos los atributos fueran sintetizados, el árbol podría ser completado en un orden ", el(em,"bottom-up") ),
		      "En muchos casos, ambos casos de atributos son utilizados y se necesita una combinación de ambos órdenes."
		  ]),
	      fig(img("attribgram2.png","auto","auto"))
	  )),
    slide("65%","Gramáticas con atributos",
	  (   
	      enum(
		  [
		       "\\( < var >.tipo-real \\leftarrow look-up(A) \\)  (Regla 4)",
		       "\\( < expr >.tipo-esperado \\leftarrow < var >.tipo-real \\) (Regla 1)",
		      item(
			  [
			      "\\(  < var >[2].tipo-real \\leftarrow look-up(A) \\) (Regla 4)",
			      "\\(  < var >[3].tipo-real \\leftarrow look-up(B) \\) (Regla 4)"
			  ]),
		      "\\( < expr >.tipo-real \\leftarrow \\) int o real  (Regla 2)",
		      "\\( < expr >.tipo-esperado = < expr >.tipo-real  \\) es VERDADERO o FALSO (Regla 2)"
		  ]),
	      fig(img("attribgram3.png","auto","auto"))
	  )).

	  

	  

sematincadinamica -->
    section("Semántica Dinámica").




show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
        theme(Theme),
        consult(slideprolog),
        file(File),
        append(File,".html",Filehtml),
	phrase_to_file(presentation(Theme),Filehtml).
