(define (square x) (* x x))
(define (even? a) (= (remainder a 2) 0))
(define (expmod b n a)
    (define (rem x) (remainder x a))
    (define (miller-rabin-test? b)
        (define x (rem (square b)) )
        ( and (= x 1) (not (= 1 b)) (not (= (- n 1) b)))
    )
    (define (expmodU q b n)
        (cond ((= n 0) q)
            ((even? n) 
                (if (miller-rabin-test? b) -1 
                
                    (expmodU 
                        q
                        (rem (square b))
                        (/ n 2)
                    )
                )
            )
            (else
                (expmodU 
                    (rem (* q b))
                    b
                    (- n 1)
                )
            )
        )
    )
    (expmodU 1 b n)
)

(expmod 2 5 4)

(define (isPrime? n)
    (define (fermat-test n times)
        (define a (random n))
        (cond ((= times 0) #t)
            ((= (expmod a n n) a) (fermat-test n (- times 1)))
            (else #f)
        )
    )
    (fermat-test n 10)
)

(isPrime? 2)
(isPrime? 3)
(isPrime? 101)
(isPrime? 160)
(isPrime? 561)



