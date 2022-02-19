(load "1-43.scm")

(define (smooth f)
    (lambda (x)
        (define dx .0001)
        (/
            (+
                (f (+ x dx))
                (f x)
                (f (- x dx))
            )
            3
        )
    )
)

(define (compose f g)
    (lambda (x)
        (f (g x))
    )
)

(define (nthfr f n)
    (if (= n 1) (f)
        (compose f (nthfr f (- n 1)))
    )
)

(define (n-smooth f n)
    (if (= n 0)     
        (lambda (x)
            (f x)
        )
        
        (smooth (n-smooth 
                f
                (- n 1)
            )
        )
    )
)



