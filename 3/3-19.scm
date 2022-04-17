(load "/Users/nilinswap/forgit/nilinswap/sicp_lisp/3/3-18.scm")

(define is-circular
    (lambda (l)
        (let ((first l) (first-time? #t))
            (define (is-circular-recursive l)
                (cond
                    ((null? l) #f)
                    ((and (eq? first l) (not first-time?)) #t)
                    (else 
                        (begin
                            (set! first-time? #f)
                            (is-circular-recursive (cdr l))
                        )
                    )
                )
            ) 
            (is-circular-recursive l)
        )
    ) 
)
