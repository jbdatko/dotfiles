;; Org mode stuff
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

(setq org-agenda-files (list "~/org/index.org" "~/cs610/cs610.org" "~/cs522/cs522.org"))

(add-to-list 'org-agenda-files "~/Documents/school/drexel/org")

;;Org mode mobile
;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;;Hooks for remember
(global-set-key (kbd "C-c r") 'remember)    ;; (1)
(add-hook 'remember-mode-hook 'org-remember-apply-template) ;; (2)
(setq org-remember-templates
      '((?n "* %U %?\n\n  %i\n  %a" "~/notes.org")))  ;; (3)
(setq remember-annotation-functions '(org-remember-annotation)) ;; (4)
(setq remember-handler-functions '(org-remember-handler)) ;; (5)

(setq org-agenda-include-diary t)

(add-hook 'org-mode-hook
                    (lambda ()
                      (org-set-local 'yas/trigger-key [tab])
                      (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))
