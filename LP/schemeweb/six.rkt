#lang web-server/insta
; start: request -> response
(define (start request)
  (show-counter 0 request))

; show-counter: number request -> doesn't return
; Displays a number that's hyperlinked: when the link is pressed,
; returns a new page with the incremented number.
(define (show-counter n request)
  (define (response-generator embed/url)
    (response/xexpr
     `(html (head (title "Counting example"))
            (body
             (a ((href ,(embed/url next-number-handler)))
                ,(number->string n))))))

  (define (next-number-handler request)
    (show-counter (+ n 1) request))
  (send/suspend/dispatch response-generator))
