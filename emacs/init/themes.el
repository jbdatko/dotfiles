;;Emacs 24 uses a different theme package
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; This is the Emacs 23 way
;(require 'color-theme)
;(color-theme-initialize)
;(load-file "~/.emacs.d/color-theme-wombat.el")
;(color-theme-wombat)
