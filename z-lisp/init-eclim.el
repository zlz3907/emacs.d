;;; init-eclim.el -- configure eclim
;;; Commentary:
;; Author: Bliss Chung
;; Version: 1.0

;;; Code:
(add-to-list 'load-path "~/gnu/plugins/emacs-eclim/")
(require 'eclim)
(global-eclim-mode)

(require 'eclimd)

(custom-set-variables
 '(eclim-eclipse-dirs '("~/programs/eclipse"))
 '(eclim-executable "~/programs/eclipse/eclim"))

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)

(require 'flymake)
(defun my-flymake-init ()
  "Doc."
  (list "my-java-flymake-checks"
        (list (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-with-folder-structure))))
(add-to-list 'flymake-allowed-file-name-masks
             '("\\.java$" my-flymake-init flymake-simple-cleanup))
(provide 'init-eclim)

;;; init-eclim.el ends here
