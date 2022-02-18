(define (compose f g)
    (lambda (x)
        (f (g x))
    )
)


(define (nthf f n)
    (define (nthf_iter g f n)
        (if (= n 0) g 
            (nthf_iter (lambda (x) (f (g x))) f (- n 1))
        )
    )
    (nthf_iter (lambda (x) x) f n)
)

(define (nthfr f n)
    (if (= n 0) (lambda (x) x)
        (compose f (nthfr f (- n 1)))
    )
)

( = ((nthf square 2) 5) ((nthfr square 2) 5))

