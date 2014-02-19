;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

;; GLOBAL CONFIGURE
(setq user-full-name "Zhong Lizhi")
(setq user-mail-address "zlz.3907@gmail.com")
(set-locale-environment "ENU")

;; bind insert datetime keys
(require 'init-datetime)

;; Set Font
;; Trebuchet MS, Lucida Grande, Tahoma, Verdana, Arial
;;(require 'init-bhj-fonts)
(require 'init-qiang-set-font)
(qiang-set-font
 ;;'("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
 '("Consolas" "Lucida Grande" "Tahama" "Verdana" "Courier New")
 ":pixelsize=14"
 '("YaHei Consolas Hybrid" "Microsoft Yahei" "黑体" "新宋体" "宋体"))


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
      'org-babel-load-languages
      '((emacs-lisp . t)
        (ruby . t)
        (ditaa . t)
        (python . t)
        (sh . t)
        (R . t)))

;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)
(require 'init-jdee)

;; YouDao Dict
(defun yodao-dict-search-wordap (&optional word)
  "Use python script dict to look up word under point."
  (interactive)
  (or word (setq word (current-word)))
  (shell-command (format "python d:/home/lizhi/gnu/plugins/dict/zdict.py %s %s" word "False")))
(global-set-key [f7] 'yodao-dict-search-wordap)

;;(setq z-keymap (make-sparse-keymap))
;;(define-key emacs-lisp-mode-map (kbd "\C-x \C-a") nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-blue)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(indent-tabs-mode nil)
 '(jde-ant-args "-emacs")
 '(jde-compile-option-debug (quote ("all" (t nil nil))))
 '(jde-compile-option-encoding "utf-8")
 '(jde-compile-option-vm-args (quote ("-Duser.language=en")))
 '(jde-compiler (quote ("javac")))
 '(jde-db-option-vm-args (quote ("-J-Duser.language=en")))
 '(jde-jdk (quote ("1.7")))
 '(jde-jdk-registry (quote (("1.6" . "~/java/jdk1.6") ("1.7" . "~/java/jdk1.7.0"))))
 '(jde-junit-testrunner-type "org.junit.runner.JUnitCore")
 '(jde-run-option-vm-args (quote ("-Duser.language=en")))
 '(js-auto-indent-flag nil)
 '(js-indent-level 2 t)
 '(make-backup-files nil)
 '(nxml-child-indent 2)
 '(org-agenda-files (quote ("~/agenda/2014.org")))
 '(org-time-stamp-custom-formats (quote ("<%Y-%m-%d %w>" . "<%Y-%m-%d %R %w>")))
 '(selection-coding-system (quote utf-16le-dos))
 '(session-use-package t nil (session))
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
 '(tidy-config-file "nil")
 '(unless (eq system-type (quote windows-nt)) t)
 '(w3m-command "~/w3m/w3m.exe"))
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
