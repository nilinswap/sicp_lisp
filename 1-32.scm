(define 
    (accumulatori op nullValue f a next b)
    (define (accumulatoriUtil q a)
        (if (> a b) q
            (accumulatoriUtil (op (f a) q) (next a))
        )
    )
    (accumulatoriUtil nullValue a)
)

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define 
    (accumulatorr op nullValue f a next b) 
    (
        cond ((> a b) nullValue)
        (else (op (f a) (accumulatorr op nullValue f (next a) next b)))
    )
)


( = (accumulatori + 0 cube 1 inc 10) (accumulatorr + 0 cube 1 inc 10))
( = (accumulatori * 1 cube 1 inc 2) (accumulatorr * 1 cube 1 inc 2))
