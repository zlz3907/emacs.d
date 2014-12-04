;;; init-bbdb.el -- configure bbdb
;;; Commentary:
;; Author: Bliss Chung
;; Version: 1.0

;;; Code:
(add-to-list 'load-path "~/gnu/plugins/bbdb-3.1.2/lisp")
(require 'bbdb)
(require 'bbdb-gnus)
(require 'bbdb-message)
(require 'bbdb-mua)
(require 'bbdb-pgp)

(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'gnus 'message)
(setq bbdb-pop-up-window-size 10)
(setq bbdb-mua-update-interactive-p '(query . create))
(setq bbdb-message-all-addresses t)
(setq bbdb-north-american-phone-numbers-p nil)

(provide 'init-bbdb)

;;; init-bbdb.el ends here
