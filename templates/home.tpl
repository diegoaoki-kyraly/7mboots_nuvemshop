<!-- Modal -->
{% if settings.show_news_box %}
    {% include 'snipplets/newsletter-popup.tpl' %}
{% endif %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}
{% set theme_version = settings.version_theme %}

<div class="main-banner hidden-phone js-home-slider-container row-fluid p-relative slider-wrapper{% if theme_version == 'full' %}-full{% else %} m-bottom m-bottom-half-xs{% endif %} {% if not settings.slider or settings.slider is empty %} hidden {% endif %}">
    <ul class="social-floater">
        {% for social_floater in ['instagram', 'facebook'] %}
            {% set sn_floater_url = attribute(store,social_floater) %}
            <li>
                {% if sn_floater_url %}
                    <a href="{{ sn_floater_url }}" target="_blank">
                        {% if social_floater == "instagram" %}
                            <div class="ico-insta-floater">Instagram</div>
                        {% elseif social_floater == "facebook" %}
                            <div class="ico-face-floater">Facebook</div>
                        {% endif %}
                    </a>
                {% endif %}
            </li>
        {% endfor %}
    </ul>
    {% snipplet 'placeholders/home-slider-placeholder.tpl' %}
    <ul class="js-home-slider slider" style="visibility:hidden; height:0;">
        {% if settings.slider and settings.slider is not empty %}
            {% for slide in settings.slider %}
                <li class="slider-slide">
                    {% if not slide.link is empty %}
                    <a href="{{ slide.link }}">
                    {% endif %}
                    {% if store.thumbnails_enabled %}
                        <img data-sizes="auto" {% if loop.index > 1 %}src="{{ slide.image | static_url | settings_image_url('thumb') }}"{% else %}src="{{ slide.image | static_url | settings_image_url('small') }}"{% endif %} data-srcset='{{ slide.image | static_url | settings_image_url('large') }} 480w, {{ slide.image | static_url | settings_image_url('huge') }} 640w, {{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w' class="lazyautosizes lazyload slide-img blur-up-big" />
                    {% else %}
                        <img {% if loop.index > 1 %}src="{{ slide.image | static_url | settings_image_url('thumb') }}"{% else %}src="{{ slide.image | static_url | settings_image_url('small') }}"{% endif %} data-src='{{ slide.image | static_url }}' class="lazyload slide-img blur-up-big" />
                    {% endif %}
                    {% if not slide.link is empty %}
                    </a>
                    {% endif %}
                </li>
            {% endfor %}
        {% endif %}
    </ul>
</div>

<div class="main-banner-mobile visible-phone js-home-slider-container row-fluid p-relative slider-wrapper{% if theme_version == 'full' %}-full{% else %} m-bottom m-bottom-half-xs{% endif %} {% if not settings.slider or settings.slider is empty %} hidden {% endif %}">
    <ul class="social-floater">
        {% for social_floater in ['instagram', 'facebook'] %}
            {% set sn_floater_url = attribute(store,social_floater) %}
            <li>
                {% if sn_floater_url %}
                    <a href="{{ sn_floater_url }}" target="_blank">
                        {% if social_floater == "instagram" %}
                            <div class="ico-insta-floater">Instagram</div>
                        {% elseif social_floater == "facebook" %}
                            <div class="ico-face-floater">Facebook</div>
                        {% endif %}
                    </a>
                {% endif %}
            </li>
        {% endfor %}
    </ul>
    {% snipplet 'placeholders/home-slider-placeholder.tpl' %}
    <ul class="js-home-slider slider" style="visibility:hidden; height:0;">
        {% if settings.slider_mobile and settings.slider_mobile is not empty %}
            {% for slider_mobile in settings.slider_mobile %}
                <li class="slider-slide">
                    {% if not slider_mobile.link is empty %}
                    <a href="{{ slider_mobile.link }}">
                    {% endif %}
                    {% if store.thumbnails_enabled %}
                        <img data-sizes="auto" {% if loop.index > 1 %}src="{{ slider_mobile.image | static_url | settings_image_url('thumb') }}"{% else %}src="{{ slider_mobile.image | static_url | settings_image_url('small') }}"{% endif %} data-srcset='{{ slider_mobile.image | static_url | settings_image_url('large') }} 480w, {{ slider_mobile.image | static_url | settings_image_url('huge') }} 640w, {{ slider_mobile.image | static_url | settings_image_url('original') }} 1024w, {{ slider_mobile.image | static_url | settings_image_url('1080p') }} 1920w' class="lazyautosizes lazyload slide-img blur-up-big" />
                    {% else %}
                        <img {% if loop.index > 1 %}src="{{ slider_mobile.image | static_url | settings_image_url('thumb') }}"{% else %}src="{{ slider_mobile.image | static_url | settings_image_url('small') }}"{% endif %} data-src='{{ slider_mobile.image | static_url }}' class="lazyload slide-img blur-up-big" />
                    {% endif %}
                    {% if not slider_mobile.link is empty %}
                    </a>
                    {% endif %}
                </li>
            {% endfor %}
        {% endif %}
    </ul>
</div>

{% if settings.banner_services_home %} 
     {% include 'snipplets/banner-services/banner-services.tpl' %}
{% endif %}

{% include 'snipplets/banner.tpl' %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

<div class="corpo-home">
    <div class="container" style="margin-bottom: 20px;">
        {% if not show_help %}
            <div class="section-tabs">
                <ul class="menu-sections-tab">
                    <li class="pague-1-leve-2 active" data-section="pague-1-leve-2">
                        <span>Promoções</span>
                        <div class="dump"></div>
                    </li>

                    <li class="combos" data-section="combos">
                        <span>Pague 1 Leve 2</span>
                        <div class="dump"></div>
                    </li>

                    <li class="mais-vendidos" data-section="mais-vendidos">
                        <span>Mais Vendidos</span>
                        <div class="dump"></div>
                    </li>

                    <li class="lancamentos" data-section="lancamentos">
                        <span>Lançamentos</span>
                        <div class="dump"></div>
                    </li>
                </ul>

                <div class="section-contents">
                    <div id="pague-1-leve-2" class="tab-cont active">
                        {% if sections.pague_leve.products %}
                            <div class="grid-row">
                                {% for product in sections.pague_leve.products %}
                                    {% include 'snipplets/single_product.tpl' with {'thumb_scroller': false, 'quickshop_included' : true} %}
                                {% endfor %}
                            </div>
                        {% endif %}
                    </div>

                    <div id="combos" class="tab-cont">
                        {% if sections.combos.products %}
                            <div class="grid-row">
                                {% for product in sections.combos.products %}
                                    {% include 'snipplets/single_product.tpl' with {'thumb_scroller': false, 'quickshop_included' : true} %}
                                {% endfor %}
                            </div>
                        {% endif %}
                    </div>

                    <div id="mais-vendidos" class="tab-cont">
                        {% if sections.mais_vendidos.products %}
                            <div class="grid-row">
                                {% for product in sections.mais_vendidos.products %}
                                    {% include 'snipplets/single_product.tpl' with {'thumb_scroller': false, 'quickshop_included' : true} %}
                                {% endfor %}
                            </div>
                        {% endif %}
                    </div>

                    <div id="lancamentos" class="tab-cont">
                        {% if sections.primary.products %}
                            <div class="grid-row">
                                {% for product in sections.primary.products %}
                                    {% include 'snipplets/single_product.tpl' with {'thumb_scroller': false, 'quickshop_included' : true} %}
                                {% endfor %}
                            </div>
                        {% endif %}
                    </div>
                </div>
            </div>
        {% endif %}
    </div>

    <!-- <div class="fabricantes">
        <div class="container">
            <div class="banner-fabricantes {% if not settings.slider_fabricantes or settings.slider is empty %} hidden {% endif %}">
                <h3>Fabricantes</h3>
                {% snipplet 'placeholders/home-slider-placeholder.tpl' %}
                <ul class="js-fabricantes-slider" style="visibility:hidden; height:0;">
                    {% if settings.slider_fabricantes and settings.slider_fabricantes is not empty %}
                        {% for slider_fabricantes in settings.slider_fabricantes %}
                            <li class="slider-slide">
                                {% if not slider_fabricantes.link is empty %}
                                <a href="{{ slider_fabricantes.link }}">
                                {% endif %}
                                <img data-sizes="auto" src="{{ slider_fabricantes.image | static_url | settings_image_url('original') }}" class="lazyautosizes lazyload slide-img blur-up-big" />
                                {% if not slider_fabricantes.link is empty %}
                                </a>
                                {% endif %}
                            </li>
                        {% endfor %}
                    {% endif %}
                </ul>
            </div>
        </div>
    </div> -->
</div>

{% if has_home_products %}
    <div class="container container-see-all-prods text-center clear m-bottom">
        <a href="{{ store.products_url }}" class="btn btn-primary d-inline-block m-top m-bottom p-left p-right col-centered full-width-xs">{{ "Ver todos los productos" | translate }}</a>
    </div>
{% endif %}

{% if (settings.show_instafeed)%}
    <div class="container video-wrapper visible-when-content-ready m-bottom-double m-top-double m-top-none-xs box-instagram">
        <div class="row-fluid m-bottom-double m-bottom-none-xs m-top-double text-center">
            {% if settings.show_instafeed %}
                <div class="span12 col-xs-custom">
                    {% set instuser = store.instagram|split('/')|last %}
                    <h5 class="h6-xs weight-bold text-uppercase">{% if store.instagram %}<a target="_blank" href="{{ store.instagram }}">{% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %} @{{ instuser }}</a>{% else %}{% include "snipplets/svg/instagram.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %} Instagram{% endif %}</h5>
                    <div class="instafeed-module m-top text-center">
                        <div id="instafeed" class="overide-container-width"></div>
                    </div>
                </div>
            {% endif %}
        </div>
    </div>
{% endif %}

{% if settings.show_footer_fb_like_box and store.facebook %}
    <div class="container m-bottom">
        <div class="border-bottom p-bottom-half m-bottom-half text-center">
            <h5 class="text-uppercase weight-normal">{{"Síguenos en Facebook" | translate}}</h5>
        </div>
        <div class="fb-page">
            <div class="fb-page-head p-all-half">
                <div class="d-flex">
                    <div class="fb-page-img-container m-right-half text-center">
                        {% if has_logo %}
                            <div class="fb-page-img lazyload" data-bg="{{ store.logo('thumb')}}" style="background-image: url({{ 'images/empty-placeholder.png' | static_url }});"></div>
                        {% else %}
                            {% include "snipplets/svg/facebook-f.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill m-top-quarter fb-page-icon"} %}
                        {% endif %}
                    </div>
                    <div>
                        <div class="h6 fb-page-title">{{ store.name }}</div>
                        <div class="m-top-half">
                            <a href="{{ store.facebook }}" target="_blank" class="fb-like weight-strong">
                                {% include "snipplets/svg/thumbs-up.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %}
                                {{ 'Me gusta' | translate }}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fb-page-footer p-all-half">
                <div class="fb-page-box">
                    <a href="{{ store.facebook }}" target="_blank" class="fb-page-link">
                        <span class="weight-strong opacity-80">{{ 'Visitá nuestra página' | translate }}</span>
                        {% include "snipplets/svg/facebook-square.tpl" with {fa_custom_class: "svg-inline--fa fa-lg m-left-quarter"} %}
                    </a>
                </div>
            </div>
        </div>
    </div>
{% endif %}
