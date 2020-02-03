<header>
    {% snipplet "header/search-mobile.tpl" %}

    {% if settings.slim_menu %}
        {% snipplet "header/head-slim.tpl" %}
    {% endif %}

    {# Shortcut to the Status Page #}
    <div class="visible-phone">
        {% include 'snipplets/notification.tpl' with {order_notification: true} %}
    </div>

    {% snipplet "header/mobile.tpl" %}
    
    {% snipplet "header/head.tpl" %}

    <!-- Barra de Anuncios -->
    {% if settings.ad_bar and settings.ad_text %}
        {% snipplet "header/advertising.tpl" %}
    {% endif %}
</header>