;;Non external package preferences should go here

;;initial geometry
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 80))

;;Set the font
(set-face-attribute 'default nil :font "Ubuntu Mono-14")

;; Use the command key as meta
(setq mac-command-modifier 'meta)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;;default mode for new buffers to text mode
(setq-default major-mode 'text-mode)

;; Highlight regions and add special behavior to regions
;; "C-h d transient" for more info
;;(setq transient-mark-mode t)

;; Display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Display line numbers on the left side
(require 'linum)
(line-number-mode 1)
(column-number-mode 1)  ;; Line numbers on left most column
(global-linum-mode 1)

;; Show matching parens
(show-paren-mode t)

;;turn off the bell
(setq visible-bell t)

;; Line-Wrapping column length
(set-default 'fill-column 79)

;; All backup files go to the same place
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Deleting trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'whitespace-cleanup)
;;makefiles are specials (tabs...)
(add-hook 'makefile-mode-hook 'indent-tabs-mode)

;; Merges the clipboard with the kill ring
(setq x-select-enable-clipboard t)

;;I hit M-q too much so...
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;turn off tool and menu bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;;undo-tree
(require 'undo-tree)

;;spelling
(setq ispell-program-name "aspell"
      ispell-dictionary "english")

;;Flyspell with text mode
(add-hook 'text-mode-hook 'flyspell-mode)

;;don't open up new frames by default
(setq ns-pop-up-frames nil)

(windmove-default-keybindings)

(winner-mode 1)

;;magit shortcut
(global-set-key (kbd "C-x g") 'magit-status)

;;hooks
(add-hook 'scheme-mode-hook 'auto-fill-mode)
(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'auto-fill-mode)

(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
	 (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))


;; view full path in frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (abbreviate-file-name (buffer-file-name))
		 "%b"))))

(global-hl-line-mode +1)

(defun open-with (arg)
  "Open visited file in default external program. With a prefix ARG always
prompt for command to use."
  (interactive "P")
  (when buffer-file-name
    (shell-command (concat
		    (cond
		     ((and (not arg) (eq system-type 'darwin)) "open")
		     ((and (not arg) (member system-type '(gnu gnu/linux gnu/kfreebsd))) "xdg-open")
		     (t (read-shell-command "Open current file with: ")))
		    " "
		    (shell-quote-argument buffer-file-name)))))
