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

;; my script

(defun prj-build (buildfile target &optional interactive-args)
  "Invoke ant build."
  (interactive
   (let* ((buildfile (jde-ant-interactive-get-buildfile))
          (build-history (jde-ant-get-from-history buildfile))
          (targets
           (if jde-ant-read-target
               (if jde-ant-complete-target
                   (if (fboundp 'completing-read-multiple)
                       (completing-read-multiple
                        "Target to build: "
                        (jde-ant-get-target-alist buildfile)
                        nil
                        nil
                        (car build-history)
                        'build-history)
                     (list (completing-read
                            "Target to build: "
                            (jde-ant-get-target-alist buildfile)
                            nil
                            t
                            (car build-history)
                            'build-history)))
                 (list (read-from-minibuffer
                        "Target to build: "
                        (car build-history)
                        nil
                        nil
                        'build-history)))))
          (target
           (jde-ant-escape (mapconcat 'identity targets " ")))
          (interactive-args
           (if jde-ant-read-args
               (read-from-minibuffer
                "Additional build args: "
                (nth 0 jde-ant-interactive-args-history)
                nil nil
                '(jde-ant-interactive-args-history . 1)))))

     ;; Setting the history for future use
     (jde-ant-add-to-history buildfile build-history)

     ;;some of these global variables are defaults.  We should restore then for
     ;;every request.  IE jde-ant-interactive-target and
     ;;jde-ant-interactive-args

     (setq jde-ant-interactive-buildfile buildfile)

     ;;return our new arguments.
     ;;This should be a list of buildfile, target and optional-args.
     (list buildfile target interactive-args)))

  (end-of-line)
  (jde-ant-build buildfile
                 target
                 (if (prj-is-java-sourcefile) ;then
                     (concat interactive-args " -Dtestcase="
                             (jde-parse-get-package-name) "."
                             (jde-parse-get-class-at-point)
                             (let* ((m (jde-parse-get-method-at-point))
                                    (method
                                     (if (eq nil m) ""
                                       (concat " -Dmethods="
                                               (cdr (nth 0 m))))))
                               method))
                   ;; else
                   interactive-args
                   )))

(defun prj-is-java-sourcefile ()
  "If current buffer is java file return t."
  (let (isJava)
    (let* ((bufferNameLenght (length (buffer-name)))
           (isLengthGtFive (> bufferNameLenght 5))
           (isJava
            (and isLengthGtFive
                 (equal ".java"
                        (substring (buffer-name)
                                   (- bufferNameLenght 5))))))
      isJava)))

(defun prj-after-save-hook ()
  "Compile current java file when you save the file."
  (if (prj-is-java-sourcefile)
      (let* ((working-dir (file-name-directory
                          (jde-find-project-file (file-truename "."))))
             (abslute-buildfile-path (concat working-dir jde-ant-buildfile)))
        (if (eq nil (search "/test/" (file-truename "."))) ; then
            (jde-ant-build abslute-buildfile-path
                         "common.compile"
                         (concat "-Dsrc.dir.includes=**/" (buffer-name)))
          ;; else
          (jde-ant-build abslute-buildfile-path
                       "common.compile-test"
                       (concat "-Dsrc.test.includes=**/" (buffer-name)))
        ))
      )
  )
(add-hook 'after-save-hook 'prj-after-save-hook)

(provide 'init-jdee)

;;; init-jdee.el ends here

