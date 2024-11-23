file("ingenerg").
title("Ingenieria en Energia").
author("Claudio Vaucheret").
date("23/11/2024").
theme("sky").
transition("slide").

slides -->
    introduccion,
    tiposdeenergia,
    competencias,
    primeranio.

introduccion -->
    slide(animate,"Facultad de Ingeniería",
	  item(
	      [
		 el(p,"Ingenieria en Informática"),
		 el(p,"Ingenieria Industrial"),
		 el(p,"Ingenieria en Energía")
		  
	      ]
	  )),
    slide(animate,"Facultad de Ingeniería",
	  item(
	      [
		  el(p,[class='r-fit-text'],col(blue,"Ingenieria en Energía")),
		  el(p,"Ingenieria en Informática"),
		 el(p,"Ingenieria Industrial")

	      ]
	  )),
    slide(col(blue,"Ingeniería en Energía"),
	  (
	      el(p,"Modalida: Presencial"),
	      el(p,"Duración: 5 años"),
	      el(p,"Resolución Ministerial Nº 429/2024")
	  )),
    slide(col(blue,"Ingeniería en Energía"),
	  item('highlight-current-blue',
	       [
	  	   el(p,"La carrera de Ingeniería en Energía se centra en la formación de profesionales capacitados para diseñar, desarrollar y gestionar sistemas energéticos sostenibles y eficientes."),
		   el(p,"Esta disciplina combina conocimientos de ingeniería eléctrica, mecánica, térmica, química, y ambiental, con un fuerte enfoque en el aprovechamiento y gestión de diferentes fuentes de energía, tanto convencionales como renovables.")
	       ]
	      )
	 ).





tiposdeenergia -->
    slide("La Energía: Motor de la Producción",
	  el(p,"La energía es esencial en todo proceso de producción porque impulsa maquinaria, permite la transformación de materiales, asegura el transporte y almacenamiento, y soporta la tecnología y automatización. Es el 'combustible' que hace posible la conversión de materias primas en bienes y servicios de manera eficiente.")
	 ),
    section("Fuentes de Energía"),
    slide("Fuentes de Energía",
	  split(
	      fig(img("caracteristicas_de_la_energia_solar_3956_600.jpg","auto","500"))
	      ,
	      el(p,[class='r-fit-text'],"Energía Solar")
	  )),
        slide("Fuentes de Energía",
	  split(
	      el(p,[class='r-fit-text'],"Energía Geotérmica")
	      ,
	      fig(img("Energia-geotermica.jpg","auto","500"))	
	  )),
	    slide("Fuentes de Energía",
	  split(
	      fig(img("energianuclear.jpeg","auto","500"))
	      ,
	      el(p,[class='r-fit-text'],"Energía Nuclear")
	  )),
        slide("Fuentes de Energía",
	  split(
	      el(p,[class='r-fit-text'],"Energía Eólica")
	      ,
	      fig(img("eolica.jpg","auto","500"))	
	  )),
	slide("Fuentes de Energía",
	  split(
	      fig(img("energia-biomasa-1.jpeg","auto","500"))
	      ,
	      el(p,[class='r-fit-text'],"Biomasa")
	  )),
	        slide("Fuentes de Energía",
	  split(
	      el(p,[class='r-fit-text'],"Energía Fósil")
	      ,
	      fig(img("energiafosil.jpeg","auto","500"))	
	  )),
		slide("Fuentes de Energía",
	  split(
	      fig(img("hidroelectrica.jpeg","auto","500"))
	      ,
	      el(p,[class='r-fit-text'],"Energía Hidroeléctrica")
	  )),
		slide("Fuentes de Energía",
	  split(
	      el(p,[class='r-fit-text'],"Energía Mareomotriz")
	      ,
	      fig(img("marea.jpeg","auto","500"))	
	  )),
		slide("En el mundo",
		      (
			  el(p,el(b,"2050 – próximos 25 años")),
			  el(p,"Según las proyecciones de organismos internacionales:"),
			  item(grow,
			       [
				   "Se duplicaría el parque automotor",
				   "Aumentaría la población mundial en unos 2000 millones de personas",
				   "Se duplicaría la demanda de energía",
				   "El cambio climático exige revisar cómo generar y usar esa energía"
			       ])
		      )),
		slide("Matriz Energética Argentina",
	  split(
	      fig(img("energiaargentina.jpg","auto","500")),
	       el(table,
		     (	 
			el(tr,( el(th,"Fuente"), el(th,"Porcentaje"))),
			el(tr,(el(td,"Gas Natural"),el(td,[style='text-align:right;'],"53,20%"))),
			el(tr,(el(td,"Petroleo"),el(td,[style='text-align:right;'],"31,30%"))),
			el(tr,(el(td,"Biomasa"),el(td,[style='text-align:right;'],"5,80%"))),
			el(tr,(el(td,"Hidroeléctrica"),el(td,[style='text-align:right;'],"3,20%"))),
			el(tr,(el(td,"Nuclear"),el(td,[style='text-align:right;'],"2,60%"))),
			el(tr,(el(td,"Renovables"),el(td,[style='text-align:right;'],"2,30%"))),
			el(tr,(el(td,"Carbón"),el(td,[style='text-align:right;'],"1,60%")))
		     )  
		     )

	      )
	  ),
		slide("80%",col(blue,"Desafíos para Argentina"),
		      item('highlight-current-blue',
			   [
			       (   "Acelerar la extracción de hidrocarburo en un contexto de transición",
				   item(
				       [
					   "Vaca Muerta, principal yacimiento de hidrocarburos",
					   "Cuenca Golfo San Jorge, 30 % de la producción de petróleo",
					   "Cuenca Austral, 20 % del gas"
				       ])
			       ),
			       "Acelerar el camino hacia las Energías Renovables",
			       "Transporte. Cómo transportar todo lo que se genere", 
			       (   "Recursos Humanos formados",
				   item(
				       [
					   "perfiles para la transición que sepan de todas las energías",
					   "en los próximos dos años el 25 % de los trabajadores se jubila"
				       ])
			       )

			   ])).

		      


		



competencias -->
    section(animate,"Competencias"),
    section(animate,el(b,el(em,col(blue,"Competencias")))),
    slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"1. Generación de Energía"))),
	      item(appear,
		   [
		       "Plantas de Energía Convencional: Ingeniero en plantas de energía térmica, nuclear o hidroeléctrica",
		       "Energías Renovables: Especialista en proyectos de energía solar, eólica, biomasa, etc."
		   ])
	  )),
    slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"2. Distribución y Transmisión de Energía"))),
	      item(appear,
		   [
		       "Diseño y gestión de redes de distribución y transmisión eléctrica.",
		       "Optimización de sistemas de distribución de gas y otros combustibles."
		   ])
	  )),
    slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"3. Eficiencia Energética y Gestión de Energía"))),
	      item(appear,
		   [
		       "Consultor en eficiencia energética para industrias, edificios y transporte.",
		       "Auditorías energéticas y desarrollo de estrategias de ahorro energético."
		   ])
	  )),
        slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"4. Investigación y Desarrollo (I+D)"))),
	      item(appear,
		   [
		       "Innovación en nuevas tecnologías energéticas.",
		       "Investigación en materiales y procesos energéticos más eficientes y sostenibles."
		   ])
	  )),
    slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"5. Consultoría y Asesoría"))),
	      item(appear,
		   [
		       "Asesor en políticas energéticas y sostenibilidad para gobiernos y organizaciones.",
		       "Consultoría en la implementación de proyectos energéticos."
		   ])
	  )),
    slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"6. Industria y Manufactura"))),
	      item(appear,
		   [
		       "Optimización de procesos industriales desde el punto de vista energético.",
		       "Diseño y gestión de sistemas de cogeneración."
		   ])
	  )),
        slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"7. Educación y Divulgación"))),
	      item(appear,
		   [
		       "Profesor en instituciones académicas.",
		       "Divulgador científico en temas de energía y sostenibilidad."
		   ])
	  )),
    slide(col(blue,"Competencias"),
	  (
	      el(p,el(b,col(green,"8. Empresas de Servicios Energéticos"))),
	      item(appear,
		   [
		       "Desarrollo y gestión de proyectos de servicios energéticos integrados para clientes industriales y comerciales."
		   ])
	  )).







primeranio -->
    section(col(blue,"Materias de Primer Año")),
    slide(col(blue,"Materias de Primer Año"),
	  split(
	      (
		  el(p,col(green,"Primer Cuatrimestre")),
		  item(
		      [
			  "Cálculo I",
			  "Introducción a la Ingeniería",
			  "Sistemas de Representación",
			  "Química I"
		      ]
		  )
	      ),
	      (
		  el(p,col(green,"Segundo Cuatrimestre")),
		  item(
		      [
			  "Física I",
			  "Algebra Lineal y Geometría Analítica",
			  "Sistemas Tecnológicos",
			  "Fundamentos de las Ciencias de la Tierra"
		      ]
		  )
	      )
	  )
	 ).

	      





show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
        theme(Theme),
	transition(Transition),
	consult(slideprologupa),
	file(File),
	append(File,".html",Filehtml),
	phrase_to_file(presentation(Theme,Transition),Filehtml).
