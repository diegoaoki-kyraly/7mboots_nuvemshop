{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}
<div id="quick{{ product.id }}" class="{% if not (template == 'category' or template == 'product') and sections.primary.products %}js-item-modal {% endif %}modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="btn-floating m-right-half m-top-quarter hidden-phone" data-dismiss="modal" aria-hidden="true">{% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa"} %}</button>
                <div class="js-product-container js-quickshop-container" itemscope itemtype="http://schema.org/Product" data-variants="{{product.variants_object | json_encode }}">
                    <div class="row-fluid">
                        <div class="span5">
                            <div class="product-slide overflow-none">
                                <div class="p-relative" style="padding-bottom: {{ product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100}}%;">
                                    <div class="labels-floating labels-floating-left-xs">
                                        <div class="js-stock-label label-circle label-secondary label-circle-big" {% if product.has_stock %}style="display:none;"{% endif %}>
                                            <span class="label-text">{{ "Sin stock" | translate }}</span>
                                        </div>
                                        <div class="pull-right">
                                            <div class="label-circle label-primary clear-both m-bottom-quarter {% if not product.promotional_offer %}js-offer-label{% endif %}" {% if (not product.compare_at_price and not product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %}>
                                                {% if product.promotional_offer.script.is_percentage_off %}
                                                    <span class="label-text">
                                                        <div>
                                                            {{ product.promotional_offer.parameters.percent * 100 }}%
                                                        </div>
                                                        <div> OFF</div>
                                                    </span>
                                                {% elseif product.promotional_offer.script.is_discount_for_quantity %}
                                                    <span class="label-text">
                                                        <div><strong>{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}% OFF</strong></div>
                                                        <div class="label-small p-right-quarter p-left-quarter">{{ "Comprando {1} o más." | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
                                                    </span>
                                                {% elseif product.promotional_offer %}
                                                    {% if store.country == 'BR' %}
                                                        <span class="label-text">
                                                        {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                                        </span>
                                                    {% else %}
                                                        <span class="label-text">
                                                            <div>
                                                            {{ "Promo" | translate }}
                                                            </div>
                                                            <div>{{ product.promotional_offer.script.type }}</div>
                                                        </span>
                                                    {% endif %}
                                                {% else %}
                                                    <span class="label-text">
                                                        <div>
                                                            <span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>%
                                                        </div>
                                                        <div> OFF</div>
                                                    </span>
                                                {% endif %}
                                            </div>
                                            {% if product.free_shipping %}
                                                <div class="label-circle label-primary clear-both">
                                                    <span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
                                                </div>
                                            {% endif %}
                                        </div>
                                    </div>
                                    <img alt="{{ product.featured_image.alt }}" title="{{ product.featured_image.alt }}" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ product.featured_variant_image | product_image_url('huge')}}" class="lazyload product-slider-image quickshop-image img-absolute img-absolute-centered fade-in" />
                                </div>
                            </div>
                        </div>
                        <div class="span7">
                            <div class="product-form-container">
                                <div class="row-fluid">
                                    <h2 itemprop="name" class="product-name">{{ product.name }}</h2>
                                    {% if product.promotional_offer.script.is_percentage_off %}
                                        <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                                    {% endif %}
                                    <div class="product-price-container" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                                        <span class="js-price-display product-price" id="price_display" itemprop="price" {% if product.display_price %} content="{{ product.price / 100 }}"{% endif %} {% if not product.display_price %}style="display:none;"{% endif %}>
                                        {% if product.display_price %}
                                            {{ product.price | money }}
                                        {% endif %}
                                        </span>
            							<span id="compare_price_display" class="js-compare-price-display product-price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                        {% if product.compare_at_price %}
                                            {{ product.compare_at_price | money }}
                                        {% endif %}
                                        </span>
                                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                        {% if product.stock_control %}
                                            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" />
                                        {% endif %}
                                        {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                                            <h5 class="m-top promo-title text-primary">
                                            {% if product.promotional_offer.script.is_discount_for_quantity %}
                                                {% for threshold in product.promotional_offer.parameters %}
                                                    {{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}
                                                {% endfor %}
                                            {% else %}
                                                {{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                            {% endif %}
                                            </h5>
                                            {% if product.promotional_offer.scope_type == 'categories' %}
                                                <p class="font-small m-top-half">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
                                                {% for scope_value in product.promotional_offer.scope_value_info %}
                                                    {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
                                                {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
                                            {% elseif product.promotional_offer.scope_type == 'all'  %}
                                                <p class="font-small m-top-half">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
                                            {% endif %}
                                        {% endif %}
                                    </div>
                                    {% if product.display_price %}
                                        <div class="m-bottom">
                                            {% snipplet "installments_in_product.tpl" %}
                                        </div>
                                    {% endif %}
                                    <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('large') }}" />
                                    <meta itemprop="url" content="{{ product.social_url }}" />
                                    {% if page_description %}
                                        <meta itemprop="description" content="{{ page_description }}" />
                                    {% endif %}
                                </div>
                                <form id="product_form" class="js-product-form m-top-half" method="post" action="{{ store.cart_url }}">
                                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                    {% if product.variations  %}
                                        {% include "snipplets/variants.tpl" with {'quickshop': true} %}
                                    {% endif %}
                                    {% set stepslength = product.variations | length  %}
                                        {% if product.available and product.display_price %}
                                            <div class="row-fluid">
                                                <div class="js-quantity span4 form-group quantity m-bottom {% if product.show_installments and not product.variations %} border-top-none-xs {% endif %}">
                                                    <label class="quantity-label">
                                                        <span class="badge m-right-quarter">{{ stepslength + 1 }}</span>
                                                        {{ "Cantidad" | translate }}
                                                    </label>
                                                    <div class="quantity-input-container">
                                                       <div class="quantity-nav quantity-nav-left visible-phone">
                                                            <div class="quantity-btn js-quantity-down">
                                                                {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                                            </div>
                                                        </div>
                                                        <input class="js-product-quantity js-quantity-input form-control form-control-secondary quantity-input" value="1" min="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
                                                        <div class="quantity-nav quantity-nav-right">
                                                            <div class="quantity-btn js-quantity-up">
                                                                {% include "snipplets/svg/chevron-up.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                                            </div>
                                                            <div class="js-quantity-down quantity-btn hidden-phone">
                                                                {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {% endif %}

                                    <div class="product-buy-container">
                                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                        <input type="submit" class="btn btn-primary js-prod-submit-form js-addtocart {{ state }} m-bottom-half" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %}/>
                                    </div>
                                </form>
                                <div class="description user-content clear-both m-top pull-left full-width">
                                    {% if product.description != '' %}
                                        <h5>{{ "Descripción" | translate }}</h5>
                                        {{ product.description | plain | truncateWords(20) }} ...
                                        <div class="quick">
                                            <a href="{{ product.url }}" title="{{ product.name }}">{{ "Ver <strong>{1}</strong> en detalle" | translate(product.name) }}</a>
                                        </div>
                                    {% endif %}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

