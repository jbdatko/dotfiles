;;gnus init info
(setq user-mail-address "jbdatko@gmail.com")
(setq user-full-name "Joshua Datko")


(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "jbdatko@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "datko.net")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


(setq gnus-secondary-select-methods
      '(
	(nnimap "drexel"
		(nnimap-stream ssl)
		(nnimap-address "imap.mail.drexel.edu")
		(nnimap-server-port 993))))

(add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))
;;(setq mail-sources '(maildir :path "~/temp/"
;;			     :subdirs ("cur" "new")))



;; Inline images?
(setq mm-attachment-override-types '("image/.*"))

(setq mm-text-html-renderer 'gnus-w3m)
