(define (square-tree tree)
    (cond ((null? tree) ())
        ((list? tree) (
                cons (square-tree (car tree)) (square-tree (cdr tree))
            )
        )
        (else (square tree))
    )
)

(square-tree
(list 1
    (list 2 
        (list 3 4) 
        5
    )
    (list 6 7)
)
)

(define (square-tree-map tree)
    (map
        (lambda (sub-tree)
            (cond ((list? sub-tree) (
                        square-tree-map sub-tree
                    )
                )
                (else (square sub-tree))
            )
        )
        tree
    )
)

(square-tree-map
(list 1
    (list 2 
        (list 3 4) 
        5
    )
    (list 6 7)
)
)