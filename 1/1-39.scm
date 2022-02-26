(load "1-37.scm")

(define (tan-cf x k)
   (if (< (abs x) 0.1) x 
   (/ (cont-frac 
        (lambda (i) (- 0 (* x x)))
        (lambda (i) 
            (let ((im1 (- i 1)))
                (+ 1 (* 2 im1))
            )
        )
        k
      )
   (- 0 x)
   )
))

(tan-cf 1 100)

