(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)


(define pi-experiment 
    (lambda ()
        (define x (rand))
        (define y (rand))
        (= (gcd x y) 1)
    )
)

(define (estimate-pi trials) 
    (sqrt (/ 6 (monte-carlo
        trials
        pi-experiment))
    )
)

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

(define (monte-carlo trials experiment) 
    (define (iter trials_left trials_passed)
        (cond
            ((= trials_left 0)
                (/ trials_passed trials)
            )
            ((experiment) (iter (- trials_left 1) (+ trials_passed 1)))
            (else (iter (- trials_left 1) trials_passed ))
        )
    )
    (iter trials 0)
)


