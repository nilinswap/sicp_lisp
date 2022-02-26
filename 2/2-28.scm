(define (append list1 list2)
    (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2)))
)

(define (fringe tree)
    (cond ((pair? tree) (append (fringe (car tree)) (fringe (cdr tree))))
            ((null? tree) ())
            (else (List tree)) 
    )
)

(define x (List 1 2 3 4 5 6))
(define y (List 7 8 7 8 (cons 9 10)))
(define z (List 0 (List 1 2) y)
(fringe x)
(fringe y)
(fringe z)

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))