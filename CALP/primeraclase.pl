:- include("slideprolog.pl").



file("primerclase").
title("C.A.L.P.").
author("Claudio Vaucheret").
date("2026-08-18 mar").
theme("night").
transition("slide").

slides -->
    introduccion,
    evolucion.

introduccion -->
    section("Introducción"),
    slide("Razones para estudiar Conceptos de Lenguajes de Programación",
	  item("appear",
	       [
		   "Incrementa la habilidad para expresar ideas",
		   "Mejora la capacidad de elegir el lenguaje apropiado",
		   "Incrementa la capacidad de aprender nuevos lenguajes",
		   "Mejora el entendimiento del funcionamiento interno del lenguaje (implementación)"
	       ])),
    slide("65%","Dominios de Programación",
	  item("appear",
	       [
		   (   col("blue","Aplicaciones Científicas"),
		       item(
			   [
			       "Gran número de computación de punto flotante",
			       "Fortran"
			   ])
		   ),
		   (   col("blue","Aplicaciones Empresariales"),
		       item(
			   [
			       "Producción de Reportes, uso de números decimales y caracteres",
			       "Cobol"
			   ])
		   ),
		   (   col("blue","Inteligencia Artificial"),
		       item(
			   [
			       "Manipulación simbólica (en lugar de números)",
			       "LISP / Prolog"
			   ])
		   ),
		   (   col("blue","Sistemas de Programación"),
		       item(
			   [
			       "Necesidad de eficiencia (debido al uso continuo)",
			       "C"
			   ])
		   ),
		   (   col("blue","Software para la WEB"),
		       item(
			   [
			       "Colección ecléctica de lenguajes: markup (e.g. HTML5), scripting (e.g. PHP), de propósito general (e.g. Java)"
			   ])
		   )
	       ])),
    slide("",
	  (
	      slide("Criterios de Evaluación de Lenguajes",
		    item("fade-in-then-semi-out",
			 [
			     (   col("blue",el(b,"Legibilidad")),": la facilidad con la cual los programas pueden ser leídos y entendidos." ),
			     (   el(b,"Escribilidad"),": la facilidad con la cual un lenguaje puede ser usado para crear programas" ),
			     (   col("orange",el(b,"Confiabilidad")),": El grado en que el lenguaje funciona de acuerdo a sus especificaciones." ),
			     (   col("red",el(b,"Costo")),": de uso, compilación, mantenimiento etc." )
			 ])),
	      slide("60%",col("blue","Legibilidad"),
		    item("fade-in-then-semi-out",
			 [
			     (
				 col("blue",el(b,"Simplicidad")),
				 item([
					  "Un conjunto manejable de características y construcciones",
					  "Poca multiplicidad de características (medios de realizar la misma operación)",
					  "Minima sobrecarga de operadores"
				      ])
			     ),
			     (
				 col("blue",el(b,"Ortogonalidad")),
				 item([
					  "Un conjunto relativamente pequeño de construcciones primitivas que puedan ser combinadas en un numero pequeño de modos",
					  "Toda posible combinación sea legal."
				      ])
			     ),
			     (
				 col("blue",el(b,"Sentencias de Control")),
				 item([
					  "La presencia de bien conocidas estructuras de control"
				      ])
			     ),
			     (
				 col("blue",el(b,"Tipos de Datos y Estructuras")),
				 item([
					  "La presencia de facilidades adecuadas para definir estructuras de datos"
				      ])
			     ),
			     (
				 col("blue",el(b,"Consideraciones sintácticas")),
				 item([
					  "Composición flexible de identificadores",
					  "Palabras especiales y métodos para formar sentencias compuestas",
					  "Construcciones autodescriptivas, palabras reservadas significativas"
				      ])
			     )
			 ])),
	      slide("80%","Escribilidad",
		    item("fade-in-then-semi-out",
			 [
			     (   el(b,"Simplicidad y ortogonalidad"),item(["Pocas constucciones, numero pequeño de primitivas y pocas reglas para combinarlas."])),
			     (   el(b,"Soporte para la abstracción"),item(["La habilidad para definir y usar estructuras complejas u operaciones de modo que los detalles puedan ser ignorados"])),
			     (   el(b,"Expresibilidad"),item(["Un conjunto conveniente de modos de especificar operaciones",("Ejemplo: La inclusión de la sentencia ",el(b,"FOR")," en  muchos lenguajes modernos")]))
			 ])),
	      slide("70%",col("orange","Confiabilidad"),
		    item("fade-in-then-semi-out",
			 [
			     (   col("orange",el(b,"Chequeo de Tipos")), item(["verificación de errores de tipos"]) ),
			     (   col("orange",el(b,"Manejo de Excepciones")), item(["interceptar errores en ejecución y tomar medidas correctivas"]) ),
			     (   col("orange",el(b,"Aliasing")), item(["Presencia de dos o mas distintas referencias para el mismo lugar de memoria"]) ),
			     (   col("orange",el(b,"Legibilidad y Escribilidad")), item(["Un lenguage que no soporta modos \"naturales\" de expresar un algoritmo necesariamente usará aproximaciones \"no naturales\" y asi reducirá la confiabilidad"]) )
			 ])),
	      slide("80%",col("red","Costo"),
		    (
			item([el(b,"Costo de &#x2026;")]),
			item("fade-in-then-semi-out",
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
		    item("fade-in-then-semi-out",
			 [
			     (   el(b,"Portabildad"),item(["La facilidad con que los programas puedan moverse de una implementación a otra"]) ),
			     (   el(b,"Generalidad"),item(["Su aplicabilidad a un amplio rango de aplicaciones."]) ),
			     (   el(b,"Bien definido"),item(["La completitud y precisión de la definición oficial del lenguaje"]) )
			 ]))
	  )),
    slide("",
	  (
	      slide("90%","Influencias en el diseño de los lenguajes",
		    (
			item("highlight-current-blue",
			     [(el(b,"Arquitectura de Computadoras"),item([("Lenguajes son desarrollados alrededor de la arquitectura de computadora prevaleciente, conocida como arquitectura de ",el(em,"von Neumann"))]))]),
			item("highlight-current-green",
			     [(el(b,"Metodologías de Programación"),item([("Nuevas metodologías de desarrollo de software (e.g. desarrollo de software orientado a objetos) llevan a nuevos paradigmas y por extensión a nuevos lenguajes de programación")]))])
		    )),
	      slide("90%",col("blue","Influencia de la Arquitectura de Computadoras"),
		    item(
			[
			    "Arquitectura de Computadora bien conocida: Von Neumann",
			    (   "Lenguajes Imperativos mas dominantes debido a la arquitectura dominante",
				item(
				    [
					"Datos y Programas almacenados en memoria",
					"Memoria Separada de la CPU",
					"Instrucciones y Datos son conducidos desde la Memoria a la CPU",
					(   "Bases para los lenguajes imperativos",
					    item(
						[
						    "Variables modelan celdas de memoria",
						    "La iteración es eficiente"
						]))
				    ]))
			])),
	      slide(col("blue","Arquitectura de Von Neumann"),
		    fig(img("vonneumann.png","auto","auto"))
		   ),
	      slide("80%",col("green","Influencia de las Metodogías de Programación"),
		    item(
			[
			    (   col("green","Décadas de los 50 y 60:")," Simples aplicaciones; preocupación principal la eficiencia"),
			    (   col("green","Finales de los 60:")," Eficiencia de programación toma importancia: legibilidad, mejores estructuras de control",
				item(
				    [
					"Programación Estructurada",
					("Diseño ",el(em,"top-down")," y refinamiento ",el(em,"step-wise"))
				    ])),
			    (   col("green","Finales de los 70:")," De Orientación a Procesos a Orientación a Datos.",
				item(
				    [
					"Abstracción de Datos"
				    ])),
			    (   col("green","Mediados de los 80:")," Programación orientada a Objetos",
				item(
				    [
					"Abstracción de Datos + Herencia + Polimorfismo"
				    ]))
			])),
	      slide("65%",col("green","Categoría de Lenguajes"),
		    item(
			[
			    (   el(b,"Imperativa"),
				item(
				    [
					"Variables, sentencias de asignación e iteración",
					"Ejemplos: C, Pascal"
				    ])),
			    (   el(b,"Funcional"),
				item(
				    [
					"Principal medio de computación es aplicar funciones a parámetros",
					"Ejemplos: LISP, Scheme"
				    ])),
			    (   el(b,"Lógica"),
				item(
				    [
					"Basado en Reglas",
					"Ejemplo: Prolog"
				    ])),
			    (   el(b,"Orientado a Objetos"),
				item(
				    [
					"abstracción de datos, herencia, ligadura tardía",
					"Ejemplos: Java, C++"
				    ])),
			    (   el(b,"Marcado"),
				item(
				    [
					"No programación per se, pero usados para especificar la información mostrada en documentos web",
					"Ejemplos: XHTML, XML"
				    ]))
			])),
	      slide("75%",col("green","Compromisos en el diseño de Lenguajes"),
		    item(
			[
			    (   el(b,"Confiabilidad vs. Costo de ejecución"),
				item(
				    [
					"Ejemplo: Java exige que todas las referencias a elementos de los arreglos sean chequeadas si la indexación es correcta, pero esto incrementa el costo de ejecución"
				    ])),
			    (   el(b,"Legibilidad vs. Escribilidad"),
				item(
				    [
					"Ejemplo: APL provee muchos operadores poderosos (y un gran numero de nuevos simbolos) permitiendo que complejas operaciones sean escritas en un programa compacto pero con el costo de pobre legibilidad"
				    ])),
			    (   el(b,"Flexibilidad vs. Confiabilidad"),
				item(
				    [
					"Ejemplo: Los punteros de C++ son poderosos y muy flexibles pero de un uso poco confiable."
				    ]))
			])))),
        slide("",
	  (
	      slide("Métodos de Implementación",
		    item(
			[
			    (   col("orange",el(b,"Compilación")),
				item(
				    [
					"Los programas son traducidos al lenguaje máquina"
				    ])),
			    (   col("brown",el(b,"Interpretación Pura")),
				item(
				    [
					"Los programas son interpretados por otro programa llamado intérprete"
				    ])),
			    (   col("purple",el(b,"Sistemas de implementación híbridos")),
				item(
				    [
					"Un compromiso entre compilación y interpretación pura"
				    ]))
			])),
	      slide("85%","Capas de Implementación de Lenguajes",
		    fig(img("interfacecapas.png","60%","auto"))
		   ),
	      slide("90%",col("orange","Compilación"),
		    item(
			[
			    "Traduce programas de alto nivel (lenguaje fuente) en codigo máquina",
			    "Traducción lenta, ejecución rápida",
			    (   "El proceso de compilación tiene varias faces:",
				item(
				    [
					"análisis lexico: convierte caracteres del programa fuente en unidades léxicas",
					("análisis sintáctico: Transforma unidades léxicas en árboles sintácticos ",el(em,"parse trees")),
					"análisis semántico: Genera código intermedio",
					"generación de código: Codigo máquina es generado"
				    ]))
			])),
	      slide(col("orange","El proceso de compilación"),
		    fig(img("procesocomp.png","auto","auto"))
		   ),
	      slide(col("orange","Terminología Adicional de Compilación"),
		    item(
			[
			    "Módulo de carga (imagen ejecutable) : El código del usuario y del sistema juntos",
			    (   el(em,"linking and loading")," Enlazado y Carga: El proceso de recolectar los programas del sistema y enlazarlo al programa del usuario")
			])),
	      slide(col("orange","Ejecución del Código Máquina"),
		    (
			item(
			    [
				"ciclo de traer y ejecutar (sobre una arquitectura Von Neumann)"
			    ]),
			code("ada",
			     (
				 "repeat  por siempre\n",
				 "   traer la instrucción apuntada por el contador\n",
				 "   incrementar el contador\n",
				 "   decodificar la instrucción\n",
				 "   ejecutar la instrucción\n",
				 "end repeat\n"
			     ))
		    )),
	      slide(col("orange",(el(em,"Cuello de botella")," de Von Neumann")),
		    item(
			[
			    "La velocidad de conección entre la memoria de la computadora y su procesador determina la velocidad de la computadora",
			    ("Las intrucciones del programa son ejecutadas mucho mas rápido que la velocidad de conección; por lo tanto ésta se vuelve el ",el(em,"cuello de botella")),
			    ("Es conocido que ",el(em,"cuello de botella")," de la arquitectura de Von Neumann es el principal factor en la velocidad de las computadoras")
			])),
	      slide(col("brown","Interpretación Pura"),
		    item(
			[
			    "Sin traducción",
			    "Facil implementación de programas. Errores de tiempo de ejecución pueden ser facilmente reconocidos",
			    "Ejecución mas lenta (10 a 100 veces mas lenta que programas compilados)",
			    "Frecuentemente requiere mas espacio",
			    "Se volvio infrecuente en lenguajes de alto nivel",
			    ("Han retornado con lenguajes de ",el(em,"sripting")," para la Web (e.g. JavaScript)")
			])),
	      slide(col("brown","Proceso de Interpretación Pura"),
		    fig(img("procesointerppuro.png","auto","auto"))
		   ),
	      slide("80%",col("purple","Sistemas de Implementación Híbrida"),
		    item(
			[
			    "Un compromiso entre compilador y intérprete puro",
			    "El programa en lenguaje de alto nivel es traducido a un lenguaje intermedio que permite facil interpretación",
			    "Mucho mas rápido que interpretación pura",
			    (   "Ejemplos",
				item(
				    [
					"Programas en Perl son parcialmente compilados para detectar errores antes de la interpretación",
					("Implementaciones iniciales de Java fueron híbridas, la forma intermedia ",el(em,"byte code"),", proveyó portabilidad a toda máquina que tenía un interprete de ",el(em,"byte code")," y un sistema de ",el(em,"run time")," (juntos son llamados la máquina virtual de java)")
				    ]))
			])),
	      slide(col("purple","Proceso de Implementación Híbrida"),
		    fig(img("procesohibrido.png","20%","auto"))
		   ),
	      slide(col("purple",("Sistemas de Implementación ",el(em,"Just in Time"))),
		    item(
			[
			    "Inicialmente Los programas se traducen a un lenguaje intermedio",
			    "Luego el lenguaje intermedio se compila a código máquina",
			    "La versión en máquina se conserva para llamadas subsecuentes",
			    "Sistemas JIT son ampliamente usados para programas Java",
			    "Lenguajes .NET son implementados con sistemas JIT"
			])),
	      slide("Preprocesadores",
		    item(
			[
			    "Macros de preprocesamiento (instrucciones) son comunmente usadas para especificar que código de otros archivos sean incluidos",
			    "Un preprocesador procesa un programa inmediatamente antes de que el programa se compile para expandir las macros incluídas",
			    (   "Un ejemplo conocido: El preprocesador de C",
				item(
				    [
					"expands #include, #define, y macros similares"
				    ]))
			])),
	      slide("80%","Entornos de Programación",
		    item(
			[
			    "Una colección de herramientas usadas en el desarrollo de software",
			    (   "UNIX",
				item(
				    [
					"un tradicional sistema operativo y colección de herramientas",
					"hoy en dia frecuentemente usado a través de un GUI que corren sobre UNIX"
				    ])),
			    (   "Borland JBuilder",
				item(
				    [
					"Un entorno de programación integrado para Java"
				    ])),
			    (   "Microsoft Visual Studio .NET",
				item(
				    [
					"Un complejo entorno visual de desarrollo",
					"Usado para programar en C#, Visual Basic .NET, jscript, J# o C++"
				    ]))
			]))
	  )).


evolucion -->
    section("Evolución de los Lenguajes de Programación"),
    lenguajesdiagramas,
    primeroslenguajes,
    codigomaquina,
    ibmfortran,
    lisp,
    algol,
    cobol,
    basic,
    pli,
    dinamicos,
    abstraccion,
    ortogonal,
    logica,
    esfuerzodiseno,
    oop,
    scripting.

lenguajesdiagramas -->
    slide("Lenguajes de Programación",
	  fig(link("https://ingenieriadesoftware.es/wp-content/uploads/2019/04/diagram-languages-light.png",
		   img("diagram-languages-light.png","auto","570")))),
    slide("Lenguajes de Programación",
	  fig(link("https://ingenieriadesoftware.es/wp-content/uploads/2019/04/diagram-languages-full.png",
		   img("diagram-languages-full.png","auto","570")))).

primeroslenguajes -->
    slide("Evolución de los primeros lenguajes", ""),
    slide("",
	  (
	      slide("Konrad Zuse's language de la computadora Z4.",
		    fig(img("z4.png","auto","auto"))),
	      slide("Zuse's Plankalkül",
		    (
			item(
			    [
				"Desarrollado en 1945",
				"Nunca implementado",
				"Su descripción fue publicada en 1972.",
				"Tipos de datos: bit, Integer and float tipos compuestos.",
				"arreglos y registros"
			    ]),
			code("lisp",
			     (
				 "  | A + 1 =&gt; A\n",
				 "V | 4        5\n",
				 "S | 1.n      1.n\n"
			     ))
		    ))
	  )).

codigomaquina -->
    slide("",
	  (
	      slide("Codigo Máquina: pseudocodigos ¿?", ""),
	      slide("Escribir en lenguaje máquina",
		    item(
			[
			    "poco legibles y modificables",
			    "sin indices ni punto flotante",
			    "direccionamiento absoluto"
			])),
	      slide("Shorte Code Mauchly (1949)",
		    (
			item(
			    [
				"computadora BINAC",
				"Expresiones eran codificadas de izquierda a derecha",
				"Ejemplos de operaciones:"
			    ]),
			code("lisp",
			     (
				 "01 - 06 abs value 1n (n+2)nd power\n",
				 "02 ) 07 +         2n (n+2)nd root\n",
				 "03 = 08 pause     4n if &lt;= n\n",
				 "04 / 09 (         58 print and tab\n"
			     )),
			el(p,"La sentencia X0 = SQRT(ABS(Y0)) podria ser codificada como:"),
			code("lisp",
			     (
				 "00 X0 03 20 06 Y0\n"
			     ))
		    )),
	      slide("Speedcoding",
		    item(
			[
			    "Desarrollado por John Backus en 1954 para IBM 701",
			    (   "Pseudo operaciones para funciones aritméticas y matemáticas",
				item(
				    [
					"bifurcación condicional e incondicional",
					"registros autoincrementales para acceso a arreglos",
					"4.2 millisegundos la instruccion de suma y 700 palabras para el programa",
					"2 semanas de programación en pocas horas!!!"
				    ]))
			])),
	      slide("Otros sistemas relacionados",
		    item(
			[
			    (   "Sistema de \"compilación\" UNIVAC",
				item(
				    [
					"Desarrollado por el equipo de Brace Hopper",
					"Pseudocodigo expandido en código máquina (macros)"
				    ])),
			    (   "David J Wheeler (Universidad de Cambridge) (1950)",
				item(
				    [
					"Desarrollo un método de usar bloques de direccionamiento reubicables"
				    ])),
			    ("Wilkes (1951-1957) desarrolló el lenguaje ",el(em,"assembler")," con estas ideas")
			]))
	  )).

ibmfortran -->
    slide("",
	  (
	      slide("IBM 704 y Fortran",
		    fig(img("ibm704.jpg","auto","570"))),
	      slide("90%","Fortan",
		    item(
			[
			    "Fortran 0: 1954 - no implementado",
			    (   "Fortran 1 1957",
				item(
				    [
					"Diseñado para la nueva IBM 704, que tenía registros y aritmética de punto flotante",
					(   "Entorno de Desarrollo",
					    item(
						[
						    "Las Computadoras eran pequeñas y confiables",
						    "Las aplicaciones eran científicas",
						    "Sin metodología ni herramientas de programación",
						    ("Importancia en ",el(b,"eficiencia"))
						]))
				    ]))
			])),
	      slide("Proceso de Diseño",
		    item(
			[
			    (   "El impacto del entorno en el diseño de Fortran",
				item(
				    [
					"Sin necesidad de almacenamiento dinámico",
					"Necesidad de un buen manejo de arreglos y ciclos",
					"Sin manejo de cadenas, aritmética decimal o herramientas de entrada/salida (de uso comercial)"
				    ]))
			])),
	      slide("Fortran I",
		    item(
			[
			    (   "Primera versión implementada de Fortrand",
				item(
				    [
					"Nombres hasta 6 caracteres",
					("Ciclos iterativos con post condición (",el(b,"DO"),")"),
					"I/O formateada",
					"subprogramas definidos por el usuario",
					("Sentencias condicionales de tres modos (",el(b,"IF")," aritmético)"),
					"sentencias sin tipo de datos"
				    ]))
			])),
	      slide("Fortran I",
		    item(
			[
			    (   "Primera versión implementada",
				item(
				    [
					"Sin compilación separada",
					"Compilador distribuido en Abril de 1957,",
					"Programas de mas de 400 lineas raramente compilaban correctamente, principalmente debido a la pobre confiabilidad de la IBM 704",
					"La Codificación era verdaderamente rápida",
					"Rapidamente se volvió ampliamente usado"
				    ]))
			])),
	      slide("Fortran II",
		    item(
			[
			    (   "Distribuido en 1958",
				item(
				    [
					"Compilación independiente",
					"Se corrigieron muchos errores"
				    ]))
			])),
	      slide("Fortran IV",
		    item(
			[
			    (   "Desarrollado durante 1960-1962",
				item(
				    [
					"Declaración explicita de tipos",
					"Sentencia de selección lógica",
					"Nombres de programas podian ser pasados como parámetros",
					"ANSI standard en 1966"
				    ]))
			])),
	      slide("Fortran 77",
		    item(
			[
			    (   "Se volvió el nuevo estandard en 1978",
				item(
				    [
					"Manejo de cadenas de caracteres",
					"sentencia de control de ciclos lógico",
					("sentencia ",el(b,"IF-THEN-ELSE"))
				    ]))
			])),
	      slide("Fortran 90",
		    item(
			[
			    (   "Con los mas significativos cámbios desde el Fortran 77",
				item(
				    [
					"Módulos",
					"Arreglos dinámicos",
					"Punteros",
					"Recursión",
					("sentencia ",el(b,"CASE")),
					"chequeo de tipos en los parametros"
				    ]))
			])),
	      slide("Evaluación de Fortran",
		    item(
			[
			    (   "Compiladores altamente optimizados (todas las versiones anteriores a 90)",
				item(
				    [
					"Los tipos y almacenamiento de todas las variables eran fijas antes del tiempo de ejecución."
				    ])),
			    "Dramaticamente cambió para siempre el modo en que las computadoras fueron usadas",
			    ("Caracterizados como la ",el(em,"lingua franca")," del mundo de la computación")
			]))
	  )).

lisp -->
    slide("",
	  (
	      slide("Programación Funcional: LISP",
		    (
			fig(img("McCarthy-.jpg","auto","500")),
			el(p,"John McCarthy")
		    )),
	      slide("LISP",
		    item(
			[
			    (   el(em,"LISt Processing Language"),
				item(
				    [
					"Diseñado en el MIT por McCarthy"
				    ])),
			    (   "Investigación en AI necesitaba un lenguaje",
				item(
				    [
					"Procesamiento de datos en Listas (en lugar de arreglos)",
					"Computación simbólica (en lugar de numérica)"
				    ])),
			    "Solo dos tipos de datos: átomos y listas",
			    ("Basado en el ",el(b,"Lambda calculus"))
			])),
	      slide("Representación de Listas LISP",
		    fig(img("represlistas.png","auto","auto"))),
	      slide("Evaluación de LISP",
		    item(
			[
			    (   "Pionero en programación funcional",
				item(
				    [
					"Sin necesidad de variables o asignación",
					"Control via recursión y expresiones condicionales"
				    ])),
			    "Aún un lenguaje dominante para IA",
			    "COMMON LISP y Scheme son dialectos contemporaneos de LISP",
			    "ML, Miranda, Haskell son lenguajes relacionados"
			])),
	      slide("Scheme",
		    item(
			[
			    "Desarrollado en el MIT a mediados de los 70",
			    "Pequeño",
			    "Extensivo uso de alcance estático",
			    "Funciones como entidades de primera clase",
			    "Sintaxis simple, ideal para aplicaciones educativas"
			])),
	      slide("COMMON LISP",
		    item(
			[
			    "Un esfuerzo por combinar características de varios dialectos de LISP en un solo lenguaje",
			    "Grande y Complejo"
			]))
	  )).

algol -->
    slide("",
	  (
	      slide("Primera sofisticación: ALGOL 60", ""),
	      slide("Algol 60",
		    item(
			[
			    (   "Entorno de Desarrollo",
				item(
				    [
					"FORTRAN había arribado para las IBM 70x",
					"Muchos lenguajes se habían desarrollado para máquinas específicas",
					"Ningún lenguaje era portable; todos eran dependiente de las máquinas",
					"No existía ningún lenguaje universal para comunicar algoritmos"
				    ])),
			    "ALGOL 60 fue el resultado del esfuerzo de designar un lenguaje universal"
			])),
	      slide("Primitivo proceso de diseño",
		    item(
			[
			    "Encuentro de ACM y GAMM para cuatro dias de diseño (27 de Mayo al 1 de Junio de 1958)",
			    (   "Metas del Lenguaje",
				item(
				    [
					"Cercano a la notación matemática",
					"Bueno para describir algoritmos",
					"Traducible a lenguaje máquina"
				    ]))
			])),
	      slide("80%","ALGOL 58",
		    item(
			[
			    "El concepto de tipos fue formalizado",
			    "Los nombre podrían tener cualquier longitud",
			    "Los arreglos podrían tener cualquier número de subíndices",
			    "Los parámetros fueron separados por modo (Entrada y Salida)",
			    "Subíndices fueron colocados entre corchetes",
			    ("Sentencias compuestas (",el(b,"begin &#x2026; end"),")"),
			    "Punto y coma como separador de sentencias",
			    ("Operador de asignación fue ",el(b,":=")),
			    (   el(b,"if")," tenía una cláusula ",el(b,"else-if")),
			    "Sin E/S - \"podría hacerlo dependiente de la máquina\""
			])),
	      slide("Implementación de ALGOL 58",
		    item(
			[
			    "Sin intención de ser implementado, sin embargo variaciones de él si lo fueron (MAD, JOVIAL)",
			    "Aunque IBM fue inicialmente entusiasta, todo soporte fue quitado a mediados de 1959"
			])),
	      slide("ALGOL 60",
		    item(
			[
			    "Se modificó ALGOL 58 en una reunión de 6 dias en Paris",
			    (   "Nuevas Características",
				item(
				    [
					"Estructura de bloques (alcance local)",
					"Dos métodos de pasaje de parámetros",
					"Recursión de subprogramas",
					"arreglos dinámicos (basados en pilas)",
					"Todavía sin E/S ni manejo de cadenas de caracteres"
				    ]))
			])),
	      slide("Evaluación de ALGOL 60",
		    item(
			[
			    (   "Exitoso",
				item(
				    [
					"Fue el modo estándar de publicar algoritmos por los siguientes 20 años",
					"Todo subsecuente lenguaje imperativo fue basado en él",
					"Primer lenguaje independiente de la máquina",
					"Primer lenguaje cuya sintaxis fue formalmente definida (BNF)"
				    ]))
			])),
	      slide("Evaluación de ALGOL 60",
		    item(
			[
			    (   "Fracaso",
				item(
				    [
					"Nunca fue ampliamente usado, especialmente en U.S.",
					(   "Razones:",
					    item(
						[
						    "Falta de E/S y el conjunto de caracteres lo hacía no portable",
						    "Demasiado flexible para implementar",
						    "atrincheramiento de Fortran",
						    "Falta de soporte de IBM"
						]))
				    ]))
			]))
	  )).

cobol -->
    slide("",
	  (
	      slide("70%","Aplicaciones Comerciales: COBOL",
		    (
			fig(img("gracehopper.webp","auto","449")),
			el(p,"Grace Hopper")
		    )),
	      slide("COBOL Commercial Buisness Language",
		    item(
			[
			    (   "Entorno de Desarrollo",
				item(
				    [
					"UNIVAC comenzó a usar FLOW-MATIC",
					"USAF comenzó a usar AIMACO",
					"IBM desarrolló COMTRAN"
				    ]))
			])),
	      slide("COBOL Historia",
		    item(
			[
			    "Basado en FLOW-MATIC",
			    (   "características de FLOW-MATIC:",
				item(
				    [
					"Nombres de mas de 12 caracteres, con guiones incluidos",
					"Nombres en Inglés para los operadores aritméticos",
					"Datos y códigos completamente separados",
					"Verbos eran las primeras palabras en toda sentencia"
				    ]))
			])),
	      slide("80%","COBOL proceso de diseño",
		    item(
			[
			    "Primera reunión de diseño (Pentagon) - Mayo de 1959",
			    (   "Metas de Diseño",
				item(
				    [
					"Debe lucir como simple Ingles",
					"Facil de usar, aún si esto significara menor potencia",
					"Debe ampliar la base de los usuarios de computadoras",
					"No debe estar sesgado por los actuales problemas de compiladores."
				    ])),
			    "Los miembros del comité eran todos de los fabricantes de computadoras y divisiones del DoD",
			    "Problemas de Diseño: expresiones aritméticas? Desacuerdo entre fabricantes"
			])),
	      slide("Evaluación de COBOL",
		    item(
			[
			    (   "Contribuciones",
				item(
				    [
					"Primeras facilidades de Macros en un lenguaje de alto nivel",
					"Estructuras de datos jerárquicos (registros)",
					"Sentencias de selección anidadas",
					"Nombres largos (mas de 30 caracteres), con guiones",
					"División de Datos separadas"
				    ]))
			])),
	      slide("Influencia del Departamento de Defensa",
		    item(
			[
			    (   "Primer lenguaje requerido por DoD",
				item(
				    [
					"Podría haber fallado sin Dod"
				    ])),
			    "Aún es el lenguaje mas usado en aplicaciones comerciales"
			]))
	  )).

basic -->
    slide("",
	  (
	      slide("Comienzo de tiempo compartido: BASIC", ""),
	      slide("BASIC",
		    item(
			[
			    "Diseñado por Kemeny &amp; Kurtz en Dartmouth",
			    (   "Metas de diseño",
				item(
				    [
					"Facil de aprender y usar por estudiantes que no sean de ciencias",
					"Debe ser placentero y amigable",
					"Acceso Libre",
					"El tiempo del usuario es mas importatne que el tiempo de computación"
				    ])),
			    "Dialecto popular actual: Visual BASIC",
			    "Primer lenguaje ampliamente usado con tiempo compartido"
			]))
	  )).

pli -->
    slide("",
	  (
	      slide("Todo para Todos: PL/I", ""),
	      slide("PL/I",
		    item(
			[
			    "Diseñado por IBM y SHARE",
			    (   "Situación de la computación en 1964 (desde el punto de vista de IBM)",
				item(
				    [
					(   "Computación científica",
					    item(
						[
						    "Computadoras IBM 1620 y 7090",
						    "FORTRAN",
						    "grupo de usuarios SHARE"
						])),
					(   "Computación de empresas",
					    item(
						[
						    "Computadoras IBM 1401, 7080",
						    "COBOL",
						    "grupo de usuarios GUIDE"
						]))
				    ]))
			])),
	      slide("80%","Antecedentes PL/I",
		    item(
			[
			    (   "En 1965",
				item(
				    [
					"usuarios científicos comenzaron a necesitar Entrada/Salida mas elaborada, como tenía COBOL; y usuarios empresariales comenzaron a necesitar aritmética de punto flotante y arreglos",
					"Muchas empresas empezaron a necesitar dos clases de computadoras, lenguajes y personal de soporte. Demasiado Costo."
				    ])),
			    (   "La solución mas obvia:",
				item(
				    [
					"Construir una nueva computadora para ambas clases de aplicaciones",
					"Diseñar un nuevo lenguaje para ambas clases de aplicaciones."
				    ]))
			])),
	      slide("Proceso de diseño",
		    item(
			[
			    (   "Diseñado en 5 meses por un comité bipartito:",
				item(
				    [
					"tres miembros de IBM y tres miembros de SHARE"
				    ])),
			    (   "Concepto inicial",
				item(
				    [
					"Una extensión de Fortran IV"
				    ])),
			    "Inicialmente llamado NPL (Nuevo Lenguaje de Programación)",
			    "El nombre cambió a PL/I en 1965"
			])),
	      slide("Evaluación de PL/I",
		    item(
			[
			    (   "contribuciones de PL/I",
				item(
				    [
					"Primer nivel de concurrencia",
					"Primer manejador de excepciones",
					"llave de selección de recursión",
					"Primer tipo de dato puntero"
				    ])),
			    "Muchas características fueron pobremente diseñadas",
			    "Demasiado grande y demasiado complejo"
			]))
	  )).

dinamicos -->
    slide("",
	  (
	      slide("Lenguajes Dinámicos", ""),
	      slide("APL y SNOBOL",
		    item(
			[
			    "Caracterizados por tipos dinámicos y administración dinámica de memoria",
			    (   "Las Variables son sin tipos",
				item(
				    [
					"Una variable adquiere un tipo cuando se le asigna un valor"
				    ])),
			    "El almacenamiento se le asigna a una variable cuando se le asigna un valor"
			])),
	      slide(("APL: (",el(em,"A Programming Language"),")"),
		    item(
			[
			    (   "Diseñado como un lenguaje de descripción de hardware en IBM por Ken Iverson alrededor de 1960",
				item(
				    [
					"Altamente expresivo (muchos operadores, tambien para arreglos de varias dimensiones)",
					"Programas muy difíciles de leer"
				    ])),
			    "Aún en uso con mínimos cambios"
			])),
	      slide("SNOBOL",
		    item(
			[
			    "Diseñado como un lenguaje de manipulación de cadena de caracteres en los laboratorios BELL por Farber, Griswold y Polensky",
			    "Operaciones poderosas para comparar patrones de cadenas de caracteres",
			    "Mas lento que los lenguajes alternativos (y por lo tanto no usado para escribir editores)",
			    "Aún usado para tareas de procesamiento de texto"
			]))
	  )).

abstraccion -->
    slide("",
	  (
	      slide("El comienzo de la Abstracción de Datos", ""),
	      slide("Simula 67",
		    item(
			[
			    "Diseñado originalmente para sistemas de simulación en Noruega por Nygaard y Dahl",
			    "Basado en Algol 60 y Simla I",
			    (   "Principales contribuciones",
				item(
				    [
					"Co-rutinas, una clase de subprogramas",
					("Implementado en una estructura llamada ",el(em,"class")),
					("Las ",el(em,"Classes")," son la base para la abstracción de datos"),
					("Las ",el(em,"Classes")," son las estructuras tanto para los datos locales y la funcionalidad")
				    ]))
			]))
	  )).

ortogonal -->
    slide("",
	  (
	      slide("Diseño Ortogonal", ""),
	      slide("ALGOL 68",
		    item(
			[
			    "Continúa el desarrollo de ALGOL 60 pero no es un superconjunto de ese lenguaje",
			    "Fuente de muchas nuevas ideas (aún cuando el lenguaje mismo nunca fue ampliamente usado)",
			    (   "El diseño es basado en el concepto de ortogonalidad",
				item(
				    [
					"Pocos conceptos principales, con pocos mecanismos de combinación"
				    ]))
			])),
	      slide("Evaluación de ALGOL 68",
		    item(
			[
			    (   "Contribuciones",
				item(
				    [
					"Estructuras de datos definidas por el usuario",
					"Tipos Referencias",
					"Arreglos dinámicos"
				    ])),
			    (   "Comentarios",
				item(
				    [
					"Menor uso que ALGOL 60",
					"Tuvo gran influencia en los lenguajes subsecuentes, especialmente Pascal, C y Ada"
				    ]))
			])),
	      slide("Principales Descendientes de ALGOL",
		    item(
			[
			    (   "El lenguaje ALGOL impactó en todos los lenguajes imperativos",
				item(
				    [
					"Pascal",
					"C",
					"Modula/Modula 2",
					"Ada",
					"Oberon",
					"C++/Java",
					"Perl",
					"&#x2026;"
				    ]))
			])),
	      slide("PASCAL - 1971",
		    item(
			[
			    "Desarrollado por Wirth (un miembro del comité de Algol 68)",
			    "Diseñado para enseñar programación estructurada",
			    "Pequeño, simple, nada realmente nuevo",
			    (   "Gran impacto en la enseñanza de la programación",
				item(
				    [
					"Desde mediados de los 70 hasta fines de los 90, fue el lenguaje mas ampliamente usado para enseñar programación."
				    ]))
			])),
	      slide("C - 1971",
		    item(
			[
			    "Diseñado para programar sistemas (en los laboratorios DELL por Dennis Richie)",
			    "Evolución de BCLP, B, pero también de ALGOL 68",
			    "Poderoso conjunto de operadores, pero con débil chequeo de tipos.",
			    "Inicialmente difundido a través de UNIX",
			    "Muchas areas de aplicación"
			])),
	      slide("80%","PERL",
		    item(
			[
			    "Relacionado a ALGOL solo a través de C",
			    ("Un lenguaje de ",el(em,"scripting"),
			     item(
				 [
				     ("un ",el(em,"script")," es un archivo que contiene instrucciones para ser ejecutadas"),
				     "otros ejemplos: sh, awk, tcl/tk"
				 ])),
			    "Desarrollado por Larry Wall",
			    (   "Las variables de Perl estan estáticamente tipeadas y declaradas implicitamente.",
				item(
				    [
					"Tres espacios de nombres definidos denotados por el primer caracter del nombre de la variable"
				    ])),
			    "Poderoso pero también peligroso",
			    "Ampliamente usado como lenguaje de propósito general"
			]))
	  )).

logica -->
    slide("",
	  (
	      slide("Programación basado en la Lógica", ""),
	      slide("Prolog",
		    item(
			[
			    "Desarrollado por Comerauer y Roussel (Universidad de Aix-Marseille), con ayuda de Kowalski (Universidad de Edinburgh)",
			    "Basado en lógica formal",
			    "No es procedural",
			    "Puede se resumido como un sistema de base de datos inteligente que usa procesos de inferir la verdad de consultas dadas",
			    el(em,"Constraint Logic Programming")
			]))
	  )).

esfuerzodiseno -->
    slide("",
	  (
	      slide("Historia del mas grande esfuerzo de diseño", ""),
	      slide("90%","Ada",
		    item(
			[
			    (   "Enorme esfuerzo de Diseño, involucrando cientos de personas, mucho dinero y alrededor de 8 años",
				item(
				    [
					"requerimientos de Strawman (Abril de 1975)",
					"requerimientos de Woodman (Agosto de 1975)",
					"requerimientos de Tinman (1976)",
					"equipamiento de Ironman (1977)",
					"requerimeintos de Stellman (1978)"
				    ])),
			    "Nombrado Ada por Augusta Ada Byron conocida por ser la primera programadora"
			])),
	      slide("80%","Evaluación de Ada",
		    item(
			[
			    (   "Contribuciones",
				item(
				    [
					(el(em,"Packages")," soporte para abstraccion de datos"),
					"Manejo de excepciones - muy elaborado",
					"Unidad de programas genérico",
					"Concurrencia - a través del modelo de tareas"
				    ])),
			    (   "Comentarios",
				item(
				    [
					"Diseño Competitivo",
					"Incluye todo lo conocido de ingeniería de software y diseño de lenguajes",
					"Los primeros compiladores fueron muy dificultosos: el primero realmente usable apareció recién 5 años despues que el diseño fue completado"
				    ]))
			])),
	      slide("Ada 95",
		    item(
			[
			    (   "Ada 95 (comenzó en 1988)",
				item(
				    [
					"Soporte para OOP a través de derivación de tipos",
					"Mejores mecanismos de control para compartir datos",
					"Nuevas características de concurrencia",
					"Librerías mas flexibles"
				    ])),
			    "Su popularidad sufrió debido a que el DoD no requirió mas su uso y también debido a la popularidad de C++"
			]))
	  )).

oop -->
    slide("",
	  (
	      slide("Programación Orientada a Objetos (OOP)", ""),
	      slide("Smalltalk",
		    item(
			[
			    "Desarrollado en Xerox PARC, inicialmente pro Alan Kay, luego por Adele Goldberg",
			    "Primera implementación completa de un lenguaje orientado a objetos (abstracción de datos, herencia y ligadura dinámica de tipos)",
			    "Pionero en el diseñode interface gráfica del usuario",
			    "Promocionó OOP"
			])),
	      slide("85%","Combinando OOP y Programación Imperativa: C++",
		    item(
			[
			    "Desarrollado en Laboratorios BELL por Stroustrup en 1980",
			    "Evolución desde C y SIMULA 67",
			    "Facilidades para oop, tomadas paralelamente de SIMULA 67",
			    "Provee manejo de excepciones",
			    "Un lenguaje grande y complejo, porque soporta tanto programacion procedural como OO",
			    "Rápidamente creció en popularidad",
			    "estandar ANSI aprobado en Noviembre de 1997"
			])),
	      slide("80%","Lenguajes OOP relacionados",
		    item(
			[
			    (   "Eiffel (diseñado por Bertrand Meyer 1992)",
				item(
				    [
					"No directamente derivado de otros lenguajes",
					"mas pequeño y simple que C++, pero aún con la mayoría de su potencia",
					"Falta de popularidad con respecto a C++ debido a que los entusiastas de C++ eran ya programadores de C."
				    ])),
			    (   "Delphi (Borland)",
				item(
				    [
					"Pascal mas características para soportar OOP",
					"mas elegante y seguro que C++"
				    ]))
			])),
	      slide("90%","Un lenguaje imperativo orientado a Objetos: Java",
		    item(
			[
			    (   "Desarrollado en Sun a principios de los 90",
				item(
				    [
					"C y C++ no era satisfactorio para dispositivos electrónicos embebidos"
				    ])),
			    (   "Basado en C++",
				item(
				    [
					("Simplificado significativamente (no incluye ",el(b,"struct"),", ",el(b,"union"),", ",el(b,"enum"),", punteros aritméticos y la mitad de las asignaciones coercitivas de C++)"),
					("soporta ",el(em,"solo")," OOP"),
					"Tiene referencias, pero no punteros",
					"Incluye soporte para applets y formas de concurrencias"
				    ]))
			])),
	      slide("Evaluación de Java",
		    item(
			[
			    "Elimina características inseguras de C++",
			    "Características de concurrencia",
			    "Librerías para applets, GUI's, acceso a base de datos",
			    "Portable: concepto de Máquina Virtual, compilador JIT",
			    "Ampliamente usado para paginas de la WWW",
			    "El uso en otras áreas se incrementó mas rápido que otros lenguajes"
			]))
	  )).

scripting -->
    slide("",
	  (
	      slide(("Lenguajes de ",el(em,"Scripting")," para la WWW"), ""),
	      slide("80%",el(em,"Scripting"),
		    item(
			[
			    (   "JavaScript",
				item(
				    [
					"Una aventura en conjunto de Netscape y Sun Microsystem",
					"Usada en programación WEB (del lado del cliente) para crear documentos HTML dinámicos",
					"Relacionado a Java, solo a través de la sintaxis similar"
				    ])),
			    (   "PHP",
				item(
				    [
					"PHP: Preprocesador Hipertexto",
					"Usado para programación WEB (del lado del servidor), produce codigo HTML como salida"
				    ])),
			    (   "Python",
				item(
				    [
					"Un lenguaje orientado a objetos interpretado",
					"chequeo de tipos pero tipeado dinámicamente",
					"Soporta CGI y procesamiento de formularios"
				    ]))
			]))
	  )).
