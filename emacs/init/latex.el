;;LaTeX stuff
(getenv "PATH")
 (setenv "PATH"
(concat
 "/usr/texbin" ":"

(getenv "PATH")))

(setq TeX-auto-save t)
    (setq TeX-parse-self t)
    (setq-default TeX-master nil)
    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'latex-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (setq reftex-plug-into-AUCTeX t)
