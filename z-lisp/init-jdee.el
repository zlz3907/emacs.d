;;; init-jdee.el --- Java Env.

;;; Commentary:
;;

;;; Code:
;; jde
(setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/jdee/lisp"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/semantic"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/speedbar"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/elib"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/eieio"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/cogre"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/ede"))
(load-file "~/gnu/plugins/cedet/common/cedet.el")

;;(setq defer-loading-jde nil)

(setq defer-loading-jde t)
(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))
;;(require 'jde)

;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-jde-mode-hook ()
  (setq c-basic-offset 2))

(add-hook 'java-mode-hook 'my-jde-mode-hook)

;; Include the following only if you want to run
;; bash as your shell.

;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))
(if (boundp 'w32-quote-process-args)
    (setq w32-quote-process-args ?\")) ;; Include only for MS Windows.

;;YaSnippet
(add-to-list 'load-path "~/gnu/plugins/yasnippet")
(require 'yasnippet)
;(autoload 'yasnippet "yasnippet" "Select yasnippet" t)
(yas-global-mode 1)

;; auto complete
;(add-to-list 'load-path "~/gnu/plugins/auto-complete") ;; This may not be appeared if you have already added.
;;(add-to-list 'ac-dictionary-directories "~/emacs-24.2/plugin/auto-complete/ac-dict")
;(require 'auto-complete-config)
;(autoload 'auto-complete-config "auto-complete-config" "Select auto-complete-config" t)
;(ac-config-default)

;; auto java complete
(add-to-list 'load-path "~/gnu/plugins/ajc-java-complete/")
(require 'ajc-java-complete-config)
;(autoload 'ajc-java-complete-config "ajc-java-complete-config" "Select ajc-java-complete-config")
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;; junit
;(require 'jde-junit)
;(require 'jde-ant)
(autoload 'jde-junit "jde-junit" "Select jde-junit" t)
(autoload 'jde-ant "jde-ant" "Select jde-ant" t)

(provide 'init-jdee)

;;; init-jdee.el ends here

