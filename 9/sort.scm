(define (print-list l) (begin (display l) (display `"\n")))
(define (random-list lim n)
  (if (not (equal? n 0))
    (cons (random lim) (random-list lim (- n 1)))
    ()))


(define (list-length l)
  (if (not (null? l))
    (+ 1 (list-length (cdr l)))
    (0)))


(define (sorted? l)
  (cond
    ((null? (cdr l)) #t)
    ((>= (cadr l) (car l)) (sorted? (cdr l)))
    (else #f)))


(define (cocktail-sort-forward l)
  (cond
    ((null? (cdr l)) l)
    (else
      (if (> (car l) (cadr l))
        (cons (cadr l) (cocktail-sort-forward (cons (car l) (cddr l))))
        (cons (car l) (cocktail-sort-forward (cdr l)))))))


(define (cocktail-sort-backward l)
  (cond
    ((null? (cdr l)) l)
    (else
      (let*
        ((new_list (cocktail-sort-backward (cdr l)))
         (_ new_list))
          (if (> (car l) (car new_list))
            (cons (car new_list) (cons (car l) (cdr new_list)))
            (cons (car l) new_list))))))


(define (cocktail-sort l)
  (cond
    ((null? (cdr l)) l)
    ((sorted? l) l)
    (else
      (let*
        ((forward (cocktail-sort-forward l))
         (backward (cocktail-sort-backward forward)))
          (begin
            ; Uncomment to debug
            ; (display "Forward:  ") (print-list forward)
            ; (display "Backward: ") (print-list backward)
            (cocktail-sort backward))))))


; Generate a list of 32 random numbers ranging from 0 to 100
(print-list (cocktail-sort (random-list 100 32)))

; vim: tabstop=2 shiftwidth=2 expandtab
