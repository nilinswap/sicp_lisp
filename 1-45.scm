(load "1-45.scm")

( define (nth-root x n)
    (fixed-point
        ((repeated average-damp (floor (log n 2))) (lambda (y) (/ x (power y (- n 1)))))
        1.0
    )
)