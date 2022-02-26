(define (fixed-point f guess)
    (define (good-enough? x) (< (abs (- (f x) x)) 0.00001))
    (cond ((good-enough? guess) guess)
        (else (fixed-point f (f guess)))
    )
)



(define (iterative-improvement good-enough? improve-guess)
        (define (ii_iter guess)
            ( if (good-enough? guess) guess 
                (ii_iter (improve-guess guess))
            )
        )
        ii_iter
)

(define (generate-good-enough? f)
    (lambda (x)
        (< (abs ( - (f x) x)) 0.0001)
    )
)

(define (sqrtnew x)
    (define (sqrtfun y) (/ x y))
    ((
        iterative-improvement
        (generate-good-enough? sqrtfun)
        (average-damp sqrtfun)
     ) 1.0
    )
)

(sqrtnew 4)


((generate-good-enough? square) 0.1)