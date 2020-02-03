<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ "Mi cuenta" | translate }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            <div class="visible-when-content-ready">
                <div class="row-fluid">
                    <div class="customer-box span12 m-bottom m-top">
                        <h4 class="m-bottom">{{ 'Datos Personales' | translate }}</h4>
                        <div class="contact-data">
                            <div class="span4">
                                <img class="portrait" src="https://www.gravatar.com/avatar/{{ customer.email | lower | md5 }}?s=80&d=mm" height="80" width="80"/>
                            </div>
                            <div class="span8">
                                <div>{{customer.name}}</div>
                                <div>{{customer.email}}</div>
                                {% if customer.cpf_cnpj %}
                                    <div><strong>{{ 'CPF / CNPJ' | translate }}:</strong> {{ customer.cpf_cnpj | format_cpf_cnpj }}</div>
                                {% endif %}
                                {% if customer.phone %}
                                    <div><strong>{{ 'Teléfono' | translate }}:</strong> {{ customer.phone }}</div>
                                {% endif %}
                                {{ 'Editar mis datos' | translate | a_tag(store.customer_info_url, {class: 'text-primary'}) }}
                            </div>
                        </div>
                        {% if customer.default_address %}
                            <div class="addresses">
                                <div class="address">
                                    {{ customer.default_address | format_address_short }}
                                </div>
                                {{ 'Editar mis direcciones' | translate | a_tag(store.customer_addresses_url, {class: 'text-primary'}) }}
                            </div>
                        {% endif %}
                    </div>
                </div>
                <h4 class="m-bottom m-bottom-none-xs m-top-xs">{{ 'Mis Órdenes' | translate }}</h4>
                <div class="row-fluid hidden-phone">
                    <div class="span12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>{{'Orden' | translate}}</th>
                                    <th>{{'Fecha' | translate}}</th>
                                    <th>{{'Estado' | translate}}</th>
                                    <th>{{'Pago' | translate}}</th>
                                    <th>{{'Envío' | translate}}</th>
                                    <th>{{'Total' | translate}}</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                {% for order in customer.orders %}
                                {% set add_checkout_link = order.pending %}
                                <tr class="{% if order.status == 'open' %} warning {% elseif order.status == 'closed' %} success {% elseif order.status == 'cancelled' %} error {% endif %}">
                                    <td data-label="{{'Orden' | translate}}"><a class="order-number" href="{{ store.customer_order_url(order) }}">#{{order.number}}</a></td>
                                    <td data-label="{{'Fecha' | translate}}">{{ order.date | i18n_date('%d/%m/%Y') }}</td>
                                    <td data-label="{{'Estado' | translate}}">{{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</td>
                                    <td data-label="{{'Pago' | translate}}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</td>
                                    <td data-label="{{'Envío' | translate}}">{{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</td>
                                    <td data-label="{{'Total' | translate}}">{{ order.total | money }}</td>
                                    {% if add_checkout_link %}
                                        <td><a class="checkout-link" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a></td>
                                    {% elseif order.order_status_url != null %}
                                        <td><a class="checkout-link" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a></td>
                                    {% endif %}
                                </tr>
                                {% endfor %}
                            </tbody>
                        </table>
                    </div>
                </div>
                {# Order box mobile begining #}
                <div class="row-fluid visible-phone">
                    <div class="span12 m-top">
                        {% for order in customer.orders %} {% set add_checkout_link = order.pending %}
                        <div class="panel">
                            <div class="panel-heading">
                                <div>
                                    <h4>
                                        <strong>{{'Orden' | translate}}:  <a href="{{ store.customer_order_url(order) }}" class="text-primary text-underline">#{{order.number}} </a></strong>
                                    </h4>
                                </div>
                                <div>
                                    <small class="text-right">{{ order.date | i18n_date('%d/%m/%Y') }}</small>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row-fluid m-bottom-quarter">
                                    <strong>{% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %} {{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}.
                                </div>
                                <div class="row-fluid m-bottom-quarter">
                                    <strong>{% include "snipplets/svg/truck-solid.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %} {{'Envío' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}.
                                </div>
                                <h6 class="row-fluid m-bottom-quarter m-top">
                                    <strong>{{'Total' | translate}}</strong> {{ order.total | money }}
                                </h6>
                                <div class="row-fluid m-bottom-quarter">
                                    <small><strong>{{'Pago' | translate}}: </strong><span class="{{ order.payment_status }}">{{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</span></small>
                                </div>
                            </div>
                            {% if add_checkout_link %}
                                <div class="panel-footer">
                                    <a class="checkout-link h6 btn btn-payment full-width-xs border-box" href="{{ order.checkout_url | add_param('ref', 'orders_list') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                                </div>
                            {% elseif order.order_status_url != null %}
                                <div class="panel-footer">
                                    <a class="checkout-link h6 btn btn-out full-width-xs border-box" href="{{ order.order_status_url | add_param('ref', 'orders_list') }}" target="_blank">{% if 'Correios' in order.shipping_name %}{{'Seguí la entrega' | translate}}{% else %}{{'Seguí tu orden' | translate}}{% endif %}</a>
                                </div>
                            {% endif %}
                        </div>
                        {% endfor %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>