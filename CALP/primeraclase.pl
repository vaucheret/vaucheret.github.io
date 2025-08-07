show :-
        file(File),
    phrase(format_("xdg-open ~s.html",[File]),Command),
    shell(Command).

	      
main :-
        consult(slideprolog),
        file(File),
        string_concat(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).


file("primerclase").
title("Inroduccion").
author("C. A. L. P.").
date("Claudio Vaucheret").
theme("night").
transition("slide").

slides -->
    introduccion,
    evolucion.

introduccion -->
    section("Introducción"),
    slide(col(violet,"Razones para estudiar Conceptos de Lenguajes de Programación"),
	  item(appear,
	       [
		   "Incrementa la habilidad para expresar ideas",
		   "Mejora la capacidad de elegir el lenguaje apropiado",
		   "Incrementa la capacidad de aprender nuevos lenguajes",
		   "Mejora el entendimiento del funcionamiento interno del lenguaje (implementación)"
	       ])),
    slide("65%",col(violet,"Dominios de Programación"),
	  item(appear,
	       [
		   (   col(blue,"Aplicaciones Científicas"),
		       item(
			   [
			       "Gran número de computación de punto flotante",
			       "Fortran"
			   ])
		   ),
		   (   col(blue,"Aplicaciones Empresariales"),
		       item(
			   [
			       "Producción de Reportes, uso de números decimales y caracteres",
			       "Cobol"
			   ])
		       
		   ),
		   (   col(blue,"Inteligencia Artificial"),
		       item(
			   [
			       "Manipulación simbólica (en lugar de números)",
			       "LISP / Prolog"
			   ])
		       
		   ),
		   (   col(blue,"Sistemas de Programación"),
		       item(
			   [
			       "Necesidad de eficiencia (debido al uso continuo)",
			       "C"
			   ])
		       
		   ),
		   (   col(blue,"Software para la WEB"),
		       item(
			   [
			       "Colección ecléctica de lenguajes: markup (e.g. HTML5), scripting (e.g. PHP), de propósito general (e.g. Java)"
			   ])
		       
		   )
		   
		   

	       ])),
    slide("",
	  (   
	      slide(col(violet,"Criterios de Evaluación de Lenguajes"),
		    item('fade-in-then-semi-out',
			 [
			     (   el(b,col(blue,"Legibilidad")),": la facilidad con la cual los programas pueden ser leídos y entendidos." ),
			     (   el(b,"Escribilidad"),": la facilidad con la cual los programas pueden ser leídos y entendidos." ),
			     (   el(b,col(orange,"Confiabilidad")),": El grado en que el lenguaje funciona de acuerdo a sus especificaciones." ),
			     (   el(b,col(red,"Costo")),": de uso, compilación, mantenimiento etc." )
			 ])),
	      slide("65%",col(blue,"Legibilidad"),
		    item('fade-in-then-semi-out',
			 [
			     (
				 col(blue,el(b,"Simplicidad")),
				 item([
					     "Un conjunto manejable de características y construcciones",
					     "Poca multiplicidad de características (medios de realizar la misma operación)",
					     "Minima sobrecarga de operadores"
					 ])
			     ),
			     (
				 col(blue,el(b,"Ortogonalidad")),
				 item([
					     "Un conjunto relativamente pequeño de construcciones primitivas que puedan ser combinadas en un numero pequeño de modos",
					     "Toda posible combinación sea legal."
					 ])
			     ),
			     (	 
				 col(blue,el(b,"Sentencias de Control")),
				 item([
					     "La presencia de bien conocidas estructuras de control"
					 ])
			     ),
			     (	 
				 col(blue,el(b,"Tipos de Datos y Estructuras")),
				 item([
					     "La presencia de facilidades adecuadas para definir estructuras de datos"
					 ])
			     ),
			     			     (	 
				 col(blue,el(b,"Consideraciones sintácticas")),
				 item([
					     "Composición flexible de identificadores",
					     "Palabras especiales y métodos para formar sentencias compuestas",
					     "Construcciones autodescriptivas, palabras reservadas significativas"
					 ])
			     )
			 ])),
	      slide("80%","Escribilidad",
		    item('fade-in-then-semi-out',
			 [
			     (	 el(b,"Simplicidad y ortogonalidad"),item(["Pocas constucciones, numero pequeño de primitivas y pocas reglas para combinarlas."])),
			     (	 el(b,"Soporte para la abstracción"),item(["La habilidad para definir y usar estructuras complejas u operaciones de modo que los detalles puedan ser ignorados."])),
			     (	 el(b,"Expresibilidad"),item(["Un conjunto conveniente de modos de especificar operaciones",("Ejemplo: La inclusión de la sentencia ",el(b,"FOR")," en  muchos lenguajes modernos")]))
			 ])),
	      slide("70%",col(orange,"Confiabilidad"),
		    item('fade-in-then-semi-out',
			 [
			     (	 el(b,col(orange,"Chequeo de Tipos")), item(["verificación de errores de tipos"]) ),
			     (	 el(b,col(orange,"Manejo de Excepciones")), item(["interceptar errores en ejecución y tomar medidas correctivas"]) ),
			     (	 el(b,col(orange,"Aliasing")), item(["Presencia de dos o mas distintas referencias para el mismo lugar de memoria"]) ),
			     (	 el(b,col(orange,"Legibilidad y Escribilidad")), item(["Un lenguage que no soporta modos \"naturales\" de expresar un algoritmo necesariamente usará aproximaciones \"no naturales\" y asi reducirá la confiabilidad"]) )
			 ])),
	      slide("80%",col(red,"Costo"),
		    (	el(p,el(b,"Costo de")),
			item('fade-in-then-semi-out',
			     [
				 "Entrenar programadores para usar un lenguaje",
				 "Escribir programas (cercano a aplicaciones particulares)",
				 "Compilar programas",
				 "Ejecutar programas",
				 "Implementar Lenguajes (disponibilidad de compiladores libres)",
				 "Confiabilidad: Confiabilidad pobre lleva a altos costos",
				 "Mantener programas"
			     ])
		    )),
	      slide("Otros",
		    item('fade-in-then-semi-out',
			 [
			     (	 el(b,"Portabildad"),item(["La facilidad con que los programas puedan moverse de una implementación a otra"]) ),
			     (	 el(b,"Generalidad"),item(["Su aplicabilidad a un amplio rango de aplicaciones."]) ),
			     (	 el(b,"Bien definido"),item(["La completitud y precisión de la definición oficial del lenguaje"]) )
			 ]))
	  )),
    slide("",
	  (   
	      slide("90%","Influencias en el diseño de los lenguajes",
		    (   
			item('highlight-current-blue',
			     [(el(b,"Arquitectura de Computadoras"),item([("Lenguajes son desarrollados alrededor de la arquitectura de computadora prevaleciente, conocida como arquitectura de ",el(em,"von Neumann"))]))]),
			item('highlight-current-green',
			     [(el(b,"Metodologías de Programación"),item([("Nuevas metodologías de desarrollo de software (e.g. desarrollo de software orientado a objetos) llevan a nuevos paradigmas y por extensión a nuevos lenguajes de programación")]))])
		    )),
	      slide("90%",col(blue,"Influencia de la Arquitectura de Computadoras"),
		    item(
			[
			    "Arquitectura de Computadora bien conocida: Von Neumann",
			    (	"Lenguajes Imperativos mas dominantes debido a la arquitectura dominante",
				item(
				    [
					"Datos y Programas almacenados en memoria",
					"Memoria Separada de la CPU",
					"Instrucciones y Datos son conducidos desde la Memoria a la CPU",
					( "Bases para los lenguajes imperativos",  item( ["Variables modelan celdas de memoria","La iteración es eficiente"]  ))
				    ]
				))
			])),
	      slide(col(blue,"Arquitectura de Von Neumann"),
		    fig(img("vonneumann.png","auto","auto"))
		    )
	  )).






evolucion -->
    [].
