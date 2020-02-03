<div id="categories-column">
    <div class="js-append-filters m-bottom" style="display: none;">
        <h5 class="h6 weight-normal m-bottom-half hidden-phone">{{ 'Filtrar por:' | translate }}</h5>
        <h5 class="visible-phone m-top-half font-small weight-normal m-bottom-quarter">{{ 'Filtro aplicado:' | translate }}</h5>
    </div>

    {% if parent_category and parent_category.id!=0 %}
        <a href="{{ parent_category.url }}" title="{{ parent_category.name }}" class="category-back hidden-phone m-bottom">{% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa m-right-half svg-text-fill"} %}{{ parent_category.name }}</a>
    {% endif %}

    {% if filter_categories %}
        <div class="hidden-phone">
            <ul>
                {% for category in filter_categories %}
                    <li data-item="{{ loop.index }}" class="js-category-sidebar-item m-bottom-quarter"><a href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a></li>
                {% endfor %}
            </ul>
            <a href="#" id="show-more-categories" class="btn-more-categories clear-both" style="display: none;" title="{{ 'Mostrar más categorías' | translate }}">
                <span class="js-btn-categories-icon btn-categories-icon">
                    {% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}
                </span>
            </a>
        </div>
    {% endif %}

</div>
