#lang racket

(require syntax/parse/define)

; The final output of the file.
(define output (open-output-string))
(provide output)


(define (format-output x)
  (cond
    [(list? x) (string-join (map format-output x) " ")]
    [(vector? x) (string-join (map format-output (vector->list x)) " ")]
    [(number? x) (number->string x)]
    [(string? x) x]
    ))
; add-to-output adds an expression with a newline to the output.
(define (add-to-output x)
  (let ([out-x (format-output x)])
    (displayln out-x output)))
(provide add-to-output)

; The ! operator adds an expression or a list of expression separated by spaces to the output.
(define-syntax-parse-rule (! args ...)
  (add-to-output (list args ...)))
(provide !)

; The !! operator adds the following expressions to the output
(define-syntax-parse-rule (!! e ...)
  (begin (add-to-output e) ...))
(provide !!)

; Creates a set of testcases
(define-syntax-parse-rule (testcases t args ...)
  (begin
    (add-to-output t)
    (for ([i t])
      (begin
        args
        ...
        ))))
(provide testcases)
      

; Returns a procedure that generates a random integer between lo and hi-1, inclusive
; (: rand-range (-> Integer Integer (-> Integer)))
(define (rand-range lo hi)
  (lambda () (random lo hi)))
(provide rand-range)

; Returns a pair of numbers in the interval [lo, hi] where lo <= hi.
(define (interval-inc lo hi)
  (let ([a (random lo (add1 hi))]
        [b (random lo (add1 hi))])
    (if (<= a b) (list a b) (list b a))))
(provide interval-inc)

; Returns a procedure.
(define (val->proc x)
  (lambda () x))
(provide val->proc)



