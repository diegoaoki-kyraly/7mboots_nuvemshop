<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
    <title>{{ page_title }}</title>
    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {{ store.name | og('site_name') }}
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}

    <!-- Critical CSS to improve the percieved performance on first load -->
    <style>
        {% snipplet 'css/critical-css.tpl' %}
    </style>

    {# load fonts #}

    {% if params.preview %}

        {# If page is loaded from customization page on the admin, load all fonts #}

        {{ '//fonts.googleapis.com/css?family=Lato:700,400italic,700italic|Poppins:400,400i,600,600i|Open+Sans:400,300,700|Slabo+27px|Oswald:400,300,700|Lora:400,700|Montserrat:400,700|Source+Sans+Pro:400,300,700|Droid+Sans:400,700|Roboto+Condensed:400italic,700italic,300,400,700|Istok+Web:400,700,400italic,700italic|Arvo:400,700,400italic,700italic|Paytone+One|Raleway:700|Lato:700|Ubuntu:700|Roboto+Slab:700&display=swap' | css_tag }}

    {% else %}

        {# If page is NOT loaded from customization only load saved fonts #}

        {# Get only the saved fonts on settings #}

        {{ [settings.font_logo, 
        settings.font_rest, 
        settings.font_navigation, 
        settings.font_headings, 
        settings.font_headingsprods,
        settings.font_buttons] | google_fonts_url | css_tag }}

    {% endif %}

    {# Aynsc CSS for the non-critical stylesheets and Font Awesome CSS #}

    {% snipplet 'js/load-css-async.tpl' %}

    {# Store colors CSS #}
    
    {{ 'css/main-color.scss.tpl' | static_url | css_tag }}
    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag(true) }}


    {% set nojquery = true %}
    {% set async_js = true %}
    {% head_content %}
    <!--[if lte IE 7]>
    {{ "css/ie.css" | static_url | css_tag }}
    <![endif]-->
    <style>
        {{ settings.css_code | raw }}
    </style>
</head>
<body itemscope itemtype="http://schema.org/WebPage" itemid="body">
{{back_to_admin}}
<div class="visible-when-content-ready">
    <div class="m-top">
        <h1 class="mobile-logo-home text-center m-bottom">
            <div id="logo" class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                {{ store.logo('large') | img_tag('', {class: 'logo-img'}) | a_tag(store.url) }}
            </div>
            <a id="no-logo" class="logo-text h2 {% if has_logo %} hidden {% endif %}" href="{{ store.url }}">{{ store.name }}</a>
        </h1>
        <div class="construction-page-svg text-center svg-primary-fill text-center m-auto">
            {% include "snipplets/svg/construction.tpl" %}
        </div>
        <div class="container">
            <div class="row">
                <div class="span10 offset1">
                    <div class="frame-title">
                        <h3 class="h6-xs text-uppercase">{{ message }}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
        <div class="js-hide-footer-while-scrolling visible-when-content-ready footer-social text-center p-top p-bottom">
            <div class="row-fluid m-top-half m-bottom-half">
                <div class="container">
                    {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                        {% set sn_url = attribute(store,sn) %}
                        {% if sn_url %}
                            <a class="social-link {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}>
                                {% if sn == "google_plus" %}
                                    {% include "snipplets/svg/google-plus-g.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}
                                {% elseif sn == "facebook" %}
                                    {% include "snipplets/svg/facebook-f.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}
                                {% elseif sn == "instagram" %}
                                    {% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}
                                {% elseif sn == "pinterest" %}
                                    {% include "snipplets/svg/pinterest-p.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}
                                {% else %}
                                    {% include "snipplets/svg/twitter.tpl" with {fa_custom_class: "svg-inline--fa fa-3x social-link-icon"} %}
                                {% endif %}
                            </a>
                        {% endif %}
                    {% endfor %}
                </div>
            </div>
        </div>
    {% endif %}
    {% if store.phone or store.address or store.blog %}
        <div class="footer">
            <div class="container">
                <ul class="footer-nav text-center">
                    {% if store.phone %}
                        <li class="d-inline p-right-quarter p-left-quarter full-width-xs pull-left-xs">{{ store.phone }}</li>
                    {% endif %}
                    {% if store.address %}
                        <li class="d-inline p-right-quarter p-left-quarter full-width-xs pull-left-xs">{{ store.address }}</li>
                    {% endif %}
                    {% if store.blog %}
                        <li class="d-inline p-right-quarter p-left-quarter full-width-xs pull-left-xs"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                    {% endif %}
                    {% if store.email %}
                        <li class="d-inline p-right-quarter p-left-quarter full-width-xs pull-left-xs">{{ store.email | mailto }}</li>
                    {% endif %}
                </ul>
            </div>
        </div>
    {% endif %}
    <div class="footer-legal">
        <div class="row-fluid">
            <div class="container">
                <div class="span3 text-left text-center-xs">
                    <div class="powered-by">
                        {#
                        La leyenda que aparece debajo de esta linea de código debe mantenerse
                        con las mismas palabras y con su apropiado link a Tienda Nube;
                        como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
                        Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
                        tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
                        Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
                        palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
                        http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
                        e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
                        manter visivél e com um link funcionando.
                        #}
                        {{ new_powered_by_link }}
                    </div>
                </div>
                <div class="span5 m-top-xs m-bottom-xs">
                    <div class="text-center">
                        <form method="post">
                            <input class="form-control m-bottom-half-xs d-block-xs full-width-xs {% if invalid_password == true %}input-error{% endif %}" type="password" name="password" placeholder="{{ 'Contraseña de acceso' | translate }}" autocomplete="off"/>
                            <input class="submit-button btn btn-primary btn-inverse btn-small full-width-xs" type="submit" value='{{ "Desbloquear" | translate }}'/>
                        </form>
                        {% if invalid_password == true %}
                            <div class='alert alert-error' role='alert'>{{ 'La contraseña es incorrecta.' | translate }}</div>
                        {% endif %}
                    </div>
                </div>
                <div class="span4 text-right text-center-xs">
                    <div class="copyright">
                        {% if not show_help %}
                            <div class="seals row" {% if not (store.afip or ebit) %}style="display: none;"{% endif %}>
                                {% if store.afip %}
                                    <div class="afip">
                                        {{ store.afip | raw }}
                                    </div>
                                {% endif %}
                                {% if ebit %}
                                    <div class="ebit">
                                        {{ ebit }}
                                    </div>
                                {% endif %}
                            </div>
                        {% else %}
                            <div class="seals row" {% if store.country == 'BR' and not (store.afip or ebit) %}data-tooltip="Esses são selos de exemplo"{% endif %}>
                                {% if store.country == 'AR' %}
                                    <div class="afip">
                                        <img src="https://www.afip.gob.ar/images/f960/DATAWEB.jpg" border="0">
                                    </div>
                                {% endif %}
                                {% if store.country == 'BR' %}
                                    <div class="ebit">
                                        {{ "images/ebit-exemplo.png" | static_url | img_tag }}
                                    </div>
                                {% endif %}
                            </div>
                        {% endif %}
                        {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{# External JS: Plugins and libraries #}

{# without dependencies #}
{{ "js/external-no-dependencies.js" | static_url | script_tag }}

{# with dependencies #}
<script>
    LS.ready.then(function(){
        {% snipplet "js/external.js.tpl"  %}
    });
</script>

</body>
</html>