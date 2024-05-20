#lang racket

(define car-if-pair
	      (lambda (item)
		(cond
		 ((pair? item) (car item))
		 (else item))
		)
	      )

	  (define singleton-list?
	     (lambda (ls)
	       (and (pair? ls) (null? (cdr ls)))
	       )
	     )


(define fib
  (λ (n)
    (cond
      ((= n 0) 1)
      ((= n 1) 1)
      (else (+ (fib (- n 1)) (fib (- n 2))))
      )
    )
  )

(define (fib1 n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))
    )
  )

(define (fibi n)
  (define (fibaux m a1 a2)
    (cond
      ((= n m) (+ a1 a2))
      (else (fibaux (+ m 1) a2 (+ a1 a2)))
      )
    )
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (else (fibaux 2 1 1))
    )
    )

(define (fibb n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (else (let fibaux ((m 2) (a1 1) (a2 1))
       (cond
      ((= n m) (+ a1 a2))
      (else (fibaux (+ m 1) a2 (+ a1 a2)))
      )     
       )
          )
    )
  )
