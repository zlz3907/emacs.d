;;; init-youdao-dict.el --- Dict

;;; Commentary:
;;

;;; Code:

;; Youdao dict
(defun yodao-dict-search-wordap (&optional word)
  "WORD Use python script dict to look up word under point."
  (interactive)
  (or word (setq word (if (use-region-p)
               (buffer-substring-no-properties
                (region-beginning) (region-end))
             (current-word))))
  (message word)
  (popup-tip
   (shell-command-to-string
    (format "python ~/gnu/plugins/dict/zdict.py '%s' %s" word "False"))))

(global-set-key [f7] 'yodao-dict-search-wordap)

(defun fy ()
  "Invoke yodao-dict-search-wordap."
  (interactive)
  (yodao-dict-search-wordap
   (read-from-minibuffer "Translation Word: ")))

(provide 'init-youdao-dict)

;;; init-youdao-dict.el ends here
