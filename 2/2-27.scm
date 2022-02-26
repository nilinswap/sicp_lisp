(define (deep-reversel l)
    (define (ifListreverse l)
        (
            if (list? l) (deep-reversel_util '() l) l
        )
    )
    (define (deep-reversel_util b l)
        (if (null? l)
            b
            (deep-reversel_util (cons (ifListreverse (car l)) b) (cdr l))
        )
    )
    (deep-reversel_util '() l)
)

(define x (list (list 1 2) (list 3 4)))

(define y (list (cons 1 2) (list 3 4)))

(deep-reversel x)

(deep-reversel y)