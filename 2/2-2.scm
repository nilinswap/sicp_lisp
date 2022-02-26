(define make-point cons)

(define x-point car)

(define y-point cdr)

(define make-segment cons)

(define start-point car)

(define end-point cdr)

(define (average x y)
    (/ (+ x y) 2)
)

(define (midpoint-segment segment)
    (
        make-point 
        (average 
            (x-point (start-point segment))
            (x-point (end-point segment))
        )

        (average 
            (y-point (start-point segment))
            (y-point (end-point segment))
        )
    )

)


(define p1 (make-point 1 2))

(define p2 (make-point 3 4))

(define seg1 (make-segment p1 p2))
(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))

(print-point (midpoint-segment seg1))
