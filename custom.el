;;; custom.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:

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
 '(browse-url-temp-dir "~/tmp/")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-blue)))
 '(custom-safe-themes (quote ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(elfeed-feeds (quote ("http://www.infoq.com/cn/feed?token=A1EBwUuLqFnk6dcHrODaIjx3jvaUr7O1" "http://www.reddit.com/r/emacs/.rss" "https://www.google.com.hk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&ved=0CCoQFjAA&url=%68%74%74%70%3a%2f%2f%77%77%77%2e%72%65%64%64%69%74%2e%63%6f%6d%2f%72%2f%65%6d%61%63%73%2f%2e%72%73%73&ei=uHIHU52nEIWPkAWxsIHIBw&usg=AFQjCNFmrFfF9u9KM6Du6X1jv-Rwmnq64Q&sig2=9i9kXpjY_zJ67Z8X4c4T1A")))
 '(jde-junit-testrunner-type "org.junit.runner.JUnitCore")
 '(org-agenda-files (quote ("~/workspace/agenda/2014.org")))
 '(org-babel-remote-temporary-directory "~/tmp/")
 '(org-time-stamp-custom-formats (quote ("<%m/%d/%y %u>" . "<%m/%d/%y %u %H:%M>")))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; custom.el ends here
