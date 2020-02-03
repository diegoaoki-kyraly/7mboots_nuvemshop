{# Desktop Banner Services #}
{% macro for_each_banner_include(template) %}
    {% set num_banners_services = 0 %}
    {% set available_banners = []%}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03', 'banner_services_04'] %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
            {% set available_banners = available_banners | merge([banner]) %}
        {% endif %}
    {% endfor %}
    {% for banner in available_banners %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% include template %}
    {% endfor %}
{% endmacro %}
{% import _self as banner_services %}


{% if settings.version_theme == 'full' %}<div class="services hidden-phone visible-when-content-ready {% if footer %}m-top m-bottom-none{% endif %}"><div class="container">{% endif %} 
    <div class="row-fluid hidden-phone">
        {% if settings.version_theme != 'full' %} <div class="services {% if footer %} row-fluid m-top m-bottom-none {% else %} container {% endif %} clear-both">{% endif %} 
            {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
        </div>
    </div>
{% if settings.version_theme == 'full' %}</div>{% endif %} 


{# Mobile Banner Services #}
<div class="row-fluid visible-phone">
    {{ banner_services.for_each_banner_include('snipplets/placeholders/banner-services-placeholder.tpl') }}
</div>
<div class="js-mobile-services-container services row-fluid visible-phone clear-both {% if footer %} m-none {% endif %}" style="visibility:hidden; height:0;">
    <div class="js-mobile-services container p-top-half-xs p-bottom-half m-bottom-none">
        {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
    </div>
</div>