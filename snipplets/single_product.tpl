{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
{% set all_tags_displayed = (not product.has_stock and product.free_shipping and product.compare_at_price > product.price) or (product.has_stock and product.free_shipping and product.compare_at_price > product.price) %}

{% if thumb_scroller %}
<div class="item-mobile-container">
{% endif %}
<div class="item span3{% if thumb_scroller %} scroller-item pull-left{% endif %}">
    {% set product_url_with_selected_variant = filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url %}
    <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" class="item-link {% if not product.available %} opacity-50 {% endif %}" >
        <div class="item-image-container">
            <div class="moldura-top">
                <img src="{{ 'images/moldura-top.png' | static_url }}" />
            </div>
            
            <div class="moldura-bottom">
                <img src="{{ 'images/moldura-bottom.png' | static_url }}" />
            </div>

            <div class="labels-floating">
                {% if not product.has_stock %}
                    <div class="flag flag-stock">
                    	<span class="label-text">{{ "Sin stock" | translate }}</span>
        			</div>
                {% endif %}
                
                {% if product.promotional_offer %}
                    <div class="flag flag-discount clear-both m-bottom-quarter" {% if not product.display_price %} style="display: none"{% endif %}>
                        <span class="label-text">
                            -
                            {% if product.promotional_offer.script.is_percentage_off %}
                                <div>{{ product.promotional_offer.parameters.percent * 100 }}%</div>
                            {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                <div class="p-top-quarter"><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}%</strong></div>
                                <div class="label-small p-right-quarter p-left-quarter">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                            {% else %}
                                {% if store.country == 'BR' %}
                                    <span class="font-small-extra">
                                        {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                    </span>
                                {% else %}
                                    <div>{{ "Promo" | translate }}</div>
                                    <div>{{ product.promotional_offer.script.type }}</div>
                                {% endif %}
                            {% endif %}
                        </span>
                    </div>
                {% elseif product.compare_at_price > product.price %}
                    <div class="flag flag-discount clear-both m-bottom-quarter" {% if not product.display_price %} style="display: none"{% endif %}>
                        <span class="label-text">
                            -{{ price_discount_percentage |round }}%
                        </span>
                    </div>
                {% endif %}
                {% if (product.price / 100) >= 300 %}
                    <div class="flag frete-gratis clear-both">
                        <span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
                    </div>
                {% endif %}
            </div>

            <img alt="{{ product.featured_image.alt }}" data-sizes="auto" src="{{ product.featured_image | product_image_url('thumb')}}" data-srcset="{{ product.featured_image | product_image_url('small')}} 240w, {{ product.featured_image | product_image_url('medium')}} 320w" class="lazyautosizes lazyload item-image img-absolute img-absolute-centered blur-up {% if not product.has_stock %}opacity-50{% endif %}" />
        </div>
        <div class="item-info-container m-top-half m-bottom-half">
        	<h6 class="item-name weight-normal font-body m-bottom-quarter" itemprop="name">{{ product.name }}</h6>
            <div class="item-price-container {% if not product.display_price%}hidden{% endif %} " itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                <span class="item-price-compare price-compare">
                    <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>
                    {% if product.compare_at_price %}
                        De: {{ product.compare_at_price | money }}
                    {% endif %}
                    </span>
                </span>
                {% if product.promotional_offer.script.is_percentage_off %}
                    <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                {% endif %}
                <span class="item-price weight-strong text-primary text-center" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>
                {% if product.display_price %}
                    Por: {{ product.price | money }}
                {% endif %}
                </span>
                <span class="preco-desconto">
                    {% set avista = product.price - (product.price * 0.06) %}
                    <strong>{{ avista | money }}</strong> à vista
                </span>
                <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                {% set product_can_show_installments = product.show_installments and product.display_price and product.get_max_installments.installment > 1 %}
                {% if product_can_show_installments %}

                    {% set max_installments_without_interests = product.get_max_installments(false) %}
                    {% if store.country == 'AR' %}
                        {% set max_installments_with_interests = product.get_max_installments %}
                        {% if max_installments_with_interests %}
                            <div class="item-installments m-top-quarter text-tertiary font-small-xs">{{ "Hasta <strong class='installment-amount'>{1}</strong> cuotas" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                        {% endif %}        
                    {% else %}
                        {% if max_installments_without_interests and max_installments_without_interests.installment > 1 %}
                            <div class="item-installments m-top-quarter text-tertiary font-small-xs">{{ "<strong class='installment-amount'>{1}</strong> cuotas sin interés de <strong class='installment-price'>{2}</strong>" | t(max_installments_without_interests.installment, max_installments_without_interests.installment_data.installment_value_cents | money ) }}</div>
                        {% else %}
                            {% set max_installments_with_interests = product.get_max_installments %}
                            {% if max_installments_with_interests %}
                                <div class="item-installments m-top-quarter text-tertiary font-small-xs">{{ "<strong class='installment-amount'>{1}</strong> cuotas de <strong class='installment-price'>{2}</strong>" | t(max_installments_with_interests.installment, max_installments_with_interests.installment_data.installment_value_cents | money) }}</div>
                            {% endif %}
                        {% endif %}
                    {% endif %}
                {% endif %}
            </div>
        </div>
    </a>
    {% if settings.quick_shop and store.allow_quickshop %}
        <a class="item-quickshop-link hidden-phone" href="#quick{{ product.id }}" data-toggle="modal">
            {{ settings.quick_shop_label }}
        </a>
        {% if quickshop_included %}
            {% snipplet "quick-shop.tpl" %}
        {% endif %}
    {% endif %}
</div>
{% if thumb_scroller %}
</div>
{% endif %}
