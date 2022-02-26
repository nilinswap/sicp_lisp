(define (for-each proc lis)
    (
        if (null? lis) #t 
            (
                (proc (car lis))
                (for-each proc (cdr lis))
            )
    )
)

(for-each (lambda (x) (
        (display x)
        (newline)
        #t
    ))
    (List 1 2 3 4)
)

(
    (lambda (x) 
        #t
    )
    1
)
