(load "2-17.scm")
(define (append list1 list2)
    (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2)))
)

(define (reverse l)
    (
        if (null? (cdr l))
           l
           (append (reverse (cdr l)) (List (car l)))
    )
)

(reverse (List 1))
(reverse (List 1 2 3))
(reverse (List 1 3 5 7))

(define (reversel l)
    (define (reversel_util b l)
        (if (null? (cdr l))
            (cons (car l) b)
            (reversel_util (cons (car l) b) (cdr l))
        )
    )
    (reversel_util '() l)
)



(reversel (List 1))
(reversel (List 1 2 3))
(reversel (List 1 3 5 7))