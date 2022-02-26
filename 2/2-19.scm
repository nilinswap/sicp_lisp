(define (same-parity x . w)
    (
        define (parity-same? a b)
        (or
            (and (= (remainder a 2) 0) (= (remainder b 2) 0) )
            (and (= (remainder a 2) 1) (= (remainder b 2) 1) )
        )
    )
    (define (sp_util x l)
        (
            if (null? l) () 
                (let
                    (   
                        (start (car l))
                        (end (sp_util x (cdr l)))
                    )
                    (
                        if (parity-same? x start) (cons start end) end
                    )
                )
        )
    )
    (sp_util x (cons x w))
)


(same-parity 2 3 4 5 6 7)