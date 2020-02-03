<div class="js-head mobile-header hidden-desktop visible-phone">
    <div class="container">
    	<div  class="js-modal-open btn-hamburger-container text-center" data-toggle="#nav-hamburger">
            <div class="mobile-nav-first-row-icon btn-hamburger svg-primary-fill">
                {% include "snipplets/svg/hamburger.tpl" %}
                <span>Menu</span>
            </div>
        </div>

        <div class="logo-box">
            {% if template == 'home' %}
                <div class="h3 m-0">
            {% endif %}
            <div id="logo" class="logo-img-container {% if not has_logo %}hidden{% endif %}">
                {{ store.logo('medium') | img_tag(store.name, {class: 'logo-img  transition-soft'}) | a_tag("https://7mboots.com.br/") }}
            </div>
            <div id="no-logo" class="logo-text-container {% if has_logo %} hidden{% endif %}">
                <a class="logo-text h3" href="https://7mboots.com.br/">{{ store.name }}</a>
            </div>
            {% if template == 'home' %}
                </div>
            {% endif %}
        </div>

        <div class="header-icons {% if not settings.search_header %}m-none p-top-half{% endif %} p-top-quarter-xs m-bottom-quarter-xs">
            <div class="js-toggle-mobile-search js-toggle-mobile-search-open header-icons-container mobile-search-btn">
                <div class="mobile-nav-first-row-icon svg-primary-fill">
                    {% include "snipplets/svg/search.tpl" with {fa_custom_class: "svg-search-icon nav-svg"} %}
                </div>
            </div> 
            <div class="header-icons-container">            
                {% if not store.is_catalog and template != 'cart' %}
                    {% if settings.ajax_cart %}
                        {% snipplet "cart-widget-ajax.tpl" as "cart" %}
                    {% else %}
                        {% snipplet "cart-widget.tpl" as "cart" %}
                    {% endif %}
                {% endif %}
            </div>
        </div>
    </div>
    <div class="mobile-search">
        <form class="js-search-container js-search-form" action="{{ store.search_url }}" method="get">
            <input class="js-search-input header-input" autocomplete="off" type="search" name="q" placeholder="Encontre aqui seu produto..." />
            <button type="submit" class="btn btn-desktop-search" value="">Buscar</button>
        </form>
        <div class="js-search-suggest search-suggest">
            {# AJAX container for search suggestions #}
        </div>
    </div>
</div>

{% if settings.tab_menu  %}
    <div class="visible-phone">
        {% snipplet "navigation/navigation-mobile.tpl" %}
    </div>
{% endif %}