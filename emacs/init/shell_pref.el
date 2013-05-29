;;term and shell stuff

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


(setq explicit-shell-file-name "/bin/bash")



;;eshell
(defun base-name (path)
  "Returns the base name of the given path."
  (let ((path (abbreviate-file-name path)))
    (if (string-match "\\(.*\\)/\\(.*\\)$" path)
 (if (= 0 (length (match-string 1 path)))
     (concat "/" (match-string 2 path))
   (match-string 2 path))
      path)))

(defun host-name ()
  "Returns the name of the current host minus the domain."
  (let ((hostname (downcase (system-name))))
    (save-match-data
      (substring hostname (string-match "^[^.]+" hostname) (match-end 0)))))

(setq eshell-prompt-function
      (lambda ()
 (concat (user-login-name)
  "@"
  (host-name)
  " "
  (base-name (eshell/pwd))
  (if (= (user-uid) 0) " # " " $ "))))

(setq eshell-prompt-regexp "^[^@]*@[^ ]* [^ ]* [$#] ")

(setq eshell-highlight-prompt nil)
