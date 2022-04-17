(load "/Users/nilinswap/forgit/nilinswap/sicp_lisp/2/2-59.scm")

(define (reduce-set set)
    (define (reduce-set-iter red set)
        (cond
            ((null? set) red)
            ((element-of-set? (car set) red) (reduce-set-iter red (cdr set)))
            (else (reduce-set-iter (cons (car set) red) (cdr set)))
        )
    )
    (reduce-set-iter nil set)
)

(define (intersection-set seta setb)
    (define set1 (reduce-set seta))
    (define set2 (reduce-set setb))
    (cond ((or (null? set1) (null? set2)) '())
            ((element-of-set? (car set1) set2)
            (cons (car set1) (intersection-set (cdr set1) set2)))
            (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
    (append set1 set2)
)

(define s1 '(a b c d c d e))

(define s2 '(c d z z x x y))

(define s3 '(p p p p q r s s s s))
;(load "2-60.scm")