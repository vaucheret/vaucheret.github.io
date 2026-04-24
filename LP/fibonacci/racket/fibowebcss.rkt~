#lang web-server/insta



(define (start request)
  (define numero 
    (cond [(exists-binding? 'numero (request-bindings request))
           (extract-binding/single 'numero (request-bindings request))]
          [else "0"]))
  (render-fib numero request)
  )

(define (render-fib numero request)
  (response/xexpr
   `(html (head (title "Numero de Fibonacci"))
          (body
           (h1 "Numero de Fibonacci" )
           (form ((method "post"))
                 (label "El numero de Fibonacci de ")
                 (input ((name "numero") (type "text") (required "") (autofocus "") (placeholder "Entre el Numero") (size "12") ))
                 (div (span "es el numero "  (b ,(number->string (fibi (string->number numero)) ))))
                 (input ((type "submit")(value  "Calcular")  )))))))




(define (fibi n)
  (define (fibaux m a1 a2)
    (cond [(= n m) (+ a1 a2)]
          [else (fibaux (+ m 1) a2 (+ a1 a2))]))
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (fibaux 2 1 1)])
  )
