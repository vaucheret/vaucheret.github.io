 :- include("slideprolog").

file("schemew").
title(col("red","Lenguajes Declarativos")).
author(col("green","Claudio Vaucheret")).
date(col("violet","Aplicaciones Web en Racket")).
theme("simple").
transition("cube").


slides -->
    applicacioneswebenracket.



applicacioneswebenracket -->
		section(("Aplicaciones Web en ",col("orange","Racket"))),
		slide("Comienzo",
		      (
			  p("Introduzca las siguientes lineas de código. Y ejecute en el REPL"),
			  code("src src-scheme",(
				"#lang web-server/insta\n",
				"(define (start request)\n",
				"   (response/xexpr\n",
				"	'(html\n",
				"          (head (title \"My Blog\"))\n",
				"          (body (h1 \"Under construction\")))))\n"))
		      )),
		slide("80%","La Aplicación",
		      (
			  p(("En éste tutorial se muesta cómo desarrollar un ",col("blue","Blog")," Usuarios del Blog deberían ser capaz de crear nuevas Publicaciones y agregar comentarios a las publicaciones existentes. Mostraremos el desarrollo incrementalmente. Realizando las siguientes tareas:")),
			  item("appear",[
					   col("blue","Muestra una lista estática de publicaciones."),
					   col("blue","Permitir que un usuario agregue nuevas publicaciones al sistema."),
					   col("blue", "Amplíe el modelo para permitir que un usuario agregue comentarios a una publicación."),
					   col("blue","Permita que todos los usuarios compartan el mismo conjunto de publicaciones."),
					   col("blue","Guardar los datos en disco.")])
		      )),
		slide("Blog Básico",
		      (
			  p(("Necesitamos una estructura de datos para representar el ",col("blue","Blog"))),
			    code("src src-scheme",(
						      "(struct post (title body))\n"
						  )),
			    p("- Ejemplo:"),
			    code("src src-scheme",(
						      "(define BLOG (list (post \"first post!\" \n",
						      "            \"Hey, this is my first post!\")))\n"
						  ))
		      )),
		slide("",(
			     slide("\"Rendering\" HTML",(
							    item([
								     (col("orange","racket")," usa la función ",col("blue","response/xexpr")," que toma una X-epression para representar una expresion ",col("blue","HTML"),"."),
								     ("Ejemplo:",
								      dividir(
								     code("src src-html",(
											       "&lt;p&gt;This is an example&lt;/p&gt;\n"
											   )),
								     code("src src-scheme",(
											       "'(p \"This is an example\")\n"
											   )
									)))
								 ]))
				  ),
			     slide("80%","\"Rendering\" HTML",(
							    item([
								     ("Otro Ejemplo:",
								     code("src src-html",(
      "&lt;p&gt;This is &lt;div classs=\"emph\"&gt;another&lt;/div&gt; example&lt;/p&gt;"
   )
									 ),
								     "es representado por:",
								     code("src src-scheme",(
											       "(p \"This is \" (div ((class \"emph\")) \"another\") \" example\")\n"
											   )
									 )
								     ),
								     ("las siguientes expresiones evalúan a la misma ",el(code,"X-expression"),
								      code("src src-scheme",(
												"(list 'html (list 'head (list 'title \"Some title\")) \n",
												"       (list 'body (list 'p \"This is a simple static page\")))\n",
												" \n",
												"'(html (head (title \"Some title\")) \n",
												"       (body (p \"This is a simple static page\")))\n"
											    ))
								     )
								 ]))
				  )
			 )),
		slide("Contenido Dinámico",(
					       item([
							("Para evaluar expresiones se usa ",col("red",el(code,",(") ),
							 code("src src-scheme",(
										   "; render-greeting: string -> response\n",
										   "; Consumes a name, and produces a dynamic response.\n",
										   "(define (render-greeting a-name)\n",
										   "    (response/xexpr\n",
										   "        `(html (head (title \"Welcome\"))\n",
										   "                         (body (p ,(string-append \"Hello \" a-name))))))\n"
							)
							     ))
						    ])
					   )
		     ).
