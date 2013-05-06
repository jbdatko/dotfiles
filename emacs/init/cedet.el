;;jdee and cedet
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet-1.1/common")
(load-file "/usr/share/emacs/site-lisp/cedet-1.1/common/cedet.el")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/jdee-2.4.0.1/lisp")
(require 'jde)
(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")
