#lang racket

(require syntax/parse/define)

; The final output of the file.
(define output (open-output-string))
(provide output)
(define (add-to-output x)
  (let ([out-x (cond
                 [(list? x) (string-join (map ~v x) " ")]
                 [(vector? x) (string-join (map ~v (vector->list x)) " ")]
                 [else x])])
    (displayln out-x output)))
(provide add-to-output)
      

; Returns a procedure that generates a random integer between lo and hi-1, inclusive
; (: rand-range (-> Integer Integer (-> Integer)))
(define (rand-range lo hi)
  (lambda () (random lo hi)))
(provide rand-range)

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
