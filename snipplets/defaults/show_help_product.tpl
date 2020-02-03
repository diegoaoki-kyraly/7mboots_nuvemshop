{# Single product that works as an example #}
<div class="row-fluid m-top">
    <div class="container">
        <div id="single-product" class="js-product-detail" >
            <div id="single-product-container" class="js-product-container">
                <div class="span6">
                    <div class="js-product-image-container product-img-col p-relative pull-left full-width m-bottom">
                        <div class="labels-floating labels-floating-left-xs">
                            <div class="pull-right pull-left-xs clear-both-xs">
                                <div class="label-circle label-primary clear-both m-bottom-quarter">
                                    <span class="label-text">
                                        <div>33%</div>
                                        <div> OFF</div> 
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div id="product-slider-container" class="product-slider-container visible-phone">
                            <ul id="product-slider" class="product-slider">
                                <li class="js-product-slide product-slide slider-slide" data-image="0" data-image-position="0">{{ "images/help-product-2.svg" | static_url |  img_tag(image.alt, {class: 'product-slider-image'}) }}</li>
                                <li class="js-product-slide product-slide slider-slide" data-image="1" data-image-position="1">{{ "images/help-product-44.jpg" | static_url | img_tag(image.alt, {class: 'product-slider-image'}) }}</li>
                                <li class="js-product-slide product-slide slider-slide" data-image="2" data-image-position="2">{{ "images/help-product-45.jpg" | static_url |  img_tag(image.alt, {class: 'product-slider-image'}) }}</li>
                            </ul>
                        </div>
                        <div class="product-img-desktop-container p-relative hidden-phone text-center">
                            <a href="{{ "images/help-product-2.svg" | static_url }}" id="zoom" class="cloud-zoom product-desktop-img" rel="position: 'inside', showTitle: false, loading: 'Cargando...'" >
                                {{ "images/help-product-2.svg" | static_url |  img_tag(image.alt, {class: 'product-desktop-img'}) }}
                            </a>
                        </div>
                    </div>
                </div>
                <div class="span6 clear-both-xs">
                    <div class="product-form-container">
                        <div class="descriptioncolContent">
                            <div class="row-fluid">
                                <h1 class="product-name" itemprop="name">{{ "Producto de ejemplo" | translate }}</h1>
                                <div class="product-price-container" itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
                                    <span class="js-price-display product-price" id="price_display" itemprop="price" content="1000.50">{{ "100000" | money }}</span>
                                    <span class="price02 hidden" itemprop="price" content="1200.50">{{ "120050" | money }}</span>
								   <span class="js-price-compare-display product-price-compare" id="compare_price_display">{{ "150000" | money }}</span>
                                    <meta itemprop="priceCurrency" content="ARS">
                                </div>
                            </div>
                        </div>
                        <form id="product_form" method="post" action="">
                            <input type="hidden" name="add_to_cart" value="2243561">
                            <div class="row-fluid m-bottom m-top">
                                <div class="span6 variant-container desktop-product-variant p-right m-bottom">
                                    <label class="variant-label" for="variation_1">{{ "Talle" | translate }}</label>
                                    <select id="variation_1" class="variant-select" name="variation[0]">
                                        <option value="s" selected="selected">{{ "S" | translate }}</option>
                                        <option value="m">{{ "M" | translate }}</option>
                                        <option value="l">{{ "L" | translate }}</option>
                                        <option value="xl">{{ "XL" | translate }}</option>
                                    </select>
                                </div>
                                <div class="span6 variant-container desktop-product-variant p-right m-bottom">
                                    <label class="variant-label" for="color_variant">{{ "Color" | translate }}</label>
                                    <select id="color_variant" class="variant-select" name="color_variant">
                                        <option value="blue" selected="selected">{{ "Azul" | translate }}</option>
                                        <option value="green">{{ "Verde" | translate }}</option>
                                        <option value="red">{{ "Rojo" | translate }}</option>
                                    </select>
                                </div>
                                <div class="span6 variant-container desktop-product-variant p-right m-bottom m-left-none">
                                    <label class="variant-label" for="variation_3">{{ "Material" | translate }}</label>
                                    <select id="variation_3" class="variant-select" name="variation[2]">
                                        <option value="Resorte" selected="selected">{{ "Denim" | translate }}</option>
                                        <option value="Ganchito">{{ "Algodón" | translate }}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span3 m-bottom">
                                    <div class="js-quantity form-group form-group-big quantity m-bottom-xs {% if product.show_installments and not product.variations %} border-top-none-xs {% endif %}">
                                        <label class="quantity-label">
                                            {{ "Cantidad" | translate }}
                                        </label>
                                        <div class="quantity-input-container">
                                           <div class="quantity-nav quantity-nav-left visible-phone">
                                                <div class="quantity-btn js-quantity-down">
                                                    {% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa svg-text-fill"} %}
                                                </div>
                                            </div>
                                            <input class="js-product-quantity js-quantity-input form-control form-control-secondary form-control-big quantity-input" value="1" min="1" type="number" name="quantity{{ item.id }}" value="{{ item.quantity }}" />
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
                                <div class="product-buy-container span9 m-bottom m-top p-top-quarter">
                                    <input type="submit" href="#" class="btn btn-primary full-width" value="{{ "Agregar al carrito" | translate }}">
                                </div>
                            </div>
                        </form>
                        {% include "snipplets/social-widgets.tpl" %}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% if show_help %}
    <script type="text/javascript">
        LS.ready.then(function(){
            $(document).ready(function(){
                

                $('#color_variant').change(function(){
                    var $values_color = $( "select#color_variant option:selected" ).val();
                    $('#' + $values_color).click();
                });

            });
        });
    </script>
{% endif %}
