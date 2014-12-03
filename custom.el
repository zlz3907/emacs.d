;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

;; add my lisp
(add-to-list 'load-path (expand-file-name "z-lisp" user-emacs-directory))

;; git completion
;;(require 'pcmpl-git)

;; GLOBAL CONFIGURE
;;(setq user-full-name "Bliss Chung")
;;(setq user-mail-address "bliss@3zso.com")
(set-locale-environment "ENU")
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; velocity mode
(require 'vtl)

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
 ;;'("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
 ;;'("serif" "Tahama" "Verdana" "Courier New")
 '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
 ":pixelsize=16"
 '("YaHei Consolas Hybrid" "Microsoft Yahei" "黑体" "新宋体" "宋体"))

;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)

;; plantuml
(require 'init-plantuml)

(require 'init-blog-publish)
(require 'init-zorg-exportpdf)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (ditaa . t)
   (python . t)
   (sh . t)
   (plantuml . t)
   (latex . t)
   (R . t)))

(require 'ox-taskjuggler)

(require 'init-zorg-capture)

;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)
(require 'init-youdao-dict)
(require 'init-jdee)


(require 'init-gnus)
(require 'init-bbdb)

;;(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
;;(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bbdb-file "/home/lizhi/.bbdb.gpg")
 '(browse-url-browser-function (quote browse-url-firefox))
 '(canlock-password "90e0c564e3c4b436c584cc82b82e76914f7581f7")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes (quote ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(jde-ant-home "~/apache/ant")
 '(jde-ant-program "~/apache/ant/bin/ant")
 '(jde-build-function (quote prj-build))
 '(jde-global-classpath (quote ("~/java/jdk/" "build/main")))
 '(jde-sourcepath (quote ("~/java/jdk1.8.0_05/src.zip" "~/.ivy2/sources/*/*.jar" "~/workspace/*/*/src")))
 '(large-file-warning-threshold 60000000)
 '(org-agenda-files (quote ("~/org/2014")))
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(package-archives (quote (("melpa-stable" . "http://stable.melpa.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/") ("org" . "http://orgmode.org/elpa/") ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(semantic-idle-scheduler-idle-time 3600)
 '(semanticdb-default-save-directory "~/tmp/semanticdb")
 '(session-use-package t nil (session))
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
