(defun interseccao ( l1 l2 )
  (if l1
    (if (member (car l1) l2)
      (cons (car l1) (interseccao (cdr l1) l2))
      (interseccao (cdr l1) l2)
    )
  )
)