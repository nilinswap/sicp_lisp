(define (count-pairs pobj)
    (let ((visited '()))
        (define (cputil pobj)
            (cond 
                ((null? pobj) 0)
                ((not (pair? pobj)) 0)
                ((member pobj visited) 0)
                (else 
                    (begin
                        (set! visited (cons pobj visited))
                        (+ 1 
                            (cputil (car pobj))
                            (cputil (cdr pobj))
                        )
                    )
                )
            )
        )
        (cputil pobj)
    )
)

(define (last-pair x)
    (if (null? (cdr x)) x (last-pair (cdr x))))
(define (append! x y)
    (set-cdr! (last-pair x) y)
    x)

(define make-circular
    (lambda (l)
        ( cond
            ((null? l) l)
            (else (set-cdr! (last-pair l) l))
        )
    )
)

(define (length l)
    (cond ((null? l) 0)
        (else (+ 1 (length (cdr l))))
    )
)

(define x (list 'a 'b 'c))
(define y (cons (cons 'a 'b) (cons 'a 'd)))
(define p (cons 'a 'b))
(define z (cons p p))


(count-pairs x)
(count-pairs y)
(count-pairs z)

(make-circular x)
(length x)
(count-pairs x)
