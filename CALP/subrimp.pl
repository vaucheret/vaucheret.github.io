file("subrimp").
title("Subrutinas").
author("C. A. L. P.").
date("Claudio Vaucheret").
theme("night").

slides -->
    semanticaGeneraldeLlamadayRetorno,
    subprogramasSimples,
    subprogramasconVariableslocalesenPilaDinamica,
    subprogramasimbricados,
    bloques,
    implementandoAlcanceDinamico.

semanticaGeneraldeLlamadayRetorno -->
    section(animate,"Semántica General de Llamada y Retorno"),
    section(animate,el(em,col(red,"Semántica General de Llamada y Retorno"))),
    slide("85%",col(red,"Semántica General de Llamada y Retorno"),
	  item('highlight-current-red',
	       [
		   "Semánticamente es como si el subprograma se insertara en el punto de su llamada (no es siempre asi)",
		   (   "En un lenguaje de Programación, las operaciones de llamado y retorno de subprogramas son llamadas en conjunto ",el(em,"articulación de subprogramas")  ),
		       (   "La llamada a un subprograma tiene varias acciones asociadas con:",
			   item('highlight-current-red',
			       [
				   "El método de pasaje de parámetros",
				   "variables locales estáticas",
				   "Estado de ejecución del programa llamador",
				   "transferencia del control",
				   "Estructura de anidamiento de los subprogramas"
			       ])
		       )
	       ])).


subprogramasSimples -->
    section(animate,"Subprogramas Simples"),
    section(animate,el(em,col(green,"Subprogramas Simples"))),
    slide(col(green,"Subprogramas Simples: LLamada"),
	  item('highlight-current-green',
	       [
		   "Grabar el estado de ejecución del llamador",
		   "llevar a cabo el proceso de pasaje de parámetros",
		   "Pasar la dirección de retorno al subprograma llamado",
		   "Transferir el control al programa llamado"
	       ])
	 ),
    slide(col(green,"Subprogramas Simples: Retorno"),
	  item('highlight-current-green',
	       [
		   "Si se usó pasaje de parametros por valor-resultado, mover los valores actuales a esos parametors a sus correspondientes parametros reales",
		   "Si es una función, mover el resultado al lugar donde el llamador pueda obtenerlo",
		   "Restaurar el estado de ejecución del llamador",
		   "Retornar el control al llamador"
	       ])
	 ),
    slide(col(green,"Subprogramas Simples: Partes"),
	  item('highlight-current-green',
	       [
		   "Dos partes separadas: El Código y los Datos (variables locales y datos que pueden cambiar)",
		   (   "El formato de la parte de datos de un subprograma en ejecución se llama ",el(em,"registro de activación") ) ,
		   (   "Una ",el(em,"instancia de un registro de activación")," es un ejemplo concreto de un registro de activación." )
	       ])
	 ),
    slide("85%",col(green,"Código y Registros de Activación"),
	  fig(img("simpleactreg.png","auto","500"))).

    

subprogramasconVariableslocalesenPilaDinamica -->
    section(animate,"Subprogramas con Variables locales en Pila Dinámica"),
    section(animate,el(em,col(blue,"Subprogramas con Variables locales en Pila Dinámica"))),
    slide(col(blue,"Subprogramas con Variables locales en Pila Dinámica"),
	  (
	      el(p,"Registros de activación mas complejos"),
	      item('highlight-current-blue',
		  [
		      "El compilador debe generar código para alojar y desalojar implícitamente las variables locales",
		      "Se debe soportar recursividad  (posibilidad de múltiples  simultáneas de un subprograma)"
		  ]),
	      el(p,"El formato y muchas veces el tamaño es conocido en tiempo de compilación")
	  )),
    slide(col(blue,"Típico registro de activación para variables locales alojadas en pila dinamica"),
	  fig(img("regactpila.png","auto","auto"))
	 ),
    slide("90%",col(blue,("Ejemplo de Función en ",el(b,"C"))),
	  (   
	  code(
	      (
"void sub(float total, int part) {\n",
"  int list[5];\n",
"  float sum;\n",
"   ...\n",
"}\n"
	      )
	  ),
	  fig(img("ejemregact.png","auto","380"))
	  )
	 ),
    slide(col(blue,"Ejemplo sin recursividad"),
	  (   
	  code(
	      (
"void fun1(float r) {\n",
"  int s, t;\n",
"   ...  <-------- 1\n",
"  fun2(s);\n",
"  ....\n",
"}\n",
"void fun2(int x) {\n",
"  int y;\n",
"  ... <---------- 2\n",
"  fun3(y)\n",
"  ... \n",
"}\n",
"void fun3(int q) {\n",
"...    <--------- 3\n",
"}\n",
"void main() {\n",
"float p;\n",
"...\n",
"fun1(p);\n",
"...\n",
"}\n"
	      )
	  ),
	  el(p,"main llama a fun1, fun1 llama a fun2 y fun2 llama a fun3")
	  )),
    slide(col(blue,"Ejemplo sin recursividad"),
	  fig(img("ejemsinrec.png","auto","auto"))
	 ),
    slide(col(blue,"Cadena Dinámica y desplazamiento local"),
	  item('highlight-current-blue',
	      [
		  (   "el conjunto  de ligaduras dinámicas y la Pila en un tiempo dada se llama ",el(em,"cadena dinámica")," o ",el(em,"cadena de llamadas") ),
		  (   "Las variables locales se pueden acceder a partir de su desplazamiento desde el comienzo del registro de activación. Se  llama ",el(em,"desplazamiento local")),
		  "El desplazamiento local puede ser determinado en tiempo de compilación."
	      ])
	 ),
    slide(col(blue,"Un Ejemplo con Recursividad"),
	  (
	      el(p,"El registro de activación del ejemplo previo soporta recursividad, e.g."),
	      code(
		  (
"int factorial(int n) {\n",
"  <-------  1\n",
"  if (n <= 1)\n",
"   return 1;\n",
"  else return (n * factorial(n - 1));\n",
"  <-------- 2\n",
"}\n",
"void main() {\n",
" int value;\n",
" value = factorial(3);\n",
"  <--------- 3\n",
"}\n"
		  )
	      )
	  )
	 ),
    slide("90%",col(blue,"Un Ejemplo con Recursividad"),
	  fig(img("firstfactorial.png","auto","550"))
	 ),
    slide("90%",col(blue,"Un Ejemplo con Recursividad"),
	  fig(img("seconfactorial.png","auto","auto"))
	 ),
    slide("90%",col(blue,"Un Ejemplo con Recursividad"),
	  fig(img("thirdfactorial.png","auto","auto"))
	 ).



subprogramasimbricados -->
    section(animate,"Subprogramas imbricados"),
    section(animate,el(em,col(pink,"Subprogramas imbricados"))),	      
    slide("90%",col(pink,"Subprogramas imbricados"),
	  item('fade-in-then-semi-out',
	       [
		   "Algunos lenguajes de alcance estático no basados en C (fortran 95, Ada, JavaScript) usan variables locales alojadas en Pila Dinámicas y permiten que los subprogramas estén imbricados",
		   "Todas las variables que pueden ser accedidas no localmente residen en alguna instancia de un registro de activación en la Pila",
		   (
		       "El proceso de localizar una referencia no local incluye:",
		       enum('fade-in-then-semi-out',
			    [
				"Encontrar la instancia del registro de activación correcta",
				"Determinar el correcto desplazamiento dentro del registro"
			    ])
		   )
	       ])
	 ),
    slide(col(pink,"Localizar una Referencia no local"),
	  (
	      el(p,"Encontrar el desplazamiento es trivial"),
	      el(p,"Para encontrar la correcta instancia del registro de activación"),
	      el(p,"Las reglas semánticas del alcance estático garantizan que toda variable no local que pueda ser referenciada ha sido alojada en alguna instancia de un registro de activación en la Pila cuando la referencia es hecha.")
	  )
	 ),
    slide(col(pink,"Alcance Estático"),
	  item('fade-in-then-semi-out',
	       [
		   (   "Una ",el(em,"cadena estática")," es una cadena de ",el(em,"punteros estáticos")," que conectan ciertas instancias de registros de activación"),
		   (   "El puntero estático en una instancia de un registro de activación para un subprograma A apunta a una de las instancias del registro de activación del padre de A en la estructura estática." ),
		   " La cadena estática de una istancia de un registro de activación la conecta con todos sus ancestros en la estructura estática."
	       ])
	 ),
    slide(col(pink,"Ejemplo"),
	  code(
	      (
"procedure MAIN_2 is\n",
"  X : Integer;\n",
"  procedure Bigsub is\n",
"    A, B, C : Integer;\n",
"    procedure Sub1 is\n",
"      A, D : Integer;\n",
"      begin - - of Sub1\n",
"      A := B + C; <---------- 1\n",
"    end; - - of Sub1\n",
"    procedure Sub2(X : Integer) is\n",
"      B, E : Integer;\n",
"      procedure Sub3 is\n",
"         C, E: Integer;\n",
"         begin  -- of Sub3\n",
"         sub1;\n",
"         E := B + A; <--------- 2\n",
"      end; -- of Sub3\n",
"      begin   -- of Sub2\n",
"      sub3;\n",
"      A := D + E; <-------------3 \n",
"    end  -- of Sub2\n",
"    begin -- of Bigsub\n",
"    sub2(7);\n",
"  end -- of Bigsub\n",
"  begin -- of Main_2\n",
"  Bigsub;\n",
"end -- of Main_2\n"
	      )
	  )),
    slide(col(pink,"Contenido de la Pila en pos 1"),
	  fig(img("ejemploestatico.png","auto","580"))
	 ),
    slide(col(pink,"Display"),
	  item(
	      [
		  "Una alternativa a las cadenas estáticas",
		  "Los punteros estáticos son almacenados en un arreglo único llamado display",
		  "El contenido del display en un tiempo dado es una lista de las direcciones de las instancias de los registros de activación accesibles"
	      ])
	 ).
bloques -->
    section(animate,"Bloques"),
    section(animate,el(em,col(orange,"Bloques"))),
    slide("90%",col(orange,"Bloques"),
	  item('fade-in-then-semi-out',
	       [
		   "Los bloques son alcances locales para variables especificados por el usuario",
		   (
		       "Un ejemplo en C ",
		       code(
			   (
"{ int temp; \n",
"  temp = list[upper];\n",
"  list[upper] = list [lower];\n",
"  list[lower] = temp\n",
"}\n"
			   )
		       )
		   ),
		   (   "El tiempo de vida de ",el(em,"temp")," en el ejemplo comienza cuando el control  entra en el bloque"),
		   (   "La ventaja de usar una variable local como ",el(em,"temp")," es que no interfiere con otra variable del mismo nombre" )
	       ])
	 ),
    slide("85%",col(orange,"Implementando bloques"),
	  (
	      el(p,"Dos métodos"),
	      enum(
		  [
		      (
			  "Tratar a los bloques como subprogramas sin parámetros que son siempre llamados desde la misma ubicación", el(p,"Todo bloque tiene un registro de activación, una instancia es creada cada vez que el bloque es ejecutado")
		      ),
		      "Ya que el máximo de almacenamiento requerido para un bloque puede ser determinado estáticamente, esta cantidad de espacio puede ser alojada después de las variables locales del registro de activación"
		  ])
	  )
	 ),
    slide(col(orange,"Ejemplo"),
	  code(
	      (
"void main() {\n",
"   int x, y, z;\n",
"   while ( ... ) {\n",
"     int a, b, c;\n",
"     ...\n",
"     while ( ... ) {\n",
"       int d, e;\n",
"       ...\n",
"     }\n",
"   }\n",
"   while ( ... ) {\n",
"      int f, g;\n",
"      ...\n",
"   }\n",
"}\n"
	      )
	  )),
    slide(col(orange,"Ejemplo"),
	  fig(img("bloque.png","auto","auto"))
	 ).

implementandoAlcanceDinamico -->
    section(animate,"Implementando Alcance Dinámico"),
    section(animate,el(em,col(yellow,"Implementando Alcance Dinámico"))),
    slide(col(yellow,"Implementando Alcance Dinámico"),
	  item(
	      [
		  (   col(yellow,el(em,"Acceso Profundo:"))," Las referencias no locales son encontradas buscando las instancias de los registros de activación en la cadena dinámica" ),
		  (   col(yellow,el(em,"Acceso Superficial:"))," Se colocan las variables locales en una tabla central",
		      item(
			  [
			      "Una pila por cada nombre de variable",
			      "Tabla central con una entrada por cada nombre de variable"
			  ])
		  )
	      ])
	 ),
    slide(col(yellow,"Ejemplo"),
	  (   
	      code(
		  (
"void sub3() {\n",
"  int x, z;\n",
"  x = u + v;\n",
"}\n",
"\n",
"void sub2() {\n",
"  int w, x;\n",
"  ... \n",
"}\n",
"\n",
"void sub1() {\n",
"  int v, w;\n",
"  ... \n",
"}\n",
"\n",
"void main() {\n",
"  int v, u;\n",
"  ... \n",
"}\n"
		  )
	      ),
	       el(p,(el(em,"main")," llama a ",el(em,"sub1"),", ",el(em,"sub1")," llama a ",el(em,"sub2")," y ",el(em,"sub2")," llama a ",el(em,"sub3")))  
	  )
	 ),
    slide(col(yellow,"Ejemplo cadena dinámica"),
	  fig(img("dinamicchain.png","auto","auto"))
	 ),
    slide(col(yellow,"Ejemplo con tabla central"),
	  fig(img("tablacentral.png","auto","auto"))
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

    
