(define (even? a) (= 0 (remainder a 2)))

(define (double a) (* 2 a))

(define (halve a) (/ a 2))

(define (mul a b)
    (define (mulI q a b)
        (cond ((= b 0 ) q)
            (   (even? b)
                (mulI q (double a) (halve b))
            )
            (else (mulI (+ q a) a (- b 1)))
        )
    )
    (mulI 0 a b)
)

(mul 6 5)

(mul 3 10)

(mul 9 9)

(mul 6 8)