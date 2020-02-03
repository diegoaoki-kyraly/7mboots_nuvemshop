{% for category in categories %}
    {% if category.subcategories %}
        <li class="mobile-nav-list-item">
            <span data-target="js-category-{{ category.id }}" class="modal-xs-list-item js-open-mobile-subcategory">
                {{ category.name }}
                <div class="link-module-icon-right modal-xs-list-icon">
                    {% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}
                </div>  
            </span>
        </li>
    {% else %}
        <li class="mobile-nav-list-item">
            <a class="modal-xs-list-item" href="{{ category.url }}">
                {{ category.name }}
            </a>
        </li>
    {% endif %}
{% endfor %}
