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
(setq user-full-name "Bliss Chung")
(setq user-mail-address "bliss@3zso.com")
(set-locale-environment "ENU")
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; email
(require 'init-mail)

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
 '("Consolas" "Lucida Grande" "Tahama" "Verdana" "Courier New")
 ":pixelsize=14"
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
        ;;(latex . t)
        (R . t)))

(require 'ox-taskjuggler)

(require 'init-zorg-capture)

;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)
(require 'init-youdao-dict)
(require 'init-jdee)

;;(setq z-keymap (make-sparse-keymap))
;;(define-key emacs-lisp-mode-map (kbd "\C-x \C-a") nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(jde-ant-home "~/apache/ant")
 '(jde-jdk-doc-url "http://docs.oracle.com/javase/7/docs/api/")
 '(jde-sourcepath (quote ("~/java/jdk1.8.0_05/src.zip" "~/.ivy2/*/*/*/*/sources/*.jar")))
 '(large-file-warning-threshold 60000000)
 '(org-agenda-files (quote ("~/org/2014")))
 '(org-mobile-directory "E:/Dropbox/Apps/MobileOrg")
 '(semantic-idle-scheduler-idle-time 3600)
 '(semanticdb-default-save-directory "~/tmp/semanticdb")
 '(send-mail-function nil)
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set coding
(set-language-environment 'Chinese-GBK)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)

(prefer-coding-system 'cp950)
(prefer-coding-system 'gb2312)
(prefer-coding-system 'cp936)
(prefer-coding-system 'gb18030)
(prefer-coding-system 'utf-16)
(prefer-coding-system 'utf-8-dos)
(prefer-coding-system 'utf-8-unix)

;;; custom.el ends here
