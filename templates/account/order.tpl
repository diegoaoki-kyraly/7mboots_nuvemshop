<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ 'Orden {1}' | translate(order.number) }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            <div class="row-fluid visible-when-content-ready m-bottom m-top">
                <div class="details-box span4">
                    {% if log_entry %}
                        <h4 class="m-bottom">{{ 'Estado actual del envío' | translate }}:</h4><span>{{ log_entry }}</span>
                    {% endif %}
                    <h4 class="m-bottom">{{ 'Detalles' | translate }}</h4>
                    <div><strong>{{'Fecha' | translate}}:</strong> {{ order.date | i18n_date('%d/%m/%Y') }}</div>

                    <div><strong>{{'Estado' | translate}}:</strong> {{ (order.status == 'open'? 'Abierta' : (order.status == 'closed'? 'Cerrada' : 'Cancelada')) | translate }}</div>

                    <div class="st"><strong>{{'Pago' | translate}}:</strong> {{ (order.payment_status == 'pending'? 'Pendiente' : (order.payment_status == 'authorized'? 'Autorizado' : (order.payment_status == 'paid'? 'Pagado' : (order.payment_status == 'voided'? 'Cancelado' : (order.payment_status == 'refunded'? 'Reintegrado' : 'Abandonado'))))) | translate }}</div>
                    <div><strong>{{'Medio de pago' | translate}}:</strong> {{ order.payment_name }}</div>

                    {% if order.address %}
                        <div class="st"><strong>{{'Envío' | translate}}:</strong> {{ (order.shipping_status == 'fulfilled'? 'Enviado' : 'No enviado') | translate }}</div>

                        <div><strong>{{ 'Dirección de envío' | translate }}:</strong></div>
                        <div class="address">
                            {{ order.address | format_address }}
                        </div>
                    {% endif %}
                </div>
                <div class="hidden-phone span8">
                    <h4 class="m-bottom">{{ 'Productos' | translate }}</h4>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>{{ 'Producto' | translate }}</th>
                            <th>{{ 'Precio' | translate }}</th>
                            <th>{{ 'Cantidad' | translate }}</th>
                            <th>{{ 'Total' | translate }}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for item in order.items %}
                            <tr>
                                <td data-label="{{ 'Producto' | translate }}">{{ item.featured_image | product_image_url("tiny") | img_tag(item.featured_image.alt) }} {{ item.name }}</td>
                                <td data-label="{{ 'Precio' | translate }}">{{ item.unit_price | money }}</td>
                                <td data-label="{{ 'Cantidad' | translate }}"{{ item.quantity }}</td>
                                <td data-label="{{ 'Total' | translate }}">{{ item.subtotal | money_long }}</td>
                            </tr>
                        {% endfor %}
                        {% if order.show_shipping_price %}
                            <tr class="oneliner">
                                <td colspan="3">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</td>
                                {% if order.shipping == 0  %}
                                    <td>{{ 'Gratis' | translate }}</td>
                                {% else %}
                                    <td>{{ order.shipping | money_long }}</td>
                                {% endif %}
                            </tr>
                        {% else %}
                            <tr class="oneliner">
                                <td colspan="3">{{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:</td>
                                <td>{{ 'A convenir' | translate }}</td>
                            </tr>
                        {% endif %}
                        {% if order.discount %}
                            <tr class="oneliner">
                                <td colspan="3">{{ 'Descuento ({1})' | translate(order.coupon) }}:</td>
                                <td class="success">- {{ order.discount | money_long }}</td>
                            </tr>
                        {% endif %}
                        <tr class="oneliner">
                            <td class="r" colspan="3"><strong>{{ 'Total' | translate }}:</strong></td>
                            <td class="r"><strong>{{ order.total | money_long }}</strong></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="m-top">
                        {% if order.pending %}
                            <a href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank" class="btn btn-payment pull-right">{{ 'Realizar el pago >' | translate }}</a>
                        {% endif %}
                    </div>
                </div>
                <div class="visible-phone order-detail m-top">
                    {% for item in order.items %}
                        <div class="span12">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div>
                                        <strong>{{ item.name }}</strong>
                                    </div>
                                    <div>
                                        <p>x{{ item.quantity }}</p>
                                    </div>
                                </div>
                                <div class="panel-body text-center">
                                   {{ item.featured_image | product_image_url("small") | img_tag(item.featured_image.alt, {class: 'img-responsive', height : 150}) }} 
                                </div>
                                <div class="panel-footer">
                                    <strong>{{ 'Precio' | translate }}</strong> {{ item.subtotal | money_long }}
                                </div>
                            </div>     
                        </div>
                    {% endfor %}
                    {% if order.show_shipping_price %}
                        <h5 class="span12 m-top-half m-bottom-half">
                            {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                            {% if order.shipping == 0  %}
                                {{ 'Gratis' | translate }}
                            {% else %}
                                {{ order.shipping | money_long }}
                            {% endif %}
                        </h5>
                    {% else %}
                        <h5 class="span12 m-top-half m-bottom-half">
                            {{ 'Costo de envío ({1})' | translate(order.shipping_name) }}:
                            {{ 'A convenir' | translate }}
                        </h5>
                    {% endif %}
                    {% if order.discount %}
                        <h5 class="span12 m-top-half m-bottom-half">
                           {{ 'Descuento ({1})' | translate(order.coupon) }}:
                            - {{ order.discount | money_long }}
                        </h5>
                    {% endif %}
                    {% if order.shipping or order.discount %}
                        <h5 class="span12 m-top-half m-bottom-half">
                            {{ 'Subtotal' | translate }}:
                            {{ order.subtotal | money_long }}
                        </h5>
                    {% endif %}  
                    <h3 class="span12 m-top m-bottom text-primary">
                       <strong>{{ 'Total' | translate }}:</strong>
                        <strong>{{ order.total | money_long }}</strong>
                    </h3>
                    {% if order.pending %}
                        <a class="checkout-link btn btn-payment full-width-xs m-top border-box" href="{{ order.checkout_url | add_param('ref', 'orders_details') }}" target="_blank">{{'Realizar el pago >' | translate}}</a>
                    {% endif %}
                </div>  
            </div>
        </div>
    </div>
</div>
