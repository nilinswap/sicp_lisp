(load "/Users/nilinswap/forgit/nilinswap/sicp_lisp/3/3-21.scm")

(define make-queue
    (let ((first-ptr nil) 
            (last-ptr nil))
        (define empty?
            (lambda ()
                (null? first-ptr)
            )
        )
        (define (insert item)
            (let ((new-pair (cons item '())))
                (cond ((empty?)
                    (begin 
                        (set! first-ptr new-pair)
                        (set! last-ptr new-pair)
                        (cons first-ptr last-ptr)
                    ))
                    (else
                        (set-cdr! last-ptr new-pair)
                        (set! last-ptr new-pair)
                        (cons first-ptr last-ptr))))
        )
        (define (delete)
            (cond ((empty?)
                        (error "DELETE! called with an empty queue"))
                    (else (set! first-ptr (cdr first-ptr))
                (cons first-ptr last-ptr))))
        (define (dispatch m)
            (cond 
                ((eq? m 'empty?) empty?)
                ((eq? m 'insert) insert)
                ((eq? m 'delete) delete)
                (else (error "unidentified operation"))
            )
        )
        dispatch
    )
)


(define (insert-queue! queue item)
    ((queue 'insert) item)
)

(define (delete-queue! queue)
    ((queue 'delete))
)

(define q1 make-queue)
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(delete-queue! q1)
(delete-queue! q1)

