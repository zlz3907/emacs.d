;;; init-z --- Initializing My Configuration

;;; Commentary:
;; 初化我的个性化配置

;;; Code:
;; GLOBAL CONFIGURE
(set-locale-environment "ENU")

;;(read)
(setq user-full-name "Bliss Chung")
(setq user-mail-address "bliss@3zso.com")

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
;;(require 'ess-site)
;;(setq org-babel-R-command "R --slave --no-save")

;; Set Font
;; Trebuchet MS, Lucida Grande, Tahoma, Verdana, Arial
;;(require 'init-bhj-fonts)

;; (require 'init-qiang-set-font)
;; (qiang-set-font
;;  '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New")
;;  ":pixelsize=16"
;;  '("YaHei Consolas Hybrid" "Microsoft Yahei" "黑体" "新宋体" "宋体"))

(require 'init-helm)

;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;;(add-to-list 'load-path "~/gnu/plugins/org-mode/lisp")
;;(add-to-list 'load-path "~/gnu/plugins/org-mode/contrib/lisp" t)
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


;; Dependencies 依赖功能
;; YaSnippet 下拉列表功能，补全输入提示时会用到
(require 'yasnippet)
(yas-global-mode 1)
;;(global-set-key (kbd "M-/") 'yas/expand)

;; Emacs的面向对象的实现包
;;(require 'eieio)

;; EDE 工程管理负责编译构建
(require 'ede)
;;(require 'srecode)
(global-ede-mode t)

(require 'semantic/java)

(require 'init-java)
;;(global-eclim-mode)
;; Include the following only if you want to run
;; bash as your shell.

;; Setup Emacs to run bash as its primary shell.
(require 'shell)
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-bash-args '("-login" "-i"))

(if (eq system-type 'windows-nt)
    (defadvice browse-url-generic (around show-window act)
      "*Sets `start-process-show-window' on."
      (let ((w32-start-process-show-window t))
        ad-do-it)))
;; (if (boundp 'w32-quote-process-args)
;;     (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.

;;(load-file "~/gnu/plugins/ajoke/etc/elisp/ajoke.el")

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
