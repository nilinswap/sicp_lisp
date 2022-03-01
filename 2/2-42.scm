(load "2-40.scm")

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
    (append (list new-row) rest-of-queens)
)


(define (length-seq seq) 
    (
        if (null? seq) 0
        (+ 1 (length-seq (cdr seq)))
    )
)

(define (safe? k positions)
    (let 
        (
            (suspect (car positions))
            (rest-of-queens (cdr positions))
        )
        (accumulate and #t 
            (flatmap 
                (lambda (predicate)
                    (map 
                        predicate
                        (zip rest-of-queens (enumerate 1 (length-seq rest-of-queens)))
                    )
                )
                (list
                    (lambda (x-rank) 
                        (let (
                                (x (car x-rank)) 
                                (rank (cadr x-rank))
                            )
                            (not (= x suspect))
                        )
                    )
                    (lambda (x-rank) 
                        (let (
                                (x (car x-rank)) 
                                (rank (cadr x-rank))
                            )
                            (not 
                                (= 
                                (abs (- x suspect)) 
                                rank)
                            )
                        )
                    )
                )
            )
        )
    )
)


(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map (lambda (new-row)
                                (adjoin-position new-row k rest-of-queens)
                            )
                            (enumerate 1 board-size)
                        )
                    )
                    (queen-cols (- k 1))
                )
            )
        )
    )
    (queen-cols board-size)
)