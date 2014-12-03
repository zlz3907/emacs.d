;;; init-gnus.el -- gnus configure

;;; Commentary:
;; Author: Bliss Chung
;; Version: 1.0

;;; Code:

(setq gnus-select-method '(nnml ""))
;;(setq mail-sources '((file :path "~/Mail/8chedao.spool")))

;; (setq gnus-secondary-select-methods
;;       '((nnimap "8chedao"
;;                 (nnimap-address "imapcom.263xmail.com")
;;                 (nnimap-stream network)
;;                 (nnimap-authenticator login)
;;                 (nnimap-authinfo-file "~/.authinfo.gpg")
;;                 (nnimap-port 143))
;;         ))


(setq nnimap-split-inbox "INBOX")
(setq nnimap-split-predicate "UNDELETED")
(setq nnmail-split-fancy
      '(|
        ("X-Spam-Status" "Yes.*" "Spamassassined")
        ("subject" "emacs" "emacs")
        ("from" ".*@youtube\\.com" "youtube")
        ("from" ".*@amazon\\.com" "amazon")
        ("from" ".*@nagios\\.com" "nagios")
        ("from" ".*@twitter\\.com" "twitter")
        ("from" ".*@google\\.com" "google")
        "INBOX")
      )
(setq nnimap-split-rule 'nnmail-split-fancy)
(setq nnmail-split-methods 'nnmail-split-fancy)
(gnus-registry-initialize)

;;(setq mm-automatic-display (remove "text/html" mm-automatic-display))
;;(setq mm-text-html-renderer nil)
;; (defun wicked/gnus-article-show-html ()
;;   "Show the current message as HTML mail."
;;   (interactive)
;;   (let ((mm-automatic-display (cons "text/html" mm-automatic-display)))
;;     (gnus-summary-show-article)))
;; (define-key gnus-article-mode-map "WH" 'wicked/gnus-article-show-html)

;; msmtp start -------------------------------------------------------
;; This is needed to allow msmtp to do its magic:
;;;(setq message-sendmail-f-is-evil 't)

;;need to tell msmtp which account we're using
;;;(setq message-sendmail-extra-arguments '("--read-envelope-from"))

;; with Emacs 23.1, you have to set this explicitly (in MS Windows)
;; otherwise it tries to send through OS associated mail client
;;;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;; we substitute sendmail with msmtp
;;;(setq sendmail-program "msmtp")
;;need to tell msmtp which account we're using
;;(setq message-sendmail-extra-arguments '("-a" "personal"))
;; msmtp end ---------------------------------------------------------

;; send mail
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)
(setq smtpmail-stream-type 'ssl)
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it)

(require 'smtpmail)

(provide 'init-gnus)

;;; init-gnus.el ends here
