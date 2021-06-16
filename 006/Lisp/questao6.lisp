(defun sequencia (n m)
    (let ((i (+ n m)))
    (let ((i (- i 1)))
    (loop for m from m to i
        do (format t "~d " m)))))