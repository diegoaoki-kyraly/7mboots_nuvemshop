{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

<div class="controller">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
    </div>
</div>

<div class="corpo-product">
    <div class="row-fluid">
    	<div class="container">
            <div id="single-product" class="js-product-detail js-shipping-calculator-container js-has-new-shipping" itemscope itemtype="http://schema.org/Product">
                <div id="single-product-container" class="js-product-container" data-variants="{{product.variants_object | json_encode }}">
                    <div class="span6">
                        <div class="js-product-image-container product-img-col p-relative pull-left full-width m-bottom">
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
                            <div id="product-slider-container" class="product-slider-container no-slide-effect-md {% if product.images_count == 1 %} product-single-image {% endif %}" {% if product.images_count > 1 %} style="visibility:hidden; height:0;"{% endif %}>
                                <div class="box-photo">
                                    <div class="moldura-top">
                                        <img src="{{ 'images/moldura-top.png' | static_url }}" />
                                    </div>
                                    
                                    <div class="moldura-bottom">
                                        <img src="{{ 'images/moldura-bottom.png' | static_url }}" />
                                    </div>
                                    {% if product.images_count > 1 %}
                                        <ul id="product-slider" class="product-slider no-slide-effect-md">
                                            {% for image in product.images %}
                                                <li class="js-product-slide slider-slide product-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}" data-zoom-url="{{ image | product_image_url('huge') }}">
                                                    <a href="{{ image | product_image_url('original') }}" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
                                                        <img data-sizes="auto" src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                                                    </a>
                                                </li>
                                            {% endfor %}
                                        </ul>
                                    {% else %}
                                        <div class="js-product-active-image visible-when-content-ready slider-slide product-slide" data-zoom-url="{{ product.featured_image | product_image_url('huge') }}">
                                            <a href="{{ product.featured_image | product_image_url('original') }}"  class="cloud-zoom p-relative" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100}}%;">
                                                <img data-sizes="auto" src="{{ product.featured_image | product_image_url('small') }}" data-srcset='{{  product.featured_image | product_image_url('large') }} 480w, {{  product.featured_image | product_image_url('huge') }} 640w' class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload blur-up" {% if product.featured_image.alt %}alt="{{product.featured_image.alt}}"{% endif %} />
                                            </a>
                                        </div>
                                    {% endif %}
                                </div>

                                <a href="#" class="js-open-mobile-zoom visible-when-content-ready visible-phone btn-floating m-right-quarter m-top-quarter">
                                    <div class="zoom-svg-icon svg-primary-fill">
                                        {% include 'snipplets/svg/expand.tpl' %}
                                    </div>
                                </a>
                            </div>
                            {% if product.images_count > 1 %}
                                <div class="p-relative hidden-phone">
                                    <div class="js-horizontal-scroller primary-products-scroller scroller scroller-horizontal-top m-top-none p-top" style="visibility: hidden;">
                                        {% for image in product.images %}
                                            <div>
                                                <a href="#" class="js-product-thumb scroller-img-container" data-slide-index="{{loop.index0}}">
                                                    <img data-sizes="auto" src="{{ image | product_image_url('thumb') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="js-scroller-img scroller-img lazyautosizes lazyload blur-up" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                                                </a>
                                            </div>
                                        {% endfor %}
                                    </div>
                                    <a href="#" class="js-horizontal-scroller-prev scroller-btn scroller-btn-prev scroller-btn-middle">
                                        {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
                                    </a>
                                    <a href="#" class="js-horizontal-scroller-next scroller-btn scroller-btn-next scroller-btn-middle">
                                        {% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-3x svg-text-fill"} %}
                                    </a>
                                </div>
                            {% endif %}
    					</div>
                        {% snipplet 'placeholders/product-detail-image-placeholder.tpl' %}
                    </div>
                    <div class="span6 clear-both-xs">
                        <div class="product-form-container">
                            <div class="row-fluid">
                                <h1 itemprop="name" class="product-name">{{ product.name }}</h1>
                                <div itemprop="offers" itemscope itemtype="http://schema.org/Offer" {% if not product.display_price %}style="display:none;"{% endif %}>
                                    {% if product.promotional_offer.script.is_percentage_off %}
                                        <input class="js-promotional-parameter" type="hidden" value="{{product.promotional_offer.parameters.percent}}">
                                    {% endif %}
                                    <div class="product-price-container">
                                        <div class="price-list">
                                            <span id="compare_price_display" class="js-compare-price-display product-price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% endif %}>
                                            {% if product.compare_at_price %}
                                                {{ product.compare_at_price | money }}
                                            {% endif %}
                                            </span>
                                            <span class="js-price-display product-price" id="price_display" itemprop="price" {% if product.display_price %} content="{{ product.price / 100 }}"{% endif %} {% if not product.display_price %}style="display:none;"{% endif %}>
                                            {% if product.display_price %}
                                                {{ product.price | money }} <em>no cartão</em>
                                            {% endif %}
                                            </span>
                                            <span class="preco-desconto">
                                                {% set avista = product.price - (product.price * 0.06) %}
                                                <strong>{{ avista | money }}</strong> à vista
                                            </span>
                                        </div>
                                        {% if product.show_installments and product.display_price %}
                                            {% set installments_info_base_variant = product.installments_info %}
                                            {% set installments_info = product.installments_info_from_any_variant %}
                                            {% if installments_info %}
                                                <a href="#installments-modal" data-toggle="modal" class="js-product-payments-container js-refresh-installment-data display-when-content-ready link-module product-payment-link" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                                    <div class="m-bottom-half">
                                                        {% snipplet "installments_in_product.tpl" %}
                                                    </div>
                                                    {% set has_payment_logos = settings.payments %}
                                                    {% if has_payment_logos %}
                                                        <div class="span6 m-left-none m-bottom-quarter bandeiras-pagamento">
                                                            <ul class="list-style-none p-none-left">
                                                                {% for payment in settings.payments %}
                                                                    {# Payment methods flags #}
                                                                    {% if store.country == 'BR' %}
                                                                        {% if payment in ['visa', 'mastercard'] %}
                                                                            <li class="d-inline-block">
                                                                                <span class="js-product-detail-payment-logo">
                                                                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload product-payment-logos-img card-img" />
                                                                                </span>
                                                                            </li>
                                                                        {% endif %}
                                                                    {% else %}
                                                                        {% if payment in ['visa', 'amex', 'mastercard'] %}
                                                                            <li class="d-inline-block">
                                                                                <span class="js-product-detail-payment-logo">
                                                                                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ payment | payment_new_logo }}" class="lazyload product-payment-logos-img card-img" />
                                                                                </span>
                                                                            </li>
                                                                        {% endif %}
                                                                    {% endif %}
                                                                {% endfor %}
                                                                <li class="d-inline-block">
                                                                    <span class="js-product-detail-payment-logo p-relative pull-left svg-text-fill opacity-80">
                                                                        {% include "snipplets/svg/credit-card-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg fa-credit-card payment-credit-icon pull-left"} %}
                                                                        {% include "snipplets/svg/plus-solid.tpl" %}
                                                                    </span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    {% endif %}
                                                    {% if product.show_installments and product.display_price %}
                                                        <div id="btn-installments" class="btn-link clear-both" {% if (not product.get_max_installments) and (not product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                                            {% set store_set_for_new_installments_view = store.is_set_for_new_installments_view %}
                                                            {% if store_set_for_new_installments_view %}
                                                                {{ "Ver medios de pago" | translate }}
                                                            {% else %}
                                                                {{ "Ver el detalle de las cuotas" | translate }}
                                                            {% endif %}
                                                        </div>
                                                        <div class="visible-phone link-module-icon-right link-module-icon">
                                                            {% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
                                                        </div>
                                                    {% endif %}
                                                </a>
                                            {% endif %}
                                        {% endif %}
                                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                                        {% if product.stock_control %}
                                            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                                            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" />
                                        {% endif %}

                                        {% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
                                            <h6 class="m-top text-primary">
                                            {% if product.promotional_offer.script.is_discount_for_quantity %}
                                                {% for threshold in product.promotional_offer.parameters %}
                                                   {{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}
                                                {% endfor %}
                                            {% else %}
                                                {{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
                                            {% endif %}
                                            </h6>
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
                                </div>

                                <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('large') }}" />
                                <meta itemprop="url" content="{{ product.social_url }}" />
                                {% if page_description %}
                                    <meta itemprop="description" content="{{ page_description }}" />
                                {% endif %}
                                {% if product.sku %}
                                    <meta itemprop="sku" content="{{ product.sku }}" />
                                {% endif %}
                                {% if product.weight %}
                                    <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                                        <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                                        <meta itemprop="value" content="{{ product.weight}}" />
                                    </div>
                                {% endif %}
                            </div>
                            {% snipplet 'placeholders/product-detail-form-placeholder.tpl' %}
                            <form id="product_form" class="js-product-form display-when-content-ready" method="post" action="{{ store.cart_url }}">
                                <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                                {% if product.variations %}
                                    {% include "snipplets/variants.tpl" with {'quickshop': false} %}
                                {% endif %}
                                <div class="row-fluid">
                                   {# {% if product.available and product.display_price %}
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
                                    {% endif %} #}
                                    <div class="product-buy-container">
                                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                                        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
                                        <input type="submit" class="btn btn-primary full-width js-prod-submit-form js-addtocart {{state}} m-bottom-half" value="Comprar com segurança" {% if state == 'nostock' %}disabled{% endif %}/>
                                    </div>
                                </div>
                                {% if settings.shipping_calculator_product_page and not product.free_shipping %}

                                    {# Shipping calculator and branch link #}

                                    <div id="product-shipping-container" class="row-fluid m-bottom" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} {% if store.has_shipping_polish %}data-shipping-url="{{ store.shipping_calculator_url }}"{% endif %}>


                                        {# Shipping Calculator #}

                                        {% if store.has_shipping %}
                                            {% include "snipplets/shipping/shipping_cost_calculator.tpl" with {'shipping_calculator_show' : settings.shipping_calculator_product_page and not product.free_shipping, 'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                                        {% endif %}

                                        {# Store branches #}

                                        {% if store.branches and store.country != 'BR' and not store.has_shipping_segmentation %}
                                            {# Link for branches modal #}
                                            {% include "snipplets/shipping/branch-details.tpl" with {'product_detail': true} %}
                                        {% endif %}
                                    </div>

                                {% endif %}
                            </form>
                            {% include "snipplets/social-widgets.tpl" %}
                        </div>
                    </div>
                </div>
            </div>

            <div class="section-tabs">
                <ul class="menu-sections-tab">
                    <li class="descricao active" data-section="descricao">
                        <span>Descrição</span>
                        <div class="dump"></div>
                    </li>

                    <li class="comentarios" data-section="comentarios">
                        <span>Avaliações</span>
                        <div class="dump"></div>
                    </li>
                </ul>

                <div class="section-contents">
                    <div id="descricao" class="tab-cont active">
                        <div class="description user-content display-when-content-ready">
                            {{ product.description }}
                        </div>
                    </div>

                    <div id="comentarios" class="tab-cont">
                        <p>
                            Veja o que nossos clientes estão falando sobre este produto.
                        </p>

                        <div id="yv-reviews"></div>

                        <div class="yv-qa"></div>

                        {% if settings.show_product_fb_comment_box %}
                            <div class="fb-comments display-when-content-ready" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                        {% endif %}
                    </div>
                </div>

                <ul id="menuInstitucional">
                    <li>
                        <a href="#porqueComprar">
                            Por que Comprar aqui?
                        </a>
                    </li>

                    {% for tag in product.tags %}
                        {% if (tag == 'bota-texana') or (tag == 'coturno-country') %}
                            <li>
                                <a href="#qualidadeCouro">
                                    Qualidade do Couro
                                </a>
                            </li>
                        {% endif %}

                        {% if (tag == 'bota-texana') or (tag == 'coturno-country') %}
                            <li>
                                <a href="#dicasUso">
                                    Dicas de Uso
                                </a>
                            </li>
                            <li>
                                <a href="#dicasConservacao">
                                    Como Conservar?
                                </a>
                            </li>
                        {% endif %}
                    {% endfor %}
                    <li>
                        <a href="#perguntasFrequentes">
                            Dúvidas Frequentes
                        </a>
                    </li>
                </ul>

                <section id="porqueComprar" class="secoes-intitucionais">
                    <h3>Por que comprar na 7M BOOTS?</h3>
                    <p>
                        O maior objetivo da marca é a satisfação e bem-estar de seus consumidores, para isso, existe uma equipe de colaboradores extremamente capacitados e habilidosos que asseguram a produção de um calçado com conforto, estilo e durabilidade.
                    </p>

                    <p>
                        Situada na cidade de <strong>Franca (SP)</strong>, um dos grandes polos calçadistas do Brasil, a marca busca atender com excelência o público apaixonado pelo <strong>universo country</strong>.
                    </p>
                </section>

                {% set bota_texana = 0 %}

                {% for tag in product.tags %}

                    {% if (tag == 'bota-texana') or (tag == 'coturno-country') %}
                        {% if bota_texana == 0 %}
                            {% set bota_texana = 1 %}

                            <section id="qualidadeCouro" class="secoes-intitucionais">
                                <h3>Qualidade do Couro</h3>

                                <p class="h3-description">
                                    <strong>Durabilidade</strong>: pode durar muitos e muitos anos se bem conservado;
                                </p>

                                <p class="h3-description">
                                    <strong>É impermeável</strong>: não deixa que os líquidos penetrem no material, mas devem ser removidos rapidamente com um pano seco para evitar o surgimento de manchas.
                                </p>

                                <p class="h3-description">
                                    <strong>Fácil limpeza</strong>: apenas com um pano úmido você consegue mantê-lo limpo;
                                </p>

                                <p class="h3-description">
                                    <strong>Nobre</strong>: é um material natural com variações únicas, o que traz exclusividade e nobreza à peça;
                                </p>

                                <p class="h3-description">
                                    <strong>Firmeza</strong>: por não necessitar de tecido junto ao couro encorpando o material, o couro natural é mais firme e também mais maleável no revestimento do sofá.
                                </p>

                                <p class="h3-description">
                                    Por ser um produto natural, é importante ressaltar que o couro apresenta aroma próprio e variações na tonalidade e textura, entre outros aspectos característicos de cada artigo. Estes aspectos, assim como marcas naturais do campo, rugas e cicatrizes não são considerados defeitos, mas sim características da originalidade do material. O couro poderá ceder um pouco com o uso localizado nos assentos e encostos, o que será considerado normal devido à origem natural e propriedades elásticas do material.
                                </p>
                            </section>
                        {% endif %}
                    {% endif %}

                    {% if (tag == 'bota-texana') or (tag == 'coturno-country') %}
                        <section id="dicasUso" class="secoes-intitucionais">
                            <h3>Dicas de Uso</h3>

                            {% if (tag == 'bota-texana') or (tag == 'coturno-country') %}
                                <p class="h3-description">
                                    As <strong>Botas Texanas</strong> da <strong>7M BOOTS</strong> são perfeitas para calçar os apaixonados pelo <strong>Mundo Country</strong> que desejam conforto, delicadeza, estilo e exclusividade. Os pares possuem bordados incríveis nas mais variadas cores e adicionam elegância a qualquer composição de look. As <strong>Botas Country</strong> são peças curingas e podem ser utilizadas das mais diversas maneiras, desde a tradicional combinação com calça jeans e camisa xadrez, ou, até mesmo, junto com saias ou vestidos, para formar um look na medida certa.
                                </p>

                                <h3 style="text-align: center;">Tabela de Tamanho</h3>

                                <img class="tabela-de-tamanho" src="{{ 'images/tabela-de-tamanho.jpg' | static_url }}" alt="Descubra aqui o seu tamanho" />
                            {% elseif tag == 'chapeu-country' %}
                                <p class="h3-description">
                                    O <strong>Chapéu Country</strong> é um item indispensável em qualquer <strong>Look Country</strong>, isso porque, a peça é cheia de estilo, além de proteger o rosto do sol e adicionar um toque final ao visual, ainda representa bem os apaixonados pelo campo. O acessório pode ser utilizado nas mais diversas ocasiões, desde baladas sertanejas e rodeios, ou, até mesmo para trabalhar e realizar atividades cotidianas.
                                </p>
                            {% elseif tag == 'bone-country' %}
                                <p class="h3-description">
                                    Assim como o <strong>Chapéu Country</strong>, o boné é um acessório muito usado por <strong>Cowboys</strong> e <strong>Cowgirls</strong>. Ele, com certeza, agrega muito estilo e originalidade, além de conferir um ar mais moderno e despojado ao look.
                                </p>
                            {% endif %}
                        </section>

                        <section id="dicasConservacao" class="secoes-intitucionais">
                            <h3>Como conservar?</h3>

                            {% if (tag == 'bota-texana') or (tag == 'coturno-country') %}
                                <p>
                                    Para você aproveitar cada momento com a sua <strong>Bota Texana</strong> nos pés e mantê-la durável e resistente por muito mais tempo, confira nossas dicas de conservação.
                                </p>

                                <p>
                                    - As <strong>Botas Texanas</strong> <strong>7M BOOTS</strong> são fabricadas em couro natural, por isso, evite lavá-las, dessa forma, o seu período de uso será muito maior!
                                </p>
                                <p>
                                    - Não deixe de molho.
                                </p>
                                <p>
                                    - Use produtos próprios para higienizar o couro e passe longe de detergentes ou alvejantes.
                                </p>
                                <p>
                                    - Limpe a parte interna com pano levemente umedecido e deixe secar na sombra.
                                </p>
                                <p>
                                    - Jamais coloque em máquinas de lavar ou secar.
                                </p>
                                <p>
                                    - Para reduzir os odores causados pela transpiração, deixe a sua <strong>Bota Texana</strong> descansando em local arejado e na sombra, por, pelo menos, 12 horas após o uso.
                                </p>
                                <p>
                                    - Evite expor ao sol por longos períodos, os raios solares podem causar deformidades no couro e comprometer a aparência do produto.
                                </p>
                            {% endif %}
                        </section>
                    {% endif %}
                {% endfor %}

                <section id="perguntasFrequentes" class="secoes-intitucionais">
                    <h3>Esclareça suas Dúvidas</h3>

                    <h4>É seguro comprar na <strong>7M BOOTS</strong>?</h4>

                    <p class="h3-description">
                        Sim, as compras são extremamente seguras. O site da <strong>7M BOOTS</strong> possui os selos <strong>Loja Confiável</strong> <strong>Cômodo Certificante</strong> e <strong>Safe Browsing Google</strong> que certificam e garantem a sua confiabilidade.
                    </p>

                    <h4>A <strong>7M BOOTS</strong> vende produtos no atacado?</h4>

                    <p class="h3-description">
                        Sim, ao efetuar uma compra que exceda 10 pares você garante condições exclusivas do atacado. Para saber mais, entre em contato conosco através do <strong>WhatsApp (16) 99206-2902</strong>, ou no próprio chat.
                    </p>

                    <h4>O material dos produtos é resistente?</h4>

                    <p class="h3-description">
                        Nossos produtos são fabricados através de couro legítimo. Em todos os processos de produção são utilizadas as melhores matérias-primas, que são desenvolvidas e previamente analisadas para garantir a você um calçado extremamente durável, com conforto e qualidade indiscutíveis.
                    </p>

                    <h4>Como eu meço a palmilha de acordo com a tabela de medidas?</h4>

                    <p class="h3-description">
                        Medir a palmilha e descobrir o tamanho mais indicado para você de acordo com a tabela de medidas é muito simples, pegue uma palmilha de um sapato seu e meça com uma régua ou fita métrica a largura e o comprimento da palmilha.
                    </p>

                    <h4>Em quanto tempo receberei meu produto?</h4>

                    <p class="h3-description">
                        O prazo de entrega dos produtos 7MBoots varia de acordo com o seu CEP. Para ser informado(a) sobre o prazo de entrega estipulado para a sua região, basta selecionar o(s) produto(s) desejados e inserir o CEP do seu endereço no carrinho de compras.
                        Importante: o prazo de entrega será calculado a partir da liberação do seu pedido pela Instituição Financeira, o que varia de acordo com a forma de pagamento escolhida.
                    </p>

                    <h4>Como é feito o cálculo do frete do meu pedido?</h4>

                    <p class="h3-description">
                        O calculo do valor do frete varia de acordo com a sua localidade. O nosso sistema calcula o valor automaticamente durante o fechamento da sua compra. Após selecionar os produtos que deseja adquirir e inserí-los no carrinho de compras, é possível calcular o custo do frete, basta informar os dígitos do seu CEP e conferir o valor.
                    </p>

                    <h4>Moro na Zona Rural, como receberei meu produto?</h4>

                    <p class="h3-description">
                        Os moradores da Zona Rural que desejam adquirir um produto <strong>7M BOOTS</strong> podem inserir o endereço de algum parente ou amigo da zona urbana, ou, se preferirem, podem informar o endereço da Agência dos Correios mais próxima e retirar a encomenda no prazo estipulado, portando documento com foto e algum comprovante do pedido.
                    </p>

                    <h4>Posso acompanhar o processo de entrega do meu pedido?</h4>

                    <p class="h3-description">
                        Sim! Você pode rastrear o seu pedido no próprio site da <strong>7M BOOTS</strong>, basta acessar a aba <strong>Área do Cliente</strong> e depois ir para <strong>Pedidos</strong>, ali, é possível acompanhar cada passo do status da sua compra. Assim que o seu pedido foi direcionado ao seu endereço de entrega, todas as informações de rastreamento de envio serão enviadas para o seu e-mail de cadastro.
                    </p>

                    <h4>Se for necessária a troca ou devolução, como proceder?</h4>

                    <p class="h3-description">
                        Na <strong>7M BOOTS</strong> o procedimento de troca ou devolução de um produto é bastante simples e prático. Para que a sua troca ou devolução sejam efetuadas com sucesso, o produto deve ser devolvido sem uso, dentro de sua embalagem original ou embalado em papel pardo, manuais e acessórios.
                    </p>

                    <p class="h3-description">
                        O prazo para solicitação do pedido de troca ou devolução do seu <strong>7M BOOTS</strong> é de quatro dias úteis.
                    </p>

                    <p class="h3-description">
                        O prazo para efetivação do processo de troca é de oito dias úteis.
                    </p>

                    <p class="h3-description">
                        Ao postar o objeto para troca, por favor, certifique-se de que o produto encontra-se dentro das condições citadas anteriormente e verifique se todos os dados do remetente estão corretos.
                    </p>

                    <p class="h3-description">
                        Em casos de troca por numeração ou insatisfação por parte do consumidor, esclarecemos que o os custos de envio do produto  para a loja, assim como os custos  de reenvio do produto serão arcados pelo cliente.
                    </p>

                    <p class="h3-description">
                        Importante: Dentro da caixa pedimos que coloque em um papel o motivo da troca e qual a numeração certa , o telefone pra contato e o numero do seu pedido , chegando aqui realizamos a sua troca.
                    </p>

                    <h4>INFORMAÇÕES DO DESTINATÁRIO:</h4>

                    <p class="h3-description">
                        <strong>7M BOOTS</strong>
                    </p>

                    <p class="h3-description">
                        Endereço: Rua José Josué da Silva nº 1579 -Bairro Residencial Vera Cruz
                    </p>

                    <p class="h3-description">
                        CEP: 14407-488
                    </p>

                    <p class="h3-description">
                        Franca – SP
                    </p>

                    <h4>Quero cancelar o meu pedido, como proceder?</h4>

                    <p class="h3-description">
                        Para cancelamentos de pedidos, entre em contato com a nossa Central de Atendimento pelo telefone:. <strong>(16) 99206-2902</strong>. Atendemos de segunda a sábado das <strong>8h00</strong> ás <strong>21h00</strong>, exceto feriados.
                        Esclarecemos que, após a conclusão do pedido, só é possível solicitar o cancelamento antes da emissão da Nota Fiscal. Caso a Nota Fiscal já tenha sido gerada, pedimos que recuse a entrega da encomenda e entre em contato com a Central de Atendimento para solicitar o cancelamento.
                    </p>

                    <h4>Onde a <strong>7M BOOTS</strong> está localizada?</h4>

                    <p class="h3-description">
                        Estamos situados na cidade de <strong>Franca – SP</strong>, um dos maiores polos calçadistas do Brasil. Confira nosso endereço:
                    </p>

                    <p class="h3-description">
                        Endereço: Rua José Josué da Silva nº 1579 -Bairro Residencial Vera Cruz
                    </p>

                    <p class="h3-description">
                        CEP: 14407-488
                    </p>

                    <p class="h3-description">
                        Franca – SP.
                    </p>
                </section>
            </div>

            <div id="related-products">
                {% set related_products_ids = product.metafields.related_products.related_products_ids %}
                {% if related_products_ids %}
                    {% set related_products = related_products_ids | get_products %}
                    {% set show = (related_products | length > 0) %}
                {% endif %}
                {% if not show %}
                    {% set related_products = category.products | shuffle | take(4) %}
                    {% set show = (related_products | length > 1) %}
                {% endif %}
                {% if show %}
                    <h6 class="subtitle">{{"Productos Relacionados" | translate}}</h6>
                    <div class="grid-row m-top-xs">
                        {% for related in related_products %}
                            {% if product.id != related.id %}
                                {% include 'snipplets/single_product.tpl' with {product : related, 'quickshop_included' : true} %}
                            {% endif %}
                        {% endfor %}
                    </div>
                {% endif %}
            </div>
        </div>
    </div>
</div>

{# Payments details #}

{% include 'snipplets/payments/payments.tpl' %}

<div class="js-mobile-zoom-panel mobile-zoom-panel">
    {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "js-mobile-zoom-spinner svg-inline--fa fa-2x fa-spin mobile-zoom-spinner svg-text-fill"} %}
    <div class="js-mobile-zoomed-image mobile-zoom-image-container">
       {# Container to be filled with the zoomable image #}
    </div>
    <a class="js-close-mobile-zoom btn-floating m-right m-top">
        {% include "snipplets/svg/times.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
    </a>
</div>
