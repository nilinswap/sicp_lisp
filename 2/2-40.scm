(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq))
)

(define (enumerate i j)
    (if (> i j) nil 
        (cons i (enumerate (+ 1 i) j)
        )
    )
)

(define (unique-pairs n)
    (flatmap 
        (lambda (i)
            (map 
                (lambda (j)
                    (list i j)
                ) 
                (enumerate 1 (- i 1))
            )
        )
        (enumerate 1 n)
    )
)
(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))

(define (filter predicate sequence)
    (cond ((null? sequence) nil)
        ((predicate (car sequence))
            (cons (car sequence)
            (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))
    )
)

(filter (lambda (x) (even? x)) (enumerate 1 10))

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum? 
            (unique-pairs n)
        )
    )
)

(unique-pairs 4)
(prime-sum-pairs 6)
