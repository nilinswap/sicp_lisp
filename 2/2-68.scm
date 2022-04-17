(define (make-leaf symbol weight) (list 'leaf symbol weight))
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
    (list left
    right
    (append (symbols left) (symbols right))
    (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
    (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
    (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))


(define (decode bits tree)
    (define (decode-1 bits current-branch)
        (if (null? bits)
        '()
        (let ((next-branch
        (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
        (cons (symbol-leaf next-branch)
        (decode-1 (cdr bits) tree))
        (decode-1 (cdr bits) next-branch)))))
    (decode-1 bits tree))

(define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
    ((= bit 1) (right-branch branch))
    (else (error "bad bit: CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
    (cond ((null? set) (list x))
    ((< (weight x) (weight (car set))) (cons x set))
    (else (cons (car set)
    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
    (if (null? pairs)
    '()
    (let ((pair (car pairs)))
    (adjoin-set (make-leaf (car pair) ; symbol
    (cadr pair)) ; frequency
    (make-leaf-set (cdr pairs))))))

(define nil '())

(define (encode bits tree)
    (if
        (null? bits) nil
        (append (encode-symbol (car bits) tree) (encode (cdr bits) tree))
    )
)

(define (encode-symbol sym tree)
    (cond
        ((or (null? tree) (not (present? sym tree))) (display "error!!"))
        ((leaf? tree) nil)
        ((present? sym (left-branch tree)) (cons 0 (encode-symbol sym (left-branch tree))))
        (else (cons 1 (encode-symbol sym (right-branch tree))))
    )
)

(define (present? sym tree)
    (cond 
        ((null? tree) #f)
        ((leaf? tree) (eq? sym (symbol-leaf tree)))
        (else (or (present? sym (left-branch tree)) (present? sym (right-branch tree))))
    )
)

(define sample-decode-message '(A D A B B C A))

(encode-symbol 'd sample-tree)
(encode-symbol 'c sample-tree)
(encode-symbol 'b sample-tree)
(encode-symbol 'a sample-tree)
(encode sample-decode-message sample-tree)
(present? 'D sample-tree)
(present? 'A sample-tree)
(present? 'B sample-tree)
(present? 'C sample-tree)
(present? 'z sample-tree)
(cdr sample-decode-message)
(cadr sample-decode-message)
(define tree sample-tree)
(append (encode-symbol (car bits) tree) (encode-symbol (cadr bits) tree) (encode-symbol (caddr bits) tree))

(apply-generic '=zero? x)

(put '=zero? '(scheme-number) (lambda (x) (= x 0))

likewise

(put 'zero? '(complex) =Zero?)

(define (=Zero? x)
    (apply-generic '=Zero? x)
)

(put '=Zero? '(polar) (lambda (x) (= (magnitude 0))))