 :- include("slideprolog").

file("schemew").
title(col("red","Lenguajes Declarativos")).
author(col("pink","Claudio Vaucheret")).
date(col("violet","Aplicaciones Web en Racket")).
theme("night").
transition("slide").


slides -->
    applicacioneswebenracket.



applicacioneswebenracket -->
		section(col("violet","Aplicaciones Web en Racket")),
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
		      			  )).
