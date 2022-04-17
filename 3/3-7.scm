(define (make-account balance secret_password)
    (define withdraw 
        (lambda (amount)
            (cond
                ((>= balance amount) (begin (set! balance (- balance amount)) balance))
                (else "insufficient balance")
            )
        )
    )
    (define deposit
        (lambda (amount) (begin (set! balance (+ balance amount)) balance))
    )
    (define call-the-cops (lambda (x)  "who let the cops out? you! you, you, you! you!"))
    (define failed-attempts 0)
    (define second_password secret_password)
    (define set_second_password (lambda (x)
        (begin (set! second_password x))
     ))
    (lambda (message password)
        (if (not (or (eq? password secret_password) (eq? password second_password)))
            (begin
                (set! failed-attempts (+ failed-attempts 1))
                (if (> failed-attempts 7)
                    call-the-cops
                    (lambda (x) "wrong password")
                )
            )
            (begin
                (set! failed-attempts 0)
                (cond 
                    ((eq? message 'withdraw) withdraw)
                    ((eq? message 'deposit) deposit)
                    ((eq? message 'set_second_password) set_second_password)
                    (else (error "Unknow request: " message))
                )
            )
        )
    )
)


(define (make-joint acc password second_password)
    (begin ((acc 'set_second_password password) second_password) acc)
)


(define acc (make-account 100 'secret-password))

((acc 'withdraw 'secret-password) 10)
((acc 'withdraw 'different-password) 20)
(define bacc (make-joint acc 'secret-password 'different-password))
((bacc 'withdraw 'different-password) 20)
((acc 'withdraw 'differnet-password) 20)

((bacc 'deposit 'secret-password) 40)


