(define (accumulator op ini seq)
    (
        if (null? seq) ini
        (op
            (car seq)
            (accumulator op ini (cdr seq))
        )
    )
)

(define (count-leaves tree)
    (accumulator 
        (lambda (this next)
            (+ (if (pair? this) (count-leaves this) 1) next)
        )
        0
        tree
    )
)

(define (map proc seq)
    (
        if (null? seq) () (cons
            (proc (car seq))
            (map proc (cdr seq))
        )
    )
)

(define (count-leaves-using-map tree)
    (accumulator    +
        0
        (map 
            (lambda (x) 
                (if (pair? x) (count-leaves x) 1)
            ) 
            tree
        )
    )
)

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))
(count-leaves-using-map x)
(count-leaves-using-map (list x x))