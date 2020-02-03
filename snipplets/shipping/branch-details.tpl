<div class="js-toggle-branches link-module no-border">
    <span class="link-module-icon d-inline-block">
        {% include "snipplets/svg/store.tpl" %}
    </span>
    <span class="link-module-content">
        <div class="font-body">
            {% if store.branches|length > 1 %}
                {{ 'Retirá gratis en nuestros locales' | translate }}
            {% else %}
                {{ 'Retirá gratis en nuestro local' | translate }}
            {% endif %}
        </div>
        <div class="btn-link">
            {% if product_detail %}
                <span class="js-see-branches">
                    {% if store.branches|length > 1 %}
                        {{ 'Ver locales' | translate }}
                    {% else %}
                        {{ 'Ver local' | translate }}
                    {% endif %}
                </span>
            {% else %}
                <span>
                    {{ 'Elegir local' | translate }}
                </span>
            {% endif %}
            {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "js-see-branches svg-inline--fa m-left-quarter"} %}

            <span class="js-hide-branches" style="display: none;">
                {% if product_detail %}
                    {% if store.branches|length > 1 %}
                        {{ 'Ocultar locales' | translate }}
                    {% else %}
                        {{ 'Ocultar local' | translate }}
                    {% endif %}
                {% endif %}
                {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "svg-inline--fa m-left-quarter"} %}
            </span>
        </div>
    </span>
</div>

{# Store branches #}

{% if not product_detail %}
    
    <ul class="js-store-branches-container list-unstyled radio-button-container box-shadow p-none m-bottom" style="display: none;">

        {# Selectable branches #}

        {% for branch in store.branches %}
            <li class="radio-button-item">
                <label class="js-shipping-radio js-branch-radio radio-button {% if store.branches|length == 1 or loop.last %}m-bottom-none{% endif %}" data-loop="branch-radio-{{loop.index}}">
                    <input 
                    class="js-branch-method {% if cart.shipping_data.code == branch.code %} js-selected-shipping-method {% endif %} shipping-method" 
                    data-price="0" 
                    {% if cart.shipping_data.code == branch.code %}checked{% endif %} type="radio" 
                    value="{{branch.code}}" 
                    data-name="{{ branch.name }} - {{ branch.extra }}"
                    data-code="{{branch.code}}" 
                    data-cost="{{ 'Gratis' | translate }}"
                    name="option" 
                    style="display:none">
                    <span class="row-fluid radio-button-content">
                        <div class="radio-bg-selected"></div>
                        <div class="radio-button-icons-container">
                            <span class="radio-button-icons">
                                <span class="radio-button-icon unchecked"></span>
                                <span class="radio-button-icon checked"></span>
                            </span>
                        </div>
                        <span class="radio-button-label">
                            <div class="row-fluid radio-button-text">
                                <div class="span9 col-xs-9-custom pull-left-xs p-right-half">
                                    <div class="shipping-method-name">
                                         {{ branch.name }} <span class="m-left-quarter">{{ branch.extra }}</span>
                                    </div>
                                </div>
                                <div class="span3 col-xs-3-custom pull-right-xs h6 text-right">
                                    <strong class="shipping-method-price text-primary">
                                        {{ 'Gratis' | translate }}
                                    </strong>
                                </div>
                            </div>
                        </span>
                    </span>
                </label>
            </li>
        {% endfor %}
    </ul>
{% else %}
    <ul class="js-store-branches-container list-readonly list-unstyled box-shadow p-none m-bottom" style="display: none;">
        {% for branch in store.branches %}
            <li class="list-item">
                <div class="list-item-content row-fluid">
                    <div class="span9 col-xs-9-custom pull-left-xs p-right-half">
                        <div class="shipping-method-name">
                            {{ branch.name }} <span class="m-left-quarter">{{ branch.extra }}</span>
                        </div>
                    </div>
                    <div class="span3 col-xs-3-custom pull-right-xs h6 text-right">
                        <strong class="shipping-method-price text-primary">
                            {{ 'Gratis' | translate }}
                        </strong>
                    </div>
                </div>
            </li>
        {% endfor %}
    </ul>
{% endif %}