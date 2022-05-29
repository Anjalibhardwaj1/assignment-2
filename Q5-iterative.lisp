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

(defun tribonacci-seq(n)
    
    (cond
        ((= n 0) NIL)
        
        ((= n 1) 0)
        
        ((= n 2) '(0 0))
        
        ((= n 3) '(0 0 1))
        
        ; if n > 3, a for loop is executed
        ((> n 3)
         
         (defvar lst '(0 0 1))
         (setq temp_lst lst)
         
         (loop for i from 4 to n
               do (setf temp_lst (sublist lst (- (list-length lst) 2) (list-length lst)))
               
               ; list.append( sum( list[n-2], list[n-1], list[n] ) )
               (setf lst (append lst (list (apply '+ temp_lst))))
               
               (setf temp_lst lst)
         )
         
         lst
        )
        
    )
)

(print (tribonacci-seq 25))