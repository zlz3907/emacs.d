;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

;; GLOBAL CONFIGURE
(setq user-full-name "Zhong Lizhi")
(setq user-mail-address "zlz.3907@gmail.com")
(set-locale-environment "CHS")

;; R Support
(add-to-list 'load-path "~/gnu/plugins/ess-13.09/lisp")
(require 'ess-site)
(setq org-babel-R-command "C:/Progra~1/R/R-3.0.2/bin/x64/R --slave --no-save")

;; blog-publish
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)
(require 'init-blog-publish)

(org-babel-do-load-languages
     'org-babel-do-load-languages
     '(
       (sh . t)
       (python . t)
       ))

;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)
(require 'init-jdee)

;; YouDao Dict
(defun yodao-dict-search-wordap (&optional word)
  "Use python script dict to look up word under point."
  (interactive)
  (or word (setq word (current-word)))
  (shell-command (format "python ~/gnu/plugins/dict/zdict.py %s %s" word "False")))
(global-set-key [f7] 'yodao-dict-search-wordap)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dictionary-directories (quote ("~/gnu/plugins/auto-complete/ac-dict")))
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(compile-command "~/apache/ant/bin/ant -emacs")
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (tango)))
 '(custom-safe-themes (quote ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#efefef")
 '(indent-tabs-mode nil)
 '(java-mode-hook (quote (ajc-java-complete-mode wisent-java-default-setup my-jde-mode-hook)))
 '(jde-ant-enable-find t)
 '(jde-ant-home "~/apache/ant")
 '(jde-ant-invocation-method (quote ("Java")))
 '(jde-ant-read-target t)
 '(jde-checkstyle-classpath (quote ("~/java/checkstyle-5.6/checkstyle-5.6-all.jar")))
 '(jde-checkstyle-style "~/java/checkstyle-5.6/sun_checks.xml")
 '(jde-compile-enable-kill-buffer nil)
 '(jde-compile-option-debug (quote ("all" (t nil nil))))
 '(jde-compile-option-encoding "utf-8")
 '(jde-compiler (quote ("javac" "")))
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-doc-url "~/java/apidocs/jdk1.7/docs/api/index.html")
 '(jde-jdk-registry (quote (("1.7.0" . "~/java/jdk1.7.0") ("1.6.0" . "~/java/jdk1.6"))))
 '(jde-junit-testrunner-type "org.junit.runner.JUnitCore")
 '(js-auto-indent-flag nil)
 '(js-indent-level 2 t)
 '(keyboard-coding-system (quote utf-8))
 '(make-backup-files nil)
 '(nxml-child-indent 2)
 '(org-display-custom-times t)
 '(org-html-preamble-format nil)
 '(org-time-stamp-custom-formats (quote ("<%Y-%m-%d %w>" . "<%Y-%m-%d %R %w>")))
 '(prefer-coding-system (quote utf-8))
 '(ruby-use-encoding-map nil)
 '(scroll-bar-mode nil)
 '(selection-coding-system (quote utf-16le-dos))
 '(semanticdb-default-save-directory "~/tmp/semanticdb")
 '(session-use-package t nil (session))
 '(set-default-coding-systems (quote utf-8))
 '(set-keyboard-coding-system (quote utf-8))
 '(set-language-environment (quote UTF-8))
 '(set-terminal-coding-system (quote utf-8))
 '(setq locale-coding-system t)
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
 '(tidy-config-file "nil")
 '(unless (eq system-type (quote windows-nt)) t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00") (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829") (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f") (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f") (340 . "#eab700") (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil)
 '(w3m-command "~/w3m/w3m.exe"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
