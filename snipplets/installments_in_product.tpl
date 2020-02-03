{% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
{% if product_can_show_installments %}
    <div class="js-max-installments-container text-tertiary">
        {% set has_payment_logos = settings.payments %}
        {% if not has_payment_logos %}
            {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa pull-left opacity-80 m-right-quarter svg-tertiary-fill"} %}
        {% endif %}
        {% set max_installments_without_interests = product.get_max_installments(false) %}
        {% set max_installments_with_interests = product.get_max_installments %}
        {% if store.country == 'AR' %}
            {% if max_installments_with_interests %}
                <div>{{ "Hasta <strong class='js-installment-amount installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
            {% else %}
                <div style="display: none;">
                {% if product.max_installments_without_interests %}
                    {{ "Hasta <strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés" | t(null, null) }}
                {% else %}
                    {{ "Hasta <strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés" | t(null, null) }}
                {% endif %}
                </div>
            {% endif %}
        {% else %}
            {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                    {% if not has_payment_logos %}
                        {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa pull-left opacity-80 m-right-quarter svg-tertiary-fill"} %}
                    {% endif %}
                    <div class="js-max-installments">{{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money) }}</div>
            {% else %}
                {% set max_installments_with_interests = product.get_max_installments %}
                {% if max_installments_with_interests %}
                    {% if not has_payment_logos %}
                        {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "js-installments-credit-card-icon svg-inline--fa pull-left opacity-80 m-right-quarter svg-tertiary-fill"} %}
                    {% endif %}
                    <div class="js-max-installments">{{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                {% else %}
                    {% if not has_payment_logos %}
                        <div class="js-installments-credit-card-icon" style="display: none;">
                            {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "svg-inline--fa pull-left opacity-80 m-right-quarter svg-tertiary-fill"} %}
                        </div>
                    {% endif %}
                    <div class="js-max-installments" style="display: none;">
                    {% if product.max_installments_without_interests %}
                        {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas sin interés de <strong class='js-installment-price installment-price'>{2}</strong>" | t(null, null) }}
                    {% else %}
                        {{ "<strong class='js-installment-amount installment-amount'>{1}</strong> cuotas de <strong class='js-installment-price installment-price'>{2}</strong>" | t(null, null) }}
                    {% endif %}
                    </div>
                {% endif %}
            {% endif %}
        {% endif %}
    </div>
{% endif %}