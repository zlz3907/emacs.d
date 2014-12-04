;;; init-zorg-exportpdf.el ---  Org Export to Pdf Configuration

;;; Commentary:
;; Export Pdf with Latex
;; Author: Bliss Chung <bliss <at> 3zso.com>
;; Version: 1.0

(require 'ox-latex)
(setq org-latex-listings 'minted)
(setq org-confirm-babel-evaluate nil)
(setq org-latex-minted-options
      '(;("frame" "leftline") ("framerule" "1.25pt")
        ;;("resetmargins" "false") ("xleftmargin" "0")
                                        ;("bgcolor" "mintedbg")
        ))

;; 加载默认的依赖包
(setq org-latex-default-packages-alist
      (quote (("" "ctex" nil)
              ("" "tikz" nil)
              ("AUTO" "inputenc" t)
              ("T1" "fontenc" t)
              ("" "fixltx2e" nil)
              ("" "graphicx" t)
              ("" "longtable" nil)
              ("" "float" nil)
              ("" "wrapfig" nil)
              ("" "rotating" nil)
              ("normalem" "ulem" t)
              ("" "amsmath" t)
              ("" "textcomp" t)
              ("" "marvosym" t)
              ("" "wasysym" t)
              ("" "amssymb" t)
              ("" "minted" nil)
              ("" "hyperref" nil)
              "\\tolerance=1000"
              "\\usemintedstyle{emacs}"
              "\\definecolor{mintedbg}{rgb}{0.95, 0.95, 0.95}")))

(setq org-export-latex-hyperref-options-format "\\hypersetup{
  pdfkeywords={%s},
  pdfsubject={%s},
  pdfborder={0 0 0},
  pdfcreator={Emacs Org-mode version %s}
}

")

(setq org-latex-title-command "\\pagenumbering{gobble}
\\clearpage
\\thispagestyle{empty}
\\maketitle")

(setq org-latex-toc-command "\\clearpage
\\tableofcontents
\\newpage
\\pagenumbering{arabic}
")

(setq org-latex-pdf-process
      (quote ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
(setq org-latex-to-pdf-process
      (quote ("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f")))

(provide 'init-zorg-exportpdf)

;;; init-zorg-exportpdf.el ends here
