{# Single snipplet that work as credit cards example #}
<div class="footer-ship-pay visible-when-content-ready p-top p-bottom">
    <div class="row-fluid">
        <div class="container">
            <div class="span8 footer-payments text-left text-center-xs">
                {% if store.country == 'BR' %}
                    {% for payment_method in [ 'visa','mastercard', 'amex', 'diners', 'pagseguro', 'moip' ] %}
                      {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                    {% endfor %}
                {% else %}
                    {% for payment_method in [ 'visa','mastercard', 'amex', 'diners', 'mercadopago' ] %}
                      {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                    {% endfor %}
                    {% if store.country == 'AR' %}
                        {% for payment_method in [ 'ar/pagofacil','ar/rapipago', 'ar/tarjeta-naranja' ] %}
                          {{ payment_method | payment_new_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                        {% endfor %}                                
                    {% endif %}
                {% endif %}
            </div>
            <div class="span4 footer-shipping m-top-xs text-right text-center-xs">
                {% if store.country == 'BR' %}
                    {% for shipping_method in [ 'br/correios','br/jadlog' ] %}
                      {{ shipping_method | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                    {% endfor %}
                {% else %}
                    {% for shipping_method in [ 'fedex','ups' ] %}
                      {{ shipping_method | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                    {% endfor %}
                    {% if store.country == 'AR' %}
                        {{ "ar/oca" | shipping_logo | img_tag('', {class : 'footer-payship-img card-img', height : 30}) }}
                    {% endif %}
                {% endif %}
            </div>
        </div>
    </div>
</div>