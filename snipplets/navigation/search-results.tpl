<ul class="search-suggest-list">
    {% set search_suggestions = products | take(6) %}
    {% for product in search_suggestions %}
        <li class="search-suggest-item">
            <a href="{{ product.url }}" class="search-suggest-link">
                <div class="search-suggest-image-container hidden-phone">
                    {{ product.featured_image | product_image_url("tiny") | img_tag(product.featured_image.alt, {class: 'search-suggest-image'}) }}
                </div>
                <div class="search-suggest-text full-width-xs">
                    <p class="search-suggest-name text-left">
                        {{ product.name | highlight(query) }}
                    </p>
                    {% if product.display_price %}
                        <p class="hidden-phone text-left weight-strong text-primary">
                            {{ product.price | money }}
                        </p>
                        {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                        {% if product_can_show_installments %}
                            <span class="hidden-phone text-left font-small">
                                {% set max_installments_without_interests = product.get_max_installments(false) %}
                                {% if store.country == 'AR' %}
                                    {% set max_installments_with_interests = product.get_max_installments %}
                                    {% if max_installments_with_interests %}
                                        <div>{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% endif %}
                                {% else %}
                                    {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                                        <div class="m-none">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
                                    {% else %}
                                        {% set max_installments_with_interests = product.get_max_installments %}
                                        {% if max_installments_with_interests %}
                                            <div class="m-none">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                                        {% endif %}
                                    {% endif %}
                                {% endif %}
                            </span>
                        {% endif %}
                    {% endif %}
                </div>
                {% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa search-suggest-icon hidden-phone "} %}
            </a>
        </li>
    {% endfor %}
    <li class="search-suggest-item hidden-phone">
        <a href="#" class="js-search-suggest-all-link search-suggest-link search-suggest-all-link">{{ 'Ver todos los resultados' | translate }}</a>
    </li>
</ul>
