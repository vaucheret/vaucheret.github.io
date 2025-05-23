#lang racket 

;render-as-itemized-list: (listof xexpr) -> xexpr
; Consumes a list of items, and produces a rendering
; as an unordered list.
(define (render-as-itemized-list fragments)
  `(ul ,@(map render-as-item fragments)))

; render-as-item: xexpr -> xexpr
; Consumes an xexpr, and produces a rendering
; as a list item.
(define (render-as-item a-fragment)
  `(li ,a-fragment))
