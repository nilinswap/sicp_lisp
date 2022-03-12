(define make-vect cons)

(define xcor-vect car)

(define ycor-vect cdr)


(define (is-invalid-pair? u v)
    (or (not (pair? u)) (not (pair? v)) (pair? (car u)) (pair? (cdr u)) (pair? (car v))  (pair? (cdr v)))
)


(define (add-vect u v)
    (
        if (is-invalid-pair? u v) ((display "wrong arguments"))
            (cons 
                (+ (car u) (car v))
                (+ (cdr u) (cdr v))
            )
    )
)

(define (sub-vect u v)
    (
        if (is-invalid-pair? u v) ((display "wrong arguments"))
            (cons 
                (- (car u) (car v))
                (- (cdr u) (cdr v))
            )
    )
)

(define (scale-vect s v)
    (
        if (is-invalid-pair? u v) ((display "wrong arguments"))
            (cons 
                (* s (car v))
                (* s (cdr v))
            )
    )
)