(define (last-pair l)
    (if (null? (cdr l)) l (last-pair (cdr l)))
)

(last-pair (List 1 2 3 4))
(last-pair (List 1))
(last-pair ())