(defun uniao (lista1 lista2)
    (if (null lista1)
        lista2
        (cons (car lista1) (uniao (cdr lista1) lista2))))