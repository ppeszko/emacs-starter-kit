;;
(defun test-emacs ()
  (interactive)
  (progn
    (set-buffer (current-buffer))
    (insert "hola mundo")))