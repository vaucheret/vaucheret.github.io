file("schemep").
title(col(red,"Lenguajes Declarativos")).
author(col(pink,"Claudio Vaucheret")).
date(col(violet,"Scheme")).
theme("night").
transition("slide").

show :-
    file(File),
    phrase(format_("xdg-open ~s.html",[File]),Command),
    shell(Command).
	      
main :-
    consult('slideprolog.pl'),
	file(File),
	phrase(format_("~s.html",[File]),Filehtml),
	phrase_to_file(presentation,Filehtml).



slides -->
    lenguaescheme,
    sintaxis,
    procedimientosyrecursion,
    procedimientosdeflocal.


lenguaescheme -->
    section(col(violet,"Lenguaje Scheme")),
    slide("",
	  (   
	      slide("80%",col(pink,"Lenguajes Funcionales"),
		    split(
			item(appear,
			     [
				 (   p(col(lightgreen,"Calculo Lambda")),
				     fig(img("Alonzo_Church.jpg","auto","150")),p("Alonzo Church")
				 )
			     ]),
			item(appear,
			     [
				 (   p(col(lightgreen,"Lisp")),
				     fig(img("John_McCarthy_Stanford.jpg","auto","150")),p("John McCarthy")
				 )
			     ]))
		   ),
	  slide("80%",col(pink,"Lenguajes Funcionales"),
	  item(appear,
	       [
		   (   p(col(lightgreen,"Scheme")),
		       fig(img("Guy_Steele.jpg","auto","150"),"Guy L. Steele, Jr. y"),
		       fig(img("Jerry_Sussman.jpg","auto","150"),"Gerald Sussman")
		   )
	       ]
	      ))
	  )),
    slide(col(pink,"Calculo Lambda"),
	  item(
	      [
		  (   b(col(violet,"Abstracción:"))," Dar a algo un ",em("nombre") ),
		  (   b(col(violet,"Referencia:"))," Mencionar algo por su nombre" ),
		  (   b(col(violet,"Sintesis:"))," Combinar dos cosas para hacer una mas compleja" )
	      ]
	  )).



sintaxis -->
    section(col(violet,"Sintaxis")),
    slide("65%",col(pink,"Numeros y Símbolos"),
	  item(appear,
	       [
		   (   p("Los siguientes caracteres tienen un significado especial y no pueden aparecer en simbolos"),
		       code("language-scheme",(
"()[]{};.\"''#\\\n"
			       ))
		   ),
		   (   p("y los siguientes son usados en números y no pueden aparecer como primer caracter de un símbolo"),
		       code("language-scheme",(
"+ - .\n"
			       ))
		   ),
		   (   p("Ejemplos de simbolos en Scheme son:"),
		       code("language-scheme",(
"abed r cdr p2q4 bugs? one-two *now&\n"
			       ))
		   ),
		   (   p("Los números no se consideran símbolos y son una categoría separada"),
		       code("language-scheme",(
"10, -763, 31.5\n"
			       ))
		   )
		   
	       ]
	      )),
    slide(col(pink,"Scheme REPL "),
	  (
	      p("Read-Eval-Print Loop"),
	      p("top level de scheme."),
	      code("language-scheme",(
"     ; \n",
"     ; Welcome to Racket v7.9 [bc].\n",
"     ; \n",
"     > 7\n",
"     7\n",
"     > \n",
"     > ten\n",
"     ; ten: undefined;\n",
"     ;   cannot reference an identifier before its definition\n",
"     ;   in module: top-level\n",
"     >\n"
		      ))
	  )),
    slide(col(pink,"Scheme REPL"),
	  (
	      p(("(define ",em("var expr")," )")),
	      code("language-scheme",(
"> (define ten 10)\n",
"> ten\n",
"10\n",
"> \n"
		      )),
	  (
	      p(("(quote ",em("symbol")," )")),
	      code("language-scheme",(
"> (quote ten)\n",
"'ten\n",
"> \n"
		      ))
	  )
	  )),
    slide(col(pink,"Aritmética"),
	  code("language-scheme",(
"> (+ 4 7)\n",
"11\n",
"> '(+ 4 7)\n",
"'(+ 4 7)\n",
">\n",
"> (* 3 (- 12 5))\n",
"21\n",
"> (+ 2 (/ 30 15))\n",
"4\n",
"> \n"
		  ))
	 ),
    slide(col(pink,"Listas"),
	  (
	      p((col(red,"LIS"),"t ",col(red,"P"),"rocessing")),
	      code("language-scheme",(
"> (cons 1 '())\n",
"'(1)\n",
"> (define ls1 (cons 1 '()))\n",
"> ls1\n",
"'(1)\n",
"> (cons 2 ls1)\n",
"'(2 1)\n",
"> (cons 'a (cons 'b (cons 'c '())))\n",
"'(a b c)\n",
"> \n"
		      ))
	  )),
    slide(col(pink,"Listas"),
	  (
	      p((
		       "IBM 704 \"",col(red,"C"),
		       "ontents of ",col(red,"A"),"ddress ",col(red,"R"),"egister\" \"",col(red,"C"),"ontents of ",col(red,"D"),"ecrement ",col(red,"R"),"egister\"" )),
	      code("language-scheme",(
"> (car '(1 2 3 4))\n",
"1\n",
"> (car '((1 2) 3 (4 5)))\n",
"'(1 2)\n",
"> (car '(ab (cd ef) gh))\n",
"'ab\n",
"> (cdr '(1 2 4))\n",
"'(2 4)\n",
"> (car (cdr '(a b c d)))\n",
"'b\n",
"> (cadr '(a b c d))\n",
"'b\n",
"> \n"
		      ))
	  )),
    slide(col(pink,"Tests Numeros"),
	  code("language-scheme",(
"> (define num 35.4)\n",
"> (define twelve 'dozen)\n",
"> (number? '3 )\n",
"#t\n",
"> (number? num)\n",
"#t\n",
"> (number? twelve)\n",
"#f\n",
"> (number? -45.67)\n",
"#t  \n",
"> (number? 'twelve)\n",
"#f\n",
"> (number? (+2 3))\n",
"#t\n",
"> (number? #t)\n",
"#f\n",
"> (number? (car '(15.3 -31.7)))\n",
"#t\n",
"> (number? (cdr '(15.3 -31.7)))\n",
"#f\n"
		  ))
	 ),
    slide(col(pink,"Tests Simbolos"),
	  code("language-scheme",(
"> (define num 35.4)\n",
"> (define twelve 'dozen)\n",
"> (symbol? 15 )\n",
"#f\n",
"> (symbol? num)\n",
"#f\n",
"> (symbol? 'num)\n",
"#t\n",
"> (symbol? twelve)\n",
"#t  \n",
"> (symbol? 'twelve)\n",
"#t\n",
"> (symbol? #f)\n",
"#f\n",
"> (symbol? (car '(banana cream)))\n",
"#t\n",
"> (symbol? (cdr '(banana cream)))\n",
"#f\n"
		  ))
	 ),
        slide(col(pink,"Tests Listas"),
	  code("language-scheme",(
"> (pair? '(Ann Ben Carl))\n",
"#t\n",
"> (pair? '(1))\n",
"#t\n",
"> (pair? '())\n",
"#f\n",
"> (pair? '(()))\n",
"#t  \n",
"> (pair? '(a (b c) d))\n",
"#t\n",
"> (pair? (cons 'a '()))\n",
"#t\n",
"> (pair? (cons 3 4))\n",
"#t\n",
"> (pair? 'pair)\n",
"#f\n",
"> (null? '())\n",
"#t\n",
"> (null? (cdr '(cat)))\n",
"#t\n",
"> (null? (car '((ab))))\n",
"#f\n"
		  ))
	 ).

    



	      
	  



procedimientosyrecursion -->
    section(col(violet,"Procedimientos y Recursión")),
    slide(col(pink,"Expresión Lambda"),
	  (
	      item(
		  [
		      (	  "(λ ( ",em("parameters"),") ",em("body")," )"),
		      (	  "(lambda ( ",em("parameters"),") ",em("body")," )")
		  ]
	      ),
	      code("language-scheme",(
"> (cons 19 '())\n",
"'(19)\n",
"> (cons 'bit '())\n",
"'(bit)\n",
"> ((λ (item) (cons item '())) 19)\n",
"'(19)\n",
"> ((lambda (item) (cons item '())) 'bit)\n",
"'(bit)\n",
"> ((lambda (item) (cons item '())) (* 5 6))\n",
"'(30)\n",
"> (define make-singleton (lambda (item) (cons item '())))\n",
"> (make-singleton 19)\n",
"'(19)\n",
"> (make-singleton 'bit)\n",
"'(bit)\n",
"> (define (make-singleton item) (cons item '()))\n"
		      ))
	  )),
    slide(col(pink,"Procedimientos"),
	  code("language-scheme",(
"       (define make-singleton\n",
"       (lambda (item)\n",
"       (cons item '())\n",
"           )\n",
"          )\n",
"\n",
"       (define (make-singleton item)\n",
"        (cons item '())\n",
"         )\n"
		  ))
	 ),
    slide(col(pink,"Condicional"),
	  code("language-scheme",(
"         (define car-if-pair\n",
"            (lambda (item)\n",
"               (cond\n",
"                (pair? item) (car item))\n",
"                (else item))\n",
"               )\n",
"             )\n",
"\n",
"         (define singleton-list?\n",
"            (lambda (ls)\n",
"              (and (pair? ls) (null? (cdr ls)))\n",
"              )\n",
"            )\n"
		  ))
	 ),
    slide(col(pink,"fibonacci"),
	  code("language-scheme",(
"(define fib\n",
"  (λ (n)\n",
"    (cond\n",
"      ((= n 0) 1)\n",
"      ((= n 1) 1)\n",
"      (else (+ (fib (- n 1)) (fib (- n 2))))\n",
"      )\n",
"    )\n",
"  )\n",
"\n",
"(define (fib n)\n",
"  (cond\n",
"    ((= n 0) 1)\n",
"    ((= n 1) 1)\n",
"    (else (+ (fib (- n 1)) (fib (- n 2))))\n",
"    )\n",
"  )\n"
		  ))
	 ),
    slide(col(pink,"fibonacci"),
	  code("language-scheme",(
"(define (fibi n)\n",
"  (define (fibaux m a1 a2)\n",
"    (cond\n",
"      ((= n m) (+ a1 a2))\n",
"      (else (fibaux (+ m 1) a2 (+ a1 a2)))\n",
"      )\n",
"    )\n",
"  (cond\n",
"    ((= n 0) 1)\n",
"    ((= n 1) 1)\n",
"    (else (fibaux 2 1 1))\n",
"    )\n",
"    )\n",
"\n",
"(define (fibb n)\n",
"  (cond\n",
"    ((= n 0) 1)\n",
"    ((= n 1) 1)\n",
"    (else (let fibaux ((m 2) (a1 1) (a2 1))\n",
"       (cond\n",
"      ((= n m) (+ a1 a2))\n",
"      (else (fibaux (+ m 1) a2 (+ a1 a2)))\n",
"      )     \n",
"       )\n",
"          )\n",
"    )\n",
"  )\n"
		  ))
	 ).

    
	  
procedimientosdeflocal -->
    section(col(violet,"Procedimientos Definidos Localmente")),
    slide(col(pink,"Let y Letrec"),
	  (
	      item(
		  [
		      (	  "\\((let \\ ((var \\  val)) \\  body))\\)"),
		      (	  "\\((let \\ ((var_1 val_1) \\  (var_2 val_2) \\ldots (var_n val_n)) \\ body)\\)")
		  ]
	      ),
	      code("language-scheme",(
"> ((lambda (x y) (+ x y)) 2 3)\n",
"5\n",
"> (define z '(4))\n",
"> (define a 1)\n",
"> ((lambda (f y) (f a (f y z))) cons 3)\n",
"'(1 3 4)\n",
"> ((lambda (x)\n",
"((lambda (y)\n",
"(- X y))\n",
"15))\n",
"20)\n",
"> ((lambda (x)\n",
"((lambda (y)\n",
"(- x y))\n",
"15))\n",
"20)\n",
"5\n",
"> (let ((a 2)\n",
"(b 3))\n",
"(+ a b))\n",
"5\n",
"> ((lambda (a b) (+ a b)) 2 3)\n",
"5\n"
		      ))
	  )).

	  
		  




