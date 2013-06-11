;;Emacs 24 seems happy with this setup

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;;(add-to-list 'load-path "/Users/jdatko/.emacs.d/packages/python-mode.el-6.1.1/")
;;(setq py-install-directory "/Users/jdatko/.emacs.d/packages/python-mode.el-6.1.1/")
;;(require 'python-mode)

;;ipython
;;(setq py-shell-name "ipython")
;;(setq ipython-command "ipython")
;;(require 'ipython)


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
;;(setq python-check-command "pyflakes")
