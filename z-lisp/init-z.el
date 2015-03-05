;;; init-z --- Initializing My Configuration

;;; Commentary:
;; 初化我的个性化配置

;;; Code:
;; GLOBAL CONFIGURE
(set-locale-environment "ENU")

;;(read)
(setq user-full-name "钟立志")
(setq user-mail-address "zhonglizhi@8chedao.com")

;; (set 'chinese-calendar-celestial-stem
;;      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
;; (setq chinese-calendar-terrestrial-branch
;;       ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

;; git completion
;;(require 'pcmpl-git)

;; velocity mode
(require 'vtl)

;; bind insert datetime keys
(require 'init-datetime)

;; R Support
;;(add-to-list 'load-path "~/gnu/plugins/ess-13.09-1/lisp")
(require 'ess-site)
(setq org-babel-R-command "R --slave --no-save")

;; Set Font
;; Trebuchet MS, Lucida Grande, Tahoma, Verdana, Arial
;;(require 'init-bhj-fonts)

(require 'init-qiang-set-font)
(qiang-set-font
 '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
 ":pixelsize=16"
 '("YaHei Consolas Hybrid" "Microsoft Yahei" "黑体" "新宋体" "宋体"))

(require 'init-helm)

;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)
;;(load-file "~/gnu/plugins/org-mode/contrib/lisp/ox-taskjuggler.el")

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
   (calc . t)
   (R . t)))

;; 在迷你缓冲区里显示右括号对应的左括号所在的行
;; (show-paren-mode t)
;; (defadvice show-paren-function (after my-echo-paren-matching-line activate)
;;   "If a matching paren is off-screen, echo the matching line."
;;   (when (char-equal (char-syntax (char-before (point))) ?\))
;;     (let ((matching-text (blink-matching-open)))
;;       (when matching-text
;;         (message matching-text)))))

(require 'ox-taskjuggler)

(require 'init-zorg-capture)

;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)
(require 'init-youdao-dict)
;;(require 'init-jdee)
;;(require 'init-eclim)
(require 'init-java)
;;(global-eclim-mode)

(require 'init-gnus)
(require 'init-bbdb)


(defun browse-url-firefox (url &optional new-window)
  "Ask the Firefox WWW browser to load URL.
  Default to the URL around or before point.  The strings in
  variable `browse-url-firefox-arguments' are also passed to
  Firefox.

  When called interactively, if variable
  `browse-url-new-window-flag' is non-nil, load the document in a
  new Firefox window, otherwise use a random existing one.  A
  non-nil interactive prefix argument reverses the effect of
  `browse-url-new-window-flag'.

  If `browse-url-firefox-new-window-is-tab' is non-nil, then
  whenever a document would otherwise be loaded in a new window, it
  is loaded in a new tab in an existing window instead.

  When called non-interactively, optional second argument
  NEW-WINDOW is used instead of `browse-url-new-window-flag'."
  (interactive (browse-url-interactive-arg "URL: "))
  (setq url (browse-url-encode-url url))
  (let* ((process-environment (browse-url-process-environment))
         (window-args (if (browse-url-maybe-new-window new-window)
                          (if browse-url-firefox-new-window-is-tab
                              '("-new-tab")
                            '("-new-window"))))
         (ff-args (append browse-url-firefox-arguments window-args (list url)))
         (process-name (concat "firefox " url))
         (process (apply 'start-process process-name nil
                         browse-url-firefox-program ff-args) )) ))
;;(require 'neotree)
(provide 'init-z)
;;; init-z.el ends here
