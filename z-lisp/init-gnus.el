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


;; python api
(require 'netrc)
(defun netrc-account-machine (list machine account &optional port defaultport)
  "Return the netrc values from LIST for MACHINE or for the default entry.
       If PORT specified, only return entries with matching port tokens.
       Entries without port tokens default to DEFAULTPORT."
  (let ((rest list)
        result)
    (while list
      (when (and (equal (cdr (assoc "machine" (car list))) machine)
                 (equal (cdr (assoc "login" (car list))) account))
        (push (car list) result))
      (pop list))
    (unless result
      ;; No machine name matches, so we look for default entries.
      (while rest
        (when (assoc "default" (car rest))
          (let ((elem (car rest)))
            (setq elem (delete (assoc "default" elem) elem))
            (push elem result)))
        (pop rest)))
    (when result
      (setq result (nreverse result))
      (if (not port)
          (car result)
        (while (and result
                    (not (netrc-port-equal
                          (or port defaultport "nntp")
                          ;; when port is not given in the netrc file,
                          ;; it should mean "any port"
                          (or (netrc-get (car result) "port")
                              defaultport port))))
          (pop result))
        (car result)))))

(defun offlineimap-get-password (host account port)
  (let* ((netrc (netrc-parse (expand-file-name "~/.authinfo.gpg")))
         (hostentry (netrc-account-machine netrc host account port port)))
    ;;(message "host: %s" hostentry)
    (when hostentry (netrc-get hostentry "password"))))

(provide 'init-gnus)

;;; init-gnus.el ends here
