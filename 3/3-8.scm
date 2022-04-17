(define (g)
    (let ((state 0))
        (lambda (x)
            (begin
                (define retVal (+ state 0))
                (set! state x)
                retVal
            )
        )
    )
)

(define f (g))

(+ (f 0) (f 1))

(+ (f 1) (f 0))