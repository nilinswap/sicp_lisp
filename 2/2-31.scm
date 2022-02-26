(define (tree-map proc tree)
    (map
        (lambda (sub-tree)
            (cond ((list? sub-tree) (
                        square-tree-map sub-tree
                    )
                )
                (else (proc sub-tree))
            )
        )
        tree
    )
)

(tree-map square
(list 1
    (list 2 
        (list 3 4) 
        5
    )
    (list 6 7)
)
)