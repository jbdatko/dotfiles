;; Josh Datko's Emacs config

;; Quick access to this file from
;;   http://emacsredux.com/blog/2013/05/18/instant-access-to-init-dot-el/
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c I") 'find-user-init-file)

;; Recommend for use of emacsclient as the editor
(require 'server)
(server-start)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("Tromey" . "http://tromey.com/elpa/")
	("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


(add-to-list 'load-path "~/.emacs.d/packages/")


;;Fix the path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin"))) ;;homebrew
(setq exec-path (append exec-path '("/usr/texbin"))) ;;latex
(setq exec-path (append exec-path '("~/ipython/")))


;;load other init files
(load "~/.emacs.d/init/pref") ;; most of Emacs personal customization is here
(load "~/.emacs.d/init/cedet")
(load "~/.emacs.d/init/gnus")
(load "~/.emacs.d/init/org")
(load "~/.emacs.d/init/desktop")
(load "~/.emacs.d/init/ibuffer")
(load "~/.emacs.d/init/shell_pref")
(load "~/.emacs.d/init/unfill")
(load "~/.emacs.d/init/themes")
(load "~/.emacs.d/init/lisp")
(load "~/.emacs.d/init/latex")
(load "~/.emacs.d/init/keys")
(load "~/.emacs.d/init/yasnippet")
(load "~/.emacs.d/init/python")
(load "~/.emacs.d/init/erc")
(load "~/.emacs.d/init/scheme_pref")
(load "~/.emacs.d/init/java_pref")

;;auto-byte compile
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and
compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)



;;markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for
editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))

;;autopair magic
(require 'autopair)
(autopair-global-mode)

;;autocomplete
(require 'auto-complete-config)
(ac-config-default)


;;tramp
(setq tramp-default-method "ssh")

;;auto detect indent
;;http://emacs-fu.blogspot.com/2008/12/auto-detecting-indentation-style.html
(declare-function dtrt-indent-mode "dtrt-indent.el" boolean)
(add-hook 'c-mode-common-hook
  (lambda()
    (require 'dtrt-indent)
    (dtrt-indent-mode t)))

;;flymake
(add-to-list 'load-path "~/.emacs.d/packages/emacs-flymake/")
(require 'flymake)


;;ido mode
(require 'ido)
(ido-mode t)

;;diredx
 (add-hook 'dired-load-hook
               (lambda ()
                 ;; Bind dired-x-find-file.
                 (setq dired-x-hands-off-my-keys nil)
                 (load "dired-x")
                 ))

(ido-hacks-mode 1)

(pending-delete-mode t)
