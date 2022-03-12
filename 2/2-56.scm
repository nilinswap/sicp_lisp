(define (deriv exp var)
    (cond
        ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (
            (sum? exp) 
            (make-sum
                (deriv (addend exp) var)
                (deriv (augend exp) var)
            )
        )
        (
            (product? exp)
            (make-sum 
                (make-product
                    (deriv (multiplier exp) var)
                    (multiplicant exp)
                )
                (make-product
                    (deriv (multiplicant exp) var)
                    (multiplier exp)
                )
            )
        )
        (
            (exponentiation? exp)
            (let 
                (
                    (b (base exp))
                    (p (power exp))
                )
                (make-product
                    (deriv b var)
                    (make-product p
                        (make-exponentiation b (make-sum p (- 0 1))))
                    
                )
            )
        )
        (else 
            (error "unknown expression type: DERIV" exp)
        )
    )
)

(define variable? symbol?)

(define (same-variable? v1 v2)
    (and
        (variable? v1)
        (variable? v2)
        (eq? v1 v2)
    )
)

(define (make-sum a b)  
    (cond 
        ((=number? a 0) b)
        ((=number? b 0) a)
        (else 
            (list '+ a b)
        )
    )
)

(define (sum? exp)
    (and 
        (pair? exp)
        (eq? (car exp) '+)
    )
)

(define addend cadr)

(define augend caddr)

(define (=number? a b)
    (and 
        (number? a)
        (number? b)
        (= a b)
    )
)

(define (make-product a b)  
    (cond 
        ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        (else 
            (list '* a b)
        )
    )
)

(define (product? exp)
    (and 
        (pair? exp)
        (eq? (car exp) '*)
    )
)

(define multiplier cadr)

(define multiplicant caddr)



(deriv '(* x y) 'x)
(deriv '(+ x 3) 'x)

(define (expr b n)
        (if (= n 0) 
            1
            (if (even? n)
                (square (expr b (/ n 2)))
                (* b (expr b (- 1 n)))
            )
        )
)

(define (make-exponentiation a n)
    (cond
        ((=number? a 0) 0)
        ((=number? a 1) 1)
        ((=number? n 0) 1)
        ((=number? n 1) a)
        ((and (number? a) (number? b)) (expr a n))
        (else (list '** a n))
    )
)


(define (exponentiation? expression)
    (and
        (pair? expression)
        (eq? (car expression) '**)
    )
)

(define base cadr)
(define power caddr)


(deriv '(** x 3) 'x)
(deriv '(** x y) 'x)
(deriv '(* (** x y) (** y 3)) 'x)

(base '(** x y))
(base '(** x y))