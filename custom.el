;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

;; add my lisp
(add-to-list 'load-path (expand-file-name "z-lisp" user-emacs-directory))
;; initialization
(require 'init-z)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bbdb-file "~/.bbdb.gpg")
 '(browse-url-firefox-new-window-is-tab t)
 '(browse-url-mozilla-new-window-is-tab t)
 '(c-basic-offset 2)
 '(canlock-password "90e0c564e3c4b436c584cc82b82e76914f7581f7")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(ecb-options-version "2.40")
 '(ecb-source-path
   (quote
    ("~/java/jdk1.8.0_05/src.zip" "~/.ivy2/sources/*/*.jar" "/media/zhong/3ZSO/workspace/*/src" "~/workspace/*/*/src" "~/projects/*/src"
     ("/" "/"))))
 '(eclim-eclipse-dirs (quote ("~/programs/eclipse")))
 '(eclim-executable "~/programs/eclipse/eclim")
 '(eclimd-default-workspace "~/projects")
 '(ede-project-directories
   (quote
    ("/home/zhong/projects/cedet-example/ede-java" "/home/zhong/projects/cedet-example/ede-test")))
 '(gnus-summary-line-format "%U%R%z%I %d %(%[%4L: %-23,23f%]%) %s
")
 '(jde-ant-home "~/apache/ant")
 '(jde-ant-program "~/apache/ant/bin/ant")
 '(jde-build-function (quote prj-build))
 '(jde-global-classpath (quote ("~/java/jdk/" "build/main")))
 '(jde-sourcepath
   (quote
    ("~/java/jdk1.8.0_05/src.zip" "~/.ivy2/sources/*/*.jar" "~/workspace/*/*/src" "~/projects/*/src")))
 '(large-file-warning-threshold 60000000)
 '(mm-tmp-directory "~/tmp/")
 '(org-agenda-files (quote ("~/org/2014" "~/org/2015" "/media/zhong/3ZSO/org")))
 '(org-ditaa-jar-path "~/gnu/plugins/org-mode/contrib/scripts/ditaa.jar")
 '(org-export-latex-verbatim-wrap
   (quote
    ("\\begin{minted}[bgcolor=mintedbg]{text}
" . "\\end{minted}")))
 '(org-html-postamble nil)
 '(org-html-preamble nil)
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(semantic-idle-scheduler-idle-time 3600)
 '(semantic-java-dependency-system-include-path (quote ("~/java/jdk1.7.0")))
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
