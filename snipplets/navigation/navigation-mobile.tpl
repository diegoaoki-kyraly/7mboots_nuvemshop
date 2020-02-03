<div class="js-mobile-nav-second-row mobile-nav mobile-nav-second-row container-fluid">
        {% snipplet "navigation/navigation-mobile-tabs.tpl" %}
</div>

{# Categories list for mobile #}
<div class="js-categories-mobile-container" style="display:none;">
    <ul class="modal-xs mobile-nav-categories-container">
        <li> 
            <a href="#" class="js-toggle-mobile-categories btn-floating pull-right p-relative m-all-half">{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}</a>
        </li>
        <li>
            <a class="modal-xs-list-item darker"  href="{{ store.products_url }}">
                {{ 'Ver todos los productos' | translate }}
            </a>
        </li>
        {% snipplet "navigation/navigation-mobile-categories.tpl" %}
    </ul>
    {% for category in categories %}
        {% snipplet "navigation/navigation-mobile-categories-panels.tpl" %}
    {% endfor %}
</div>