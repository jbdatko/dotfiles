;;slime

(add-to-list 'load-path "~/.emacs.d/slime-2012-10-30/")  ; your SLIME directory
(add-to-list 'load-path "~/.emacs.d/slime-2012-10-30/contrib/")  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/clisp") ; your Lisp system
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))


(add-hook 'lisp-mode-hook (lambda () (slime-mode t )))
