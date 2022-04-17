(define nil '())
(define (make-table) ;check this
    (list '*table*))

(define (assoc key records)
    (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (find-last-if-number records) ; if last item is that record return value  else return false
    (cond
        ((null? records) false)
        ((null? (cdr records))
            (if (number? (car records))
                records
                false
            )
        )
        (else 
            (find-last-if-number (cdr records))
        )
    )
)

(define (insert! table keys value)
    (let ((record (get-record table keys)))
        ( if (pair? record)
            (set-car! record value)
            (full-insert-and-return! table keys value)
        )
    )
    'ok
)

(define (attach-at-end! records value)
    (cond 
        ((null? records) (error "empty records not allowed"))
        ((null? (cdr records)) (set-cdr! records (cons value nil)))
        (else (attach-at-end! (cdr records) value))
    )
)

(define (full-insert-and-return! table keys value) ; what if keys is null
    (if (null? keys) 
        (if (list? (cdr table))
            (attach-at-end! (cdr table) value)
            (begin

                (set-cdr! table (cons value nil))
                (cdr table)
            )
        )
        (let ((subRecord (assoc (car keys) (cdr table))))
            (if subRecord
                (begin 
                    (set-cdr! subRecord (full-insert-and-return! subRecord (cdr keys) value))
                    subRecord
                )
                (begin
                    (set-cdr! table (list (cons (car keys) 'z)))
                    (set-cdr! (cadr table) (full-insert-and-return! (cadr table) (cdr keys) value))
                    (cdr table)
                )
            )
        )
    )
)

(define (get-record table keys)
    (if (null? (cdr table));this only checks for top level table. for others we use assoc result. assuming table is a pair
        false
        (let 
            ((records (cdr table)))
            (if 
                (null? keys) 
                ( let ((last-pair (find-last-if-number records)))
                    (if (pair? last-pair) (car last-pair) last-pair)
                ) 
                ( let ((subRecord (assoc (car keys) records)))
                    (if subRecord 
                        (lookup subRecord (cdr keys))
                        false
                    )
                )
            )
        )
    )
)

(define (lookup table keys)
    (if (null? (cdr table))
        false
        (let ((record (get-record table keys)))
            (if (pair? record) (car record) record)
        )
    )
)




(define table (make-table))

(define k1 (list 'a))
(insert! table k1 5)
(lookup table k1)


(define k2 (list 'c 'd))
(insert! table k2 7)
(lookup table k2)


(define k3 (list 'a 'b))
(insert! table k3 6)
(lookup table k3)


(define k4 (list 'a 'c 'd))
(insert! table k4 4)
(lookup table k4)
(insert! table k4 8)
(lookup table k4)


(define k5 (list 'a 'c 'd 'e))
(insert! table k5 9)
(lookup table k5)
(lookup table k4)