(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (* (expmod base (/ exp 2) m)
             (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(expmod 4 10 5)


(define (expmod1 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (
            (remainder (* vm vm) m))
        )
        (else
         (remainder
          (* base
             (expmod1 base (- exp 1) m))
          m))))
(expmod1 4 10 5)