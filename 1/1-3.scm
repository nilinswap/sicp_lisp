(define (sum2 a b) (+ a b))
(define (sumLargest2in3 a b c) (
    cond (
            (and (<= a b) (<= a c))
            (sum2 b c)
         )
        (
            (and (<= b a) (<= b c))
            (sum2 a c)
        )
        (
            (and (<= c a) (<= c b))
            (sum2 a b)
        )
))

(sumLargest2in3 2 4 3)