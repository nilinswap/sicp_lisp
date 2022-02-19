(define (compose f g)
    (lambda (x)
        (f (g x))
    )
)

(define (repeated f n)
    (if (= n 0) (lambda (x) x) 
        (compose f (repeated f (- n 1)))
    )
)

(define (repeatedi f n)
    (define (repeatedi_iter g n)
        (if (= n 0) g
            (repeatedi_iter (compose f g) (- n 1))
        )
    )
    (repeatedi_iter (lambda(x) x) n)
)

( = ((repeated square 2) 5) ((repeatedi square 2) 5))

