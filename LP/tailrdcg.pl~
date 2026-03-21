 :- include('slideprolog').
     

file("tailrdcg").
title("Lenguajes Declarativos").
author("Claudio Vaucheret").
date("Tail Recursivo y DCG").
theme("night").
transition("slide").


slides -->
    tailrecursion,
    listdifferences,
    dcg.

tailrecursion -->
    section("Tail Recursion"),
    slide(col(red,"Tail Recursion"),
	  item('highlight-current-red',
	       [
		   (   p(("Una relacion recursiva es ",em("tail recursive"),"solo si:")),
		     item('highlight-current-red',
			  [
			      "hay una sola llamada recursiva",
			      "la llamada recursiva es la última meta de la última cláusula",
			      "todas las metas precediendo la última meta en la última cláusula son deterministas" 
			  ]			 )
		   ),
		   "En Prolog, las relaciones tail recursive pueden ser optimizadas por el sistema de ejecución para evitar el crecimiento de la pila de llamadas.",
		   "Cuando Prolog detecta que una relación es tail recursive, transforma la llamada recursiva en una iteración."
	       ]
	      )),
    slide(col(blue,"Ejemplo de Tail Recursion"),
	  (
	      p("Sumatoria de una lista de números:"),
	      code((
			  "sum([], 0).\n",
			  "sum([H|T], S) :-\n",
			  "    sum(T, S1),\n",
			  "    S is H + S1."
		      )))),
    slide(col(yellow,"Ejemplo de Tail Recursion Optimizada"),
	  (
	      p("Sumatoria de una lista de números utilizando un acumulador:"),
	      code((
			  "sum(List, S) :-\n",
			  "    sum_helper(List, 0, S).\n",
			  "\n",
			  "sum_helper([], Acc, Acc).\n",
			  "sum_helper([H|T], Acc, S) :-\n",
			  "    Acc1 is Acc + H,\n",
			  "    sum_helper(T, Acc1, S)."
		      )))),
    slide(col(green,"Ejemplo de Tail Recursion"),
	  code((
                      "factorial(0, 1).\n",
		      "\n",
		      "factorial(N, F) :-\n",
		      "    N > 0,\n",
		      "    N1 is N - 1,\n",
		      "    factorial(N1, F1),\n",
		      "    F is N * F1."
		  ))),
    slide(col(yellow,"Ejemplo de Tail Recursion Optimizada"),
	  code((
											"factorial(N, F) :-\n",
		      "    factorial_helper(N, 1, F).\n",
		      "\n",
		      "factorial_helper(0, Acc, Acc).\n",
		      "factorial_helper(N, Acc, F) :-\n",
		      "    N > 0,\n",
		      "    Acc1 is Acc * N,\n",
		      "    N1 is N - 1,\n",
		      "    factorial_helper(N1, Acc1, F)."
		  ))),
    slide(col(red,"Ultimo Ejemplo: Fibonacci"),
	  code((
											"fibonacci(0, 0).\n",
		      "fibonacci(1, 1).\n",
		      "\n",
		      "fibonacci(N, F) :-\n",
		      "    N > 1,\n",
		      "    N1 is N - 1,\n",
		      "    N2 is N - 2,\n",
		      "    fibonacci(N1, F1),\n",
		      "    fibonacci(N2, F2),\n",
		      "    F is F1 + F2."
		  ))),
    slide(col(green,"Ejemplo de Tail Recursion Optimizada"),
	  code((
		      "fibonacci(N, F) :-\n",
		      "    fibonacci_helper(N, 0, 1, F).\n",
		      "\n",
		      "fibonacci_helper(0, A, _, A).\n",
		      "fibonacci_helper(N, A, B, F) :-\n",
		      "    N > 0,\n",
		      "    A1 is B,\n",
		      "    B1 is A + B,\n",
		      "    N1 is N - 1,\n",
		      "    fibonacci_helper(N1, A1, B1, F)."
		  ))),
    slide(col(red,"Ventajas de Tail Recursion"),
	  item('highlight-current-red',
	       [
		   "Reduce el consumo de memoria al evitar el crecimiento de la pila de llamadas.",
		   "Mejora el rendimiento al transformar la recursión en iteración.",
		   "Permite resolver problemas que de otra manera podrían causar un desbordamiento de pila."
	       ]
	      )),
    slide("85%",col(blue,"Invertir una lista utilizando Tail Recursion"),
	  (
	      p("Invertir una lista, version recursiva:"),
	      code((
			  "reverse([], []).\n",
			  "reverse([H|T], R) :-\n",
			  "    reverse(T, RT),\n",
			  "    append(RT, [H], R)."
)),
	      p("Invertir una lista, version tail recursive:"),
	      code((
			  "rev_list(L, R) :-\n",
			  "    rev_listAux(L, [], R).\n",
			  "\n",
			  "rev_listAux([], R, R).\n",
			  "rev_listAux([H|T], A, R) :-\n",
			  "    rev_listAux(T, [H|A], R)."
		      )))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt0.png","auto","500"))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt1.png","auto","500"))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt2.png","auto","500"))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt3.png","auto","500"))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt4.png","auto","500"))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt5.png","auto","500"))),
        slide(none,col(green,"Traza de Ejecución, Reverse Tail Recursive"),
	      fig(img("revlistt6.png","auto","500"))).



listdifferences -->
    section("Diferencia de Listas"),
    slide(col(purple,"Diferencia de Listas"),
	  (
	      p("La diferencia de listas es una técnica utilizada en Prolog para representar listas con punteros a la cabeza y la cola de la lista. Esto permite realizar operaciones de concatenación y manipulación de listas de manera eficiente.")
	  )),
    slide(none,col(green,"Agregar un elemento a una lista"),
	  fig(img("listas1.png","auto","420"),"Lista L es [a,b,c,d]")),
    slide(none,col(green,"Agregar un elemento a una lista"),
	  fig(img("listas2.png","auto","420"),"Lista L es [1,a,b,c,d]")),
    slide(none,col(green,"Agregar un elemento a una lista"),
	  fig(img("listas3.png","auto","420"),"1 se agrega al final")),
    slide(none,col(green,"Agregar un elemento a una lista"),
	  fig(img("listas4.png","auto","420"),"L es [a,b,c,d|T]-T")),
    slide("",
	  (
	      slide(col(pink,"Agregar un elemento a una lista"),
		    (
			p((col(violet,"add_front/3")," es un predicado que agrega un elemento al frente de una lista.")),
			code((
				    "add_front(X, L, [X|L])."
				))
		    )),
	      slide("90%",col(pink,"Agregar un elemento a una lista"),
		    (	
			p((col(violet,"add_back/3")," es un predicado que agrega un elemento al final de una lista recorriendo la lista hasta el final.")),
			code((
				    "add_back(X, [], [X]).\n",
				    "add_back(X, [H|T], [H|R]) :-\n",
				    "    add_back(X, T, R)."
				)),
			p((col(violet,"add_back/3")," es menos eficiente que ",col(violet,"add_front/3")," debido a que recorre toda la lista para agregar el elemento al final, mientras que ",col(violet,"add_front/3")," simplemente agrega el elemento al frente de la lista."))
		    )),
	      slide(col(pink,"Agregar un elemento a una lista"),
		    (   
			p("La diferencia de listas permite agregar elementos al final de una lista de manera eficiente sin necesidad de recorrer toda la lista."),
			p((col(violet,"add_back_dif/3")," es un predicado que agrega un elemento al final de una lista utilizando la diferencia de listas.")),
			code((
				    "add_back_dif(X, L - [X|R], L - R)."
				))
		    ))
    )),
    slide(col(green,"Lista [a,b,c] como diferencia de listas"),
	  (
	      p("La lista [a,b,c] se puede representar como una diferencia de listas de la siguiente manera:"),
	      item('highlight-current-green',
		   [
		       "[a,b,c,d,e] - [d,e]",
		       "[a,b,c] - []",
		       "[a,b,c,1] - [1]",
		       "[a,b,c|T] - T"
		   ]
		  )
	  )),
    slide(col(blue,"La lista vacia como diferencia de listas"),
	  (
	      p("La lista vacía se puede representar como una diferencia de listas de la siguiente manera"),
	      item('highlight-current-blue',
		   [
		       "[] - []",
		       "[a,b,c] - [a,b,c]",
		       "L - L"
		   ]
		  )
	  )),
    slide(none,col(yellow,"Concatenar dos listas"),
	  fig(img("concdif1.png","auto","450"),"Concatenar A - B y B - C")),
    slide(none,col(yellow,"Concatenar dos listas"),
	  fig(img("concdif2.png","auto","450"),"Concatenar A - B y B - C")),
    slide(none,col(yellow,"Concatenar dos listas"),
	  fig(img("concdif3.png","auto","450"),"Resultado es A - C")),
    slide("",
	  (
    slide(col(yellow,"Concatenar dos listas"),
	  (
	      p("La concatenación de dos listas recorriendo la lista hasta el final se puede realizar de la siguiente manera:"),
	      code((
			  "concatenate([], L, L).\n",
			  "concatenate([H|T], L2, [H|R]) :-\n",
			  "    concatenate(T, L2, R)."
		      ))
	  )),
   slide(col(green,"Concatenar dos listas"),
	  (
	      p("La concatenación de dos listas representadas como diferencias de listas se puede realizar de la siguiente manera:"),
	      code((
			  "concatenate(A - B, B - C, A - C)."
		      ))
	  ))
	  )).











dcg --> [].

