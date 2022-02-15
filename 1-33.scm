(load "1-28.scm")
(load "1-32.scm")

(define 
    (filter-accumulator filter op nullValue f a next b) 
    (
        (cond ((> a b) nullValue)
            (else (display (filter a)) (op 
                (if (filter a) (f a) nullValue)
                (filter-accumulator filter op nullValue f (next a) next b)
            ))
        )
    )
)

(filter-accumulator isPrime? + 0 cube 3 inc 4)