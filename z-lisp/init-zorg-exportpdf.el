;;; init-zorg-exportpdf.el ---  Org Export to Pdf Configuration

;;; Commentary:
;; Export Pdf with Latex
;; Author: Bliss Chung <bliss <at> 3zso.com>
;; Version: 1.0

;;; Code:
(require 'ox-latex)

;;;; Example Block
(defun org-latex-example-block (example-block contents info)
  "Transcode an EXAMPLE-BLOCK element from Org to LaTeX.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (when (org-string-nw-p (org-element-property :value example-block))
    (org-latex--wrap-label
     example-block
     (format "\\begin{minted}[xleftmargin=26pt,xrightmargin=26pt,frame=lines,framesep=5mm]{text}\n%s\\end{minted}"
             (org-export-format-code-default example-block info)))))

(defun org-latex-quote-section (quote-section contents info)
  "Transcode a QUOTE-SECTION element from Org to LaTeX.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (let ((value (org-remove-indentation
                (org-element-property :value quote-section))))
    (when value (format "\\begin{minted}[xleftmargin=26pt,xrightmargin=26pt,frame=lines,framesep=5mm]{text}\n%s\\end{minted}" value))))


(setq org-export-latex-classes
      '(("article" "\\documentclass[a4paper]{article}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ("report" "\\documentclass[11pt]{report}"
         ("\\part{%s}" . "\\part*{%s}")
         ("\\chapter{%s}" . "\\chapter*{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
        ("book" "\\documentclass[11pt]{book}"
         ("\\part{%s}" . "\\part*{%s}")
         ("\\chapter{%s}" . "\\chapter*{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
        ("beamer" "\\documentclass{beamer}" org-beamer-sectioning)))

(setq org-latex-listings 'minted)
(setq org-confirm-babel-evaluate nil)
;;;[mathescape,numbersep=5pt,gobble=2,frame=lines,framesep=2mm]{text}
(setq org-latex-minted-options
      '(;("frame" "leftline") ("framerule" "1.25pt")
        ;;("resetmargins" "false")
        ;;("mathescape" "true")
        ("xleftmargin" "26pt")
        ("xrightmargin" "26pt")
        ;;("numbersep" "5pt")
        ;;("gobble" "2")
        ("frame" "lines")
        ("framesep" "10pt")
        ;;("bgcolor" "mintedbg")
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
              ("unicode" "hyperref" nil)
              ("" "enumitem" nil)
              ("" "geometry" nil)
              "\\tolerance=1000"
              "\\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}"
              "\\setenumerate{fullwidth,itemindent=\\parindent,listparindent=\\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex}"
              "\\setitemize{itemindent=38pt,leftmargin=0pt,itemsep=-0.4ex,listparindent=26pt,partopsep=0pt,parsep=0.5ex,topsep=-0.25ex}"
              "\\setdescription{itemindent=38pt,leftmargin=0pt,itemsep=-0.4ex,listparindent=26pt,partopsep=0pt,parsep=0.5ex,topsep=-0.25ex}"
              "\\usemintedstyle{friendly}"
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
