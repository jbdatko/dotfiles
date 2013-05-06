(add-to-list 'load-path "/Users/jdatko/.emacs.d/packages/python-mode.el-6.1.1/")
(setq py-install-directory "/Users/jdatko/.emacs.d/packages/python-mode.el-6.1.1/")
(require 'python-mode)

;;ipython
(setq py-shell-name "ipython")
(setq ipython-command "ipython")
(require 'ipython)

;; (require 'pymacs)
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "

;; (setq ropemacs-enable-shortcuts nil)
;; (setq ropemacs-local-prefix "C-c C-p")

;; ;;code completion
;; (setq py-load-pymacs-p t)

;; ;;ropemacs
;; (pymacs-load "ropemacs" "rope-")
;; ;; Automatically save project python buffers before refactorings
;; (setq ropemacs-confirm-saving 'nil)

;;pyflakes
(setq python-check-command "pyflakes")
