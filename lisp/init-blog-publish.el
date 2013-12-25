;;; init-blog-publish.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:
(require 'org-publish)
(setq org-html-postamble-format
      '(("en" "
<div id=\"disqus_thread\"></div>
<script type=\"text/javascript\">
    var disqus_shortname = '3zso';
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
<a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>
<hr />
<p class=\"author\">Author: %a (%e)</p>
<p class=\"date\">Date: %d</p>
<p class=\"creator\">%c</p>
<p class=\"validation\">%v</p>
<p>Copyright &#169; 2013 - 2014 Bliss Chung. All rights reserved.</p>
<script type=\"text/javascript\">
  var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");
  document.write(unescape(\"%%3Cspan id='cnzz_stat_icon_1000216635'%%3E%%3C/span%%3E%%3Cscript src='\"
    + cnzz_protocol
    + \"s22.cnzz.com/z_stat.php%%3Fid%%3D1000216635%%26show%%3Dpic1' type='text/javascript'%%3E%%3C/script%%3E\"));
</script>")))

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
         :auto-sitemap t       ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org" ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"        ; ... with title 'Sitemap'.
         :sitemap-function org-publish-org-sitemap
         :author "Bliss Chung"
         :email "bliss@3zso.com"
         :html-head "<link rel=\"stylesheet\" title=\"Standard\" href=\"http://blog.3zso.com/css/worg.css\" type=\"text/css\" />
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
         :html-head "
<link rel=\"stylesheet\" title=\"Standard\"
      href=\"css/worg.css\" type=\"text/css\" />
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
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-index" "blog-static"))
        ;;
        ))

(provide 'init-blog-publish)

;;; init-blog-publish.el ends here
