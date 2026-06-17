:- include("slideprolog.pl").

file("test_turing").
title("El Test de Turing").
author("Alan Turing").
date("17/8/2024").
theme("simple").
transition("slide").

slides -->
    introduccion,
    concepto,
    ejemplos,
    conclusion.

introduccion -->
    section("Introducción"),
    slide("El Test de Turing",
	  (
	      p("El Test de Turing fue propuesto por Alan Turing en 1950."),
	      p("Es un experimento mental para determinar si una máquina puede exhibir un comportamiento inteligente indistinguible del de un humano.")
	  )).

concepto -->
    section("Concepto"),
    slide("Definición",
	  (
	      p("El Test de Turing evalúa la capacidad de una máquina para imitar la inteligencia humana."),
	      p("Un interrogador interactúa con una máquina y un humano sin saber cuál es cuál."),
	      p("Si el interrogador no puede distinguir entre ambos, la máquina pasa el test.")
	  )),
    slide("Componentes del Test",
	  item("appear",
	       [
		   "Un interrogador humano.",
		   "Un humano que responde.",
		   "Una máquina que responde."
	       ])).

ejemplos -->
    section("Ejemplos"),
    slide("Ejemplo 1: Chatbots",
	  (
	      p("Los chatbots modernos, como ChatGPT, intentan pasar el Test de Turing."),
	      p("Interactúan con humanos simulando conversaciones naturales.")
	  )),
    slide("Ejemplo 2: Juegos",
	  (
	      p("Máquinas como Deep Blue y AlphaGo muestran inteligencia en juegos."),
	      p("Aunque no pasan el Test de Turing completo, demuestran capacidades específicas.")
	  )).

conclusion -->
    section("Conclusión"),
    slide("Reflexión",
	  (
	      p("El Test de Turing sigue siendo un estándar para medir la inteligencia artificial."),
	      p("Aunque las máquinas han avanzado, aún queda mucho por explorar en el campo de la IA.")
	  )),
    slide("Última Diapositiva",
	  (
	      "Gracias por su atención."
	  )).
