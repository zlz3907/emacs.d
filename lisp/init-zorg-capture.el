;;; init-zorg-capture.el --- Java Env.

;;; Commentary:
;;

;;; Code:
;; current time
(defvar zorgcapture-year
  (nth 5 (decode-time (current-time)))
  "Current year.")
(defvar zorgcapture-basepath
  (concat org-directory "/"
          (number-to-string zorgcapture-year) "/")
  "Org files path.")
(if (not (file-directory-p zorgcapture-basepath))
    (mkdir zorgcapture-basepath))

;; org-default-notes-file
(setq org-default-notes-file (concat zorgcapture-basepath "notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; org-capture-templates
(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline
          (concat zorgcapture-basepath "gtd.org") "Tasks")
         "* TODO %?\n %i\n %a")
        ("j" "Journal" entry
         (file+datetree
          (concat zorgcapture-basepath "journal.org"))
         "* %?\n :PROPERTIES:\n :LINK: %a\n :ENTEREDON: %U\n :END: %i")
        ("n" "Note" entry
         (file+headline
          (concat zorgcapture-basepath "note.org") "Notes")
         "* %?\n :PROPERTIES:\n :LINK: %a\n :ENTEREDON: %U\n :END: %i")))
;;; init-zorg-capture.el ends here
