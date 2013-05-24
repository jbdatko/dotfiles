(require 'tls)
(load "~/.ercpass.gpg")
(require 'erc-services)

(erc-spelling-mode 1)
(erc-services-mode 1)

;;hide notices
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; (setq erc-prompt-for-nickserv-password nil)
;; (setq erc-nickserv-passwords
;;       `((freenode     (("jbdatko" . ,freenode-jbdatko-pass)))))

(setq erc-user-full-name "Josh Datko")
(setq erc-email-userid "jbdatko@gmail.com")

 ; M-x start-irc
 (defun start-irc ()
   "Connect to IRC."
   (interactive)
   (erc-tls :server "irc.freenode.net" :port 6697
        :nick "jbdatko" :full-name "Josh Datko" :password freenode-jbdatko-pass))

   ;; (erc-tls :server "irc.freenode.net" :port 6697
   ;;      :nick "jbdatko" :full-name "Josh Datko" :password freenode-jbdatko-pass))
;;   (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs"))))

;;for highlight nicks
(and
 (require 'erc-highlight-nicknames)
 (add-to-list 'erc-modules 'highlight-nicknames)
 (erc-update-modules))

;;bitlbee stuff
;;; from http://nflath.com/2009/10/bitlbee-and-emacs/
(defun erc-ignore-unimportant (msg)
  (if (or (string-match "*** localhost has changed mode for &bitlbee to" msg)
          (string-match "Account already online" msg)
          (string-match "Unknown error while loading configuration" msg))
      (setq erc-insert-this nil)))
(add-hook 'erc-insert-pre-hook 'erc-ignore-unimportant)

(setq erc-keywords '((".*Online.*" (:foreground "green"))
                     (".*Busy" (:foreground "red"))
                     (".*Away" (:foreground "red"))
                     (".*Idle" (:foreground "orange"))
                     ))
