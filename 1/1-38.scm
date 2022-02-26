(load "1-37.scm")

(cont-frac (lambda (i) 1.0)
    (lambda (i) 
        (if (= (remainder i 3) 2) (* 2 (/ (+ i 1) 3)) 1)
    )
    100
)

