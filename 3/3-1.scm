(define (make-accumulator sumval)
    (lambda (val)
        (begin (set! sumval (+ sumval val)) sumval) 
    )
)

(define A (make-accumulator 5))
(A 10)