{% set show_sidebar = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}
{% paginate by settings.category_quantity_products %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}

{% if products %}
    <div class="page-section-title">
        <div class="container">
            {% snipplet "breadcrumbs.tpl" %}
            <h1>{{ category.name }}</h1>
        </div>
    </div>
{% endif %}

<div class="corpo-category">
    {% if show_sidebar %}
        {% snipplet 'sidebar.tpl' %}
    {% endif %}

    {% if settings.category_banner_top %} 
        {% include 'snipplets/banner.tpl' %}
    {% endif %} 
    <div class="row-fluid" id="category-page">
    	<div class="container">        
            {% if "banner-products.jpg" | has_custom_image %}
                <div class="image-banner">
                    {% if settings.banner_products_url != '' %}
                    <a href="{{ settings.banner_products_url }}">
                    {% endif %}
                        {% if store.thumbnails_enabled %}
                            <img class="lazyautosizes lazyload blur-up-big" src="{{ "banner-products.jpg" | static_url | settings_image_url('small')}}" data-srcset='{{ "banner-products.jpg" | static_url | settings_image_url('large') }} 480w, {{ "banner-products.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "banner-products.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "banner-products.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" />
                        {% else %}
                            <img class="lazyload blur-up-big" src="{{ "banner-products.jpg" | static_url | settings_image_url('small')}}" data-src='{{ "banner-products.jpg" | static_url }}' />
                        {% endif %}
                    {% if settings.banner_products_url != '' %}
                    </a>
                    {% endif %}
                </div>
            {% endif %}
            {% if settings.banner_services_category %} 
                {% include 'snipplets/banner-services/banner-services.tpl' %}
            {% endif %}
            {% if not show_help %}

            <div class="row-fluid">
                <div class="span12 controller">
                    {% if show_filter_error %}
                        <div class="text-center m-top m-bottom">
                            <h5 class="text-uppercase m-bottom-half">{{ "No tenemos productos para mostrarte :(" | translate }}</h5>
                            <h5 class="weight-normal">{{ "Quizás encuentres lo que buscabas en los productos debajo." | translate }}</h5>
                        </div>
                    {% endif %}
                    {% if products %}
                        <div class="sort-by-container">
                            {% snipplet 'sort_by.tpl' %}
                        </div>
                        {% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
                        {% if has_filters %}
                            <a class="js-toggle-mobile-filters mobile-filters-btn btn-default btn-small pull-right weight-strong-xs visible-phone">
                                {{ 'Filtrar' | translate }}
                            </a>
                        {% endif %}
                        <div class="js-product-table product-table clear-both p-top-xs">
                            {% snipplet "product_grid.tpl" %}
                        </div>
                        {% if settings.infinite_scrolling and pages.current == 1 and not pages.is_last %}
                            <div class="clear-both text-center m-top m-bottom p-bottom-half visible-when-content-ready visible-when-content-ready">
                                <a class="js-load-more-btn btn btn-primary clear-both full-width-xs col-centered">
                                    <span class="js-load-more-spinner" style="display:none;">
                                        {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin m-left-half pull-right svg-primary-fill"} %}
                                    </span>
                                    {{ 'ver mais' | t }}
                                </a>
                            </div>
                            <div id="js-infinite-scroll-spinner" class="m-bottom-double text-center m-top pull-left full-width" style="display:none">
                                {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-2x fa-spin svg-text-fill"} %}
                            </div>
                        {% endif %}
                        <div class="js-pagination-container clear-both p-top p-bottom text-center container-xs" {% if settings.infinite_scrolling %}style="display:none"{% endif %}>
                            <div class='pagination'>
                                {% snipplet "pagination.tpl" %}
                            </div>
                      </div>
                    {% else %}
                        <h4 class="text-center text-uppercase m-top m-bottom row-fluid pull-left h6-xs">
                            {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
                        </h4>
                    {% endif %}
                </div>
            </div>
            {% elseif show_help %}
                {% snipplet 'defaults/show_help_category.tpl' %}
            {% endif %}

        </div>
    </div>
    {% if settings.category_banner_bottom %} 
        {% include 'snipplets/banner.tpl' %}
    {% endif %}
</div>

{% if has_filters %}
    {% snipplet 'mobile-filters.tpl' %}
{% endif %}