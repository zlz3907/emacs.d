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

;; filter
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

;; send mail

(defun z-selectsmtp-hook ()
  "Select smtp server."
  ;;(interactive)
  (if (message-mail-p)
      (save-excursion
        (let* ((from
                (save-restriction
                  (message-narrow-to-headers)
                  (message-fetch-field "from"))))
          (message "from: %s" from)
          )))
  (smtpmail-send-it))

;;(z-selectsmtp-hook)
;;(add-hook 'message-send-mail-hook 'z-selectsmtp-hook)
;;(add-hook 'mail-send-hook 'z-selectsmtp-hook)
;;(setq smtpmail-smtp-server "smtpcom.263xmail.com")
;;(setq smtpmail-smtp-service 465)
;;(setq smtpmail-stream-type 'ssl)
(setq send-mail-function 'z-selectsmtp-hook)
(setq message-send-mail-function 'z-selectsmtp-hook)

(require 'smtpmail)

(provide 'init-gnus)

;;; init-gnus.el ends here
