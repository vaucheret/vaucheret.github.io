#lang racket

;; (define fib
;;   (lambda (n)
;;     (cond ((= 0 n) 1)
;;           ((= 1 n) 1)
;;           (else (+ (fib (- n 1))
;;                    (fib (- n 2)))))))

(define (fib n)
  (cond [(= 0 n) 1]
        [(= 1 n) 1]
        [else (+ (fib (- n 1))
                 (fib (- n 2)))]))

(define (fibi n)
  (define (fibaux m a1 a2)
    (cond [(= n m) (+ a1 a2)]
          [else (fibaux (+ m 1) a2 (+ a1 a2))]))
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (fibaux 2 1 1)])
  )

(define (fibb n)
  (cond
    [(= n 0) 1]
    [(= n 1) 1]
    [else (let fibaux ((m 2) (a1 1) (a2 1)) 
            (cond
              ((= n m) (+ a1 a2))
              (else (fibaux (+ m 1) a2 (+ a1 a2)))
              )     
            )]
    )
  )
