{% if installments_info %}
{% set gateways = installments_info | length %}
{% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
    <div id="installments-modal" class="modal js-mobile-installments-panel modal-xs modal-xs-right hide fade {% if gateways <= '3' %} two-gates {% endif %}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-xs-dialog">
             <div class="modal-header with-tabs">
                <a class="js-mobile-toggle-installments modal-xs-header visible-phone" href="#" data-dismiss="modal">
                    <span class="modal-xs-header-icon modal-xs-right-header-icon">
                        {% include "snipplets/svg/arrow-left.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
                    </span>
                    <span class="modal-xs-header-text modal-xs-right-header-text">
                        {% if store_set_for_new_installments_view %}
                            {{ 'Medios de pago' | translate }}
                        {% else %}
                            {{ 'Detalles de las cuotas' | translate }}

                        {% endif %}
                    </span>
                </a>

                {# Modal header and gateways tab links #}

                <div class="nav-tabs-container horizontal-container">
                    <ul class="nav nav-tabs m-right-double">
                        {% for method, installments in installments_info %}
                            <li id="method_{{ method }}" class="js-refresh-installment-data js-installments-gw-tab tab m-bottom-none {% if loop.first %} active {% endif %}" data-code="{{ method }}">
                                <a href="#installment_{{ method }}_{{ installment }}" class="tab-link" data-toggle="tab">{{ method == 'paypal_multiple' ? 'PAYPAL' : (method == 'itaushopline'? 'ITAU SHOPLINE' : method == 'boleto_paghiper'? 'BOLETO PAGHIPER' : method | upper) }}</a>
                            </li>

                            {# Custom payment method #}

                            {% if loop.last and custom_payment is not null %}
                              <li id="method_{{ custom_payment.code }}" class="js-refresh-installment-data js-installments-gw-tab tab m-bottom-none" data-code="{{ custom_payment.code }}">
                                  <a href="#installment_{{ custom_payment.code }}" class="tab-link" data-toggle="tab">{{ custom_payment.name | upper }}</a>
                              </li>
                            {% endif %}

                        {% endfor %}
                    </ul>
                    <button type="button" class="btn-floating m-right-half m-top-quarter hidden-phone" data-dismiss="modal" aria-hidden="true">{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}</button>
                </div>
             </div>
             <div class="modal-content">
                <div class="modal-body modal-xs-body">

                    {# Gateways tab content #}

                    <div class="tab-content">
                        {% for method, installments in installments_info %}
                            {% set discount = product.get_gateway_discount(method) %}
                            <div class="tab-pane{% if loop.first %} active {% endif %} js-gw-tab-pane" id="installment_{{ method }}_">
                                <div class="full-width pull-left">

                                    {% if store_set_for_new_installments_view %}

                                        {# Payments info with readonly #}

                                        {% if method == 'mercadopago' and store.country == 'AR' %}

                                            {# Payments Gateways with banks: at the moment only MP AR #}

                                            {% include 'snipplets/payments/payments-info-banks.tpl' %}
                                        {% else %}

                                            {# Payments Gateways with cards only #}

                                            {% include 'snipplets/payments/payments-info.tpl' %}
                                        {% endif %}

                                    {% else %}

                                        {# Installments list for ROLA stores #}

                                        {% for installment, data_installment in installments %}
                                            <div class="m-bottom-quarter p-left-quarter" id="installment_{{ method }}_{{ installment }}">
                                                {% set rounded_installment_value = data_installment.installment_value | round(2) %}
                                                {% set total_value = (data_installment.without_interests ? data_installment.total_value : installment * data_installment.installment_value) %}
                                                {% set total_value_in_cents = total_value  | round(2) * 100 %}
                                                <strong class="js-installment-amount installment-amount">{{ installment }}</strong> {% if store.country != 'BR' %}cuota{% if installment > 1 %}s{% endif %} de{% else %}x{% endif %} <strong class="js-installment-price">{{ (rounded_installment_value * 100) | money }}</strong>
                                                {% if data_installment.without_interests %} {{ 'sin interés' | t }}{% endif %}
                                            </div>
                                        {% endfor %}
                                    {% endif %}
                                </div>
                            </div>

                            {# Custom payment method #}

                            {% if loop.last and custom_payment is not null %}
                              <div class="tab-pane js-gw-tab-pane" id="installment_{{ custom_payment.code }}">
                                  <div class="box-container">

                                    {# Custom method instructions #}

                                    <p class="weight-strong m-bottom-half">{{ 'Cuando termines la compra vas a ver la información de pago en relación a esta opción.' | translate }}</p>

                                    {# Price total #}

                                    <div class="h6 m-top-quarter">
                                        <span class="m-right-quarter">{{ 'Total:' | translate }}</span><span class="js-installments-one-payment weight-strong text-primary">{{ product.price | money }}</span>
                                    </div>

                                    {% if custom_payment.discount > 0 %}
                                        <div class="m-top-half"> {{ custom_payment.name }}: {{ 'tiene un' | translate }} <strong>{{ custom_payment.discount }}% {{'de descuento' | translate }}</strong> {{'que será aplicado sobre el costo total de la compra al finalizar la misma.' | translate }}</div>
                                    {% endif %}

                                  </div>
                              </div>
                            {% endif %}
                        {% endfor %}
                    </div>

                </div>

                {# Modal footer and close button #}

                <div class="modal-footer hidden-phone">
                    <a href="#" class="btn btn-small btn-link pull-right p-none" data-dismiss="modal">{{ 'Volver al producto' | translate }}</a>
                </div>
             </div>
        </div>
    </div>
{% endif %}
