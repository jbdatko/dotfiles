;;iBuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
  (quote (("default"
            ("Org" ;; all org-related buffers
              (mode . org-mode))
            ("Mail"
              (or  ;; mail-related buffers
               (mode . message-mode)
               (mode . mail-mode)
               ;; etc.; all your mail related modes
               ))
            ("Code" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . perl-mode)
                (mode . python-mode)
		(mode . scheme-mode)
                ;; etc
                ))
	    ("Emacs Lisp"
	     (mode . emacs-lisp-mode))
	    ("tux" ;;drexel cs computer
	     (filename . "/ssh:jbd65@tux:~/.emacs"))
            ("ERC"   (mode . erc-mode))
	    ("Fundamental"
	     (mode . fundamental-mode))
	    ("Text"
	     (mode . text-mode))
	    ("LaTeX"
	     (or
	      (mode . bibtex-mode)
	      (mode . latex-mode)))
	    ("dired" (mode . dired-mode))
))))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))


(global-set-key (kbd "C-x C-b") 'ibuffer) ;; Use Ibuffer for Buffer List
