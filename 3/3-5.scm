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

(define (estimate-circle-area circle trials) 
    (*
        (monte-carlo trials (make-circle-area-experiment circle)) 
        (square (* 2 (radius circle)))
    )
)

(define (make-circle-area-experiment circle)
    (define es (enclosing-square circle))
    (lambda () (pt-in-circle? circle (random-pt-in-rect es)))
)


; for circle
(define pi 3.1415)
(define (circle-area circle)
    (* pi (square (radius circle)))
)

(define make-circle cons)

(define radius cdr)
(define center car)

(define (enclosing-square circle)
    (define cent (center circle))
    (define x (x-cord cent))
    (define y (y-cord cent))
    (define r (radius cent))
    (cons (make-point (- x r) (- y r)) (make-point (+ x r) (+ y r)))
)

(define (pt-in-circle? circle pt)
    (>= (square (radius circle))
        (+
            (square (- (x-cord pt) (x-cord (center circle))))
            (square (- (y-cord pt) (y-cord (center circle))))
        )
    )
)

(define (random-pt-in-rect rect)
    (cons 
        (random-bw 
            (x-cord (car rect)) 
            (x-cord (cdr rect)) 
        )

        (random-bw 
            (y-cord (car rect)) 
            (y-cord (cdr rect)) 
        )
    )

)


; for point
(define make-point cons)
(define x-cord car)
(define y-cord cdr)



; others
(define (random-bw x y)
    (+ x (* (- y x) (random 1.0)))
)


(define sample_circle (make-circle (make-point 5.0 7.0) 3.0))
(estimate-circle-area sample_circle 100) 
(circle-area sample_circle) 


