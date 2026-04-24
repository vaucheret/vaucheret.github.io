#lang racket/gui

(define (fibi n)
  (define (fibaux m a1 a2)
    (cond [(= n m) (+ a1 a2)]
          [else (fibaux (+ m 1) a2 (+ a1 a2))]))
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (fibaux 2 1 1)])
  )

; --- Interfaz Gráfica (GUI) ---

; 1. Crear la ventana principal (Frame)
(define frame (new frame%
                   [label "Fibonacci"]
                   [width 300]
                   [height 150]))

; 2. Crear un panel vertical para organizar los elementos
(define panel (new vertical-panel% 
                   [parent frame]
                   [alignment '(left center)]))

; 3. Campo de texto para ingresar el número
(define input-field (new text-field%
                         [label "Numero: "]
                         [parent panel]
                         [init-value "0"]))

; 4. Mensaje para mostrar el resultado
(define result-msg (new message%
                        [parent panel]
                        [label "Resultado:"]))


(define control (new horizontal-panel%
                     [parent panel]
                     [alignment '(center center)]))


; 5. Botón para realizar el cálculo
(define button (new button%
                    [parent control]
                    [label "Calcular"]
                    [callback (lambda (button event)
                                (calculate-and-display))]))

(define buttone (new button%
                    [parent control]
                    [label "Salir"]
                    [callback  (lambda (button event)
                                (exit)) ]))


; --- Función de callback para unir GUI y Lógica ---
(define (calculate-and-display)
  (let* ([input-str (send input-field get-value)]
         [n (string->number input-str)])
    (if (and n (>= n 0))
        (let ([result (fibi n)])
          (send result-msg set-label 
                (string-append "Resultado: "
                               (number->string result))))
        (send result-msg set-label "Por favor ingrese un número entero >= 0"))))

; 6. Mostrar la ventana
(send frame show #t)

