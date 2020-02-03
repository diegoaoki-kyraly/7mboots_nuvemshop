<div class="item-small">
    <div class="span3 item-image-container">
        <div class="p-relative" style="padding-bottom: {{ product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100}}%;">
            <a href="{{ product.url }}" title="{{ product.name }}">
                <img alt="{{ product.featured_image.alt }}" data-sizes="auto" src="{{ product.featured_image | product_image_url('tiny')}}" data-srcset="{{ product.featured_image | product_image_url('small')}} 240w, {{ product.featured_image | product_image_url('medium')}} 320w" class="lazyautosizes lazyload item-image img-absolute blur-up {% if not product.has_stock %}opacity-50{% endif %}" />
            </a>
        </div>
    </div>
    <div class="span9 item-info-container font-small">
        {% if product.category.id != 0 %}
            <div class="text-tertiary">
            	{{ product.category.name }}
            </div>
        {% endif %}
    	<a href="{{ product.url }}" title="{{ product.name }}" class="item-name">{{ product.name }}</a>
        <div class="item-price-container {% if not product.display_price%}hidden{% endif %}">
            {% if product.promotional_offer.script.is_percentage_off %}
                <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
            {% endif %}
            <span class="item-price weight-strong" id="price_display" itemprop="price" content="{{ product.price / 100 }}" {% if not product.display_price %}class="hidden"{% endif %}>
                {% if product.display_price %}
                    {{ product.price | money }}
                {% endif %}
            </span>
			<span class="item-price-compare price-compare">
                <span id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}>
                {% if product.compare_at_price %}
                    {{ product.compare_at_price | money }}
                {% endif %}
                </span>
            </span>
            {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                <p class="text-primary">
                    {% if product.promotional_offer.script.is_discount_for_quantity %}
                        {% for threshold in product.promotional_offer.parameters %}
                            {{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}
                        {% endfor %}
                    {% else %}
                    {{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                {% endif %}
                </p> 
            {% endif %}
        </div>
    </div>
</div>

