(define rand
    (let ((x random_init))
        (
            lambda ()
            (begin
                (set! x (rand-update x))
                x
            )
        )
    )
)

(define rand
    (define x random_init)
    (lambda (message)
        (cond
            ((eq? message 'generate) (begin (set! x (rand-update x)) x))
            ((eq? message 'reset) (lambda (y) (begin (set! x y) x)))
        )
    )
)