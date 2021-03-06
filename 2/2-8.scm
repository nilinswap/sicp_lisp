(load "2/2-7.scm")

(define (sub-interval x y)
    (let (
            (p1 (- (lower-bound x) (lower-bound y)))
            (p2 (- (lower-bound x) (upper-bound y)))
            (p3 (- (upper-bound x) (lower-bound y)))
            (p4 (- (upper-bound x) (upper-bound y)))
        )
        (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))
    )
)

(sub-interval int1 int2)