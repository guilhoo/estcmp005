(defun fatorial (n)
    (if (= n 0)
        1
        (* n (fatorial (- n 1)))))
