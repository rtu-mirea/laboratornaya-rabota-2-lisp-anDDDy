(defconstant L (list 1 1 1 1 0 1 0 1 1 0 0 0 1 1))

(defun comprsf (all i)
    (if (= (nth 1 i) (nth 1 (car all)))
        (append (list (list (+ 1 (nth 0 (car all))) (nth 1 i))) (cdr all))
        (append (list i) all)
    )
)

(defun mapf (i)
    (list 1 i)
)

(defun unmapf (i)
    (if (= (nth 0 i) 1)
        (nth 1 i)
        i
    )
)

(defun list_of (cnt item)
    (if (= cnt 0)
        `()
        (cons item (list_of (- cnt 1) item))
    )
)

(defun deccomprsf (all i)
    (append
        (if (consp i)
            (list_of (nth 0 i) (nth 1 i))
            (list i)
        )
        all
    )
)

(defun compress_list (lst)
    (map 'list #'unmapf
        (cdr
            (reverse
                (reduce
                    #'comprsf
                    (map 'list #'mapf lst)
                    :initial-value (list(list 1 -1))
                 )
             )
         )
    )
)

(defun decompress_list (lst)
    (reverse(reduce #'deccomprsf lst :initial-value (list)))
)

(compress_list L)

(decompress_list (compress_list L))
