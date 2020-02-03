{% if shipping_calculator_show %}
<div class="shipping-calculator row-fluid {% if product_detail %} product-shipping-calculator m-top-half{% else %} cart-shipping-calculator m-top{% endif %} m-bottom ">

    {% if store.has_shipping_polish %} 
        <div class="js-shipping-calculator-head shipping-calculator-head p-relative transition-soft {% if cart.shipping_zipcode %}with-zip{% else %}with-form{% endif %}">
        
            <div class="js-shipping-calculator-with-zipcode transition-up row-fluid {% if cart.shipping_zipcode %}transition-up-active{% endif %} p-absolute">
                <div class="span12 p-none">
                    <span class="pull-left m-top-half">{{ "Entregas para el CP:" | translate }} <strong class="js-shipping-calculator-current-zip">{{ cart.shipping_zipcode }}</strong></span>
                    <a class="js-shipping-calculator-change-zipcode btn btn-default btn-smallest pull-right" href="#">{{ "Cambiar CP" | translate }}</a>
                </div>
            </div>
    {% endif %} 
    <div class="js-shipping-calculator-form shipping-calculator-form row-fluid {% if store.has_shipping_polish %}transition-up p-absolute {% if not cart.shipping_zipcode %}transition-up-active{% endif %}{% endif %}" {% if shipping_calculator_variant and not shipping_calculator_variant.available %}style="display: none;" {% endif %}>
        <p class="p-bottom-quarter">
            {% include "snipplets/svg/truck-solid.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter opacity-80 svg-text-fill"} %}
            <span class="font-medium">
                
				{# Free shipping achieved label #}

				<span class="js-free-shipping-message" {% if not cart.free_shipping.cart_has_free_shipping %}style="display: none;"{% endif %}>
					{{ "¡Genial! <strong class='text-primary'>Tenés envío gratis</strong> en esta compra" | translate }}
				</span>

				{# Free shipping with min price label #}

				<span class="js-shipping-calculator-label" {% if cart.free_shipping.cart_has_free_shipping or not cart.free_shipping.min_price_free_shipping.min_price %}style="display: none;"{% endif %}>
					{{ "<strong class='text-primary'>Envío gratis</strong> superando los" | translate }} <span>{{ cart.free_shipping.min_price_free_shipping.min_price }}</span>
				</span>

				{# Shipping default label #}

				<span class="js-shipping-calculator-label-default" {% if cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}style="display: none;"{% endif %}>

					{# Regular shipping calculator label #}
					
					{% if product_detail %}{{ 'Conocé nuestras opciones de envío' | translate }}{% else %}{{ 'Elegí nuestras opciones de envío' | translate }}{% endif %}
				</span>
            </span>
        </p>
        <div class="span12 m-none">
            <input type="tel" name="zipcode" class="js-shipping-input shipping-zipcode form-control form-control-secondary form-control-small border-thin input-shipping" placeholder="{{ 'Código postal' | translate }}" value="{{ cart.shipping_zipcode }}">
            {% if shipping_calculator_variant %}
            <input type="hidden" name="variant_id" id="shipping-variant-id" value="{{ shipping_calculator_variant.id }}">
            {% endif %}
            <button class="js-calculate-shipping btn btn-default btn-shipping btn-small m-left-quarter border-thin">  
                <span class="js-calculate-shipping-wording">{{ "Calcular envío" | translate }}</span>
                <span class="js-calculating-shipping-wording" style="display: none;">{{ "Calculando" | translate }}</span>
            </button>
            {% if not store.has_shipping_polish %} 
                 <div class="loading text-center m-top-half" style="display: none;">
                    {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin svg-text-fill"} %}
                </div>
            {% endif %}
            <div class="js-ship-calculator-error invalid-zipcode alert alert-danger m-top" style="display: none;">{{ "No encontramos este código postal. ¿Está bien escrito?" | translate }}</div>
            <div class="js-ship-calculator-error js-ship-calculator-common-error alert alert-danger m-top" style="display: none;">{{ "Ocurrió un error al calcular el envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
            <div class="js-ship-calculator-error js-ship-calculator-external-error alert alert-danger m-top" style="display: none;">{{ "El calculo falló por un problema con el medio de envío. Por favor intentá de nuevo en unos segundos." | translate }}</div>
        </div>
    </div>
    {% if store.has_shipping_polish %}
    </div>
        <div class="js-shipping-calculator-spinner pull-left full-width transition-soft text-center" style="display: none;">
            <div class="spinner-ellipsis">
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
                <div class="point"></div>
            </div>
        </div>
    {% endif %}
    <div class="js-shipping-calculator-response shipping-calculator-response clear-both {% if product_detail %}list-readonly{% endif %} {% if store.has_shipping_polish %}m-top-half{% else %}m-top{% endif %} p-top-half" style="display: none;"></div>
</div>
{% endif %}