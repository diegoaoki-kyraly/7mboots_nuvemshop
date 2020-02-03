{# Order notification #}

{% if order_notification and status_page_url %}
    <div data-url="{{ status_page_url }}" class="js_notification notification notification-secondary" style="display:none;">
        <div class="container">
            <span>{{ "Seguí acá" | translate | a_tag(status_page_url) }}</span> <span>{{ "tu última compra" | translate }}</span>
            <a class="js_notification_close pull-right notification-close" href="#">
            	{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
            </a>
        </div>
    </div>
{% endif %}
