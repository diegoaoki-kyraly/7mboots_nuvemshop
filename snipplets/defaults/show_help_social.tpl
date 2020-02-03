{# Single snipplet that works as social example #}
<div class="footer-social text-center p-top p-bottom">
    <div class="row-fluid">
        <div class="row-fluid m-top-half m-bottom-half">
            <a class="social-link facebook" href="#">{% include "snipplets/svg/facebook-f.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}</a>
            <a class="social-link twitter" href="#">{% include "snipplets/svg/twitter.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}</a>
            <a class="social-link google_plus" href="#">{% include "snipplets/svg/google-plus-g.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}</a>
            <a class="social-link pinterest" href="#">{% include "snipplets/svg/pinterest-p.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}</a>
            <a class="social-link instagram" href="#">{% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}</a>
        </div>
    </div>
</div>