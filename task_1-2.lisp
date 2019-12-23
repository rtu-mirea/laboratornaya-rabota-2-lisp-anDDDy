(defconstant L (list 1 9 98 0 9 11 -9 143 22 1))
(defun del (list pos)
(cond
((< pos 0) nil)
((>= pos 0)(let ((fst  (subseq list 0 pos)) (scnd (subseq list pos)))
	        (pop scnd)
		(append fst scnd)))))
(del L 0)
