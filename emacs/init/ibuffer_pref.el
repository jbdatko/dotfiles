;;iBuffer
(require 'ibuffer)
(setq ibuffer-saved-filter-groups
  (quote (("default"
	    ("Org" ;; all org-related buffers
	      (mode . org-mode))
	    ("gnus"
	     (or
	      (mode . message-mode)
	      (mode . bbdb-mode)
	      (mode . mail-mode)
	      (mode . gnus-group-mode)
	      (mode . gnus-summary-mode)
	      (mode . gnus-article-mode)
	      (name . "^\\.bbdb$")
	      (name . "^\\.newsrc-dribble")
	      ))
	    ("Code" ;; prog stuff not already in MyProjectX
	      (or
		(mode . c-mode)
		(mode . perl-mode)
		(mode . python-mode)
		(mode . scheme-mode)
		(mode . scheme-interaction-mode)
		(mode . prolog-mode)
		(mode . prolog-inferior-mode)
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

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   ((> (buffer-size) 1000000) (format "%7.2fM" (/ (buffer-size) 1000000.0)))
   (t (format "%8d" (buffer-size)))))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only " "
	      (name 22 22 :left :elide)
	      " "
	      (size-h 9 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      filename-and-process)))

(global-set-key (kbd "C-x C-b") 'ibuffer) ;; Use Ibuffer for Buffer List

;; Switching to ibuffer puts the cursor on the most recent buffer
(defadvice ibuffer (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name"
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))

(ad-activate 'ibuffer)
