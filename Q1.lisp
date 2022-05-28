(defun sublist(lst from &optional (to (list-length lst)))

    (cond
    
        ((or(>= 0 from)(> from to)(< (list-length lst) from)(< (list-length lst) to))
        NIL
        )
    
        ((<= 2 from)
        (sublist (cdr lst) (- from 1) (- to 1))
        )
    
        ((and(= 1 from)(> to 0))
        (cons (car lst) (sublist (cdr lst) from (- to 1)))
        )
        
        (T NIL)
    )
)

(print
    (sublist
        '(1 2 3 4) 2 3
    )
)


