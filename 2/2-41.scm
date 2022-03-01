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
(define (remove x l)
    (filter 
        (lambda (y)
            (not (= y x))
        ) l
    )
)

(define (permutation l)
    (if (null? l) (list nil)
        (flatmap
            (lambda (x)
                (map 
                    (lambda (rest) 
                        (append (list x) rest)
                    )
                    (permutation (remove x l))
                )
            )
            l
        )
    )
)

(permutation (enumerate 1 3))



(define (all-distinct-triplets n)
    (flatmap 
        (lambda (x)
            ( map (lambda(y-pairs) (append (list x) y-pairs))
                (list-of-unique-pairs-without-x x)
            )
        )
        (enumerate 1 n)
    )
)


(define (list-of-unique-pairs-without-x x)
    (flatmap 
        (lambda (y)
            (map 
                (lambda (z) 
                    (list y z)
                )
                (enumerate 1 (- y 1))
            )
        )
        (enumerate 1 (- x 1))
    )
)

(all-distinct-triplets 4)


(triplet-sum 10 10)