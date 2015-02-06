;;; init-blog-publish.el --- My Configurations

;;; Commentary:
;; Author: Zhong Lizhi <zlz.3907 <at> gmail.com>
;; Version: 1.0

;;; Code:
;;(require 'ox-publish)
(require 'ox-publish)
(setq org-html-preamble-format '(("en" "
</div><!-- preamble end -->
    <style>
      #content {
      margin-top: 105px;
      width: 779px;
      align: center;
      margin-left: auto;
      margin-right: auto;
      }
    </style>
<!--[if lt IE 10]>
        <p class=\"browsehappy\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://3zso.com/\">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <div class=\"hfeed site\">
      <header class=\"site__header\" role=\"header\">
        <div class=\"container\">
          <nav class=\"navbar navbar-default\">
            <div class=\"navbar-header\">
              <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar-collapse-1\">
                <span class=\"sr-only\">Toggle navigation</span>
                <span class=\"icon-bar\"></span>
                <span class=\"icon-bar\"></span>
                <span class=\"icon-bar\"></span>
              </button>
              <a class=\"navbar-brand\" href=\"http://3zso.com/\" rel=\"archives\">
                <h1 class=\"navbar-site-title\">3ZSO.COM</h1>
              </a>
              <h2 class=\"navbar-page-title\"><span class=\"home\">Home</span></h2>
            </div>
            <div id=\"navbar-collapse-1\" class=\"collapse navbar-collapse\">
              <ul id=\"menu-navigation-menu\" class=\"nav navbar-nav\">
                <li id=\"menu-item-14\" class=\"menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-6 current_page_item menu-item-14\"><a title=\"Home\" href=\"http://3zso.com/\">Home</a></li>
                <li id=\"menu-item-41\" class=\"menu-item-work menu-item menu-item-type-custom menu-item-object-custom menu-item-41\"><a title=\"Work\" href=\"http://work.3zso.com/\">Work</a></li>
                <li id=\"menu-item-16\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-16 active\"><a title=\"Archives\" href=\"http://archive.3zso.com/\">Archives</a></li>
                <li id=\"menu-item-18\" class=\"menu-item menu-item-type-post_type menu-item-object-page menu-item-18\"><a title=\"Source\" href=\"http://source.3zso.com/\">Source</a></li>
                <li id=\"menu-item-139\" class=\"menu-item menu-item-type-custom menu-item-object-custom menu-item-139\"><a title=\"About\" href=\"http://3zso.com/about.html\">About</a></li>
            </ul></div>
          </nav>
        </div><!-- .container -->
      </header><!-- .site__header -->
      <aside class=\"site__banner\">
        <div class=\"container\">
          <div class=\"row\">
            <div class=\"text-right col-xs-12 col-sm-6 col-sm-push-6\">
              <p class=\"tagline\">%a. C<span>st.</span> %C.<br />
                 %c</p>
            </div>
            <div class=\"col-xs-12 col-sm-5 col-sm-pull-6\">
              <p></p>
            </div>
          </div><!-- .row -->
        </div><!-- .container -->
      </aside><!-- .site__banner.hidden-xs -->

<main class=\"site__content\" role=\"main\">
<!-- hidden preamble -->
<div style=\"display:none\">
")))
(setq org-html-postamble-format
      '(("en" "
</div><!-- postamble end -->

</main>

<div class=\"callout-quote animation is-animated\">
<div id=\"disqus_thread\" class=\"container\"></div>
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
</div>

<aside id=\"contact\" class=\"contact\" role=\"secondary\">
<div class=\"container\">
<div class=\"row\">
<div class=\"col-sm-8\">
  <img src=\"/frm/logo/3zso-logo-F2F5F4.svg\" style=\"width:220px\" />
</div>
<div class=\"z-cc col-sm-4\" style=\"display:none\">
<a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-nd/4.0/\"><img alt=\"Creative Commons License\" style=\"border-width:0\" src=\"https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png\" /></a><br />This work is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-nd/4.0/\">Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License</a>
</div>
</div></div>
</aside>

<footer class=\"site__footer\" role=\"contentinfo\">
        <div class=\"container\">
          <small class=\"copyright\">&copy;2015 Zhong Lizhi. Contents licensed under
<a rel=\"license\" target=\"_blank\" href=\"http://creativecommons.org/licenses/by-nc-nd/4.0/\">CC BY-NC-ND 4.0</a> with attribution required.
鄂ICP备13010742号-1

<div style=\"display:none\">
<script type=\"text/javascript\">
  var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");
  document.write(unescape(\"%%3Cspan id='cnzz_stat_icon_1000216635'%%3E%%3C/span%%3E%%3Cscript src='\"
    + cnzz_protocol
    + \"s22.cnzz.com/z_stat.php%%3Fid%%3D1000216635%%26show%%3Dpic1' type='text/javascript'%%3E%%3C/script%%3E\"));
</script>
</div>
</small>

        </div><!-- .container -->
      </footer><!-- .site__footer -->
</div>
<script type='text/javascript' src='http://3zso.com/assets/js/main.min.js'></script>
<div style=\"display:none\">
")))

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
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">

    <link rel='stylesheet' id='ep2014-styles-css'  href='http://3zso.com/assets/css/main.css' type='text/css' media='all' />

    <script type='text/javascript' src='http://3zso.com/assets/js/vendor/modernizr.custom.js'></script>
    <script type='text/javascript' src='http://3zso.com/js/jquery/jquery.js'></script>
    <script type='text/javascript' src='http://3zso.com/js/jquery/jquery-migrate.min.js'></script>

    <!--[if lt IE 9]>
        <script src=\"http://3zso.com/assets/js/vendor/respond.min.js\"></script>
        <![endif]-->
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
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">

    <link rel='stylesheet' id='ep2014-styles-css'  href='http://3zso.com/assets/css/main.css' type='text/css' media='all' />

    <script type='text/javascript' src='http://3zso.com/assets/js/vendor/modernizr.custom.js'></script>
    <script type='text/javascript' src='http://3zso.com/js/jquery/jquery.js'></script>
    <script type='text/javascript' src='http://3zso.com/js/jquery/jquery-migrate.min.js'></script>

    <!--[if lt IE 9]>
        <script src=\"http://3zso.com/assets/js/vendor/respond.min.js\"></script>
        <![endif]-->
"
         )
        ("blog-static"
         :base-directory "~/orgblogs/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|svg\\|html\\|ttf\\|woff\\|eot"
         :publishing-directory "~/blog/web"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("blog-notes" "blog-index" "blog-static"))
        ;;
        ))
(provide 'init-blog-publish)

;;; init-blog-publish.el ends here
