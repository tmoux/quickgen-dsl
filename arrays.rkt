#lang racket

; Creates an n-element list of elements val.
; val can either be a value or a procedure of arity 0
(define (array n val)
  (if (equal? n 0)
      null
      (let ([elem (if (procedure? val) (val) val)])
        (cons elem (array (sub1 n) val)))))
(provide array)

(define (generate-with-constraint f index valid-cond)
  (lambda ()
    (let ([elem (f)])
      (if (valid-cond elem index)
          elem
          ((generate-with-constraint f index valid-cond))))))
(provide generate-with-constraint)

; Generates a random permutation of numbers 1 to n.
(define (permutation n)
  (let ([perm (make-vector n)])
    (for ([i (in-range n)])
      (vector-set! perm i (add1 i)))
    (for ([i (in-range (- n 2))])
      (let ([j (random i (sub1 n))])
        (let ([temp (vector-ref perm i)])
          (vector-set! perm i (vector-ref perm j))
          (vector-set! perm j temp))))
    perm))
(provide permutation)