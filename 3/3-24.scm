; 1D
(define (lookup key table)
    (let ((record (assoc key (cdr table))))
        (if record
            (cdr record)
            false)))
(define (assoc key records)
    (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))


(define (insert! key value table)
    (let ((record (assoc key (cdr table))))
        (if record
            (set-cdr! record value)
            (set-cdr! table
                (cons (cons key value)
                (cdr table)))))
'ok)


(define (make-table)
    (list '*table*))


; 2D
(define (lookup key-1 key-2 table)
    (let ((subtable
        (assoc key-1 (cdr table))))
        (if subtable
            (let ((record
                (assoc key-2 (cdr subtable))))
                (if record
                    (cdr record)
                    false))
            false)))


(define (insert! key-1 key-2 value table)
    (let ((subtable (assoc key-1 (cdr table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
                (if record
                    (set-cdr! record value)
                    (set-cdr! subtable
                        (cons (cons key-2 value)
                        (cdr subtable)))))
                    (set-cdr! table
                        (cons (list key-1
                        (cons key-2 value))
                            (cdr table)))))
                'ok)



; 1D
(define (lookup key table)
    (let ((record (assoc key (cdr table))))
        (if record
            (cdr record)
            false)))
(define (assoc key records)
    (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))


(define (insert! key value table)
    (let ((record (assoc key (cdr table))))
        (if record
            (set-cdr! record value)
            (set-cdr! table
                (cons (cons key value)
                (cdr table)))))
'ok)


(define (make-table same-key?)
    (let ((table (list '*table*)))
        (define (assoc key records)
            (cond ((null? records) false)
                ((same-key? key (caar records)) (car records))
                (else (assoc key (cdr records)))))
        (define (lookup key)
            (let ((record (assoc key (cdr table))))
                (if record
                    (cdr record)
                    false)))
        (define (insert! key value)
            (let ((record (assoc key (cdr table))))
                (if record
                    (set-cdr! record value)
                    (set-cdr! table
                        (cons (cons key value)
                        (cdr table)))))
        'ok)
        (define (dispatch m)
            (cond
                ((eq? m 'insert) insert!)
                ((eq? m 'lookup) lookup)
                (else (error "wtf"))
            )
        )
        dispatch
    )
)

(define (lookup key table)
    ((table 'lookup) key)
)

(define (insert! key value table)
    ((table 'insert) key value)
)

(define same-key? 
    (lambda (x y)
        (if (and (number? x) (number? y))
            (> 0.01 (abs (- x y)))
            (equal? x y)
        )
        
    )
)
(define tabel (make-table same-key?))
(insert! 1.01 2 tabel)
(insert! 1.11 4 tabel)
(lookup 1.01 tabel)
(lookup 1.109 tabel)

