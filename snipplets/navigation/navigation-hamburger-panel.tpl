<div class="clear-both">
    <span class="js-modal-close btn-hamburger-close p-absolute">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa btn-hamburger-close-icon pull-right p-all-half"} %}
    </span>
    <ul class="list-items">
        {% snipplet "navigation/navigation-hamburger-list.tpl" %}
    </ul>
</div>

<div class="hamburger-panel-first-row">
    {% if languages | length > 1 %}
        <div class="languages span12 clear pull-left p-left-quarter p-top-half p-right-double">
            {% for language in languages %}
                {% set class = language.active ? "" : "opacity-50" %}
                <a href="{{ language.url }}" class="{{ class }} pull-left p-all-half border-top-none-xs border-bottom-none-xs">{{ language.country | flag_url | img_tag(language.name) }}</a>
            {% endfor %}
        </div>
    {% endif %}
    <ul class="clear-both p-top-half p-bottom-half">
        <div class="mobile-accounts">
             {% if not customer %}
                {% if store.customer_accounts != 'mandatory' %}
                <li class="mobile-accounts-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'mobile-accounts-link border-bottom-none-xs border-top-none-xs weight-normal') }}</li>
                {% endif %}
                <li class="mobile-accounts-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'mobile-accounts-link border-top-none-xs weight-normal') }}</li>
            {% else %}
                <li class="mobile-accounts-item">{{ "Mi cuenta" | translate | a_tag(store.customer_home_url, '', 'mobile-accounts-link border-bottom-none-xs border-top-none-xs weight-normal') }}</li>
                <li class="mobile-accounts-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'mobile-accounts-link border-top-none-xs ') }}</li>
            {% endif %}
        </div>
    </ul>
</div>