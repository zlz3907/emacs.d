;;; init-gnus.el -- gnus configure

;;; Commentary:
;; Author: Bliss Chung
;; Version: 1.0

;;; Code:
(require 'smtpmail)
(require 'gnus)
(require 'nnmail)

;;(require 'spam)

(setq gnus-select-method '(nnml ""))
;;(setq mail-sources '((file :path "~/Mail/8chedao.spool")))

;; 在组视图里按 ^ 键可以进行服务器定制界面，按a添加下面的内容也可以的
;; (nnimap "Mail"
;;         (nnimap-address "localhost")
;;         (nnimap-stream network)
;;         (nnimap-authenticator login)
;;         (nnimap-split-inbox "INBOX")
;;         (nnimap-split-methods
;;          '(|
;;            ("X-Spam-Status" "Yes.*" "Spamassassined")
;;            ("subject" "emacs" "emacs")
;;            ("subject" "test" "test)"
;;            ("from" ".*@youtube\\.com" "youtube")
;;            ("from" ".*@amazon\\.com" "amazon")
;;            ("from" ".*@nagios\\.com" "nagios")
;;            ("from" ".*@twitter\\.com" "twitter")
;;            ("from" ".*@google\\.com" "google")
;;            "INBOX")))


;; (setq gnus-secondary-select-methods
;;       '((nnimap "Mail"
;;                 (nnimap-address "localhost")
;;                 (nnimap-stream network)
;;                 (nnimap-authenticator login)
;;                 (nnimap-inbox "INBOX")
;;                 (nnimap-split-methods default))))

;; filter
;; see: spamassassin
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
(setq smtpmail-smtp-server "smtp.3zso.com")
(setq smtpmail-smtp-service 587)


;;(setq smtpmail-stream-type nil)
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
  (let* ((netrc (netrc-parse (expand-file-name "~/.mail/.config/.authinfo.gpg")))
         (hostentry (netrc-account-machine netrc host account port port)))
    ;;(message "host: %s" hostentry)
    (when hostentry (netrc-get hostentry "password"))))

;;(message "%s" (offlineimap-get-password "imap.3zso.com" "bliss@3zso.com" "25"))
;; (setq smtpmail-auth-credentials
;;       (list (smtpmail-smtp-server
;;              smtpmail-smtp-service
;;              "bliss@3zso.com"
;;              "")))

(provide 'init-gnus)

;;; init-gnus.el ends here
