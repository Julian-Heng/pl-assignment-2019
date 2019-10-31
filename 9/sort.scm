(define (pos-neg) (if (equal? (random 2) 1) `-1 `1))
(define (rand-list lim n)
  (if (not (equal? n 0))
    (cons (* (random lim) (pos-neg)) (rand-list lim (- n 1)))
    ()))


(define (print-list l) (begin (display l) (display `"\n")))
(define (list-length l)
  (if (not (null? l))
    (+ 1 (list-length (cdr l)))
    `0))


(define (sorted? l)
  (cond
    ((null? (cdr l)) #t)
    ((>= (cadr l) (car l)) (sorted? (cdr l)))
    (else #f)))


(define (cocktail-forward l)
  (cond
    ((null? (cdr l)) l)
    (else
      (if (> (car l) (cadr l))
        (cons (cadr l) (cocktail-forward (cons (car l) (cddr l))))
        (cons (car l) (cocktail-forward (cdr l)))))))


(define (cocktail-backward l)
  (cond
    ((null? (cdr l)) l)
    (else
      (let*
        ((new_list (cocktail-backward (cdr l)))
         (_ new_list))
          (if (> (car l) (car new_list))
            (cons (car new_list) (cons (car l) (cdr new_list)))
            (cons (car l) new_list))))))


(define (cocktail-sort l)
  (cond
    ((sorted? l) l)
    (else
      (let*
        ((forward (cocktail-backward l))
         (backward (cocktail-forward l)))
          (begin
            ; Uncomment to debug
            ; (display "Forward:  ") (print-list forward)
            ; (display "Backward: ") (print-list backward)
            (cocktail-sort backward))))))


; Generate a list of 32 random numbers ranging from 0 to 100
(print-list (cocktail-sort (rand-list 100 32)))

; vim: tabstop=2 shiftwidth=2 expandtab
