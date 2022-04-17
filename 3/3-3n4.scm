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
    (lambda (message password)
        (if (not (eq? password secret_password))
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
                    (else (error "Unknow request: " message))
                )
            )
        )
    )
)

(define acc (make-account 100 'secret-password))

((acc 'withdraw 'secret-password) 10)
((acc 'withdraw 'secret-password) 20)
((acc 'deposit 'secret-password) 40)

((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)
((acc 'deposit 'secret-password-) 40)


