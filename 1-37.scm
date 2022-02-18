(define (cont-frac n d k)
    (define (newCarry l p)
        (/ (n l) (+ (d l) p))
    )
    (define (cfu nthterm carry)
        (if (= nthterm 0) carry 
            (
                cfu (- nthterm 1)
                (newCarry nthterm carry)
            )
        )
    )
    (cfu k 0)
)


(cont-frac (lambda (i) 1.0)
    (lambda (i) 1.0)
    100
)

(define (cont-frac-rec n d k)
    (if (= k 0) 0
        (/ (n k) 
            (+ (d k) 
                (cont-frac-rec n d (- k 1))
            )
        )
    )
)

(cont-frac-rec (lambda (i) 1.0)
    (lambda (i) 1.0)
    10
)

(define (findK n d k)
    (define (goodK? k) 
        (let ((value (cont-frac n d k))
            (tolerance 0.0001)
            (target 0.6180)
            )
            (display value)
            (newline)
            (< (abs (- value target)) tolerance)
        )
    )
    (if (goodK? k) k (findK n d (+ 1 k)))
)

(findK (lambda (i) 1.0)
    (lambda (i) 1.0)
    1
)