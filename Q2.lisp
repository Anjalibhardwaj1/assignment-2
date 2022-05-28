;gnu clisp  2.49.60

(defun sublist(lst from &optional (to (list-length lst)))

    (cond
        
        ; from is greater than to
        ((> from to)
         NIL
        )

        ; from is out of bound but to is correct
        ((and (or (>= 0 from) (< (list-length lst) from)) (>= (list-length lst) to))
        (sublist lst 1 to)
        )
        
        ; to is out of bound but from is correct
        ((and (and (<= 1 from) (> (list-length lst) from)) (< (list-length lst) to))
        (sublist lst from (list-length lst))
        )
        
        ; both from and to are out of bound
        ((and (or (>= 0 from) (< (list-length lst) from)) (< (list-length lst) to))
        (sublist lst 1 (list-length lst))
        )

        ((<= 2 from)
        (sublist (cdr lst) (- from 1) (- to 1))
        )

        ((and (= 1 from) (> to 0))
        (cons (car lst) (sublist (cdr lst) from (- to 1)))
        )

        (T NIL)
    )
)

(print
    (sublist
        '(1 6 12 9 56 0) 7 8
    )
)