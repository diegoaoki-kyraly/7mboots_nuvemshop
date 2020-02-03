{% if options %}

	 {% if store.has_shipping_segmentation %}

        {# Check for only shipping featured options #}

        {% set has_featured_shipping = false %}

        {% for option in options_to_show if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
            {% if option |length >= 1 %}
                {% set has_featured_shipping = true %}
            {% endif %}
        {% endfor %}

        {# Check for only non featured shipping options #}

        {% set has_non_featured_shipping = false %}

        {% for option in options_to_hide if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
            {% if option |length >= 1 %}
                {% set has_non_featured_shipping = true %}
            {% endif %}
        {% endfor %}

        {# Check for only pickup featured options #}

        {% set has_featured_pickup = false %}

        {% for option in options_to_show if option.shipping_type == 'pickup' or option.method == 'branch' %}
            {% if option |length >= 1 %}
                {% set has_featured_pickup = true %}
            {% endif %}
        {% endfor %}


        {# Check for only non featured pickup options #}

        {% set has_non_featured_pickup = false %}

        {% for option in options_to_hide if option.shipping_type == 'pickup' or option.method == 'branch' %}
            {% if option |length >= 1 %}
                {% set has_non_featured_pickup = true %}
            {% endif %}
        {% endfor %}

        {# Shipping featured options #}

        {% if has_featured_shipping %}

            <div class="full-width-container m-bottom {% if has_featured_pickup %}p-bottom{% endif %}">
                <div class="box-title">{{ "Entrega a domicilio" | translate }}</div>

                <ul class="list-unstyled shipping-list list-unstyled radio-button-container box-shadow p-none m-bottom-half">

                    {# Smart shipping hides similar shipping options on a toggle div and also shows an improved shipping item #}

                    {# Check if smart shipping is needed #}

                    {# Include branch options inside calculador #}

                    {% for option in options_to_show if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
                        {% include "snipplets/shipping/shipping-calculator-item.tpl" with {'featured_option': true} %}
                    {% endfor %}

                    {% if has_non_featured_shipping %}

                        <div class="js-other-shipping-options full-width-container shipping-extra-options" style="display: none;">

                            {# Smart shipping hides similar shipping options on a toggle div and also shows an improved shipping item #}

                            {# Check if smart shipping is needed #}

                            {# Include branch options inside calculador #}

                            {% for option in options_to_hide if option.shipping_type == 'ship' or option.shipping_type == 'delivery' or (option.method == 'table' and option.shipping_type == 'custom') %}
                                {% include "snipplets/shipping/shipping-calculator-item.tpl" %}
                            {% endfor %}
                        </div>

                        <a href="#" class="js-toggle-more-shipping-options js-show-more-shipping-options btn-link btn-link-centered border-box">
    			    		<span class="js-shipping-see-more">
                                {{ 'Ver más opciones de entrega' | translate }}
                            </span>
                            <span class="js-shipping-see-less" style="display: none;">
                                {{ 'Ver menos opciones de entrega' | translate }}
                            </span>
    			    	</a>
                    {% endif %}
                </ul>
            </div>

        {% endif %}

        {# Pickup featured options #}

        {% if has_featured_pickup %}

            <div class="full-width-container m-bottom">
                <div class="box-title">{{ "Retirar por" | translate }}</div>

                <ul class="list-unstyled shipping-list list-unstyled radio-button-container box-shadow p-none m-bottom-half">

                    {# Smart shipping hides similar shipping options on a toggle div and also shows an improved shipping item #}

                    {# Check if smart shipping is needed #}

                    {# Include branch options inside calculador #}

                    {% for option in options_to_show if option.shipping_type == 'pickup' or option.method == 'branch'   %}
                        {% include "snipplets/shipping/shipping-calculator-item.tpl" with {'featured_option': true, 'pickup' : true} %}
                    {% endfor %}

                    {% if has_non_featured_pickup %}

                        <div class="js-other-pickup-options full-width-container shipping-extra-options" style="display: none;">

                            {# Smart shipping hides similar shipping options on a toggle div and also shows an improved shipping item #}

                            {# Check if smart shipping is needed #}

                            {# Include branch options inside calculador #}

                            {% for option in options_to_hide if option.shipping_type == 'pickup' or option.method == 'branch'   %}
                                {% include "snipplets/shipping/shipping-calculator-item.tpl" with {'pickup' : true}  %}
                            {% endfor %}
                        </div>

                        <a href="#" class="js-toggle-more-shipping-options js-show-other-pickup-options btn-link btn-link-centered border-box">
        		    		<span class="js-shipping-see-more">
                                {{ 'Ver más opciones de retiro' | translate }}
                            </span>
                            <span class="js-shipping-see-less" style="display: none;">
                                {{ 'Ver menos opciones de retiro' | translate }}
                            </span>
        		    	</a>
                    {% endif %}
                </ul>
            </div>
        {% endif %}

    {% else %}

		<ul class="list-unstyled radio-button-container box-shadow p-none m-bottom">

			{# Smart shipping hides similar shipping options on a toggle div and also shows an improved shipping item #}

		    {# Check if smart shipping is needed #}

			{% set has_options_to_hide = false %}

			{% for option in options_to_hide %}
				{% if options_to_hide|length >= 1 %}
					{% set has_options_to_hide = true %}
				{% endif %}
			{% endfor %}

			{% for option in options_to_show if store.country == 'BR' or option.method != "branch" %}
				{% include "snipplets/shipping/shipping-calculator-item.tpl" with {'featured_option': true} %}
			{% endfor %}

			{% if has_options_to_hide %}
			    <div class="js-other-shipping-options shipping-extra-options full-width-container" style="display: none;">
				    {% for option in options_to_hide if store.country == 'BR' or option.method != "branch" %}
					 	{% include "snipplets/shipping/shipping-calculator-item.tpl" %}
				    {% endfor %}
				</div>
                <a href="#" class="js-toggle-more-shipping-options js-show-more-shipping-options btn-link btn-link-centered border-box">
                    <span class="js-shipping-see-more">{{ 'Ver más opciones' | translate }}</span>
                    <span class="js-shipping-see-less" style="display: none;">{{ 'Ver menos opciones' | translate }}</span>
                </a>
			{% endif %}
		</ul>
	{% endif %}

	{% if store.has_smart_dates and show_time %}
        <div class="text-center full-width-container m-bottom-half">{{"El tiempo de entrega no considera feriados." | translate}}</div>
    {% endif %}

<div class="js-product-shipping-label full-width-container text-center" style="display: none;">
	<span class="js-shipping-filled-cart js-visible-on-cart-filled" {% if cart.items_count == 0 %}style="display:none;"{% endif%}>
    	{% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %}<span class="align-middle">{{ 'El precio de envío incluye este producto y todos los que agregaste al carrito.' | translate }}</span>
    </span>
</div>
<div style="clear: both;"></div>
{% else %}
<span>{{"No hay costos de envío para el código postal dado." | translate}}</span>
{% endif %}

{# Don't remove this #}
<input type="hidden" name="after_calculation" value="1"/>
<input type="hidden" name="zipcode" value="{{zipcode}}"/>
