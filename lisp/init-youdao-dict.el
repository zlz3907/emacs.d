;;; init-youdao-dict.el --- Dict

;;; Commentary:
;;

;;; Code:

;; Youdao dict
(defun yodao-dict-search-wordap (&optional word)
  "WORD Use python script dict to look up word under point."
  (interactive)
  (or word (setq word (current-word)))
  (tooltip-show
   (shell-command-to-string
    (format "python ~/gnu/plugins/dict/zdict.py %s %s" word "False"))))

(global-set-key [f7] 'yodao-dict-search-wordap)

(provide 'init-youdao-dict)

;;; init-youdao-dict.el ends here
