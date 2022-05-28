(defun bst-p (L)
(cond 

( (null L)
   t
)

( (and (not (null (caar (cdr L)) )) (> (caar (cdr L)) (car L) )) 
    nil
) ;left element > head
    

( (and (not (null (caar (cddr L)) )) (<= (caar (cddr L)) (car L) ));right element <= head
    nil
) 

(t 
  (and (bst-p (car (cdr L))) (bst-p (car (cddr L)))  )
)

)
)

(write (bst-p '(8 (3 () () ) (80 () ()) ) ) )