file("semantica").
title("Semantica").
author("C. A. L. P.").
date("Claudio Vaucheret").
theme("night").
transition("slide").


slides -->
    introduccion,
    semanticaestatica,
    semanticadinamica.




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
			       "Se puede determinar si la sintaxis de una sentencia particular\c
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
				"El método mas conocido para describir la sintaxis de un Lenguaje\c
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
				  "\\( \\mbox{&lt;assign&gt;} \\to \\mbox{&lt;var&gt;} = \\mbox{&lt;expr&gt;}\\)",
				  "\\( \\mbox{&lt;expr&gt;} \\to \\mbox{&lt;var&gt;} + \\mbox{&lt;var&gt;} | \\mbox{&lt;var&gt;} \\)",
				  "\\( \\mbox{&lt;var&gt;} \\to A | B | C \\)"
			      ])
		      ),
		      "tipo-real: sintetizado por \\(\\mbox{&lt;var&gt;}\\) y \\(\\mbox{&lt;expr&gt;}\\)",
		      "tipo-esperado: heredado por \\(\\mbox{&lt;expr&gt;}\\)"
		  ]),
	      fig(img("attribgram1.png","auto","auto"))
	  )),
    slide("65%","Gramáticas con atributos: Un Ejemplo",
	      enum(
		  [
		      (
			  "Regla sintáctica: \\( \\mbox{&lt;assign&gt;} \\to \\mbox{&lt;var&gt;} = \\mbox{&lt;expr&gt;} \\)",
			  item(
			      [
				 "Regla semántica: \\( \\mbox{&lt;expr&gt;.tipo-esperado} \\leftarrow \\mbox{&lt;var&gt;.tipo-real} \\)"
			      ])
		      ),
		      (
			  "Regla sintáctica: \\( \\mbox{&lt;expr&gt;} \\to \\mbox{&lt;var&gt;[2]} + \\mbox{&lt;var&gt;[3]} \\)",
			  item(
			      [
				  (
				      "Regla semántica: \\( \\mbox{&lt;expr&gt;.tipo-real} \\leftarrow \\)", 
				      el(p, 
					 "if \\( \\mbox{&lt;var&gt;[2].tipo-real} = int \\)  and \\( \\mbox{&lt;var&gt;[3].tipo-real} = int \\)  then \\( int \\) else \\( real \\)  end if  ")
				  ),
				  "Predicado: \\( \\mbox{&lt;expr&gt;.tipo-real} = \\mbox{&lt;expr&gt;.tipo-esperado } \\)"
			      ])
			  
		      ),
		      (
			  "Regla sintáctica: \\( \\mbox{&lt;expr&gt;} \\to \\mbox{&lt;var&gt;} \\)",
			  item(
			      [
				      "Regla semántica: \\( \\mbox{&lt;expr&gt;.tipo-real } \\leftarrow \\mbox{&lt;var&gt;.tipo-real } \\)", 
				      "Predicado: \\( \\mbox{&lt;expr&gt;.tipo-real } = \\mbox{&lt;expr&gt;.tipo-esperado } \\)"
			      ])
		      ),
		      (
			  "Regla sintáctica: \\( \\mbox{&lt;var&gt;} \\to A | B | C \\)",
			  item(
			      [
				      "Regla semántica: \\( \\mbox{&lt;var&gt;.tipo-real } \\leftarrow \\) lookup \\( ( \\mbox{&lt;var&gt;.string}) \\)"

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
		       "\\( \\mbox{&lt;var&gt;.tipo-real } \\leftarrow look-up(A) \\)  (Regla 4)",
		       "\\( \\mbox{&lt;expr&gt;.tipo-esperado } \\leftarrow \\mbox{&lt;var&gt;.tipo-real } \\) (Regla 1)",
		      item(
			  [
			      "\\(  \\mbox{&lt;var&gt;[2].tipo-real }\\leftarrow look-up(A) \\) (Regla 4)",
			      "\\(  \\mbox{&lt;var&gt;[3].tipo-real }\\leftarrow look-up(B) \\) (Regla 4)"
			  ]),
		      "\\( \\mbox{&lt;expr&gt;.tipo-real }\\leftarrow \\) int o real  (Regla 2)",
		      "\\( \\mbox{&lt;expr&gt;.tipo-esperado } = \\mbox{&lt;expr&gt;.tipo-real } \\) es VERDADERO o FALSO (Regla 2)"
		  ]),
	      fig(img("attribgram3.png","auto","auto"))
	  )).

	  
semanticadinamica -->
    section("Semántica Dinámica"),
    slide("90%","Métodos Desarrollados",
	  item(
	      [
		  (
		      el(b,col(green, "Semántica Operacional")),
		      item(appear,
			   [
			       "Operaciones en una máquina abstracta"
			   ])
		  ),
		  (
		      el(b,col(green, "Semántica Denotacional")),
		      item(appear,
			   [
			       "Usa funciones para especificar la semántica, los programas se convierten en funciones para poder aplicar la teoría de funciones recursivas"
			   ])
		  ),
		  (
		      el(b,col(green, "Semántica Axiomática")),
		      item(appear,
			   [
			       "Aplica la lógica formal: afirmaciones (aserciones) para describir suposiciones y resultados deseados",
			       "Los axiomas o reglas de inferencia son usados en cada tipo de sentencias."
			   ])
		  )
	      ])
	
	 ),
    slide(col(green,"Semántica Operacional"),
	  (
	      slide("90%","",
		    (
			el(p,"Describe el significado de un programa ejecutando sus sentencias sobre una máquina, simulada o real. Los cambios en el estado de la máquina (registros, memoria, etc) define el significado de la sentencia."),
			el(p,"Para el uso de una semántica operacional en un lenguaje de alto nivel se necesita una máquina virtual"),
			item(
			    [
				"Un intérprete de hardware puro podría ser muy costoso.",
				"Un intérprete de software puro también tiene problemas (dependiente de la máquina )"
			    ])
		    )),
	      slide("",
		    (
			el(p,"Una mejor alternativa: Una simulación completa de la computadora"),
			item(
			    [
				"Construir un traductor del codigo fuente a un codigo maquina de una computadora idealizada",
				"Construir un simulador para la computadora idealizada"
			    ])
		    )),
	      slide("",
		    (
			el(p,"Ejemplo: sentencia  for"),
			fig(img("senteciafor.png","auto","400"))
		    )),
		 slide(col(green,"Semántica Operacional"),
		    item(
			[
			    (
				"Simulador de Prolog en Prolog",
				code(
				    (
					"mi(true).\n",
					"mi((A,B)) :-\n",
					"        mi(A),\n",
					"        mi(B).\n",
					"mi(Goal) :-\n",
					"        Goal \\= true,\n",
					"        Goal \\= (_,_),\n",
					"        clause(Goal, Body),\n",
					"        mi(Body).\n"
				    ))
			    ),
			    (
				"Evaluación:",
				item(
				    [
					"Bueno usado informalmente.",
					"Extremadamente complejo usado formalmente."
				    ])
			    )
			])
		   )
	  )),
    slide("",
	  (
	      slide("85%",col(green,"Semántica Denotacional"),
		    item('highlight-current-green',
			 [
			     "Basado en la teoría de funciones recursivas",
			     "El método de descripción semántica mas abstracto",
			     "Originalmente desarrollado por Scott y Strachey (1970)",
			     (	 "El proceso de construir una especificación denotacional para un lenguaje es definir un objeto matemático por cada entidad del Lenguaje",
				 item(["Define una función que relaciona instancias de las entidades del lenguaje con instancias de los objetos matemáticos correspondientes"])),
			     "El significado de las construcciones del lenguaje son definidos solo por los valores de las variables del programa"
			 ])
		   ),
	      slide("85%",col(green,"Semántica Denotacional vs Semántica Operacional"),
		    item('highlight-current-green',
			 [
			     "En la semántica operacional los cambios de estado son definidos por algoritmos codificados",
			     "En la semántica denotacional los cambios de estado son definidos por funciones matemáticas rigurosas.",
			     "El estado de un programa son los valores de todas las variables actuales  \\(s = { < i_1,v_1 >,< i_2,v_2 >, ... ,< i_n,v_n > }\\)", 
			     	 "Sea \\(VARMAP\\), una función que, cuando recibe un nombre de variable y un estado retorna el valor actual de esa variable \\(VARMAP(i_j, s) = v_j\\)" 
			 ])
		   ),
	      slide(col(red,"Números Decimales"),
		    item(
			[
			    "\\( \\mbox{&lt;dec-num&gt;} \\to 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | \\)",
			    "\\( M_{dec} ('0') = 0,  M_{dec} ('1') = 1, ... , M_{dec} ('9') = 9 \\)",
			    "\\( M_{dec} ( \\mbox{&lt;dec-num&gt;} '0') = 10 * M_{dec} ( \\mbox{&lt;dec-num&gt;} ) \\)",
			    "\\( M_{dec} ( \\mbox{&lt;dec-num&gt;} '1') = 10 * M_{dec} ( \\mbox{&lt;dec-num&gt;} ) + 1 \\)",
			    "\\(\\ldots\\)",
			    "\\( M_{dec} ( \\mbox{&lt;dec-num&gt;} '9') = 10 * M_{dec} ( \\mbox{&lt;dec-num&gt;} ) + 9 \\)"
			])
		   ),
	      slide(col(blue,"Expresiones"),
		    (
			el(p,"relaciona expresiones a \\(Z \\cup \\{ error \\} \\)"),
			el(p,"suponiendo que las expresiones son números decimales, variables, o expresiones binarias teniendo un operador aritmético y dos operandos, cada uno de los cuales puede ser una expresión.")
		    )),
	      slide("60%","",
		    enum(
			[
			    "\\( M_e ( \\mbox{&lt;expr&gt;}, s) = case \\mbox{&lt;expr&gt;} of \\)",
			    "\\(\\qquad \\mbox{&lt;dec-num&gt;} \\to M_{dec} ( \\mbox{&lt;dec-num&gt;} , s)\\)",
			    "\\(\\qquad \\mbox{&lt;var&gt;} \\to \\mbox{ if } VARMAP(\\mbox{&lt;var&gt;}, s)\\)",
			    "\\(\\qquad \\mbox{&lt;binary-expr&gt;} \\to \\)",
			    "\\(\\qquad \\qquad \\mbox{ if } (M_e(\\mbox{&lt;binary-expr&gt;} . \\mbox{&lt;left-expr&gt;} , s) = undef\\)",
			    "\\(\\qquad \\qquad \\qquad \\mbox{ OR } M_e(\\mbox{&lt;binary-expr&gt;} . \\mbox{&lt;right-expr&gt;} , s) = undef)\\)",
			    "\\(\\qquad \\qquad \\mbox{ then error}\\)",
			    "\\(\\qquad \\qquad \\mbox{ else}\\)",
			    "\\(\\qquad \\qquad \\qquad \\mbox{ if } (\\mbox{&lt;binary-expr&gt;}.\\mbox{&lt;operator&gt;} = ‘+’ then \\)" ,
			    "\\(\\qquad \\qquad \\qquad  M_e(\\mbox{&lt;binary-expr&gt;}.\\mbox{&lt;left-expr&gt;}, s) + M_e(\\mbox{&lt;binary-expr&gt;}.\\mbox{&lt;right-expr&gt;}, s)\\)",
			    "\\(\\qquad \\qquad \\qquad \\mbox{ else }\\)",
			    "\\(\\qquad \\qquad \\qquad M_e(\\mbox{&lt;binary-expr&gt;}.\\mbox{&lt;left-expr&gt;}, s) * M_e(\\mbox{&lt;binary-expr&gt;}.\\mbox{&lt;right-expr&gt;}, s)\\)",
			    "\\( \\ldots \\)"
			])
		   ),
	      slide("85%",col(brown,"asignación"),
		    enum(
			[
			    "\\( M_a ( X := E, s) = \\)",
			    "\\(\\qquad \\mbox{if } M_e(E, s) = error \\)",
			    "\\(\\qquad \\qquad \\mbox{ then error}\\)",
			    "\\(\\qquad \\qquad \\mbox{ else } s' = { < i_{1}',v_{1}' >, < i_{2}',v_{2}' >, \\ldots , < i_{n}',v_{n}' >},\\)",
			    "\\(\\qquad \\qquad \\qquad \\mbox{ where for } j = 1, 2, \\ldots n,\\)",
			    "\\(\\qquad \\qquad \\qquad \\qquad v_{j}' = varmap(i_j, s) \\mbox{ if } i_j <> x \\)",
			    "\\(\\qquad \\qquad \\qquad \\qquad \\qquad  = M_e(E, s) \\mbox{ if } i_j = x\\)"
			])
		   ),
	      slide("85%",col(yellow,"Ciclo 'while'"),
		    enum(
			[
			    "\\( M_l(\\mbox{while B do L}, s) =\\)",
			    "\\(\\qquad \\mbox{ if } M_b(B, s) = undef\\)",
			    "\\(\\qquad \\qquad \\mbox{ then error}\\)",
			    "\\(\\qquad \\qquad \\mbox{ else if } M_b(B, s) = false\\)",
			    "\\(\\qquad \\qquad \\qquad \\mbox{ then } s\\)",
			    "\\(\\qquad \\qquad \\qquad \\mbox{ else if } M_{sl}(L, s) = error\\)",
			    "\\(\\qquad \\qquad \\qquad \\qquad \\mbox{ then error}\\)",
			    "\\(\\qquad \\qquad \\qquad \\qquad \\mbox{ else } M_l(\\mbox{while B do L}, M_{sl}(L, s))\\)"
			])
		   ),
	      slide("Ciclo",
		    item('highlight-current-red',
			 [
			     "El significado del ciclo es el valor de las variables del programa después de que las sentencias del ciclo han sido ejecutadas el número prescrito de veces, asumiendo que no ha habido errores",
			     "En esencia el ciclo ha sido convertido de iterativo a recursivo, donde el control recursivo es definido por otra función recursiva de estados",
			     "La recursión comparada con la iteración es mas facil de describir con rigor matemático"
			 ])
		   ),
	      slide(col(green,"Evaluación"),
		    item('highlight-current-green',
			 [
			     "Puede ser usado para probar la corrección de programas",
			     "Provee un modo riguroso de pensar los programas",
			     "Puede ser una ayuda al diseño de lenguajes",
			     "Ha sido usado en sistemas de generación de compiladores",
			     "A causa de su complejidad es de poco uso para los usuarios del lenguaje"
			 ])
		   )
	  )),
        slide("",
	      (
		  slide("Semántica Axiomática",
			item('fade-in-then-semi-out',
			    [
				"Basado en Lógica Formal (cálculo de predicados)",
				"Propósito original: Verificación formal de programas",
				"Axiomas o reglas de inferencia son definidas para cada tipo de sentencia del lenguaje (para permitir transformaciones de expresiones a otras expresiones)",
				(   "Las expresiones son llamadas ", el(em,"aserciones"), " (afirmaciones) " )
			    ])
		       ),
		  slide(col(blue,"Semántica Axiomática"),
			item('highlight-current-blue',
			     [
				 (   "Una aserción antes de una sentencia (una ", el(em,"precondición"), "establece las relaciones y restricciones entre variables que son verdaderas en ese punto de la ejecución" ),
				 (   "Una aserción que sigue a una sentencia es una ", el(em,"postcondición") ),
				 (   "Una ", el(em,"precondición mas débil"), " es la menos restrictiva precondición que garantiza la postcondición" )
			    ])
		       ),
		  slide(col(red,"Semántica Axiomática"),
			item(appear,
			     [
				 "La Forma es \\({P}\\) sentencia \\({Q}\\)",
				 (   "Un ejemplo" ,
				     item(appear,
					  [
					      "\\(a = b + 1 \\: \\{a > 1\\} \\)",
					      "una posible precondición: \\( \\{b > 10\\} \\)",
					      (	  el(em,"precondición mas débil"), "\\( \\{b > 0\\} \\)" ) 
					  ])
				 )
			     ])
		       ),
		  slide(col(brown,"Proceso de prueba de programa"),
			(
			    el(p,"La postcondición para el programa entero es el resultado deseado"),
			    item(appear,
				 [
				     "Se trabaja hacia atrás a través del programa hasta la primer sentencia. Si la precondición sobre la primer sentencias está inferida por la especificación de entrada del programa, entonces el programa es correcto."
				 ])
			)
		       ),
		  slide("Axiomas",
			item(appear,
			    [
				(   
				    "Un axioma para la asignación",
				    item(
					[
					    "( x = E ): \\( \\{Q_{x \\to E}\\} \\ x = E \\ \\{Q\\} \\)"
					])
				),
				(   
				    "La regla de la Consecuencia",
				    item(
					[
					    " \\[ \\frac{ \\{P\\} \\ S \\ \\{Q\\}, P' \\Rightarrow P, Q \\Rightarrow Q'}{\\{P'\\} \\ S \\ \\{Q'\\}} \\] "
					])
				)
			    ])
		       ),
		  slide("Axiomas",
			item(appear,
			     [
				 "\\( x = 2 * y - 3 \\{x > 25 \\}  \\)",
				 "\\( 2 * y - 3 > 25  \\)",
				 "\\( y > 14  \\)",
				 "\\( x = x + y - 3 \\{x > 10 \\}  \\)",
				 "\\( x + y - 3 > 10  \\)",
				 "\\( y > 13 - x  \\)"
			     ])
		       ),
		  slide("80%","Axiomas",
			" \\[ \\frac{ \\{x > 3\\} \\ x = x - 3 \\ \\{x > 0\\}, (x > 5) \\Rightarrow (x > 3), (x > 0) \\Rightarrow (x > 0)}{\\{x > 5\\} \\ x = x - 3 \\ \\{x > 0\\}} \\]"
		       ),
		  slide("Axiomas",
			(
			    item(
				[
				    (
					"Una regla de inferencia para secuencias",
					item(
					    [
						  "\\( \\{P1\\} S1 \\{P2\\} \\)",
						  "\\( \\{P2\\} S2 \\{P3\\} \\)"
					    ])
				    )
				]),
			    "\\[ \\frac{ \\{P1\\} \\ S1 \\ \\{P2\\}, \\{P2\\} \\ S2 \\ \\{P3\\}}{\\{P1\\} \\ S1;S2 \\ \\{P3\\}} \\]"
			
			)),
		  slide("Axiomas",
			(
			    item(
				[
				    "\\( y = 3 * x + 1  \\);",
				    "\\( x =  y + 3 \\);",
				    "\\(\\{ x < 10 \\}  \\)"
				]),
			    el(p,("La precondición para la segunda asignación es \\( y < 7 \\) la cual es usada como postcondición para la primer sentencia. La precondición para la primera asignación puede ser computada")),
			    item(
				[
				    "\\( 3 * x + 1 < 7  \\)",
				    "\\( x < 2 \\)"
				])
			)),
		  slide("Axiomas",
			(
			    el(p,("regla de inferencia para sentencias de selección ",el(em,"if"))),
			    el(p,("{P} ",el(b,"if")," B ",el(b,"then")," S1 ",el(b,"else")," S2 {Q}")),
			    "\\[ \\frac{ \\{B \\ and \\ P \\} \\ S1 \\ \\{Q\\}, \\{(not B) \\ and \\ P\\} \\ S2 \\ \\{Q\\}}{\\{P\\} \\ if \\ B \\ then \\ S1 \\ else \\ S2 \\ \\{Q\\}}\\]"
			)),
		  slide(col(magenta,"Ejemplo"),
			(
			    (	el(b,"if")," \\( x > 0 \\) ",el(b,"then")," \\( y = y -1 \\) ",el(b,"else")," \\( y = Y + 1 \\)"),
			    item(appear,
				 [
				     "con la postcondición \\( \\{ y > 0 \\} \\)",
				     (	 "el axioma de asignación para la clausula ",el(b,"then")," : \\( y = y - 1  \\{ y > 0 \\} \\)  produce \\( \\{ y - 1 > 0 \\} \\) o \\( \\{ y > 1 \\} \\)" ),
				     (	 "el axioma de asignación para la clausula ",el(b,"else")," : \\( y = y + 1  \\{ y > 0 \\} \\)  produce \\( \\{ y + 1 > 0 \\} \\) o \\( \\{ y > -1 \\} \\)"),
				     "Como \\( \\{ y > 1 \\} \\Rightarrow \\{ y > -1 \\}\\) la regla de consecuencia nos permite usar \\( \\{ y > 1 \\} \\) como precondición del total de la sentencia"
				 ])
			)),
		  slide("Axiomas",
			(
			    el(p,("Una regla de inferencia para un ciclo ",el(em,"while"))),
			    el(p,("{P} ",el(b,"while")," B ",el(b,"do")," S ",el(b,"end")," {Q}")),
			    "\\[ \\frac{ (I \\ and \\ B ) S \\{I\\} }{\\{I\\} \\ while \\ B \\ do \\ S \\{I \\ and (not B)\\}} \\]",
			    (	"donde \\(I\\) es el ",el(em,"invariante")," (la hipótesis inductiva)" )
			)),
		  slide("Axiomas",
			(
			    el(p,("Características del ",el(em,"invariante"),": \\(I\\) debe satisfacer las siguientes condiciones:")),
			    enum(
				[
				    "\\( P \\Rightarrow I \\) el invariante debe ser inicialmente verdadero",
				    "\\( \\{I\\} \\ B \\ \\{I\\}  \\) la evaluación de la parte booleana no debe cambiar la validez de \\(I\\)",
				    "\\( \\{I \\ and \\ B \\} \\ S \\ \\{I\\}  \\) \\(I\\) no cambia por la ejecución del cuerpo del ciclo  iterativo",
				    "\\( (I \\ and \\ (not \\ B)) \\Rightarrow Q \\) si \\(I\\) es verdadero y \\(B\\) es falso es implicado \\(Q\\)",
				    "El ciclo termina"
				])
			)),
		  slide("65%",col(magenta,"Ejemplo"),
			(
			    el(p,(el(b,"while")," \\( y <> x \\) ",el(b,"do")," \\( y = Y + 1 \\) ",el(b,"end")," \\( \\{ y = x \\} \\)")),
			    item(appear,
				[
				    "Para cero iteraciones la precondición mas débil es \\( \\{ y = x \\} \\)",
				    "Para una iteración es: \\[ wp( y = y + 1, \\{y = x\\}) = \\{ y + 1 = x \\} = \\{ y = x - 1 \\} \\]",
				    "Para dos iteraciones es:\\[ wp( y = y + 1, \\{y = x - 1\\}) = \\{ y + 1 = x - 1\\} = \\{ y = x - 2 \\} \\]",
				    "Para tres iteraciones es:\\[ wp( y = y + 1, \\{y = x - 2\\}) = \\{ y + 1 = x - 2\\} = \\{ y = x - 3 \\} \\]",
				    "Es obvio que \\(\\{y <  x \\} \\)es suficiente para los casos de uno o mas iteraciones. Combinado con \\(\\{y = x \\} \\)para el caso base obtenemos  \\( \\{y <= x \\}\\), que puede ser el invariante del ciclo."
				])
			)),
		  slide("75%",col(magenta,"Ejemplo"),
			item(
			    [
				"\\( P \\Rightarrow I \\) \\( \\{y <= x \\} \\Rightarrow \\{y <= x \\} \\) ",
				"\\( \\{I\\} \\ B \\ \\{I\\}  \\)  \\( \\{y <= x \\} \\ \\{y <> x \\}  \\ \\{y <= x\\}  \\) ",
				"\\( \\{I \\ and \\ B \\} \\ S \\ \\{I\\}  \\) \\( \\{y <= x \\ and \\ y <> x \\} \\ y = y + 1 \\ \\{y <= x\\}  \\) aplicando el axioma de asignación a \\( y = y + 1 \\{ y <= x \\} \\) tenemos \\( \\{y + 1 <= x \\}\\) que es equivalente a \\( \\{y < x \\}\\) el cual es implicado por \\( \\{y < x \\ and \\ y <> x\\}\\).",
				"\\( (I \\ and \\ (not \\ B)) \\Rightarrow Q \\) \\( \\{(y <= x) \\ and \\ (not \\ y <> x)\\} \\Rightarrow \\{y = x\\} \\) sigue \\( \\{(y <= x) \\ and \\ (y = x)\\} \\Rightarrow \\{y = x\\} \\) sigue \\( \\{y = x \\} \\Rightarrow \\{y = x\\} \\)",
				"El ciclo termina"
			    ])
		       ),
		  slide(col(purple,"Invariante"),
			item(
			    [
				"El invariante es la versión mas debil de la postcondición del ciclo, y es también una precondición.",
				"Debe ser lo suficientemente debil para satisfacer a priori el comienzo del ciclo, pero cuando se combina con la condición de salida debe ser los suficientemente fuerte para forzar la verdad de la postcondición"
			    ])
		       ),
		  slide(col(purple,"Evaluación"),
			item(
			    [
				"Desarrollar axiomas y reglas de inferencia para todas las sentencias en un lenguaje es dificultoso",
				"Es una buena herramienta para la verificación de programas y un excelente marco para razonar los programas, pero no es útil para los usuarios del lenguaje y desarrolladores de compiladores"
			    ])
		       )
	      )).








show :-
    file(File),
    phrase(format_("xdg-open ~s.html",[File]),Command),
%        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
        consult(slideprolog),
        file(File),
	string_concat(File,".html",Filehtml),
%        append(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).
