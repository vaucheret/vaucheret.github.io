 :- include('slideprolog').
     

file("tailrdcg").
title(col(lightblue,"Lenguajes Declarativos")).
author("Claudio Vaucheret").
date(col(violet,"Tail Recursivo y DCG")).
theme("night").
transition("slide").


slides -->
    tailrecursion,
    listdifferences,
    dcg.

tailrecursion -->
    section(animate,"Tail Recursion"),
    section(animate,"Recursivo a la Cola"),
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
    slide("",
	  (
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
		      ))))
	  )),
    slide("",
	  (
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
		  )))
	  )),
    slide("",
	  (
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
		  )))
	  )),
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
    section(animate,"Diferencia de Listas"),
    section(animate,"List Difference"),
    slide(col(purple,"Diferencia de Listas"),
	  (
	      p(("La diferencia de listas es una ",col(red,em("técnica"))," utilizada en ",col(red,b("Prolog"))," para representar listas con punteros a la cabeza y la cola de la lista. Esto permite realizar operaciones de concatenación y manipulación de listas de manera eficiente."))
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
	slide(none,col(yellow,"Concatenar dos listas"),
	  fig(img("concdif1.png","auto","450"),"Concatenar A - B y B - C")),
	slide(none,col(yellow,"Concatenar dos listas"),
	  fig(img("concdif2.png","auto","450"),"Concatenar A - B y B - C")),
	slide(none,col(yellow,"Concatenar dos listas"),
	  fig(img("concdif3.png","auto","450"),"Resultado es A - C")),
	slide(col(yellow,"Concatenar dos listas"),
	  (
	      p("La concatenación de dos listas representadas como diferencias de listas se puede realizar de la siguiente manera:"),
	      code((
			  "concatenate(A - B, B - C, A - C)."
		      ))
	  ))
	      )),
	slide(col(red,"Ventajas de la diferencia de listas"),
	  item('highlight-current-red',
	       [
		   "Permite realizar operaciones de concatenación y manipulación de listas de manera eficiente.",
		   "Evita la necesidad de recorrer toda la lista para agregar elementos al final.",
		   "Facilita la implementación de algoritmos que requieren manipulación de listas."
	       ]
	      )),
	slide("",
	  (
	slide(col(green,("Ejemplo con ",col(violet,"qsort/2")," utilizando ",col(violet,"append/3"))),
	  code((
		  "qsort([], []).\n",
		  "qsort([H|T], Sorted) :-\n",
		  "    partition(>=(H), T, Less, Greater),\n",
		  "    qsort(Less, SortedLess),\n",
		  "    qsort(Greater, SortedGreater),\n",
		  "    append(SortedLess, [H|SortedGreater], Sorted)."
		  ))),
	slide(col(green,("Ejemplo con ",col(violet,"qsort/2")," utilizando diferencia de listas")),
	      code((
			  "qsort([], L - L).\n",
			  "qsort([H|T], Sorted - Rest) :-\n",
			  "    partition(>=(H), T, Less, Greater),\n",
			  "    qsort(Less, Sorted - [H|SortedGreater]),\n",
			  "    qsort(Greater, SortedGreater - Rest)."
		      ))
	     )
	  )).



dcg -->
    section(animate,(col(red,"D")," ",col(red,"C")," ",col(red,"G"))),
    section(animate,(col(red,"D"),"efinite ",col(red,"C"),"lause ",col(red,"G"),"rammars")),
    section(animate,(col(red,"G"),"ramática de ",col(red,"C"),"láusulas ",col(red,"D"),"efinidas")),
    slide(col(red,"Definite Clause Grammars"),
	  (
	      p(("Las ",col(red,em("Definite Clause Grammars (DCG)
")), " son una extensión de Prolog que permite describir gramáticas formales de manera
 más natural y legible. Las DCG se utilizan comúnmente para el análisis sintáctico de lenguajes formales, como los
 lenguajes de programación y los lenguajes naturales. Las DCG se basan en la idea de que una gramática puede ser representada como un conjunto de cláusulas definidas en Prolog, donde cada cláusula representa una regla de producción de la gramática."))
	  )),
		slide(col(green,"Ejemplo de DCG"),
	  (
	      p("Una gramática simple para reconocer cadenas formadas por 'a' y 'b' se puede definir utilizando DCG de la siguiente manera:"),
	      code((
			  "s --> [a], s, [b].\n",
			  "s --> []."
		  ))
	  )),
		slide(col(blue,"Explicación del Ejemplo"),
	  (
	      p(("En este ejemplo, la regla ",col(green,"'s --> [a], s, [b].'")," indica que una cadena válida puede consistir en una ",col(green,"a"),", seguida de otra cadena válida (representada por ",col(green,"s"),"), seguida de una ",col(green,"b"),". La regla ",col(green,"'s --> []'")," indica que una cadena vacía también es válida. Por lo tanto, esta gramática reconoce cadenas como ",col(green,"[a,b]"),", ",col(green,"[a,a,b,b]"),", ",col(green,"[a,a,a,b,b,b]"),", etc."))
	  )),
		slide("",
		      (	  
		slide(col(magenta,"Describiendo sequencias con seq//1, seq//2, y ...//0"),
	  (
	      p(("Definimos un noterminal ",col(magenta,"seq//1")," para describir una secuencia de elementos:")),
	      code((
			  "seq([]) --> [].\n",
			  "seq([E|Es]) --> [E], seq(Es)."
		      )),
	      p("Ejemplo de uso:"),
	      code((
			  "?- phrase((`Hello, `,seq(Cs),`!`), `Hello, world!`),string_codes(C,Cs).\n",
		      	  "Cs = [119, 111, 114, 108, 100]\n",
		      "C = \"world\"\n"
		      ))
	  )),
		slide(col(magenta,"Describiendo sequencias con seq//1, seq//2, y ...//0"),
		      (
			  p(("usando ",col(magenta,"seq//1")," podemos definir ",col(magenta,"seq//2")," para describir una secuencia de secuencias:")),
			  code((
				      "seq2([]) --> [].\n",
				      "seq2([Es|Ess]) --> seq(Es), seq2(Ess)."
				  )),
			  p("Ejemplo de uso:"),
			  code((
				      "?- phrase(seqq([`ab`, `cd`, `ef`]), Es), string_codes(S,Es)).\n",
				      "Es = [97, 98, 99, 100, 101,102]\n",
				      "S = \"abcdef\"\n"
				  ))
		      )),
		slide("90%",col(magenta,"Describiendo sequencias con seq//1, seq//2, y ...//0"),
		      (
			  p(("a veces es util describir \"cualquier secuencia\" y podemos hacerlo con el noterminal ",col(magenta,"...//0")," que es equivalente a ",col(magenta,"seq(_)"),":")),
			  code((
				      "... --> [] | [_], ... . \n"
				  )),
			  p("Por ejemplo, el último elemento de una lista se puede describir con:"),
			  code((
				      "?- phrase((..., [Last]), `hello`), char_code(Char, Last).\n",
				      "Last = 111\n",
				      "Char = 'o'"
				  ))
		      )),
		slide(col(magenta,"Describiendo sequencias con seq//1, seq//2, y ...//0"),
		      (
			  p(("Como otro ejemplo, elementos repetidos consecutivamente se pueden describir con:")),
			  code((
				      "?- phrase((..., [X,X], ...), `mississippi`), char_code(Char, X).\n",
				      "X = 115\n",
				      "Char = 's' ;\n",
				      "X = 115\n",
				      "Char = 's' ;\n",
				      "X = 112\n",
				      "Char = 'p' ;\n",
				      "false."
				  ))
		      ))
		      )),
		slide("",
		      (
		slide("85%",col(yellow,"Inversión de listas, palíndromos y otros ejercicios."),
	  (
	      p(("DCG se pueden utilizar para describir una amplia variedad de estructuras de datos y patrones, como la inversión de listas, palíndromos, y otros ejercicios relacionados con cadenas y secuencias. Por ejemplo, para describir una lista que es un palíndromo (es decir, que se lee igual de izquierda a derecha que de derecha a izquierda), podemos definir la siguiente gramática:")),
	      code((
			  "palindrome --> [] .\n",
			  "palindrome --> [_] .\n",
			  "palindrome --> [X], palindrome, [X]."
		  ))
	  )),
		slide(col(yellow,"Inversión de listas, palíndromos y otros ejercicios."),
		      (
			  	      p(("Esta gramática reconoce cadenas como ",col(green,"[]"),", ",col(green,"[a]"),", ",col(green,"[a,b,a]"),", ",col(green,"[a,b,b,a]"),", etc.")),
		code((
			    "?- phrase(palindrome, `neuquen`),\n",
			    "true. ;\n",
			    "false."
			))
		      )),
		slide(col(yellow,"Inversión de listas, palíndromos y otros ejercicios."),
		      (
			  p(("También podemos describir la inversión de una lista utilizando DCG:")),
			  code((
				      "reversal([] --> [].\n",
				      "reversal([H|T]) --> reversal(T), [H]."
				  )),
			  p("Ejemplo de uso:"),
			  code((
				      "?- phrase(reversal(`abcd`, RevCodes), string_codes(Rev, RevCodes)).\n",
				      "RevCodes = [100, 99, 98, 97]\n",
				      "Rev = \"dcba\""
				  ))
		      )),
		slide("70%",col(yellow,"Inversión de listas, palíndromos y otros ejercicios."),
		      (
			  p(("DCG también se pueden utilizar para relacionar árboles binarios con sus recorridos en preorden, inorden y postorden. Por ejemplo, para describir el recorrido en inorden de un árbol binario, podemos definir la siguiente gramática:")),
			  code((
				      "tree_nodes(nil) --> [] .\n",
				      "          tree_nodes(node(Value, Left, Right)) --> \n",
				      "          tree_nodes(Left),\n",
				      "          [Value],\n",
				      "          tree_nodes(Right)."
				  )),
			  p("Ejemplo:"),
			  code((
				      "?- phrase(tree_nodes(node(a, node(b, nil,\n",
				      "                     node(c, nil, nil)),\n",
				      "                     node(d, nil, nil))), Codes), string_codes(S, Codes)).\n",
				      "Codes = [98, 99, 97, 100]\n",
				      "S = \"bcad\""
				  ))
		      ))
		      )),
		slide("",
		      (
		slide("90%",col(teal,"Notación semicontextual"),
	  (
	      p(("usar ",b(col(teal,"notación semicontextual"))," podemos insertar elementos de la lista que inicialmente no estaban en la lista que se está analizando. Una regla DCG de la forma:")),
	      code((
			  "Head, [T1,...,Tn] --> Body."
		      )),
	      p(("puede leerse como: parsear la lista usando Body, luego agregar los terminos T1,...,Tn al resto de la lista. Por ejemplo:")),
	      code((
			  "nt1, [b] --> [a].\n",
			  "nt2      --> [b]."
		      ))
	  )),
		slide("80%",col(teal,"Notación semicontextual"),
	      (
	      p(("El cuerpo de ",col(teal,"nt1//0")," describe una lista con un unico elemento ",col(green,"a"),". Operacionalmente, despues de que ",col(teal,"nt1//0")," consume el atomo ",col(green,"a"),", inserta el atomo ",col(green,"b")," al frente del resto de la lista:")),
	      code((
			  "?- phrase((nt1, nt2), [a]).\n",
			  "true.\n",
			  "\n",
			  "?- phrase(nt1, [a]).\n",
			  "false."
		      )),
	      p(("la version ",col(teal,"phrase/3")," muestra lo que queda de la lista despues de que ",col(teal,"nt1//0")," tiene éxito:")),
	      code((
			  "?- phrase(nt1, [a], Rest).\n",
			  "Rest = [b]"
		      ))
	  
	      )),
		slide(col(teal,"Notación semicontextual"),
	      (
		  p(("Usando ",b(col(teal,"notación semicontextual")),", podemos implementar ",em("look-ahead")," para inspeccionar el siguiente elemento de la lista sin consumirlo:")),
		  code((
			      "look_ahead(T), [T] --> [T]."
			  )),
		  p(("Ejemplo:")),
		  code((
			      "?- phrase(look_ahead(T), [a],Rest]).\n",
			      "T = a,\n",
			      "Rest = [a]"
			  ))
	      ))
		      )),
		slide("",
		      (	  
		slide(col(fuchsia,"Pasando estados implícitamente"),
		      (
			  p(("la ",b(col(fuchsia,"notación semicontextual"))," es util para el pasaje de estados implícita. Por ejemplo el siguiente contador de hojas de un árbol binario:")),
			  code((
				      "num_leaves(Tree, N) :-\n",
				      "            num_leaves_(Tree,0,N).\n",
				      "\n",
				      "num_leaves_(nil, N0, N) :- N is N0 + 1.\n",
				      "num_leaves_(node(_,Left,Right), N0, N) :-\n",
				      "             num_leaves_(Left, N0, N1),\n",
				      "             num_leaves_(Right, N1, N).\n"
				  ))
		      )),
		slide(col(fuchsia,"Pasando estados implícitamente"),
		      (
			  p("siendo los estados una lista de un unico elemento entero:"),
			  code((
				      "num_leaves(Tree, N) :-\n",
				      "                phrase(num_leaves_(Tree), [0], [N]).\n",
				      "\n",
				      "num_leaves_(nil), [N] --> [N0], { N is N0 + 1 }.\n",
				      "num_leaves_(node(_,Left,Right)) -->\n",
				      "              num_leaves_(Left),\n",
				      "              num_leaves_(Right).\n"
				  ))
		      )),
		slide(col(fuchsia,"Pasando estados implícitamente"),
		      (
			  p(("Ejemplo de query:")),
			  code((
				      "?- num_leaves(node(a, node(b, nil, nil),\n",
				      "                 node(c, nil, \n",
				      "                     node(d, nil, nil))), N).\n",
				      "N = 5."
				  )),
			  p("los siguientes noterminales son utiles para describir estados con DCGs:"),
			  code((
				      "state(S), [S] --> [S].\n",
				      "state(S0, S), [S] --> [S0].\n"
				  ))
		      )),
		slide(col(fuchsia,"Pasando estados implícitamente"),
		      (
			  p(("usando ",b(col(fuchsia,"state//2"))," podemos escribir ",b(col(fuchsia,"num_leaves_//1")), " de la siguiente manera:")),
			  code((
				      "num_leaves_(nil) --> state(N0, N), { N is N0 + 1 }.\n",
				      "num_leaves_(node(_,Left,Right)) -->\n",
				      "              num_leaves_(Left),\n",
				      "              num_leaves_(Right).\n"
				  ))
		      ))
		      )).
