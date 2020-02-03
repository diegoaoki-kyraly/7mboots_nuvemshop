<div class="js-variants-container product">
  <div class="row-fluid">

  {# Color and size variants #}
  {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
    <div data-variant="{{ variation.name }}" class="variation_{{loop.index}} row-fluid variant-container btn-variant-container">
      <label class="variant-label" for="variation_{{loop.index}}">
        {% if quickshop %}
          <span class="badge m-right-quarter">{{ loop.index }}</span>
          <span>{{variation.name}}:</span>
        {% else %}
          {{variation.name}}: 
        {% endif %}
        <strong class="js-insta-variation-label">{{ product.default_options[variation.id] }}</strong>
      </label>
      <div class="row-fluid">
        {% for option in variation.options if option.custom_data %}
            <a data-option="{{ option.id }}" class="js-insta-variant btn-variant insta-variations {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}">
              <span class="btn-variant-content" style="background: {{ option.custom_data }}" data-name="{{ option.name }}"></span>
            </a>
        {% endfor %}
        {% for option in variation.options if not option.custom_data %}
            <a data-option="{{ option.id }}" class="js-insta-variant btn-variant btn-variant-custom insta-variations insta-variations_btn-custom {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}">
                <span class="btn-variant-content" data-name="{{ option.name }}">{{ option.name }}</span>
            </a>
        {% endfor %}
      </div>
    </div>
  {% endfor %}

  {# Custom variants #}
  {% for variation in product.variations %}
    <div class="js-mobile-variations-container {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%} m-none {% endif %}">
      <div class="span6 variant-container desktop-product-variant p-right m-bottom hidden-phone {% if loop.last %} m-left-none {% endif %}" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}style="display: none"{% endif %}>
          <label class="variant-label" for="variation_{{loop.index}}">
            {% if quickshop %}
              <span class="badge m-right-quarter">{{ loop.index }}</span>
              <span class="m-right-half">{{variation.name}}:</span>
            {% else %}
              {{variation.name}}: 
            {% endif %}
          </label>
          <select class="js-variation-option js-refresh-installment-data variant-select" name="variation[{{ variation.id }}]"
          {% if quickshop %}
              onchange="LS.changeVariant(changeVariant, '#quick{{ product.id }} .js-product-container');">
          {% else %}
              onchange="LS.changeVariant(changeVariant, '#single-product .js-product-container');">
          {% endif %}
          {% for option in variation.options %}
              <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
          {% endfor %}
          </select>
      </div>
      {% if not(variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'])%}
        <div class="js-mobile-vars mobile-vars visible-phone">
          <a href="javascript:void(0)" class="js-mobile-vars-btn btn-module {% if quickshop %} js-quickshop-vars {% endif %}" id="{{variation.name}}" style="{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
              <p class="text-wrap">{{variation.name}}:</p>
              <span class="js-mobile-vars-selected-label text-primary text-wrap ">{{ product.default_options[variation.id] }}</span>
              <div class="btn-module-icon-right btn-module-icon">
                {% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
              </div>  
          </a>
          <div class="js-mobile-vars-panel modal-xs modal-xs-right panel-mobile-variant modal-xs-right-out" data-custom="{{variation.name}}" style="{% if quickshop %}top: 60px;{% endif %}{% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}display:none;{% endif %}">
            <div class="modal-xs-dialog">
              <a href="javascript:void(0)" class="js-close-panel modal-xs-header">
                <span class="modal-xs-header-icon modal-xs-right-header-icon">
                  {% include "snipplets/svg/arrow-left.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
                </span>
                <span class="modal-xs-header-text modal-xs-right-header-text">{{variation.name}}</span>
              </a>
              <div class="modal-content">
                <div class="modal-xs-body modal-xs-body-list">
                  {% for option in variation.options %}
                    <a href="javascript:void(0)" class="js-mobile-vars-property modal-xs-list-item {% if quickshop %} js-quickshop-mobile-vars-property {% endif %}" data-option="{{ option.id }}">
                      <div class="row-fluid">
                        <div class="modal-xs-radio-icon-container">
                        <span class="m-right-half modal-xs-radio-icon">
                          {% include "snipplets/svg/check.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                        </span>
                        </div>
                        <div class="modal-xs-radio-text p-none-left text-wrap">
                        {{ option.name }}
                        </div>
                      </div>
                    </a>
                  {% endfor %}
                </div>
              </div>
            </div>
          </div>
        </div>
      {% endif %}
    </div>
  {% endfor %}
  </div>
</div>
