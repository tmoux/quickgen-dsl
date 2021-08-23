#lang racket

(require syntax/parse/define)

(require quickgen/lib/prelude)

(define (query . ts)
  (let* ([query-types (list->vector ts)]
         [num-types (vector-length query-types)]
         [query-num (random 0 num-types)])
    (val->proc (vector-ref query-types query-num))))
(provide query)
