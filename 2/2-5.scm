(define (pairo a b)
    (* (expt 2 a) (expt 3 b))
)


(define (logbv base value)
    (define (util value) 
        (cond 
            (
                (= (remainder value base) 0) 
                (+ 1 (util (/ value base)))
            )
            (else 0)
        )
    )
    (util value)
)
(define (caro p)
    (define (caro_util p)
        (if (= (remainder p 3) 0) (caro_util (/ p 3)) (logbv 2 p))
    )
    (caro_util p)
)



(define (cdro p)
    (define (cdro_util p)
        (if (= (remainder p 2) 0) (cdro_util (/ p 2)) (logbv 3 p))
    )
    (cdro_util p)
)

(define p (pairo 3 5))

(= 3 (caro p))
(= 5 (cdro p))