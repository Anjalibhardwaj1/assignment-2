;left node right
(defun in-order(l)
    (if 
        (or (null l) (< (list-length l) 3)) nil ;base case
      (append (in-order (car ( cdr l ) ) ) (list (car l)) (in-order(car(cdr(cdr l )))) )
    )
)

;node left right
(defun pre-order (l)
    (if (or (null l) (< (list-length l) 3)) nil
        (append (list (car l)) (pre-order (car ( cdr l ) )) (pre-order (car(cdr(cdr l )))))
	)
)


(print (inorder '(+ (- (1 () ()) (* (4 () ())(7 () ()))) (/ (7 () ()) (6 () ())))
))
(print (preorder '(+ (- (1 () ()) (* (4 () ())(7 () ()))) (/ (7 () ()) (6 () ())))
))


(princ (pre-order '(8 (3 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (13 () ()) ()))) ) )