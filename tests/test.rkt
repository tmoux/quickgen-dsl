#lang quickgen

(define n 10)

(define gen-even (generate-with-constraint (rand-range 10 20) #f (lambda (elem _) (= (modulo elem 2) 0))))

(testcases 2
           (add-to-output n)
           (add-to-output (array n (rand-range 10 20)))
           (add-to-output (array n gen-even))
           (add-to-output (permutation 6))
           )


#|
(testcases T)

|#
