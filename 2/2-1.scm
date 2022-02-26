

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

(define (make_rat n d)
    (define signum (
        if 
        (or (and (<= n 0) (<= d 0))
            (and (> n 0) (> d 0))
        )
        1
        -1
    ))
    (define g (gcd (abs n) (abs d)))
    (let (
            (nn (abs n))
            (dd (abs d))
        )
        (cons (/ (* signum nn) g) (/ dd g))
    )
    
)

(make_rat 2 4)
(make_rat 3 -4)



(define (sideLengthsD rect)
    (cons
        (distance (car (car rect)) (cdr (cdr rect)))
        (distance (cdr (car rect)) (cdr (car rect)))
    )
)