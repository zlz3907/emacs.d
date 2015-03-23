;;; init-java.el -- configure java
;;; Commentary:
;;

;;; Code:

;; cedet
;; (load-file "~/gnu/plugins/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu


;; jde 加载类文件
(setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/jdee/lisp"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/semantic"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/speedbar"))
(add-to-list 'load-path (expand-file-name "~/gnu/plugins/elib"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/eieio"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/cogre"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/ede"))
;;(load-file "~/gnu/plugins/cedet/common/cedet.el")

;;(setq defer-loading-jde nil)

(ac-config-default)
;;(ac-set-trigger-key "TAB")
;;(ac-set-trigger-key "<tab>")
;; Dependencies 依赖功能
;; YaSnippet 下拉列表功能，补全输入提示时会用到
(require 'yasnippet)
(yas-global-mode 1)
;;(global-set-key (kbd "M-/") 'yas/expand)

;; Emacs的面向对象的实现包
;;(require 'eieio)

;; EDE 工程管理负责编译构建
(require 'ede)
(require 'srecode)
(global-ede-mode t)

;; 代码浏览器，激活后有点像eclipse布局
(require 'ecb)
;;(require 'semantic-java)

(require 'semantic/java)

;; JDEE Configure 下面这段才是JDEE的相关配置
;; (setq defer-loading-jde t)
;; 这一段用来判断是否激活jde-mode
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

(if (prj-is-java-sourcefile)
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))
;;(require 'jde)

;;(add-hook 'java-mode-hook 'my-jde-mode-hook)

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

;; auto complete
;;(require 'auto-complete-config)
;;(ac-config-default)

;; auto java complete
(add-to-list 'load-path "~/gnu/plugins/ajc-java-complete/")
(require 'ajc-java-complete-config)
(add-hook 'java-mode-hook 'ajc-java-complete-mode)
;;(add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)

;; junit
(require 'jde-junit)
(require 'jde-ant)
;;(autoload 'jde-junit "jde-junit" "Select jde-junit" t)
;;(autoload 'jde-ant "jde-ant" "Select jde-ant" t)

;; jde contrib: decompile
;;(add-to-list 'load-path "~/gnu/plugins/jdee/contrib/")
;;(require 'decompile)



;; 下面这一段是用来执行ANT的
;; my script
(require 'jde-parse)
(defun prj-build (buildfile target &optional interactive-args)
  "Invoke ant build.
BUILDFILE: path of build.xml.
TARGET: target.
INTERACTIVE-ARGS: interactive-args."
  (interactive
   (let* ((buildfile (concat
                      (file-name-directory (jde-find-project-file
                                            (file-truename ".")))
                      jde-ant-buildfile))
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
  ;; end interactive

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
;;(add-hook 'after-save-hook 'prj-after-save-hook)

(custom-set-variables
 '(jde-build-function (quote prj-build)))

(provide 'init-java)

;;; init-java.el ends here

