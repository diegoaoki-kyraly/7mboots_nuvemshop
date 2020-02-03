<div id="header" class="head-top row-fluid hidden-phone">
    {# Shortcut to the Status Page #}
    {% include 'snipplets/notification.tpl' with {order_notification: true} %}
    <div class="container">
        {% if languages | length > 1 %}
            <div class="span4 m-top-half">
                <div class="languages">
                    {% for language in languages %}
                        {% set class = language.active ? "" : "opacity-50" %}
                        <a href="{{ language.url }}" class="{{class}} m-right-quarter">{{ language.country | flag_url | img_tag(language.name) }}</a>
                    {% endfor %}      
                </div>
            </div>
        {% endif %}

        {% if settings.search_header %}
            <div class="p-relative span4 {% if languages | length == 1 %} offset4 {% endif %}">
                {% if store.email %} 
                    <div class="font-small font-italic m-top-quarter text-center">
                        {{ store.email | mailto }}
                    </div>
                {% endif %}
            </div>
        {% else %}
            <div class="desktop-search p-relative span4 {% if languages | length == 1 %} offset4 {% endif %}">
                <div class="js-search-container searchbox">
                    <form action="{{ store.search_url }}" method="get" class="js-search-form">
                        <input class="js-search-input desktop-search-input" autocomplete="off" type="search" name="q" placeholder="{{ '¿Qué estás buscando?' | translate }}"/>
                        <span class="desktop-search-icon">
                            {% include "snipplets/svg/search.tpl" with {fa_custom_class: "svg-search-icon nav-svg"} %}
                        </span>
                        <input class="desktop-search-submit" type="submit" value=""/>
                    </form>
                </div>
                <div class="js-search-suggest search-suggest">
                    {# AJAX container for search suggestions #}
                </div>
            </div>
        {% endif %}

        <div class="p-relative span4 font-small-extra text-right text-uppercase {% if settings.search_header %}m-top-quarter m-bottom-quarter{% else %}m-top-half m-bottom-half{% endif %}">
            {% if store.has_accounts %}
                {% if not customer %}
                    {% if 'mandatory' not in store.customer_accounts %}
                        {{ "Crear cuenta" | translate | a_tag(store.customer_register_url, {class: 'p-right-quarter head-top-link'}) }}
                        <span>-</span>
                    {% endif %}
                    {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, {class: 'p-left-quarter head-top-link'}) }}
                {% else %}
                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url, {class: 'p-right-quarter head-top-link'}) }}
                    <span>-</span>
                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, {class: 'p-left-quarter head-top-link'}) }}
                {% endif %}
            {% endif %}
        </div>
    </div>
</div>