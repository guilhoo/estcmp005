(defun compactar (vet &aux lista)
  (setq lista '())
  (setq prev NIL)
  (setq cont 1)
  (dolist (i vet)
    (when (equal prev i)
      (incf cont)
    )
    (if prev
      (when (/= prev i)
        (when (equal cont 1)
          (push prev lista)
        )
        (when (> cont 1)
          (setq aux '())
          (push prev aux)
          (push cont aux)
          (setq lista (cons aux lista))
          (setq cont 1)
        )
      )
    )
    (setq prev i)
  )
  ; Acrescentar último item
  (when (equal cont 1)
    (push prev lista)
  )
  (when (> cont 1)
    (setq aux '())
    (push prev aux)
    (push cont aux)
    (setq lista (cons aux lista))
    (setq cont 1)
  )
  (nreverse lista)
)