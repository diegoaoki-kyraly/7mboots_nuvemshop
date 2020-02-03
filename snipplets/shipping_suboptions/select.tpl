{% set selected_option = loop.first or cart.shipping_option == option.name %}
<div class="js-shipping-suboption shipping-suboption {{suboptions.name}}">
    {% if suboptions.options %}

        {% if store.has_shipping_polish %}

            {% set modal_id_val = (suboptions.name | sanitize) ~ '-pickup-modal-' ~ random() %}

            <a href="#{{ modal_id_val }}" data-toggle="modal" class="js-trigger-modal-zindex-top js-shipping-suboption-list btn-link btn-block" style="display: none;">
                {% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter"} %}
                <span class="align-middle">{{ 'Ver puntos de retiro' | translate }}</span>
            </a>


            <div id="{{ modal_id_val }}" class="js-modal-shipping-suboptions modal modal-xs modal-xs-centered hide fade modal-zindex-top" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="js-close-modal-zindex-top modal-header" data-dismiss="modal" aria-hidden="true">
                    <button type="button" class="btn-floating m-right-half m-top-quarter" >
                        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}
                    </button>
                    <h3>{{ 'Puntos de retiro' | translate }}</h3>
                </div>
                <div class="modal-body">
                    <ul class="list-unstyled">
                        {% for option in suboptions.options %}
                            <li class="text-capitalize m-bottom-half">{% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill d-flex pull-left m-right-half icon-align-middle"} %} <span class="d-flex">{{ option.name | lower }}</span></li>
                        {% endfor %}
                        {% for option in suboptions.options %}
                            <li class="text-capitalize m-bottom-half">{% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill d-flex pull-left m-right-half icon-align-middle"} %} <span class="d-flex">{{ option.name | lower }}</span></li>
                        {% endfor %}
                    </ul>
                    <div class="m-top"><span>{{ 'Cercanos al CP:'}}</span> <span class="text-primary font-weight-bold">{{cart.shipping_zipcode}}</span></div>
                    <div class="m-top-quarter font-small">
                        {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill m-right-quarter"} %}
                        <i class="align-middle">{{ "Vas a poder elegir estas opciones desde el carrito de compras" | translate }}</i>
                    </div>
                </div>
            </div>

        {% else %}

            <p class="js-shipping-suboption-product m-bottom-half" style="display: none;">{{ 'Vas a poder elegir alguna de las siguientes opciones antes de finalizar la compra:' | translate }}</p>

            {# Read only suboptions #}
            <ul class="js-shipping-suboption-list p-left border-box list-syle-disc" name="{{suboptions.name}}" style="display: none;">
                {% for option in suboptions.options %}
                    <li class="text-capitalize m-bottom-quarter">{{ option.name | lower }}</li>
                {% endfor %}
            </ul>

        {% endif %}

        {# Select suboptions for cart page #}
        <select class="js-shipping-suboption-select{% if selected_option and suboptions.required %} required {% endif %} full-width m-none-bottom m-top-quarter" name="{{suboptions.name}}" style="display:none;">
            <option {% if not suboptions.selected %}selected{% endif %} disabled>{{ suboptions.default_option | translate }}</option>
            {% for option in suboptions.options %}
                <option value="{{option.value}}">{{ option.name | lower }}</option>
            {% endfor %}
        </select>

    {% else %}
        <input type="hidden" name="{{suboptions.name}}"/>
        <div>{{ suboptions.no_options_message | translate }}</div>
    {% endif %}
</div>