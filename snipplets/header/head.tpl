<div class="js-head desk-header hidden-phone">
    <div class="container">
        <div class="logo-box">
            {% if template == 'home' %}
                <h1 class="h3 m-0">
            {% endif %}
            <div id="logo" class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                {{ store.logo('medium') | img_tag(store.name, {class: 'logo-img  transition-soft'}) | a_tag("https://7mboots.com.br/") }}
            </div>
            <div id="no-logo" class="logo-text-container {% if has_logo %} hidden{% endif %}">
                <a class="logo-text h3" href="https://7mboots.com.br/">{{ store.name }}</a>
            </div>
            {% if template == 'home' %}
                </h1>
            {% endif %}
        </div>

        {% if settings.search_header %}
            <div class="js-search-container searchbox ">
                <form action="{{ store.search_url }}" method="get" class="js-search-form">
                    <input class="js-search-input desktop-search-input" autocomplete="off" type="search" name="q" placeholder="Pesquisar"/>
                    <input class="desktop-search-submit" type="submit" value=""/>
                </form>
            </div>
            <div class="js-search-suggest search-suggest">
                {# AJAX container for search suggestions #}
            </div>
        {% endif %}

        <div class="account-box {% if settings.search_header %} header-search-active {% endif %}">
            {% if store.has_accounts %}
                {% if not customer %}
                    {% if 'mandatory' not in store.customer_accounts %}
                        {{ "Cadastrar" | translate | a_tag(store.customer_register_url, {class: 'head-top-link'}) }}
                    {% endif %}
                    {{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, {class: 'head-top-link'}) }}
                {% else %}
                    {{ "Mi cuenta" | translate | a_tag(store.customer_home_url, {class: 'p-right-quarter head-top-link'}) }}
                    {{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, {class: 'head-top-link'}) }}
                {% endif %}
            {% endif %}
        </div>

        <div class="cart-box">
            {% if not store.is_catalog and template != 'cart' %}
                {% if settings.ajax_cart %}
                    {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                {% else %}
                    {% snipplet "cart-widget.tpl" as "cart" %}
                {% endif %}
            {% endif %}
        </div>
    </div>

    <div class="main-menu">
        <div class="moldura-top">
            <img src="{{ 'images/moldura-top-menu.png' | static_url }}" />
        </div>
        <ul class="js-desktop-nav desktop-nav container">
            {% snipplet "navigation/navigation.tpl" %}
        </ul>
    </div>
</div>