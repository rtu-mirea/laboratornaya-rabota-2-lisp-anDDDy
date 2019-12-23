(defconstant L (list 1 9 98 0 9 11 -9 143 22 1))
(defun insert (list elem pos)
(cond
((< pos 0) nil)
((>= pos 0)(let ((fst  (subseq list 0 pos)) (scnd (subseq list pos)))
        (push elem scnd)
        (append fst scnd)))))
(insert L 1985 4)
