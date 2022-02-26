(define 
    (metaSumi f a next b)
    (define (metaSumiUtil q a)
        (if (> a b) q
            (metaSumiUtil (+ (f a) q) (next a))
        )
    )
    (metaSumiUtil 0 a)
)

(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define 
    (metaSumr f a next b) 
    (
        cond ((> a b) 0)
        (else (+ (f a) (metaSumr f (next a) next b)))
    )
)

(define (twoFunEqual fun1 fun2 f a next b)
    (= (fun1 f a next b) (fun2 f a next b))
)

(twoFunEqual metaSumi metaSumr cube 0 inc 10)