;;; init-blog-publish.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:
(require 'org-publish)
(setq org-html-postamble-format
      '(("en" "<p class=\"author\">Author: %a (%e)</p>
<p class=\"date\">Date: %d</p>
<p class=\"creator\">%c</p>
<p class=\"validation\">%v</p>
<p>Copyright © 2013 - 2014 Bliss Chung. All rights reserved.</p>")))

(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/orgblogs/"
         :base-extension "org"
         :exclude "index.org\\|frames/*"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :html-preamble nil
         :html-postamble t
         :auto-sitemap t                ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :sitemap-function org-publish-org-sitemap
         :author "Bliss Chung"
         :email "bliss@3zso.com"
         :html-head "<link rel=\"stylesheet\" title=\"Standard\" href=\"css/worg.css\" type=\"text/css\" />
                     <style>
                       body {
                         font-family: Trebuchet MS, Lucida Grande, Tahoma, Verdana, Arial, sans-serif;
                         font-size: 16px;line-height: 1.7;
                       }
                       a {color: #6e7d8e;
                         ext-decoration: none;
                         font-weight: bold;
                       }
                     </style>"
         ;;:sitemap-style ;'("~/orgblogs/css/")
         )
        ("blog-index"
         :base-directory "~/orgblogs/"
         :base-extension "noexport"
         :include ("index.org")
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :html-preamble nil
         :html-postamble nil
         :author "Bliss Chung"
         :email "bliss@3zso.com"
         :html-head "<link rel=\"stylesheet\" title=\"Standard\" href=\"css/worg.css\" type=\"text/css\" />
<style>
   body {
     font-family: Trebuchet MS, Lucida Grande, Tahoma, Verdana, Arial, sans-serif;
     font-size: 16px;line-height: 1.7;
   }
   a {color: #6e7d8e;
     ext-decoration: none;
     font-weight: bold;
   }
</style>"
         )
        ("blog-static"
         :base-directory "~/orgblogs/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-index" "blog-notes" "blog-static"))
        ;;
        ))

(provide 'init-blog-publish)

;;; init-blog-publish.el ends here
