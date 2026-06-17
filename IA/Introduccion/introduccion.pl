:- include("slideprolog.pl").

file("introduccion").
title(col("blue","Experience AI")).
author("Test de Turing").
date("17/6/2026").
theme("night").
transition("fade").


slides -->
%    introduccion,
    turing,
    turingtest.

introduccion -->
    section(animate,"Inteligencia Artificial"),
    section(animate,"¿Qué es la IA?"),
    slide(col("red","¿Qué es la Inteligencia Artificial?"),
          (
              p(("La ",col("red",em("Inteligencia Artificial (IA)"))," es la rama de la informática que estudia cómo crear sistemas capaces de realizar tareas que, cuando son realizadas por humanos, requieren inteligencia."))
          )),
    slide(col("blue","Enfoques de la IA"),
          item("highlight-current-blue",
               [
                   (b("Actuar como humanos: "), "El sistema se comporta de manera indistinguible a un humano (Test de Turing)."),
                   (b("Pensar como humanos: "), "El sistema modela los procesos cognitivos humanos (Ciencias Cognitivas)."),
                   (b("Pensar racionalmente: "), "El sistema utiliza la lógica formal para razonar (Lógica)."),
                   (b("Actuar racionalmente: "), "El sistema actúa para maximizar un objetivo (Agentes Racionales).")
               ]
              )),
    slide(col("green","Historia de la IA"),
          item("highlight-current-green",
               [
                   (col("violet","1943: "), "McCulloch y Pitts proponen el primer modelo de neurona artificial."),
                   (col("violet","1950: "), "Alan Turing publica 'Computing Machinery and Intelligence'."),
                   (col("violet","1956: "), "Conferencia de Dartmouth: nace oficialmente la IA como disciplina."),
                   (col("violet","1966-1974: "), "Primer invierno de la IA."),
                   (col("violet","1980s: "), "Auge de los sistemas expertos."),
                   (col("violet","1997: "), "Deep Blue derrota a Kasparov en ajedrez."),
                   (col("violet","2012-hoy: "), "Era del Deep Learning y las redes neuronales profundas.")
               ]
              )).

turing -->
    section(animate,"Alan Turing"),
    section(animate,em(col("red","Alan Turing"))),
    slide("80%",col("blue","Alan Turing (1912-1954)"),
          dividir(
              fig(img("Alan_turing_header.jpg","auto","200")),
              (
                  p(("Alan Turing fue un ",col("red",em("matemático, lógico y científico de la computación"))," británico, considerado uno de los padres de la informática y de la inteligencia artificial.")),
                  item("highlight-current-blue",
                       [
                           "Desarrolló la Máquina de Turing, modelo teórico de computación.",
                           "Trabajó en el descifrado del código Enigma durante la Segunda Guerra Mundial.",
                           "Propuso el Test de Turing en 1950."

                       ]
                      )
              )
          )),
    slide("90%",col("purple","Contribuciones de Alan Turing"),
          (
              p(("Las contribuciones de Turing abarcan múltiples áreas del conocimiento:")),
              item("highlight-current-red",
                   [
                       (col("red",b("Computabilidad: ")), "Definió formalmente el concepto de algoritmo y computación mediante la Máquina de Turing."),
                       (col("red",b("Criptografía: ")), "Su trabajo en Bletchley Park fue crucial para descifrar los mensajes nazis durante la WWII."),
                       (col("red",b("Inteligencia Artificial: ")), "Planteó la pregunta fundamental: ¿Pueden las máquinas pensar?"),
                       (col("red",b("Biología Matemática: ")), "Propuso modelos matemáticos para explicar patrones en la naturaleza.")
                   ]
                  )
          )),
    slide(col("teal","La Máquina de Turing"),
          (
              p(("Una ",col("teal",em("Máquina de Turing"))," es un modelo matemático de computación que define una máquina abstracta que manipula símbolos en una cinta de acuerdo a una tabla de reglas.")),
              item("highlight-current-teal",
                   [
                       "Una cinta infinita dividida en celdas.",
                       "Un cabezal de lectura/escritura.",
                       "Un conjunto finito de estados.",
                       "Una tabla de transiciones que define el comportamiento."
                   ]
                  ),
              p(("A pesar de su simplicidad, una Máquina de Turing puede simular cualquier algoritmo computable. Este resultado se conoce como la ",col("red",em("Tesis de Church-Turing")),"."))
          )).

turingtest -->
    section(animate,"El Test de Turing"),
    section(animate,col("red",el(tt,"El Test de Turing"))),
    slide(col("red","El Test de Turing"),
          (
              p(("En su artículo de 1950 ",col("green",em("'Computing Machinery and Intelligence'"))," Turing propuso el ",col("red",b("Juego de Imitación"))," como criterio para determinar si una máquina puede ser considerada inteligente.")),
              p(("La pregunta original de Turing fue: ",col("blue",em("'¿Pueden las máquinas pensar?'"))))
          )),
    slide(col("green","El Juego de Imitación"),
	  (
	      fig(img("The-Turing-test-C-123RF.png","auto","300"))
	  )),
    slide("90%",col("blue","¿Cómo funciona el Test de Turing?"),
          (
              p("El test involucra tres participantes:"),
              item("highlight-current-blue",
                   [
                       (col("red",b("Interrogador (C): ")), "Un humano que realiza preguntas a través de un terminal."),
                       (col("red",b("Humano (B): ")), "Un humano que responde las preguntas."),
                       (col("red",b("Máquina (A): ")), "Un programa de computadora que intenta imitar las respuestas humanas.")
                   ]
                  ),
              p(("Si el interrogador no puede distinguir de manera confiable entre el humano y la máquina, se dice que la máquina ha ",col("red",em("pasado el Test de Turing")),"."))
          )),
    slide(col("green","Capacidades necesarias para pasar el Test"),
          item("highlight-current-green",
               [
                   (col("violet",b("Procesamiento del Lenguaje Natural: ")), "Para comunicarse en lenguaje humano."),
                   (col("violet",b("Representación del Conocimiento: ")), "Para almacenar lo que sabe o escucha."),
                   (col("violet",b("Razonamiento Automático: ")), "Para usar el conocimiento almacenado y responder preguntas."),
                   (col("violet",b("Aprendizaje Automático: ")), "Para adaptarse a nuevas circunstancias y detectar patrones.")
               ]
              )),
    slide(col("blue","Test de Turing Total"),
          (
              p(("El ",col("blue",b("Test de Turing Total"))," agrega una señal de video para que el interrogador pueda evaluar también las capacidades perceptivas y de manipulación física del participante.")),
              p("Esto requiere adicionalmente:"),
              item("highlight-current-blue",
                   [
                       (col("red",b("Visión por Computadora: ")), "Para percibir objetos."),
                       (col("red",b("Robótica: ")), "Para manipular objetos y moverse.")
                   ]
                  )
          )),
    slide(col("green","Sistemas que han intentado pasar el Test"),
          item("highlight-current-green",
               [
                   (col("violet","ELIZA (1966): "), "Programa de Joseph Weizenbaum que simulaba un psicoterapeuta."),
                   (col("violet","PARRY (1972): "), "Simulaba a un paciente con paranoia esquizofrénica."),
                   (col("violet","Eugene Goostman (2014): "), "Chatbot que convenció al 33% de los jueces de ser humano."),
                   (col("violet","ChatGPT y LLMs (2020s): "), "Modelos de lenguaje que generan texto indistinguible del humano en muchos contextos.")
               ]
              )),
    slide(col("red","Legado de Alan Turing"),
          (
              p(("El legado de Turing es inmenso. En su honor, la ",col("red",b("Association for Computing Machinery (ACM)"))," otorga anualmente el ",col("red",em("Premio Turing")),", considerado el Nobel de la Computación.")),
              p(("Sus ideas fundamentales sobre computabilidad, inteligencia artificial y criptografía siguen siendo la base de la informática moderna.")),
              p(col("blue",em("\"Solo podemos ver poco del futuro, pero lo suficiente para darnos cuenta de que hay mucho que hacer.\" - Alan Turing")))
          )).
