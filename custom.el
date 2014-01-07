;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

;; GLOBAL CONFIGURE
(setq user-full-name "Zhong Lizhi")
(setq user-mail-address "zlz.3907@gmail.com")

;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)

(require 'init-blog-publish)
(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
        (ruby . t)
        (ditaa . t)
        (python . t)
        (sh . t)
        (R . t)))

;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)
(require 'init-youdao-dict)
(require 'init-jdee)

;;(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
;;(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(org-time-stamp-custom-formats (quote ("<%m/%d/%y %u>" . "<%m/%d/%y %u %H:%M>")))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
