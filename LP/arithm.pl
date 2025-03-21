file("arithm").
title("Lenguajes Declarativos").
author("Claudio Vaucheret").
date("Aritmética Entera Declarativa").
theme("night").
transition("slide").

show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
	consult(slideprolog),
	file(File),
	append(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).

slides -->
    introduccion,
    predicates,
    evaluate,
    domains,
    puzzles.




introduccion -->
    section("Introducción"),
    slide(col(red,"CLP(\\(\\mathbb{Z}\\))"),
	  item('highlight-current-red',
	       [
		   "Constraint Logic Programming over Integers",
		   "CLP(FD)",
		   "Sictus, Ciao, Swi (CLP(FD))",
		   "Scryer, Trealla (CLP(\\(\\mathbb{Z}\\)))"
   	       ]
	      )
	 ).

predicates -->
    section("Restricciones"),
    slide(col(green,"Restricciones"),
	  item('highlight-current-green',
	       [
		   "Resticciones aritméticas como (#=)/2, (#>)/2 y (#\\=)/2",
		   "Restricciones de dominio (in)/2 y (ins)/2",
		   "Predicados de enumeración  indomain/1, label/1 y labeling/2",
		   "restricciones combinatorias como  all_distinct/1 y global_cardinality/2",
		   "predicados de reificación tales como (#<==>)/2",
		   "predicados de reflexión tales como fd_dom/2"
	       ]
	      )
	 ),
    slide(col(yellow,"Resticciones aritméticas"),
	  (
	      p("En total  las restricciones aritméticas son:"),
	      table((
		  tr((td(col(yellow,"Expr1 #= Expr2")),td(col(yellow,"Expr1 es igual a Expr2")))),
		  tr((td("Expr1 #\\= Expr2"),td("Expr1 no es igual a Expr2"))),
		  tr((td(col(yellow,"Expr1 #>= Expr2")),td(col(yellow,"Expr1 is mayor o igual a Expr2")))),
		  tr((td("Expr1 #=< Expr2"),td("Expr1 is menor o igual a Expr2"))),
		  tr((td(col(yellow,"Expr1 #> Expr2")),td(col(yellow,"Expr1 is mayor que Expr2")))),
		  tr((td("Expr1 #< Expr2"),td("Expr1 is menor que Expr2")))
		       ))
	  )	  
	  ),
    slide("50%",col(blue,"Expresiones aritméticas"),
	  (
	      p("Las expresiones aritméticas son:"),
	      table((
		  tr((td(col(blue,"Entero")),td(col(blue,"Valor dado")))),
		  tr((td("Variable"),td("Entero desconocido"))),
		  tr((td(col(blue,"#(variable)")),td(col(blue,"Entero desconocido")))),
		  tr((td("-Expr"),td("Menos unario"))),
		  tr((td(col(blue,"Expr")),td(col(blue,"+ Expr Suma")))),
		  tr((td("Expr"),td("* Expr Multiplication"))),
		  tr((td(col(blue,"Expr")),td(col(blue,"- Expr Resta")))),
		  tr((td("Expr"),td("^ Expr Exponenciación"))),
		  tr((td(col(blue,"min(Expr,Expr)")),td(col(blue,"Minimo de dos expresiones")))),
		  tr((td("max(Expr,Expr)"),td("Maximo de dos expresiones"))),
		  tr((td(col(blue,"Expr")),td(col(blue,"mod Expr Modulo inducido por division piso")))),
		  tr((td("Expr "),td("rem Expr Modulo inducido por division truncada"))),
		  tr((td(col(blue,"abs(Expr)")),td(col(blue,"Valor Absoluto")))),
		  tr((td("sign(Expr)"),td("Sign (-1, 0, 1) de Expr"))),
		  tr((td(col(blue,"Expr")),td(col(blue,"// Expr  Division entera truncada")))),
		  tr((td("Expr"),td("div Expr Division entera piso")))
	      ))
	 )).

		  
	      
evaluate -->
    section("Ejemplos"),
    slide("Evaluando Expresiones Enteras",
	  code((
		      "?- X #= 5 + 3.\n",
		      "X = 8.\n",
		      "\n",
		      "?- 2 #= X + 9.\n",
		      "X = -7.\n",
		      "\n",
		      "?- 1 #= 1 + Y.\n",
		      "Y = 0.\n"
		  ))
	 ),
    slide("Ejemplo relacion Factorial",
	  code((
		      "n_factorial(0, 1).\n",
		      "n_factorial(N, F) :-\n",
		      "      N #> 0,\n",
		      "      N1 #= N - 1,\n",
		      "      n_factorial(N1, F1),\n",
		      "      F #= N * F1.\n",
		      "\n",
		      "\n",
		      "?- n_factorial(47, F).\n",
		      "F = 258623241511168180642964355153611979969197632389120000000000\n",
		  ";  false.     \n",
		  "\n",
		      "n_factorial(0, 1).\n",
		      "n_factorial(N, F) :-\n",
		      "      N #> 0,\n",
		      "      N1 #= N - 1,\n",
		      "      F #= N * F1,\n",
		      "      n_factorial(N1, F1).\n",
		      "\n",
		      "\n",
		      "?- n_factorial(N, 1).\n",
		      "N = 0\n",
		  ";  N = 1\n",
		  ";  false.\n",
		  "\n",
		  "?- n_factorial(N, 3).\n",
		  "false.\n",
		  "\n"
		  ))
	 ),
    slide("Ejemplo Longitud de una Lista",
	  code((
		      "list_length([], 0).\n",
		      "list_length([_|Ls], Length) :-\n",
		      "        Length #= Length0 + 1,\n",
		      "        list_length(Ls, Length0).\n",
		      "\n",
		      "?- list_length(\"abcd\", Length).\n",
		      "Length = 4.\n",
		      "\n",
		      "?- list_length(Ls, Length).\n",
		      "Ls = [], Length = 0\n",
		  ";  Ls = [_A], Length = 1\n",
		  ";  Ls = [_A,_B], Length = 2\n",
		  ";  Ls = [_A,_B,_C], Length = 3\n",
		  ";  ... .      \n",
		  "\n",
		  "?- list_length(Ls, 3).\n",
		  "Ls = [_A,_B,_C]\n",
		  ";  ... .\n",
		  "\n",
		  "?- list_length(Ls, 3), false.\n",
		  "nontermination  \n",
		  "\n",
		  "list_length(Ls, L) :-\n",
		  "list_length_(Ls, 0, L).\n",
		  "\n",
		  "list_length_([], L, L).\n",
		  "list_length_([_|Ls], L0, L) :-\n",
		  "L1 #= L0 + 1,\n",
		  "list_length_(Ls, L1, L).\n"
		  ))
	 ).


domains -->
    section("Dominios"),
    slide("Dominios",
	  code((
		      "?- V in 0..2.\n",
		      "clpz:(V in 0..2).\n",
		      "\n",
		      "\n",
		      "?- V in 0..2, V #= 3.\n",
		      "false.\n",
		      "\n",
		      "\n",
		      "?- V in 0..2, V #= 1.\n",
		      "V = 1.\n",
		      "\n",
		      "\n",
		      "?- X in 0..2, Y in 0..2.\n",
		      "clpz:(X in 0..2), clpz:(Y in 0..2).\n",
		      "\n",
		      "?- [X,Y] ins 0..2.\n",
		      "clpz:(X in 0..2), clpz:(Y in 0..2).\n"
    		      
		  ))
	 ),
    slide("Labeling",
	  code((
		      "?- V in 0..2, indomain(V).\n",
		      "V = 0\n",
		  ";  V = 1\n",
		  ";  V = 2.\n",
		  "\n",
		  "\n",
		  "?- [X,Y] ins 0..1, label([X,Y]).\n",
		  "X = 0, Y = 0\n",
		  ";  X = 0, Y = 1\n",
		  ";  X = 1, Y = 0\n",
		  ";  X = 1, Y = 1.\n"
		  ))
	 ),
    slide("Propagración de las Restricciones",
	  code((
		      "?- [X,Y] ins 0..2, Z #= X + Y.\n",
		      "clpz:(X+Y#=Z), clpz:(X in 0..2), clpz:(Y in 0..2), clpz:(Z in 0..4).\n",
		      "\n",
		      "\n",
		      "?- [X,Y] ins 0..2, Z #= X + Y, Z #= 0.\n",
		      "X = 0, Y = 0, Z = 0.\n",
		      "\n",
		      "\n",
		      "?- X in 0..1, X #> 2.\n",
		      "false.\n",
		      "\n",
		      "\n",
		      "?- [X,Y] ins 0..2, Z #= X + Y, Z #= 1.\n",
		      "Z = 1, clpz:(X+Y#=1), clpz:(Y in 0..1), clpz:(X in 0..1).\n",
		      "\n",
		      "\n",
		      "?- [X,Y,Z] ins 0..1, all_different([X,Y,Z]).\n",
		      "clpz:all_different([X,Y,Z]), clpz:(X in 0..1), clpz:(Y in 0..1), clpz:(Z in 0..1).\n",
		      "\n",
		      "\n",
		      "?- [X,Y,Z] ins 0..1, all_distinct([X,Y,Z]).\n",
		      "false.\n"
    		      
		  ))
	 ).


puzzles -->
    section("Problemas"),
    slide("Granjero",
	  (
	      p(" Un granjero tiene en  entre vacas y gallinas un total de 30 animales,que tienen 74 patas en total. ¿Cuantas gallinas y vacas tiene?"),
	      code((
			  "vacas_gallinas(V,G) :-\n",
			  "    G  + V #= 30,\n",
			  "    G * 2 + V * 4 #= 74,\n",
			  "    [V,G] ins 0..sup.\n",
			  "\n",
			  "?- vacas_gallinas(V,G).\n",
			  "V = 7, G = 23.\n"
			  ))
	  )),
    slide("Sudoku",
	  code((
		      "sudoku(Rows) :-\n",
		      "        length(Rows, 9), maplist(same_length(Rows), Rows),\n",
		      "        append(Rows, Vs), Vs ins 1..9,\n",
		      "        maplist(all_distinct, Rows),\n",
		      "        transpose(Rows, Columns),\n",
		      "        maplist(all_distinct, Columns),\n",
		      "        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],\n",
		      "        blocks(As, Bs, Cs),\n",
		      "        blocks(Ds, Es, Fs),\n",
		      "        blocks(Gs, Hs, Is).\n",
		      "\n",
		      "blocks([], [], []).\n",
		      "blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-\n",
		      "        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),\n",
		      "        blocks(Ns1, Ns2, Ns3).\n",
		      "\n",
		      "problem(1, [[_,_,_,_,_,_,_,_,_],\n",
		      "            [_,_,_,_,_,3,_,8,5],\n",
		      "            [_,_,1,_,2,_,_,_,_],\n",
		      "            [_,_,_,5,_,7,_,_,_],\n",
		      "            [_,_,4,_,_,_,1,_,_],\n",
		      "            [_,9,_,_,_,_,_,_,_],\n",
		      "            [5,_,_,_,_,_,_,7,3],\n",
		      "            [_,_,2,_,1,_,_,_,_],\n",
		      "            [_,_,_,_,4,_,_,_,9]]).\n",
		      "\n",
		      "\n",
		      "?- problem(1, Rows), sudoku(Rows), maplist(portray_clause, Rows).\n",
		      "[9,8,7,6,5,4,3,2,1].\n",
		      "[2,4,6,1,7,3,9,8,5].\n",
		      "[3,5,1,9,2,8,7,4,6].\n",
		      "[1,2,8,5,3,7,6,9,4].\n",
		      "[6,3,4,8,9,2,1,5,7].\n",
		      "[7,9,5,4,6,1,8,3,2].\n",
		      "[5,1,9,2,8,6,4,7,3].\n",
		      "[4,7,2,3,1,9,5,6,8].\n",
		      "[8,6,3,7,4,5,2,1,9].\n",
		      "   Rows = [[9,8,7,6,5,4,3,2,1]|...].\n"
		      
		  ))
	 ),
    slide("puzzle",
	  (
	      p("puzzle SEND + MORE = MONEY"),
	  code((
		      "puzzle([S,E,N,D] + [M,O,R,E] = [M,O,N,E,Y]) :-\n",
		      "        Vars = [S,E,N,D,M,O,R,Y],\n",
		      "        Vars ins 0..9,\n",
		      "        all_different(Vars),\n",
                      "                S*1000 + E*100 + N*10 + D +\n",
                      "                M*1000 + O*100 + R*10 + E #=\n",
		      "        M*10000 + O*1000 + N*100 + E*10 + Y,\n",
		      "        M #\\= 0, S #\\= 0.\n",
		      "\n",
		      "\n",
		      "?- puzzle(As+Bs=Cs).\n",
		      "As = [9, A2, A3, A4],\n",
		      "Bs = [1, 0, B3, A2],\n",
		      "Cs = [1, 0, A3, A2, C5],\n",
		      "A2 in 4..7,\n",
		      "all_different([9, A2, A3, A4, 1, 0, B3, C5]),\n",
		      "91*A2+A4+10*B3#=90*A3+C5,\n",
		      "A3 in 5..8,\n",
		      "A4 in 2..8,\n",
		      "B3 in 2..8,\n",
		      "C5 in 2..8.\n",
		      "\n",
		      "?- puzzle(As+Bs=Cs), label(As).\n",
		      "As = [9,5,6,7], Bs = [1,0,8,5], Cs = [1,0,6,5,2]\n",
		  ";  false.\n"
		  ))
	  )
	 ).




