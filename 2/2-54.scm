(define (equal? x y)
    (define (eqUtil x y)
        (let ( 
                (fx (car x))
                (fy (car y))
            )
            (and
                (equal? fx fy)
                (equal? (cdr x) (cdr y))
            )
        )
    )
    (let ( (px (pair? x)) (py (pair? y)) )
        (cond
            ((and (not px) (not py)) (eq? x y))
            ((and px py) (eqUtil x y))
            (else #f)
        )
    )
)

(equal? '(a c (b)) '(a c (b)))
(equal? '((a) (c (b))) '((a) (c (b))))
(equal? '(a c b) '(a c b))
(equal? '() '())
(equal? '(((a))) '(((a))))
(equal? '(a c (b)) '(a c (b)))


(equal? '(a c b) '(a c (b)))
(equal? '((a) c (b)) '((a) (c (b))))
(equal? '(a b c) '(a c b))
(equal? '() '(a))
(equal? '((a)) '(((a))))
(equal? '(a c (b)) '(a c (b)))