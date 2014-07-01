;;; init-blog-publish.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:
;;(require 'ox-publish)
(require 'ox-publish)
(setq org-html-preamble-format '(("en" "
    <style>
      #content {
      margin-top: 50px;
      width: 750px;
      align: center;
      margin-left: auto;
      margin-right: auto;
      }
    </style>

    <nav class=\"navbar navbar-default navbar-fixed-top\" role=\"navigation\">
      <div class=\"navbar-header\">
        <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">
          <span class=\"sr-only\">Toggle navigation</span>
          <span class=\"icon-bar\"></span>
          <span class=\"icon-bar\"></span>
          <span class=\"icon-bar\"></span>
        </button>
        <a class=\"navbar-brand\" href=\"http://3zso.com\">3ZSO.COM</a>
      </div>

      <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">
        <ul class=\"nav navbar-nav\">
          <li id=\"navbar_home\"><a href=\"http://3zso.com\">Home</a></li>
          <li id=\"navbar_blog\"><a href=\"http://blog.3zso.com\">Blog</a></li>
          <li id=\"navbar_source\"><a href=\"http://source.3zso.com\">Source</a></li>
        </ul>
        <ul class=\"nav navbar-nav navbar-right\">

          <li><a href=\"#\" style=\"margin: 13px 25px; padding: 0px;\">
            <img alt=\"About Bliss\" width=\"20px\" height=\"20px\" src=\"http://www.gravatar.com/avatar/9bfabf3004a9198030310a28417283af?s=26&amp;d=mm\">
          </a></li>
          <!--
          <li class=\"dropdown\">
            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"
               >Dropdown <b class=\"caret\"></b></a>
            <ul class=\"dropdown-menu\">
              <li><a href=\"#\">Action</a></li>
              <li><a href=\"#\">Another action</a></li>
              <li><a href=\"#\">Something else here</a></li>
              <li class=\"divider\"></li>
              <li><a href=\"#\">Separated link</a></li>
            </ul>
          </li>
          -->
        </ul>
      </div>
    </nav>

    <script>
      <!--/*--><![CDATA[/*><!--*/
      $(function changeContentClass() {
        //$('#content').attr('class', 'container');
        // active menu
        var href = window.location.href;
        if (0 < href.indexOf(\"//www.3zso.com\")
            || 0 < href.indexOf(\"//3zso.com\")) {
          $('#navbar_home').attr(\"class\", \"active\");
        } else if (0 < href.indexOf(\"//blog.3zso.com\")) {
          $('#navbar_blog').attr(\"class\", \"active\");
        } else if (0 < href.indexOf(\"//source.3zso.com\")) {
          $('#navbar_source').attr(\"class\", \"active\");
        }
      });
      /*]]>*///-->
    </script>
")))
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

<div class=\"container\" style=\"width:750px;\">
<div class=\"row\">
<div class=\"col-sm-4\"></div>
<div class=\"z-docinfo col-sm-4\">
<p class=\"author\">Author: %a (%e)</p>
<p class=\"date\">Create Time: %d</p>
<p class=\"date\">Last Modify: %T</p>
<p class=\"creator\">%c</p>
<p class=\"validation\">%v</p>
<script type=\"text/javascript\">
  var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");
  document.write(unescape(\"%%3Cspan id='cnzz_stat_icon_1000216635'%%3E%%3C/span%%3E%%3Cscript src='\"
    + cnzz_protocol
    + \"s22.cnzz.com/z_stat.php%%3Fid%%3D1000216635%%26show%%3Dpic1' type='text/javascript'%%3E%%3C/script%%3E\"));
</script>
<br />
</div>
<div class=\"z-cc col-sm-4\">
<a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-nd/4.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png\" /></a><br />This work is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-nd/4.0/\">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>
</div>
</div></div>")))

(setq org-publish-project-alist
      '(
        ("blog-notes"
         :base-directory "~/orgblogs/"
         :base-extension "org"
         :exclude "index.org\\|frm/*\\|blog.org"
         :publishing-directory "~/blog/web"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :html-preamble t
         :html-postamble t
         :auto-sitemap t       ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org" ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"        ; ... with title 'Sitemap'.
         :sitemap-function org-publish-org-sitemap
         :author "Bliss Chung"
         :email "bliss@3zso.com"
         :html-head "
<link rel=\"stylesheet\" href=\"http://3zso.com/css/worg-3zso.css\">
<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css\">
<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css\">
<script src=\"http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js\"></script>
<script src=\"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js\"></script>
"
         ;;:sitemap-style ;'("~/orgblogs/css/")
         )
        ("blog-index"
         :base-directory "~/orgblogs/"
         :base-extension "noexport"
         :include ("index.org" "blog.org")
         :publishing-directory "~/blog/web"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :section-numbers nil
         :html-preamble nil
         :html-postamble nil
         :author "Bliss Chung"
         :email "bliss@3zso.com"
         :html-head "
<link rel=\"stylesheet\" href=\"http://3zso.com/css/worg-3zso.css\">
<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css\">
<link rel=\"stylesheet\" href=\"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css\">
<script src=\"http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js\"></script>
<script src=\"http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js\"></script>
"
         )
        ("blog-static"
         :base-directory "~/orgblogs/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt"
         :publishing-directory "~/blog/web"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-index" "blog-static"))
        ;;
        ))

(provide 'init-blog-publish)

;;; init-blog-publish.el ends here
