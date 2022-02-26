(load "2/interval_arithmetic.scm")

(define (make-interval a b) (cons (min a b) (max a b)) )

(define upper-bound cdr)

(define lower-bound car)

(define int1 (make-interval 2 4))

(define int2 (make-interval 3 5))

(add-interval int1 int2)

(mul-interval int1 int2)