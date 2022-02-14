(define (sqr x) (* x x))
(define (expr b n)
        (if (= n 0) 
            1
            (if (even? n)
                (square (expr b (/ n 2)))
                (* b (expr b (- 1 n)))
            )
        )
)

(define (expi b n)
    (define (expii q d m)
            (cond 
                ((= m 0) q)
                ((even? m) (expii  q (* d d) (/ m 2)))
                (else (expii (* d q) d (- m 1)))
            )
    )
    (expii 1 b n) 
)

(define (isEqual a b) (= (expr a b) (expi a b)))
(isEqual 2 4)
(display (expi 2 7))



(define (primes-in-range l r) 
    (if (> l r) (display " done ") 
        (
            (timed-prime-test l)
            (primes-in-range (+ l 1) r)
        )

    )
)

(primes-in-range 2 10)