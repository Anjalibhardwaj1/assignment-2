;gnu clisp  2.49.60

(defun revList (lst1)
    (cond
        ((null lst1) '())
        (t (append (revList (cdr lst1)) (list (car lst1))))
    )
)

; variable n to count recursive calls
(defvar n 0)
(defun sublist(lst from &optional (to (list-length lst)))

    (setf n (+ n 1))
    
    (cond
        
        ; if from is greater than to then this is the first recursive call
        ((and (> from to) (= n 1))
         (revlist (sublist lst to from))
        )
        
        ; last recursive call
        ((and (> from to) (> n 1))
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
        '(1 4 65 7 9 23) 4 1
    )
)