(define nil '())
(define is-circular 
    (let ((visited nil))
        (lambda (l) (cond
            ((null? l) #f)
            ((member l visited) #t)
            (else (
                begin
                (set! visited (cons l visited))
                (is-circular (cdr l))
            ))
            )
        )
    )
)
(define make-circular
    (lambda (l)
        ( cond
            ((null? l) l)
            (else (set-cdr! (last-pair l) l))
        )
    )
)

(define x (list 'a 'b 'c))

(is-circular  x)
(make-circular x)
(is-circular x)
