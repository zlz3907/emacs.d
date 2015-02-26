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
      '(("g" "Goals" entry
         (file+headline
          (concat zorgcapture-basepath "agenda.org") "Goals")
         "* TODO %?\n  :PROPERTIES:\n  :ENTEREDON: %U\n  :END: %i")
        ("T" "Todo" entry
         (file+headline
          (concat zorgcapture-basepath "gtd.org") "Tasks")
         "* TODO %?\n  :PROPERTIES:\n  :LINK: %a\n  :ENTEREDON: %U\n  :END: %i")
        ("t" "Todo Without Link" entry
         (file+headline
          (concat zorgcapture-basepath "gtd.org") "Tasks")
         "* TODO %?\n  :PROPERTIES:\n  :ENTEREDON: %U\n  :END: %i")
        ("W" "Work" entry
         (file+headline
          (concat zorgcapture-basepath "gtd.org") "Work")
         "* TODO %?\n  :PROPERTIES:\n  :LINK: %a\n  :ENTEREDON: %U\n  :END: %i")
        ("w" "Work Without Link" entry
         (file+headline
          (concat zorgcapture-basepath "gtd.org") "Work")
         "* TODO %?\n  :PROPERTIES:\n  :ENTEREDON: %U\n  :END: %i")
        ("J" "Journal" entry
         (file+datetree
          (concat zorgcapture-basepath "journal.org"))
         "* %?\n  :PROPERTIES:\n  :LINK: %a\n  :ENTEREDON: %U\n  :END: %i")
        ("j" "Journal Without Link" plain
         (file+datetree
          (concat zorgcapture-basepath "journal.org"))
         "%i")
        ("N" "Note" entry
         (file+headline
          (concat zorgcapture-basepath "note.org") "Notes")
         "* %?\n  :PROPERTIES:\n  :LINK: %a\n  :ENTEREDON: %U\n  :END: %i")
        ("n" "Note Without Link" entry
         (file+headline
          (concat zorgcapture-basepath "note.org") "Notes")
         "* %?\n  :PROPERTIES:\n  :ENTEREDON: %U\n  :END: %i")))

(provide 'init-zorg-capture)
;;; init-zorg-capture.el ends here
