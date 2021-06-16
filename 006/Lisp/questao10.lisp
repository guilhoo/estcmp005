(defun fatorial-aux (num aux)
  (cond
    ((<= num 1) aux)
    (t (fatorial-aux (- num 1) (* num aux)))))
(defun fatorial (num)
  (fatorial-aux num 1))