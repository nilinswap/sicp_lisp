(load "1-36.scm")


(define (average-damp f)
    (lambda (x) 
        (/ (+ 
                x 
                (f x)
            )
            2
        )
    )
)

(define (sqrt-using-fixed-point x) 
    (fixed-point 
        (
                average-damp
                (lambda (y) (/ x y))
        )
        1.0
    )
)




(sqrt-using-fixed-point 9)




(define (derivative f)
    (define dx 0.00001)
    (lambda (x) 
        (/  (- 
                (f (+ x dx))
                (f x)
            )
            dx
        )
    )   
)

(define (newton-transform f)
    (lambda (x) 
        (-
            x
            (/
                (f x)
                (
                    (derivative f)
                    x
                )
            )
        )
    )
)

(define (newton-method f guess)
    (
        fixed-point
        (newton-transform f)
        guess
    )
)


(define (sqrt-using-newton-method x)
    (
        newton-method
        (lambda (y) (- (square y) x))
        1.0
    )
)

(define (equal? x) (< (abs (- (sqrt-using-newton-method x) (sqrt-using-fixed-point x))) 0.0001))


(equal? 4)