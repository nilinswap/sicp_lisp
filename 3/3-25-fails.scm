(define (make-table)
    (list '*table*))




(define (assoc-gen keys records)
    (cond 
        ((null? records) false)
        ((null? (cdr keys)) (assoc (car keys) records))
        (else (let
                ((record (assoc (car keys) records)))
                (if record 
                    (assoc-gen (cdr keys) (cdr record))
                    false 
                )
            )
        )
    )
)

(define (keys-val keys value)
    (if 
        (null? (cdr keys)) (cons (car keys) value)
        (cons 
            (car keys) 
            (list (keys-val (cdr keys) value))
        )
    )
)

(define (insert! keys value table)
    (let ((record (assoc-gen keys (cdr table))))
        (if record
            (set-cdr! record value)
            (set-cdr! table
                (cons (full-keys-val keys value table)
                    (cdr table)
                )
            )
        )
    )
'ok)


(define (lookup keys table)
    (let ((record (assoc-gen keys (cdr table))))
        (display record)
        (if record 
            (cdr record)
            false
            )
    )
)

(define (full-keys-val keys value table)
    (if 
        (null? keys) value 
        (let
            ((partial-record (assoc (car keys) (cdr table))))
            (if partial-record
                (full-keys-val (cdr keys) value partial-record)
                (keys-val keys value)
            )
        )
    )
)


(define tabel (make-table))
(lookup (list 'a) tabel)
(insert! (list 'a) 2 tabel)
(lookup (list 'a) tabel)
(define keys (list 'a))
(assoc-gen keys (cdr tabel))
(define records (cdr tabel))
(assoc (car keys) records)


(define keys2 (list 'b 'c))
(lookup keys2 tabel)
(insert! keys2 3 tabel)
(lookup keys2 tabel)
(define records2 (cdr tabel))
(assoc-gen keys2 (cdr tabel))
(assoc (car keys2) records2)

(define keys3 (list 'b))
(lookup keys3 tabel)
(insert! keys3 4 tabel)
(lookup keys3 tabel)


