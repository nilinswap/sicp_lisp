(load "2/2-2.scm")

(define (RectangleDiagonal diag1 diag2)
        (cons
            (distance (car diag1) (cdr diag2))
            (distance (cdr diag1) (cdr diag2))
        )
)

(define (RectangleAdjacentSides pt1 pt2 pt3) 
    (cons
            (distance pt1 pt2)
            (distance pt1 pt4)
    )
)

(define (distance pt1 pt2)
    (sqrt
        (+ 
            (square (- (car pt1) (car pt2)))
            (square (- (cdr pt1) (cdr pt2)))
        )
    )
)



(define (area rect)
    (* (car rect) (cdr rect))
)

(define (perimeter rect)
    (* 2 (+ (car rect) (cdr rect)) )
)


(define pt1 (make-point 2 8))
(define pt2 (make-point 14 12))
(define pt3 (make-point 16 6))
(define pt4 (make-point 4 2))

(define diag1 (make-segment pt1 pt3))
(define diag2 (make-segment pt2 pt4))

(define rectD (RectangleDiagonal diag1 diag2))
(define rectAS (RectangleAdjacentSides pt1 pt2 pt3))

(area rectD)

(perimeter rectD)

(area rectAS)

(perimeter rectAS)
