(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))


(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

(define (is-structure-simple x) 
    (not (pair? x))
)

(define (total-weight struct)
    (
        if (is-structure-simple struct) struct
            ( +
                (total-weight (branch-structure (left-branch struct)))
                (total-weight (branch-structure (right-branch struct)))
            )
    )
)

(define (is-balanced struct)
    (
        if (is-structure-simple struct) #t 
            (
                let (
                    (lbs (branch-structure (left-branch struct)))
                    (rbs (branch-structure (right-branch struct)))
                )
                
                (and 
                    (is-balanced lbs) 
                    (is-balanced rbs) 
                    (= (total-weight lbs) (total-weight rbs))
                )
            )
    )
)   





;; test:
;;                   |
;;                 3 | 3
;;                -------             <- 2
;;                |     |
;;                2   2 | 2
;;                    -----           <- 1
;;                    |   |
;;                    3   3

(define m1
  (make-mobile (make-branch 2 3)
               (make-branch 2 3)))
(define m2
  (make-mobile (make-branch 3 6)
               (make-branch 3 m1)))

(total-weight m1)
(total-weight m2)

(is-balanced m1)
(is-balanced m2)    


(define (make-mobile left right) (cons left right))
(define (make-branch length structure)
(cons length structure))



(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

; not change. littrallay