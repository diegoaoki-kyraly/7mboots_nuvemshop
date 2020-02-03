<div class="service-item-container span{{ 12 / num_banners_services }} {% if banner_services_icon != 'none' %}{% if num_banners_services > 1 and not loop.last %} border-right border-none-xs {% endif %}{% endif %} {% if num_banners_services > 1 %} p-bottom-xs {% endif %}">
    <div class="js-service-item service-item">
        {% if banner_services_url %}
            <a href="{{ banner_services_url }}">
        {% endif %}
        <div class="span12 text-center service-text">
            <h6 class="service-title font-body-xs">{{ banner_services_title }}</h6>
            <p>{{ banner_services_description }}</p>
        </div>
        {% if banner_services_url %}
            </a>
        {% endif %}
    </div>
</div>
