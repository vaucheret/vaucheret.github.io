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
   `(html (head
           (link ((rel "stylesheet") 
                  (href "https://www.w3schools.com/w3css/5/w3.css")
                  (type "text/css")))
           (meta ((name "viewport")
                  (content "width=device-width, initial-scale=1.0")))
           (title "Numero de Fibonacci"))
          (body
           (header ((class "w3-container w3-teal")) (h1 ((class "w3-jumbo")) "Numero de Fibonacci" ))
           (form ((class "w3-container w3-light-green w3-margin w3-padding-16") (method "post"))
                 (label ((class "w3-text-white")) "El numero de Fibonacci de ")
                 (input ((class "w3-input") (name "numero") (type "text") (required "") (autofocus "") (placeholder "Entre el Numero") (size "12") ))
                 (div (span "es el numero "  (b ,(number->string (fibi (string->number numero)) ))))
                 (input ((class "w3-btn w3-white") (type "submit")(value  "Calcular")  )))
                 (footer ((class "w3-container w3-teal w3-xlarge w3-center")) "Powered by racket and w3.css" )
                 ))))




(define (fibi n)
  (define (fibaux m a1 a2)
    (cond [(= n m) (+ a1 a2)]
          [else (fibaux (+ m 1) a2 (+ a1 a2))]))
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (fibaux 2 1 1)])
  )
