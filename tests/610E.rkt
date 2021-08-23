#lang quickgen

(define n (random 10 2000))
(define m (random 1 20000))
(define k (random 5 10))

(! n m k)
(for ([i (in-range m)])
  (query
   (! 1 (interval-inc 1 n))
   (! 2 (permutation k))
  ))