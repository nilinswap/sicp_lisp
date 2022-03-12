(load "2/2-56.scm")

(define addend cadr)

(define nil '() )

(define (augend exp) 
    ; check if it is sum
    (let
        (
            (secondPart (cddr exp))
        )
        (cond 
            ((eq? (cdr secondPart) nil) (car secondPart))
            (else 
                (append (list '+) secondPart)
            )
        )
    )
)


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define
    (reduceSum exp)
    (cond 
        ( 
            (singleTerm? exp)
            exp
        )
        (
            (sum? exp) 
            (let 
                (
                    (terms (cdr exp))
                )
                (let 
                    (
                        (
                            numberful
                            (filter 
                                number?
                                terms
                            )
                        )
                        (
                            numberless
                            (filter 
                                (lambda (x) (not (number? x)))
                                terms
                            )
                        )
                    )
                    (let
                        (
                            (
                                finalList 
                                (append (filter (lambda (x) (not (= x 0))) (list (accumulate + 0 numberful)))
                                    numberless
                                )
                            )                            
                        )
                        (cond
                            ((eq? finalList nil) 0)
                            ((eq? (cdr finalList) nil) (car finalList))
                            (else
                                (append (list '+) (finalList))
                            )
                        )
                    )
                )
            )
        )
        ;(else error)
    )
)

(define singleTerm?
    (lambda (x)
        (not
            (pair? x)
        )
    )
)

(define (make-sum l1 l2)
    (let 
        (
            (reducedL2 (reduceSum l2))
        )
        (cond
            ((=number? l1 0) reducedL2)
            ((=number? reducedL2 0) l1)
            ((and (number? l1) (number? reducedL2)) (+ l1 reducedL2))
            ((singleTerm? reducedL2) (list '+ l1 reducedL2)) 
            (else 
                (append (list '+) (list l1) (cdr reducedL2))
            )
        )
    )
)

(deriv '(+ (* x x) (* 3 x) 5) 'x)
(deriv '(+ (+ x x) (* 3 x) 5) 'x)
(deriv '(+ (* 4 x) (* 3 x) 5) 'x)

(make-sum 'a '(+ a b))


( make-sum 4 '(+ 0  0 0))