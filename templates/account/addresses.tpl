<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ "Mis direcciones" | translate }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            <div class="addresses m-top visible-when-content-ready">
                <ul>
                    {% for address in customer.addresses %}
                        {% if loop.index % 4 == 1 %}
                            <div class="row-fluid">
                        {% endif %}
                        <li class="m-bottom span3">
                            <div class="address">{{ address | format_address }}</div>
                            <div class="small">
                                {{ 'Editar' | translate | a_tag(store.customer_address_url(address), {class: 'text-primary'}) }} -
                                {% if address.main %}
                                    <strong>{{ 'Principal' | translate }}</strong>
                                {% else %}
                                    {{ 'Principal' | translate | a_tag(store.customer_set_main_address_url(address), {class: 'text-primary'}) }}
                                {% endif %}
                            </div>
                        </li>
                        {% if loop.index % 4 == 0 or loop.last %}
                            </div>
                        {% endif %}
                    {% endfor %}
                </ul>
                <a class="btn btn-out m-top m-bottom pull-right full-width-xs" href="{{ store.customer_new_address_url }}"> {{ 'Agregar una nueva dirección' | translate }} </a>
            </div>
        </div>
    </div>
</div>
