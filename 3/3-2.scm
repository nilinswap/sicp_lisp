(define (make-monitored f)
    (define count 0)
    (lambda (message)
        (cond
            ((eq? message 'how-many-calls?) 
                    count
            )
            ((eq? message 'reset-count) 
                    (begin (set! count 0) count)
            )
            (else (begin (set! count (+ count 1)) (f message)))
        )
    )
)

(define (make-monitored2 f)
    (define (mf count)
        (lambda (message)
            (cond
                ((eq? message 'how-many-calls?) 
                         count
                )
                ((eq? message 'reset-count) 
                        (begin (set! count 0) count)
                )
                (else (begin (set! count (+ count 1)) (f message)))
            )
        )
    )
    (mf 0)
)

(define (square x) (* x x))

(define ms (make-monitored2 square))
(ms 10)
(ms 'how-many-calls?)
(ms 'reset-count)