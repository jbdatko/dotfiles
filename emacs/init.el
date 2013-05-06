;; Josh Datko's Emacs config


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

;;initial geometry
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 80))

;;Fix the path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin"))) ;;homebrew
(setq exec-path (append exec-path '("/usr/texbin"))) ;;latex
(setq exec-path (append exec-path '("~/ipython/")))


;;load other init files
(load "~/.emacs.d/init/cedet")
(load "~/.emacs.d/init/gnus")
(load "~/.emacs.d/init/org")
(load "~/.emacs.d/init/desktop")
(load "~/.emacs.d/init/ibuffer")
(load "~/.emacs.d/init/eshell")
(load "~/.emacs.d/init/unfill")
(load "~/.emacs.d/init/themes")
(load "~/.emacs.d/init/lisp")
(load "~/.emacs.d/init/latex")
(load "~/.emacs.d/init/keys")
(load "~/.emacs.d/init/yasnippet")
(load "~/.emacs.d/init/pref") ;; most of Emacs personal customization is here
(load "~/.emacs.d/init/python")
(load "~/.emacs.d/init/erc")

;;auto-byte compile
(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode and
compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(add-hook 'after-save-hook 'byte-compile-current-buffer)




(setq ispell-program-name "aspell"
      ispell-dictionary "english")

;;Flyspell with text mode
(add-hook 'text-mode-hook 'flyspell-mode)

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
(add-hook 'c-mode-common-hook
  (lambda()
    (require 'dtrt-indent)
    (dtrt-indent-mode t)))

;;flymake
(add-to-list 'load-path "~/.emacs.d/packages/emacs-flymake/")
(require 'flymake)

;;don't open up new frames by default
(setq ns-pop-up-frames nil)

(windmove-default-keybindings)

(winner-mode 1)

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


;;magit
(global-set-key (kbd "C-x g") 'magit-status)

;;expand-region
(add-to-list 'load-path "~/.emacs.d/packages/expand-region.el/")
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(pending-delete-mode t)

;;term (shell) stuff
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;;jdee stuff, mainly kept for reference
(custom-set-variables

 '(jde-global-classpath (split-string classpath jde-classpath-separator))
 '(jde-jdk-registry (quote (("1.6.0" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0"))))
 '(jde-sourcepath (quote ("/Users/jdatko/cs510/svn/othello/trunk/src/")))
 '(transient-mark-mode nil))


;;custome jdee stuff for my current project
(setq jde-make-working-directory "/Users/jdatko/cs510/svn/othello/trunk")
(add-to-list 'jde-global-classpath "/Users/jdatko/cs510/svn/othello/trunk/classes/")
(setq jde-run-application-class "edu.drexel.cs.ai.othello.Othello")
(setq jde-run-working-directory "/Users/jdatko/cs510/svn/othello/trunk")

(setq scheme-program-name
      "/usr/local/Cellar/mit-scheme/9.1.1/bin/mit-scheme")
(require 'xscheme)
