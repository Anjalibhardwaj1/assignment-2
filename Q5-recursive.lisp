;gnu clisp  2.49.60

(defun tribonacci(n)

    (cond
        ((= n 0) NIL)
        
        ((= n 1) 0)
        
        ((= n 2) 0)
        
        ((= n 3) 1)
        
        (T (+ (tribonacci (- n 1)) (tribonacci (- n 2)) (tribonacci(- n 3))))
    )
    
)

(defun tribonacci-seq(n)
    
    (defvar lst '())
    (loop for i from 1 to n
          ; list.append(tribonacci(i))
          do (setf lst (append lst (list (tribonacci i)))))
    lst

)

(print (tribonacci-seq 1))