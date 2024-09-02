file("tipos").
title("Tipos de Datos").
author("C. A. L. P.").
date("Claudio Vaucheret").
theme("night").


slides -->
    introduccion,
    chequeotipos,
    arreglos,
    strings,
    registros,
    punteros,
    listas,
    entsal.


introduccion -->
    section("Introducción"),
    slide("85%","Tipos de Datos",
	  (
	      el(p,"Hemos desarrollado una noción intuitiva de tipo de dato; ¿Que hay  detras de la intuición?"),
	      item('fade-in-then-semi-out',
		  [
		      " Conjunto de valores de un \"dominio\" (la aproximación funcional)",
		      "Estructura interna de un manojo de datos, descripto al nivel de un conjunto pequeño de tipos fundamentales (aproximación estructural)",
		      "Clase de equivalencia de objetos (aproximación del implementador)",
		      "Conjunto de operaciones bien-definidas que pueden ser aplicadas a    objetos de ese tipo (aproximación de abstracción)"
		  ])
	  )),
    slide(col(green,"Tipos de Datos"),
		   (
		       el(center,el(b,"Utilidad")),
		       item('highlight-current-green',
			    [
				"Contexto implícito",
				(   
				"Chequeo de tipos",
				item('highlight-current-green',
				     [
					 "Asegura que ciertas operaciones erróneas no ocurran",
					 "aunque no puede prevenir todas"
				     ])
				),
				"polimorfismo surge cuando el compilador encuentra que no necesita saber ciertas cosas"
			    ])
		   )
	 ),
    slide("",
	  (
	      slide(col(red,"Tipos de Datos"),
		    item('highlight-current-red',
			 [
			     (   el(b,"Fuetemente Tipado"), "se ha vuelto un término popular",
				 item('highlight-current-red',
				      [
					  (   "como ",el(em,"programación estructurada")),
					  "Informalmente, significa que el lenguaje previene al programador  de aplicar operaciones a los datos que no son apropiados"
				      ])
			     ),
			     (   el(b,"Fuetemente Estático"), "significa que el compilador puede realizar todos los chequeos en tiempo de compilación")
			 ])
		   ),
	      slide(col(red,"Ejemplos"),
		    item('highlight-current-red',
			 [
			     (	 "Common Lisp is fuertemente tipado pero no ",el(b,"tipado estaticamente") ),
			     "Ada es estáticamente tipado",
			     "Pascal es casi estáticamente tipado",
			     "Java es fuertemente tipado, con una mezcla no trivial de cosas que pueden ser chequeadas estaticamente y cosas que tienen que ser chequeadas dinámicamente."
			 ])
		   )
	  )
	 ),
    slide("90%",col(brown,"Tipos de Datos"),
	  (
	      el(center,el(b,col(brown,"Simples"))),
	      item(appear,
		   [
		       (   el(em,"Primitivos:"), "integer, float, char, enum,"), 
		       "Definidos por el Usuario"
		   ]),
	      el(center,el(b,col(brown,"Compuestos"))),
	      item(appear,
		   [
		       "Arreglos",
		       el(em,"strings"),
		       "Arreglos asociativos",
		       "Registros",
		       "Union",
		       "conjuntos",
		       "listas",
		       "punteros",
		       "archivos"
		   ])
	  )
	 ),
    slide(col(blue,"Sistema de Tipos"),
	  (
	      el(center,("Un ",el(b,"Sistema de Tipos"), " tiene reglas para:")),
	      item('highlight-current-blue',
		   [
		       "equivalencia de tipos (¿cuándo los tipos de dos valores son el mismo?)",
		       "compatibilidad de tipos (¿cuándo puede el valor de un tipo A ser usado en un contexto donde se espera el tipo B?)",
		       "inferencia de tipos (¿Cuál es el tipo de una expresión, dado el tipo de los operandos?)"
		   ])
	  )
	 ),
    slide(col(purple,"Chequeo de Tipos"),
	  (
	      (	  "Dos Aproximaciones: ",el(em,"equivalencia estructural")," y ",el(em,"equivalencia por nombre") ),
	      item(appear,
		   [
		       "La equivalencia por nombre esta basado en las declaraciones",
		       "La equivalencia estructural esta basada en la noción de significado detrás de esas declaraciones",
		       "Equivalencia por nombre es mas preferida hoy en dia."
		   ])
	  )
	 ),
    slide("70%",col(pink,"Estructural vs. por Nombre"),
	  item(appear,
	       [
		   (
		       el(p,"a veces es preferible estructural"),
		       code(
			   (
"TYPE stack_element = INTEGER; (* or whatever type the user prefers *)\n",
"MODULE stack; \n", 
"IMPORT stack_element;\n", 
"EXPORT push, pop; \n",
"... \n",
"PROCEDURE push(elem : stack_element); \n",
"...\n",
"PROCEDURE pop() : stack_element; \n",
"...\n"
			   ))
		   ),
		   (   
		       el(p,"otras veces por nombre"),
		       code(
			   (
"TYPE celsius_temp = REAL;\n",
"fahrenheit_temp = REAL; \n",
"VAR c : celsius_temp; \n",
"    f : fahrenheit_temp; \n",
" \n",
"BEGIN (* alias_types *)\n",
"    c := 100.0;\n",
"    f := c;               (* this should probably be an error *)\n"
			   ))
		   )
	       ])
	 ).





	 
chequeotipos -->
    section("Chequeo de Tipos"),
    slide("",
	  (
	      slide("90%",col(magenta,"Chequeo de Tipos: Coerción"),
		    (
			el(center,el(b,"Coerción")),
			item(
			    [
			    "Cuando una expresión es usada en un contexto donde un tipo diferente se espera, uno normalmente obtiene un error.",
			    (
				"Pero, ¿y en esta situación?:",
				code(
				    (
"var a : integer; b, c : real;\n",
"...\n",
"\n",
"c := a + b;\n"
				    ))
			    ),
			    "Muchos Lenguajes lo permiten.",
			    "Puede ser basado solo en los tipos de los operandos (Fortran)"
			    ])
		    )),
	      slide(col(magenta,"Chequeo de Tipos: Coerción"),
		    (
			el(center,el(b,"Coerción")),
			el(p,(el(b,"C")," usa mucha coerción, pero con reglas simples:")),
			item(
			    [
				(   "todos los ",el(code,"float")," en expresiones se vuelven ",el(code,"double") ),
				(   el(code,"short int ")," y ",el(code,"char")," se vuelven ",el(code,"int")," en las expresiones" ),
				    "Si es necesario, la precisión es removida cuando se asigna a lado izquierdo de la asignación."
			    ]
			))
		   ),
	      slide(col(magenta,"Chequeo de Tipos: Coerción"),
		    (	
			el(p,"De hecho, las reglas de coerción son una relajación del chequeo de tipos:"),
			item(
			    [
				"Nuevas opiniones lo consideran una mala idea",
				"Lenguajes como Modula-2 y Ada no permiten coerción",
				(   el(b,"C++")," sin embargo lo usa en extremo")
			    ])
		    )),
	      slide(col(magenta,"Chequeo de Tipos: Coerción"),
		    (	
			el(p,"Es importante entender la diferencia entre:"),
			item(
			    [
				(   el(b,"Conversión de Tipos")," que es ",el(em,"explícito")," y" ),
				(   el(b,"Coerción de Tipos")," que es ",el(em,"implícito")),
				(   "para las conversiones a veces se usa la palabra ",el(em,"cast")," por ",el(b,"C"))
			    ])
		    ))
	  )).

    


		   

arreglos -->
    section("Arreglos"),
    slide("",
	  (   
	      slide("Arreglos",
		    el(p,"Los Arreglos son el tipo compuesto mas importante en los lenguajes de alto nivel. Es una agrupación de elementos (usualmente) homogeneos en la cual los elementos individuales son identificados por su posición en la agrupación relativo a su primer elemento. ")),
	      slide(col(blue,"Cuestiones de Diseño de Arreglos"),
		    item('highlight-current-blue',
			 [
			     "¿Cuales tipos son legales para ser subíndices?",
			     "¿Es chequeado que el subíndice cumpla el rango definido?",
			     "¿Cuándo se liga el rango de subíndices?",
			     "¿Cuándo tiene lugar el alojamiento de espacio?",
			     "¿Cual es el número máximo de subíndices?",
			     "¿Pueden los arreglos ser inicializados?",
			     "¿Se pueden definir porciones (slices) de arreglos?"
			 ])
		   ),
	      slide("90%",col(magenta,"Accediendo a los elementos del Arreglo"),
			(   
			    el(p,"Es una función desde subíndices a elementos"),
			    col(magenta,el(p,(el(code,"array_name(index_value_list)")," \\(\\to\\) ",el(code,"an element")))),
			    el(center,el(b,"Sintaxis")),
			    item(
				[
				    (   "FORTRAN, PL/I, Ada usan ",el(em,"paréntesis") ),
				    "Ada explícitamente usa paréntesis para mostrar uniformidad entre referencia de arreglos y llamadas a función porque ambas mapean resultados",
				    (   "La mayoría de los otros lenguajes usan ",el(em,"corchetes") )
				])
			)
		   ),
	      slide("Tipos de los subíndices de los arreglos",
		    item('fade-in-then-semi-out',
			 [
			     "FORTRAN, C: solo enteros (integer)",
			     "PASCAL: cualquier tipo ordinal (integer, boolean, char, enumeration)",
			     "Ada: Enteros y enumeración (incluídos char y booleanos)",
			     "Java: solo tipos enteros",
			     "C, C++, Perl, y Fortran no especifican chequeo de rango",
			     "Java, ML, C#, especifican chequeo de rango"
			 ])
		   ),
	      slide("75%","Categoría de Arreglos",
		    item('fade-in-then-semi-out',
			 [
			     (	 el(b,"Estático:")," rango de subíndices son ligados estáticamente y el alojamiento de memoria es estático (antes del tiempo de ejecución) ",el(em,"ventaja:")," eficiencia (no hay alojamiento dinámico)"),
			     (	 el(b,"(stack)dinámico Fijo:")," los subíndices son ligados estáticamente, pero el alojamiento es hecho en tiempo de declaración ",el(em,"ventaja:")," eficiencia de espacio"),
			     (	 el(b,"(stack)dinámico:")," rangos de subíndices son ligados dinámicamente y el almacenamiento es dinámico (hecho en tiempo de ejecución)"),
			     (	 el(b,"(heap)dinámico Fijo:")," el almacenamiento es ligado dinámicamente pero fijo después del alojamiento."),
			     (	 el(b,"(heap)dinámico:")," la ligadura de los subíndices y el almacenamiento es dinámico y puede cambiar ",el(em,"ventaja:")," flexibilidad (los arreglos pueden crecer o disminuir durante la ejecución del programa)")
			 ])),
	      slide("Categoría de Arreglos",
		    item('fade-in-then-semi-out',
			 [
			     (	 "Los arreglos de ",el(b,"C")," y ",el(b,"C++")," que incluyen el modificador ",el(code,"static")," son ",el(em,"Estáticos") ),
			     (	 "Los arreglos de ",el(b,"C")," y ",el(b,"C++")," sin el modificador ",el(code,"static")," son ",el(em,"(stack)dinámicos Fijos")),
			     (	 "Los arreglos de ",el(b,"Ada")," pueden ser ",el(em,"(stack)dinámicos")),
			     (	 el(b,"C")," y ",el(b,"C++")," proveen arreglos ",el(em,"(heap)dinámicos Fijos")," (",el(b,"C#")," con sus ",el(code,"ArrayList"),")"),
			     (	 el(b,"Perl")," y ",el(b,"JavaScript")," soporta arreglos ",el(em,"(heap)dinámicos."))
			 ])
		   ),
	      slide("(Stack) Dinámicos fijos",
		    fig(img("adaarreglo.png","auto","500"))
		   ),
	      slide("Arreglos",
		    (
			el(p,col(purple,"Elementos Contiguos")),
			enum(
			    [
				(   "Dirigido por Columnas - solo en ",el(b,"Fortrand")),
				(   "Dirigido por filas",
				item(
				    [
					"usada por el resto de lenguajes",
					(   "hace que el ",el(code,"array [a..b,c..d]")," sea igual a ",el(code,"array [a..b] of array [c..d]")  )
				    ])
				)
			    ])
		    )),
	      slide("Arreglos",
		    fig(img("rowcolumnmajor.png","auto","auto"))
		   ),
	      slide("90%","Arreglos",
		    (
			el(p,el(b,"Dos estrategias para arreglos")),
			item(appear,
			     [
				 "Elementos continuos",
				 "punteros de filas"
			     ]),
			el(p,el(b,"Punteros de Filas")),
			item(appear,
			     [
				 (   "una opción en ",el(b,"C")),
				 "permite a las filas colocarse en cualquier parte de la memoria",
				 (   "bueno para matrices cuando las filas son de diferente longitud", el(p,col(yellow,"ejemplo arreglo de strings")) ),
				 "requiere espacio para los punteros"
			     ])
		    )
		   ),
	      slide("Arreglos",
		    fig(img("arraypontrowc.png","auto","auto"))
		   ),
	      slide(col(blue,"Inicialización de Arreglos"),
		    (
			el(p,"Algunos Lenguajes permiten inicialización en el tiempo de alojamiento."),
			item('highlight-current-blue',
			     [
				 (   "ejemplo de ",el(b,"C, C++, Java, C#"),
				     el(p,el(code,col(yellow,"int list [] = {4, 5, 7, 83}")))),
				 (   "cadena de caracteres en ",el(b,"C")," y ",el(b,"C++"),el(p,el(code,col(yellow,"char name [] = \"freddie\";")))),
				 (   "Arreglo of strings en ",el(b,"C")," y ",el(b,"C++"),el(p,el(code,col(yellow,"char *names [] = {\"bob\", \"jake\", \"Joe\"};")))),
				 (   el(b,"Java"),el(p,el(code,col(yellow,"String[] names = {\"Bob\", \"Jake\", \"Joe\"};"))))
			     ])
		    )),
	      slide("95%",col(orange,"Operaciones de Arreglos"),
		    item(appear,
			 [
			     (	 el(b,col(orange,"APL"))," provee el mas poderoso conjunto de operadores para procesar vectores y matrices y operaciones unarias (por ejemplo revertir elementos de una columna)" ),
			     (	 el(b,col(orange,"Ada"))," permite asignación de arreglos y concatenación"),
			     (	 el(b,col(orange,"Fortran"))," provee operaciones /elementales/ a causa de que son entre pares de elementos del arreglo",el(center,"Por ejemplo, el operador + entre dos arreglos resulta en un arreglo con la suma de los pares de elementos de los dos arreglos.") )
			 ])
		   ),
	      slide("85%","Arreglos",
		    (
			el(p,"Ejemplo"),
			el(p,el(code,"A : array [L1..U1] of array [L2::U2] of array [L3..U3] of elem;")),
			item(
			    [
				"\\(D1 = U1 - L1 + 1\\)",
				"\\(D2 = U2 - L2 + 1\\)",
				"\\(D3 = U3 - L3 + 1\\)",
				(   "\\(S3 = \\) tamaño de ",el(code,"elem")),
				"\\(S2 = D3 * S3\\)",
				"\\(S1 = D2 * S2\\)"

			    ]),
			el(p,"\\( A(i,j,k) = \\mbox{ address of A } + (i * S1) + (j * S2) + (k * S3) - \\)"),
			el(p,"\\( [(L1 * S1) + (L2 * S2) + (L3 * S3)] \\)")
			
		    )
		   ),
	      slide(col(green,"Slices"),
		    (
			el(p,(   "Una ",el(em,"porción")," (slice) de un arreglo es una subestructura de un arreglo; un mecanismo de referenciación." )),
			el(p,(   "Los ",el(em,"Slices")," son útilies en lenguages que tienen operaciones sobre arreglos (APL, FORTRAN etc)."))
		    )),
	      slide(col(green,"Slices"),
		    fig(img("slicesfort.png","auto","auto"))
		   ),
	      slide(col(blue,"Descriptores en Tiempo de Compilación"),
		    fig(img("descriptoresarray.png","auto","auto"))
		   ),
	      slide("70%",col(blue,"Arreglos Asociativos"),
		    item('highlight-current-blue',
			 [
			     (	 "Un ",el(em,"arreglo asociativo")," es una colección no ordenada de elementos de datos que son indexados por un numero igual de valores llamados ",el(em,"claves")," (keys)",el(center,"claves definidas por el usuario deben ser almacenadas" )),
			     (	 "Ahora llamados ",el(em,"Diccionarios") ),
			     (	 "en ",el(b,"PERL"),
				 item('highlight-current-blue',
				     [
					 (   "Nombres comenzando con ",el(code,"%;")," literales son delimitados con paréntesis", el(p,el(code,"%hi_temps~ = (\"Mon\" => 77, \"Tue\" => 79, \"Wed\" => 65, ... ),")) ),
					 (   "Para acceder se usan llaves y claves: ",el(p,el(code,"%hi_temps{\"wed\"} = 83;"))),
					 (   "Los elementos pueden ser removidos con ",el(code,"delete"),el(p,el(code,"delete %hi_temps{\"Tue\"}")))
					 
				     ])
			     )
			 ])
		   )
	  
	  )).



strings -->
    slide("Strings",
	  item(
	      [
		  (   el(em,"Strings")," son en realidad arreglos de caracteres" ),
		  "Son frecuentemente casos especiales, para darles flexibilidad (como polimorfismo y tamaño dinámico) que no es disponible para arreglos en general",
		  (   "Es mas facil proveer estas cosas para ",el(em,"strings")," que para arreglos en general porque los ",el(em,"strings"),"son de una dimensión y no circulares."   )
	      ])
	 ).

registros -->
    section("Registros"),
    slide("",
	  (
	      slide(col(orange,"Tipo Registro"),
		    item(
			[
			    "Un registro es un conjunto posiblemente heterogeneo de elementos de datos en el cual los elementos individuales son identificados por su nombre",
			    (
				col(orange,"Cuestiones de Diseño"),
				item(
				    [
					"¿Cual es la sintaxis para referenciar los campos?",
					"¿Son permitidas las referencias elípticas?"
				    ])
			    )
			])
		   ),
	      slide("75%",col(blue,"Tipo Registro"),
		    item(
			[
			    (
				"Cobol",
				code(
				    (
"01 EMPLOYEE-RECORD. \n",
"   02 EMPLOYEE-NAME. \n",
"      05 FIRST    PICTURE IS x(20). \n",
"      05 MIDDLE   PICTURE IS x(10). \n",
"      05 LAST     PICTURE IS x(20). \n",
"   02 HOURLY-RATE PICTURE IS 99v99. \n"

				    ))
			    ),
			    (
				"Ada",
				code(
				    (
"type Employee_Name_Type is record\n",
"   First : String (1..20);\n",
"   Middle : String (1..10);\n",
"   Last : String (1..20);\n",
"end record;\n",
"type Employee_Record_Type is record \n",
"   Employee_Name: Employee_Name_Type; \n",
"   Hourly_Rate: Float;\n",
"end record;\n",
 "Employee_Record: Employee_Record_Type; \n"
				    ))
			    )
			])
		   ),
	      slide("90%",col(blue,"Registros"),
		    item('highlight-current-blue',
			 [
			     (
				 "Referencia a los campos",
				 item('highlight-current-blue',
				     [
					 (   el(b,"COBOL "),el(p,el(code,"field_name OF record_name_1 OF ... OF record_name_n")) ),
					 (   "Otros (notación con punto) ",el(code,"record_name_1.record_name_2. ... record_name_n.field_name"))
				     ])
			     ),
			     "Referencias completamente calificadas: debe incluir todo el camino de nombres de registros.",
			     (	 "Referencia elíptica: permite no especificar nombres intermedios siempre que la referencia no sea ambigua. Ej: ",el(code,"FIRST OF EMP-REC")," en ",el(b,"COBOL") 	 )
			 ])
		   ),
	      slide(col(green,"Operaciónes de Registros"),
		    item('highlight-current-green',
			 [
			     "La asignación es muy común si los tipos son identicos",
			     (	 el(b,"Ada")," permite comparación de registros"),
			     (	 "Los registros de ",el(b,"Ada")," pueden ser inicializados con conjunto de literales") ,
			     (	 el(b,"COBOL")," provee ",el(code,"MOVE CORRESPONDING"), el(p, "copia un campo de un registro origen al correspondiente campo en el registro destino." ) )
			 ])
		   ),
	      slide(col(red,"Comparación con Arreglos"),
		    item('highlight-current-red',
			 [
			     "Tiene un diseño directo y seguro",
			     "Son usados cuando el agrupamiento de datos es heterogeneo",
			     "El acceso es mucho mas rápido que en arreglos porque el acceso a los nombres de los campos es estático"
			 ])
		   ),
	      slide(col(purple,"Implementación de Registros"),
		    (	
			fig(img("implementregistros.png","auto","auto")),
			el(p,"Un desplazamiento de dirección relativo al comienzo del registro es asociado con cada campo.")
		    )
		   ),
	      slide("85%",col(blue,"Tipo Uniones"),
		    item('highlight-current-blue',
			 [
			     (	 "Una ",el(em,"Union")," es un tipo a cuyas variables se les permite almacenar diferentes valores de tipo (estructura) en diferentes tiempos durantes la ejecución."	 ),
			     (	 "Cuestiones de Diseño",
				 item('highlight-current-blue',
				      [
					  "¿Debería requerirse chequeo de tipos?",
					  "¿Deberían incluirse como tipos particulares de Registros?"
				      ])
			     ),
			     (	 el(b,"Fortran, C, y C++")," proveen constructores de ",el(em,"Union")," sin soporte para chequeo de tipos se llaman ",el(em,"uniones libres") ),
			     (	 "Chequeo de tipos en ",el(em,"Uniones")," requieren que se incluya un indicador de tipo llamado ",el(em,"discriminante"),
				 el(center,(	 "soportado por ",el(em,"Ada") ))
			     )
			     
			 ])
		   ),
	      slide("75%",col(green,"tipo Union de Ada"),
		    (	
		    code(
			(
"type Shape is (Circle, Triangle, Rectangle); \n",
"type Colors is (Red, Green, Blue); \n",
"type Figure (Form: Shape) is record \n",
"  Filled: Boolean; \n",
"  Color: Colors; \n",
"  case Form is  \n",
"      When Circle => Diameter : Float; \n",
"      When Triangle =>  \n",
"             LeftSide, Rightside: Integer; \n",
"             Angle: Float; \n",
"      when Rectangle => Side1,Side2: Integer; \n",
"  end case; \n",
"end record; \n"
			)),
		    fig(img("adaunion.png","auto","250"))
		    )
		   ),
	      slide("Evaluación de Uniones",
		    item('fade-in-then-semi-out',
			 [
			     "También llamados registros variantes",
			     (	 "Es una construcción potencialmente insegura",
				 el(center,"no permite chequeo de tipos o es muy caro" )),
			     (	 el(b,"Java y C#")," no soportan uniones",
			         el(center,"Como reflejo de la creciente preocupación por la seguridad en los lenguajes de programación") ),
			     "La falta de discriminante (tag) significa que uno no sabe lo que hay almacenado,",
			     "La posibilidad de cambiar el discriminante permite acceder a campos erroneamente"
			 ])
		    )
	  )).



punteros -->
    section("Punteros y Tipos Recursivos"),
    slide("",
	  (
	      slide(col(magenta,"Tipo Punteros"),
		    item(
			[
			    (
				"Los Punteros sirven para dos propósitos:",
				enum(
				    [
					(   "acceso eficiente (y a veces intuitivo) a objetos muy elaborados (como en ",el(b,"C"),")"  ),
					(   "creación dinámica de estructuras ligadas, en conjunción con administración de memoria ",el(em,"heap")  )
				    ])
			    ),
			    (   "Varios lenguajes (e.g. ",el(b,"Pascal")," restringen los punteros para acceder a cosas en el ",el(em,"heap")  ),
			    (   "Los punteros son usados en un modo ",el(em,"por valor")," de las variables", el(center,("No se necesitan como modo ",el(em,"por referencia")))   )
			])
		   ),
	      slide(col(magenta,"Punteros y Tipos Recursivos"),
		    fig(img("lisppunt.png","auto","auto"))
		   ),
	      slide("90%",col(brown,"Punteros y Tipos Recursivos"),
		    (
			el(center,(el(b,"C")," punteros y arreglos")),
			item(
			    [
				el(code,"int *a == int a[]"),
				el(code,"int **a == int *a[]")
			    ]),
			el(center,"Las equivalencias no siempre ocurren"),
			item(
			    [
				"Especificamente, una declaración aloja un arreglo si se especifica un tamaño para la primera dimensión",
				(   
				    "En caso contrario aloja un puntero",
				    item(
					[
					    (	el(code,"int **a, int *a[]")," puntero a puntero a int" ),
					    (	el(code,"int *a[n]"), " arreglo de ",el(em,"n")," elementos de punteros" ),
					    (	el(code,"int a[n][m]"), " arreglo de dos dimensiones" )
					])
				)
			    ])
		    )
		   ),
	      slide("90%",col(brown,"Punteros y Tipos Recursivos"),
		    (
			el(p,"El compilador tiene que ser capaz de establecer el tamaño de las cosas apuntadas por los punteros"),
			item(
			    [
				(
				    "Por lo tanto las siguientes no son válidas:",
				    item(
					[
					    (	el(code,"int a[][]")," mal " ),
					    (	el(code,"int (*a)[]")," mal " )
					])
				),
				(
				    (	"Regla de declaración de ",el(b,"C"),": lee a la derecha tanto como puede (sujeto a paréntesis), luego a la izquierda, y luego sube de nivel y repite."),
				    item(
					[
					    (	el(code,"int *a[n]")," arreglo de ",el(em,"n")," elementos de punteros a enteros" ),
					    (	el(code,"int (*a)[n]")," puntero a un arreglo de ",el(em,"n")," elementos de enteros" )
					])
				)
			    ])
		    )
		   ),
	      slide(col(brown,"Punteros y Tipos Recursivos"),
		    (
			el(p,("Los problemas con punteros ",el(em,"colgados")," se deben a:")),
			item(
			    [
				(   "desalojo explícito de objetos del ",el(em,"heap"),el(center,"(solo en lenguajes que tienen desalojo explícito)")),
				"desalojo implícito de objetos elaborados"
			    ]),
			el(p,("Dos mecanismos de implementación para atrapar punteros ",el(em,"colgados"))),
			item(
			    [
				(   el(em,"Tombstones")," lápidas"   ),
				(   el(em,"Locks and Keys")," llaves y cerraduras"   )
			    ])
		    )
		   )
	  )).




listas -->
    slide(col(yellow,"Listas"),
	  (
	      el(p,("Una ",el(em,"Lista")," es definida recursivamente ya sea como una lista vacía o un par consistente de un objeto (que puede ser una lista o un átomo) y otra lista (mas corta)")),
	      item(
		  [
		      (	  "Las ",el(em,"Listas")," son ideales para programar en lenguajes lógicos y funcionales",el(center,("En ",el(b,"Lisp")," de hecho un programa",el(em,"es")," una lista, y puede extenderse a si mismo para contruir una lista y ejecutarla") )  ),
		      ("Las ",el(em,"Listas")," pueden usarse en programas imperativos." )
		  ])
	  )
	 ).


entsal -->
    slide("90%",col(yellow,"Archivos y Entrada/Salida"),
	  item(
	      [
		  (   "Entrada/Salida (E/S) facilita al programa a comunicarse con el mundo externo",el(center,"E/S interactiva y E/S con archivos")  ),
		  "Interactivo generalmente implica comunicación con usuarios humanos ydispositivos físicos",
		  "Archivos generalmente se refieren a almacenamiento fuera de linea implementado por el sistema operativo.",
		  ( "Archivos pueden ser categorizados en:",
		    item(
			[
			    "Temporarios",
			    "Persistentes"
			])
		  )
	      ])
	 ).

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
