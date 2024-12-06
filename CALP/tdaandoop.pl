file("tdaandoopb").
title("TDA y POO").
author("C. A. L. P.").
date("Claudio Vaucheret").
theme("night").
transition("slide").


slides -->
    abstraccion,
    tdaparametrizados,
    encapsulacion,
    poo.

abstraccion -->
    section(animate,"Abstracción"),
    section(animate,el(em,col(red,"Abstracción"))),
    slide("90%",col(red,"El concepto de Abstracción"),
	  item('highlight-current-red',
	       [
                  "Una abstracción es una vista o representación de una entidad que incluye sólo los atributos más significativos",
                  "El concepto de abstracción es fundamental en la programación (y en toda la ciencia de la computación)",
		  "Casi todos los lenguajes de programación admiten la abstracción de procesos con subprogramas",
                   "Casi todos los lenguajes de programación diseñados desde 1980 soportan la abstracción de datos"
	       ])),
    slide("90%",col(red,"Introducción a la Abstracción del Dato"),
	  (
	      el(p,("Un ",el(em,"tipo de datos abstracto")," (TDA) es un tipo de datos definido por el usuario que cumple las dos condiciones siguientes:")),
	  item('highlight-current-red',
	       [
		   "La representación y las operaciones sobre los objetos del tipo se definen en una única unidad sintáctica",
		   "La representación de objetos del tipo está oculta a las unidades de programa que utilizan estos objetos, por lo que las únicas operaciones posibles son las proporcionadas en la definición del tipo"
	       ])
	  )
	 ),
    slide("90%",col(red,"Ventajas de la Abstracción"),
	  (
	      el(p,"Ventaja de la primera condición"),
	      item('highlight-current-red',
		   [
		       "Organización del programa, modificabilidad (todo lo relacionado con la estructura de datos está junto), y compilación separada"		       
		   ]
		  ),
	      el(p,"Ventaja de la segunda condición"),
	      item('highlight-current-red',
		   [
		       "Fiabilidad - ocultando las representaciones de datos, el código de usuario no puede acceder directamente a objetos del tipo y asi depender de la representación, permitiendo que la representación se cambie sin afectar el código de usuario."
		   ]
	      	  )
	  )),
    section(animate,"Cuestiones de Diseño"),
    section(animate,el(em,col(green,"Cuestiones de Diseño"))),
    slide(col(green,"Cuestiones de Diseño"),
	  item('highlight-current-green',
	       [
		   "Una unidad sintáctica para definir un TDA",
		   (
		       "Operaciones integradas",
		       enum('highlight-current-green',
			    [
				"Asignación",
				"Comparación"
			    ]
			   )
		   ),
		   (
		       "Operaciones comunes",
		       enum('highlight-current-green',
			    [
				"Iteradores",
				"Accesores",
				"Constructores",
				"Destructores"
			    ]
			   )
		   ),
		   "TDA parametrizados"
	       ])
	 ),
    slide("80%",col(green,("Ejemplo en ",el(b,"ADA"))),
	  (
	      el(p,col(green,("El constructor de encapsulación se denomina ",el(em,"package")))),
	      item('highlight-current-green',
		   [
		       (   "Especificación del ",el(em,"package")," (la interfaz)"),
		       (   "Cuerpo del ",el(em,"package")," (implementación de las entidades nombradas en la especificación)")
		   ]
		  ),
	      el(p,col(green,"Ocultamiento de la información")),
	      item('highlight-current-green',
		   [
		       (   "La representación de tipo aparece en una parte de la especificación llamada la parte ",el(em,"privada")),
		       (   "Una forma más restringida con tipos privados ",el(em,"limitados"), " Define el TDA como un puntero y proporciona la definición de la estructura apuntada en el paquete del cuerpo")
		   ]
		  )
	  )
	 ),
    slide(col(green,("Ejemplo en ",el(b,"ADA"))),
	  code(
	      (
"package Stack_Pack is \n",
"       type stack_type is limited private;\n",
"       max_size: constant := 100;\n",
"       function empty(stk: in stack_type) return Boolean;\n",
"       procedure push(stk: in out stack_type; elem:in Integer);\n",
"       procedure pop(stk: in out stack_type);\n",
"       function top(stk: in stack_type) return Integer;\n",
"\n",
"       private  -- hidden from clients\n",
"       type list_type is array (1..max_size) of Integer;\n",
"       type stack_type is record\n",
"               list: list_type;\n",
"               topsub: Integer range 0..max_size) := 0;\n",
"       end record;\n",
"end Stack_Pack\n"
	      )
	  )
	 ),
    section(animate,("Ejemplo en ",el(b,"C++"))),
    section(animate,el(em,col(blue,("Ejemplo en ",el(b,"C++"))))),
    slide(col(blue,("Ejemplo en ",el(b,"C++"))),
	  item(appear,
	       [
		   (   "Basado en el tipo ",el(em,"struct")," de ",el(b,"C")," y en las clases de ",el(b,"Simula 67")),
		   "La clase es el dispositivo de encapsulación",
		   (   "Todas las ",el(em,"instancias")," de una  clase comparten una copia única de las funciones miembro"),
		   "Cada instancia de una clase tiene su propia copia de los miembros de datos de la clase",
		   (   "Las instancias pueden ser estáticas, dinámicas de pila o dinámicas  de ",el(em,"heap"))
	       ])
	 ),
    slide(col(blue,("Ejemplo en ",el(b,"C++"))),
	  (
	      el(p,"Ocultamiento de la Información"),
	  item(appear,
	       [
		   (   "cláusula ",el(em,"Private")," para entidades ocultas"),
		   (   "cláusula ",el(em,"Public")," para interface de entidades"),
		   (   "cláusula ",el(em,"Protected")," para herencia")		   
	       ])
	  )
	 ).







    

    

    
tdaparametrizados -->
    [].

encapsulacion -->
    [].

poo -->
    [].






show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
        consult(slideprolog),
        file(File),
        append(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).

    
