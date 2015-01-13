;;; init-java.el -- configure java
;;; Commentary:
;;

;;; Code:
;; jde
(setq debug-on-error t)
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/jdee/lisp"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/semantic"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/speedbar"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/elib"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/eieio"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/cogre"))
;;(add-to-list 'load-path (expand-file-name "~/gnu/plugins/cedet/ede"))
;;(load-file "~/gnu/plugins/cedet/common/cedet.el")

;;(setq defer-loading-jde nil)

(require 'eieio)

;; EDE 工程管理负责编译构建
(require 'ede)
(require 'srecode)

(global-ede-mode t)

;; Sets the basic indentation for Java source files
;; to two spaces.
(setq c-basic-offset 2)

;;YaSnippet
(require 'yasnippet)
(yas-global-mode 1)
(require 'ecb)



(provide 'init-java)

;;; init-java.el ends here

