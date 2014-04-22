;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

;; git completion
(require 'pcmpl-git)

;; GLOBAL CONFIGURE
(setq user-full-name "Zhong Lizhi")
(setq user-mail-address "zlz.3907@gmail.com")

;; bind insert datetime keys
(require 'init-datetime)

;; R Support
(add-to-list 'load-path "~/gnu/plugins/ess-13.09-1/lisp")
(require 'ess-site)
(setq org-babel-R-command "R --slave --no-save")

;; Set Font
;; Trebuchet MS, Lucida Grande, Tahoma, Verdana, Arial
;;(require 'init-bhj-fonts)

(require 'init-qiang-set-font)
(qiang-set-font
;; '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
 '("Ubuntu Mono" "Monospace" "Tahama" "Verdana" "Courier New")
 ":pixelsize=16"
 '("YaHei Consolas Hybrid" "Microsoft Yahei" "黑体" "新宋体" "宋体"))

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
        (latex . t)
        (R . t)))

(require 'ox-taskjuggler)

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
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(global-linum-mode t)
 '(jde-checkstyle-finish-hook nil)
 '(jde-checkstyle-style "~/gnu/plugins/jdee/java/lib/sun_checks.xml")
 '(large-file-warning-threshold 60000000)
 '(org-export-backends (quote (ascii html icalendar latex taskjuggler)))
 '(org-taskjuggler-valid-resource-attributes (quote (limits vacation shift booking efficiency journalentry rate workinghours flags chargeset email fail leaveallowance leaves managers purge resource shifts supplement vacation warn workinghours)))
 '(semantic-idle-scheduler-idle-time 432000)
 '(semanticdb-default-save-directory "~/tmp/semanticdb")
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
