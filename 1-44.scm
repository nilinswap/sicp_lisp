(load "1-43.scm")

(define (smooth f)
    (define (average a b c) (/ (+ a b c) 3))
    (let ((dx 0.0001))
        (lambda (x)
            (average 
                (f (+ x dx))
                (f x)
                (f (- x dx))
            )
        )
    )
)


(define (n-fold-smooth f n)
    ((repeated smooth n) f)
)

(- ((n-fold-smooth square 1) 2.003) ((n-fold-smooth square 1) 2.002))

(- (square 2.003) (square 2.002))


