(define 
    (metaSum f a next b) 
    (
        cond ((> a b) 0)
        (else (+ (f a) (metaSum f (next a) next b)))
    )
)


(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (integration a b n f)
    (define h (/ (- b a) n))
    (define (y p) (f (+ a (* p h)) ) )
    (define (term p)
        (cond
            ((or (= p 0) (= p n)) (y p))
            ((= (remainder p 2) 0) (* 2.0 (y p)))
            (else (* 4.0 (y p)))
        )
    )
    (define integAns 
        (*  (/ h 3)
            (metaSum term 0 inc n)
        )
    )
    integAns
)

(integration 0 1 4 cube)