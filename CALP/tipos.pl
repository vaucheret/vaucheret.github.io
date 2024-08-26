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
    [].

chequeotipos -->
    slide(col(magenta,"Chequeo de Tipos: Coerción"),
	  (
	      slide("",
		    item(
			[
			    "uno",
			    "dos"
			]
		    )),
	      slide(col(magenta,"Chequeo de Tipos: Coerción"),
		    item(
			[
			    "uno",
			    "dos"
			]
		    ))

	  )).
		   

arreglos -->
    [].

strings -->
    [].

registros -->
    [].

punteros -->
    slide(col(magenta,"Punteros y Tipos Recursivos"),
	  (
	      slide("","")
	  )).


listas -->
    [].

entsal -->
    [].


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
