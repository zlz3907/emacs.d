;;; init-datetime.el -- Insert Current Date

;;; Commentary:
;; Author: Bliss Chung
;; Version: 1.0

;;; Code:
(defvar z-simple-date-format "%Y-%m-%d %w"
  "Format of date to insert with 'insert-current-date-time' function.
See help of 'format-time-string' for possible replacements")

(defvar z-simple-time-format "%Y-%m-%d %R %w"
  "Format of date to insert with 'insert-current-time' function.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "Insert the current date and time into current buffer.
Uses 'current-date-time-format' for the formatting the date/time."
  (interactive)
  ; (insert (let () (comment-start)))
  (insert (format-time-string z-simple-date-format (current-time)))
  )

(defun insert-current-time ()
  "Insert the current time (1-week scope) into the current buffer."
  (interactive)
  (insert (format-time-string z-simple-time-format (current-time)))
  )

(global-set-key "\C-cd" 'insert-current-date-time)
(global-set-key "\C-ct" 'insert-current-time)

(provide 'init-datetime)

;;; init-datetime.el ends here
