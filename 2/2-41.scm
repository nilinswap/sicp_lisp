(load "2/2-40.scm")

(define (triplet-sum n s)
    (filter (lambda (l) (= (accumulate + 0 l) s)) 
        (all-distinct-triplets n)
    )
)

(define (all-distinct-triplets n)
    (flatmap 
        (lambda (pairo)
            (map (lambda (z)
                    (list (car pairo) (cadr pairo) z)
                )
                (enumerate 1 (- (cadr pairo) 1))
            )
        )
        (all-distinct-pairs n)
    )
)
(define (all-distinct-pairs n)
    (flatmap 
        (lambda (x) 
            (map 
                (lambda (y) (list x y))
                (enumerate 1 (- x 1))
            )
        )
        (enumerate 1 n)
    )
)
(all-distinct-triplets 4)


(triplet-sum 10 10)

;find all i,j,k less than equal n and filter then for their sum being equal to s
