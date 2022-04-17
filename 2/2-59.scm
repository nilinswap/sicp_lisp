(define nil '())
(define (equal? x y)
    (cond
        ((and (number? x) (number? y)) (= x y))
        ((and (symbol? x) (symbol? y)) (eq? x y))
        ((and (null? x) (null? y)) #t)
        ((and (list? x) (list? y)) (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
        (else #f)
    )
)

(equal? '(a b 1) '(a b 1))
(equal? '(a (b) 1 (a b c) ) '(a (b) 1 (a b c) ))
(equal? '(a (b) 1 (a b c) ) '(a (b) 1 (a b d) ))


(define (filter predicate sequence)
    (cond ((null? sequence) nil)
        ((predicate (car sequence))
            (cons (car sequence)
            (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))
    )
)

(define (element-of-set? x set)
    (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
    (if (element-of-set? x set)
    set
    (cons x set)))

(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
            ((element-of-set? (car set1) set2)
            (cons (car set1) (intersection-set (cdr set1) set2)))
            (else (intersection-set (cdr set1) set2))))

(define (difference-set set1 set2)
    (filter 
        (lambda (x)
            (not (element-of-set? x set2))
        ) 
        set1)
)

(define (union-set set1 set2)
    (append (difference-set set1 set2) set2)
)

(define s1 '(a b c d e))

(define s2 '(c d z x y))

(define s3 '(p q r s))

(element-of-set? 'p (adjoin-set 'p s1))

(union-set s1 s2)

(union-set s2 s3)

(intersection-set s1 s2)
(difference-set s1 s2)
(difference-set s1 s3)
(difference-set s2 s1)



(intersection-set s1 s3)

(element-of-set? 'a s1)

;(load "2-59.scm")