{% set gateways = installmentsv2['methods'][method] %}

{# Gateways with banks #}

{# Credit cards #}
{% if gateways.cc is not null %}
  <div class="box-title">{{'Tarjetas de crédito' | translate }}</div>
  <div class="box-container">
      <div class="pull-left full-width border-box">

        {# Installments without interest modules by groups, E.g: 3, 6, 9, 12 #}

        {% if gateways.cc is null or gateways.cc is empty is not null %}
          {% for installment, banks in gateways.cc.no_interest %}
            <div class="installments-container m-bottom">

              {# Installment amount, cost, CFT, 1 payment info and total cost #}

              <h6 class="subtitle m-bottom-half">
                {{ installment }}
                {{ 'cuotas' | translate }}
                <span class="text-primary">{{ 'sin interés' | t }}</span>
                {{'de' | t}}
                <span class="js-modal-installment-price text-primary weight-strong" data-installment="{{installment}}"> {{ (product.price / installment) | money }}</span>
                <div class="legal-info font-small">
                  <span class="m-right-quarter">
                    <span class="text-capitalize weight-normal">{{ 'CFT: ' | translate }}</span><span class="weight-strong">0,00%</span>
                  </span>
                  <span class="m-right-quarter">
                    <span class="text-capitalize weight-normal">{{ 'Total: ' | translate }}</span><span class="js-installments-one-payment weight-strong">{{ product.price | money }}</span>
                  </span>
                  <span class="m-right-quarter">
                    <span class="text-capitalize weight-normal">{{ 'En 1 pago: ' | translate }}</span><span class="js-installments-one-payment weight-strong">{{ product.price | money }}</span>
                  </span>
                </div>
              </h6>
              
              {# Banks with installments without interest flags #}

              <div class="flags-container">
                {% for bank in banks %}
                  <span class="installments-card">
                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ bank | bank_code_by_name | payment_new_logo }}" class="lazyload card-img card-img-big" alt="{{ bank }}">
                  </span>
                {% endfor %}
              </div>
            </div>
          {% endfor %}
        {% endif %}

        {# Installments with interest in one module #}

        {% if gateways.cc.interest is not null %}
          <div class="installments-container">

            {# Installment amount #}

            <h6 class="subtitle m-bottom-half">
              {{ gateways.max_with_interests ~ ' cuotas con otras tarjetas' | translate }}
              <div class="legal-info font-body">
                <span class="text-capitalize weight-normal">{{ 'O en 1 pago de: ' | translate }}</span>
                <span class="js-installments-one-payment weight-strong text-primary">{{ product.price | money }}</span>
              </div>
            </h6>

            {# Banks with installments with interest flags #}

            {% for bank in gateways.cc.interest %}
              <span class="installments-card js-installments-flag-tab js-installments-cash-tab">
                <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ bank | bank_code_by_name | payment_new_logo }}" class="lazyload card-img card-img-big" alt="{{ bank }}">
              </span>
            {% endfor %}
          </div>
        {% endif %}
      </div>
  </div>
{% endif %}

{# Cash methods #}

{% if gateways.debit is not null or gateways.cash is not null or gateways.transfer is not null %}
  <div class="box-title">{{'Tarjeta de débito y efectivo' | translate }}</div>
  <div class="box-container">

    {# Debit card #}

    {% if gateways.debit is not null %}

      {# Debit price #}

      <div class="m-bottom">

        <h6 class="subtitle m-bottom-half">
          {{ 'Débito' | translate }}
          <div class="font-body h6-xs">
            <span class="text-capitalize weight-normal">{{ 'Precio:' | translate }} </span><span class="js-installments-one-payment weight-strong text-primary"> {{ product.price | money }}</span>
          </div>
        </h6>

        {# Debit flags #}

        {% for logo in gateways.debit %}
          <span class="installments-card" data-type="dd" data-code="{{ card }}">
            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-big">
          </span>
        {% endfor %}

      </div>

    {% endif %}

    {# Cash #}

    {% if gateways.cash is not null %}

      <div class="m-bottom">

        {# Cash price #}

        <h6 class="subtitle m-bottom-half">
          {{'Efectivo' | translate }}
          <div class="font-body h6-xs">
            <span class="text-capitalize weight-normal">{{ 'Precio:' | translate }} </span><span class="js-installments-one-payment weight-strong text-primary"> {{ product.price | money }}</span>
          </div>
        </h6>

        {# Cash flags #}

        {% for logo in gateways.cash %}
          <span class="installments-card" data-type="dd" data-code="{{ card }}">
            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-big">
          </span>
        {% endfor %}

      </div>

    {% endif %}

    {# Wire transfer #}

    {% if gateways.transfer is not null %}

      <div class="m-bottom">

        {# Transfer price #}

        <h6 class="subtitle m-bottom-half">
          {{ 'Transferencia o déposito' | translate }}
          <div class="font-body h6-xs">
            <span class="text-capitalize weight-normal">{{ 'Precio:' | translate }} </span><span class="js-installments-one-payment weight-strong text-primary"> {{ product.price | money }}</span>
          </div>
        </h6>

        {# Transfer logos #}

        {% for logo in gateways.transfer %}
          <span class="installments-card js-installments-flag-tab js-installments-cash-tab" data-type="dd" data-code="{{ card }}">
            <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ logo | payment_new_logo }}" class="lazyload card-img card-img-big">
          </span>
        {% endfor %}

      </div>

    {% endif %}
  </div>
{% endif %}
