;;; init-bbdb.el -- configure bbdb
;;; Commentary:
;; Author: Bliss Chung
;; Version: 1.0

;;; Code:
(add-to-list 'load-path "~/gnu/plugins/bbdb-3.1.1/lisp")
;; (require 'bbdb-l)
(require 'bbdb)
(bbdb-initialize 'gnus 'message 'mail)
(setq bbdb-north-american-phone-numbers-p nil)


(provide 'init-bbdb)

;;; init-bbdb.el ends here
