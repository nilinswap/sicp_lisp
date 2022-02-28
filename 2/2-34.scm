(define (accumulator op ini seq)
    (
        if (null? seq) ini
        (op
            (car seq)
            (accumulator op ini (cdr seq))
        )
    )
)

(define (polynomial x seq)
    (accumulator 
        (lambda (y z)
            (+
                (* z x)
                y
            )
        )
        0
        seq
    )
)

(polynomial 2 (list 1 3 0 5 0 1))