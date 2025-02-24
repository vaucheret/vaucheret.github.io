file("teoriad").
title("Lenguajes Declarativos").
author("Claudio Vaucheret").
date("Semanticas").
theme("night").
transition("slide").

show :-
        file(File),
        append(["xdg-open ",File,".html"],Command),
	shell(Command).
	      
main :-
	consult(slideprolog),
	file(File),
	append(File,".html",Filehtml),
	phrase_to_file(presentation,Filehtml).

slides -->
    section("SEMANTICAS"),
    slide("70%",col(green,"Arbol SLD"),
          (
              p(("Un árbol (de búsqueda) ",col(red,"\\(SLD\\) \\(\\tau_\\varphi\\)"),"  para ",col(red,"\\(\\Pi \\cup \\{{\\cal G}\\}\\)")," (usando la regla de computación ",col(red,"\\(\\varphi\\)"),") es un conjunto de nodos que cumplen:")),
              enum(
                  [
                      (   "El nodo raíz de ",col(red,"\\(\\tau_\\varphi\\)")," es la meta inicial ",col(red,"\\({\\cal G}\\)"),";"),
                      (   "Si ",col(red,"\\({\\cal G}_i \\equiv\\leftarrow {\\cal A}_1 \\wedge \\ldots \\wedge{\\cal A}_n\\)")," es un nodo de ",col(red,"\\(\\tau_\\varphi\\)")," y suponiendo que ",col(red,"\\(\\varphi({\\cal G}_i) = {\\cal A}_k\\)"),", entonces para cada cláusula ",col(red,"\\({\\cal C} \\equiv {\\cal A} \\leftarrow {\\cal Q}\\)")," de ",col(red,"\\(\\Pi\\)")," (con sus variables renombradas si hace falta) t.q. ",col(red,"\\(\\theta = mgu({\\cal A},{\\cal A}_k) \\not\\equiv fail\\)"),", el resolvente ",col(red,"\\({\\cal G}_{ij} \\equiv \\leftarrow \\theta({\\cal A}_1 \\wedge \\ldots \\wedge {\\cal A}_{k-1} \\wedge {\\cal Q} \\wedge {\\cal A}_{k+1} \\wedge \\ldots \\wedge {\\cal A}_n\\)")," es un nodo de ",col(red,"\\(\\tau_\\varphi\\)"))
                  ])
          )
         ),
    slide(col(green,"Arbol SLD"),
          item('highlight-current-green',
               [
                   (   "Cada nodo del árbol es una cláusula meta. ",col(red,"\\({\\cal G}_{i}\\)")," es el ",em("nodo padre")," de ",col(red,"\\({\\cal G}_{ij}\\)")," y ",col(red,"\\({\\cal G}_{ij}\\)")," es ",em("nodo hijo")," de ",col(red,"\\({\\cal G}_{i}\\)"),"."),
                   "Los nodos hojas son o bien la cláusula vacía o nodos fallidos.",
                   (   "Cada rama de un árbol ",col(red,"\\(SLD\\)")," es una derivación ",col(red,"\\(SLD\\)")," para ",col(red,"\\(\\Pi \\cup \\{{\\cal G}\\}\\)"),"."),
                   (   "Ramas ",b(col(yellow,"infinitas"))," de ",b(col(yellow,"éxito"))," y de ",b(col(yellow,"fallo")),"."),
                   (   "Arboles ",b(col(yellow,"infinitos"))," de ",b(col(yellow,"éxito"))," y de ",b(col(yellow,"fallo")),"."),
                   (   "Cada regla de computación ",col(red,"\\(\\varphi\\)")," da lugar a un árbol ",col(red,"\\(SLD\\)")," para ",col(red,"\\(\\Pi \\cup \\{{\\cal G}\\}\\)")," distinto.")
               ]
              )),
    slide(col(green,"Ejemplo"),
          (
              p(col(yellow,"Sea el programa definido")),
              p("\\[\\Pi = \\{ {\\cal C}_1 : p(X,Z) \\leftarrow q(X,Y) \\wedge p(Y,Z) \\\\ {\\cal C}_2 : p(X,X) \\leftarrow  \\\\ {\\cal C}_3 : q(a,b) \\leftarrow \\} \\]"),
              p("y la meta definida \\({\\cal G} \\equiv\\leftarrow p(X,b)\\).")
          )),
    slide("50%",col(green,"Ejemplo"),
          (
              p("Un árbol de búsqueda \\(SLD\\) para \\(\\Pi \\cup \\{{\\cal G}\\}\\) usando una regla de computación que selecciona el átomo más a la izquierda dentro de la meta considerada."),
              fig(img("sld1.png","auto","500"))
          )),
    slide(col(green,"Ejemplo"),
          (
              p(("Un ",b("procedimiento de prueba por refutación")," \\(SLD\\) queda completamente especificado fijando:")),
              enum('highlight-current-green',
                   [
                       "una regla de computación;",
                       "una regla de ordenación; y",
                       "una regla de búsqueda."
                   ])
          )),
    slide("90%",col(red,"Semántica de Modelos Mínimos"),
          (   
              p(("Sea \\(I\\) un conjunto índices y conjunto no vacío de modelos de Herbrand de un programa \\(\\Pi\\), \\(\\{{\\cal M}_i \\mid (i \\in I) \\wedge ({\\cal M}_i\\) es modelo de \\(\\Pi)\\}\\). Entonces, el conjunto \\(\\bigcap_{i \\in I} {\\cal M}_i\\) es un modelo de Herbrand de \\(\\Pi\\).")),
              p("donde"),
              p(("\\({\\cal M}_i(\\Pi) = \\{{\\cal A} \\mid  {\\cal A} \\in {\\cal B}_{\\cal L}(\\Pi) \\wedge \\Pi \\models {\\cal A}\\}\\)"))
          )),
    slide("70%",col(red,"EJEMPLO"),
          (
              p("\\(\\Pi = \\{{\\cal C}_1 : q(X) \\leftarrow p(X), {\\cal C}_2 : p(a) \\leftarrow , {\\cal C}_3 : q(b) \\leftarrow \\}\\)."),
              enum([
                          "\\({\\cal U}_{\\cal L}(\\Pi) = \\{a,b\\} y {\\cal B}_{\\cal L}(\\Pi) = \\{p(a),p(b),q(a),q(b)\\}\\).",
                          "\\({\\cal I}_1 = \\varnothing\\), \\({\\cal I}_2 = \\{p(b)\\}\\), \\({\\cal I}_3 = \\{p(a)\\}\\), \\({\\cal I}_4 = \\{q(a)\\}\\), \\({\\cal I}_5 = \\{q(b)\\}\\), \\({\\cal I}_6 = \\{p(a),p(b)\\}\\), \\({\\cal I}_7 = \\{p(a),q(a)\\}\\), \\({\\cal I}_8 = \\{p(a),q(b)\\}\\), \\({\\cal I}_9 = \\{p(b),q(a)\\}\\), \\({\\cal I}_{10} = \\{p(b),q(b)\\}\\), \\({\\cal I}_{11} = \\{q(a),q(b)\\}\\), \\({\\cal I}_{12} = \\{p(a),p(b),q(a)\\}\\), \\({\\cal I}_{13} = \\{p(a),p(b),q(b)\\}\\), \\({\\cal I}_{14} = \\{p(a),q(a),q(b)\\}\\), \\({\\cal I}_{15} = \\{p(b),q(a),q(b)\\}\\), \\({\\cal I}_{16} = \\{p(a),p(b),q(a),q(b)\\}\\).",
                          "Las únicas H-interpretación modelos de \\(\\Pi\\) son: \\({\\cal I}_{14}\\) e \\({\\cal I}_{16}\\)."
                      ]),
              p("La interpretación modelo mínimo de Herbrand es:"),
              "\\[{\\cal M}(\\Pi) = {\\cal I}_{14} \\cap {\\cal I}_{16} = \\{p(a),q(a),q(b)\\}\\]"
          )),
    slide("75%",col(blue,"Semántica de Punto Fijo"),
          (
              p("Sea \\(\\Pi\\) un programa definido. El operador de consecuencias lógicas inmediatas \\(T_{\\Pi}\\) es una aplicación \\(T_{\\Pi} : \\wp({\\cal B}_{\\cal L}(\\Pi)) \\longrightarrow \\wp({\\cal B}_{\\cal L}(\\Pi))\\) definida como:"),
              p("\\[T_{\\Pi}({\\cal I}) = \\{ {\\cal A} \\mid {\\cal A} \\in {\\cal B}_{\\cal L}(\\Pi) \\wedge ({\\cal A} \\leftarrow {\\cal A}_1 \\wedge \\ldots \\wedge {\\cal A}_n ) \\in {\\cal B}asicas(\\Pi) \\\\  \\wedge \\{{\\cal A}_1, \\ldots, {\\cal A}_n \\} \\subseteq {\\cal I} \\}\\]"),
              p("donde \\({\\cal I}\\) es una interpretación de Herbrand para \\(\\Pi\\) y \\({\\cal B}asicas(\\Pi)\\) es el conjunto de instancias básicas de las cláusulas de \\(\\Pi\\)."),
              p("\\[{\\cal M}_{\\Pi} = mfp(T_{\\Pi}) = T_{\\Pi} \\uparrow \\omega\\]")
          )),
    slide("75%",col(blue,"EJEMPLO"),
          (
              p(" \\(\\Pi = \\{{\\cal C}_1 : q(X) \\leftarrow p(X), {\\cal C}_2 : p(a) \\leftarrow , {\\cal C}_3 : q(b) \\leftarrow \\}\\)."),
              item([
                          "\\(T_{\\Pi} \\uparrow 0 = \\varnothing\\)",
                          "\\(T_{\\Pi} \\uparrow 1 = T_{\\Pi}(\\varnothing) = \\{p(a),q(b)\\}\\)",
                          "\\(T_{\\Pi} \\uparrow 2 = T_{\\Pi}(T_{\\Pi} \\uparrow 1)  = \\{p(a),q(b)\\} \\cap \\{q(a)\\} = \\{p(a),q(b),q(a)\\}\\)",
                          "\\(T_{\\Pi} \\uparrow 3 = T_{\\Pi}(T_{\\Pi} \\uparrow 2) = T_{\\Pi} \\uparrow 2\\)"
                      ]),
              p("Se alcanza el punto fijo en la tercera iteración y por consiguiente,"),
              p("\\[{\\cal M}_{\\Pi} = \\{p(a),q(b),q(a)\\}\\].")
          )).









          
