
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define nil '())

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define x 
(List (List 1 2 3) (List 4 5 6) (List 7 8 9) (List 10 11 12))
)
(accumulate-n + 0 x)

(define (accumulate-m op init seqs)
    (map (
        lambda (x)
        (accumulate + 0 x)
        )
        seqs
    )
)

(accumulate-m + 0 x)


(map + (list 1 2 3) (list 3 2 1))