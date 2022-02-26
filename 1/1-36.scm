(define (fixed-point f guess)
    (define (good-enough? x) (< (abs (- (f x) x)) 0.00001))
    (cond ((good-enough? guess) guess)
        (else (fixed-point f (f guess)))
    )
)


(fixed-point cos 1.0)

(define (logo x) (/ (log 1000) (log x)))


(fixed-point logo 2.0)