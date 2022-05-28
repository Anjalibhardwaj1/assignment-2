(defun flatten-nums (L) 
(cond 
( (null L) 
   '()
) 

( (listp (car L)) 
   (append (flatten-nums-nodup (car L)) (flatten-nums-nodup (cdr L))) 
)

( (not (numberp (car L)))
    (flatten-nums-nodup (cdr L))
)

(t 
  (cons (car L) (flatten-nums-nodup (cdr L)) ) 
)

)
)
(defun elim (elt L)
(cond 
((null L)
   L
)


((eql elt (car L))
   (elim elt (cdr L))
)

(t 
  (cons (car L) (elim elt (cdr L) ) )
)

)
)

(defun nodups (L)
(cond 
((null L) 
   L 
)

((member (car L) (cdr L) ) 
  (elim (car L) (cdr L))
)

(t 
  (cons (car L) (nodups (cdr L)))
)
)
)

(defun flatten-nums-nodup (L)
(nodups (flatten-nums L)) 
)


(print (flatten-nums-nodup '(1 2 (3 1) (a 2.5) (2 4.5) ((1 2)) )
))