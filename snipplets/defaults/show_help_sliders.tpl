{# Only remove this if you want to take away the theme onboarding advices #}
{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}
{# Products that works as example #}
<div class="row-fluid">
    <div class="container">
        <div class="span4">
            <div class="p-relative border-bottom m-bottom border-none-xs">
                <h6 class="subtitle">{{"Productos recientes" | translate}}</h6>
                <div class="js-vertical-scroller-one secondary-products-scroller scroller scroller-vertical visible-when-content-ready">
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                    {% include "snipplets/svg/help-product-0.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                <div class="item-price-container">
                                    <span class="item-price weight-strong" id="price_display" itemprop="price" content="112">{{"11200" | money }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-1.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                <div class="item-price-container">
                                    <span class="item-price weight-strong" id="price_display" itemprop="price" content="112">{{"100000" | money }}</span>
                                    <span class="item-price-compare price-compare">
                                        <span id="compare_price_display">{{"150000" | money }}</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-3.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                <div class="item-price-container">
                                    <span class="item-price weight-strong" id="price_display" itemprop="price" content="112">{{"7200" | money }}</span>
                                    <span class="item-price-compare price-compare">
                                        <span id="compare_price_display">{{"8000" | money }}</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-4.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                <div class="item-price-container">
                                    <span class="item-price weight-strong" id="price_display" itemprop="price" content="112">{{"10200" | money }}</span>
                                    <span class="item-price-compare price-compare">
                                        <span id="compare_price_display">{{"13200" | money }}</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="js-vertical-scroller-one-prev scroller-btn scroller-prev scroller-btn-bottom hidden-phone">
                    {% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                </a>
                <a href="#" class="js-vertical-scroller-one-next scroller-btn scroller-next scroller-btn-bottom hidden-phone">
                    {% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                </a>
            </div>
        </div>
        <div class="span4">
            <div class="p-relative border-bottom m-bottom border-none-xs">
                <h6 class="subtitle">{{"Productos en oferta" | translate}}</h6>
                <div class="js-vertical-scroller-two secondary-products-scroller scroller scroller-vertical visible-when-content-ready">
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-6.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                <div class="item-price-container">
                                    <span class="item-price weight-strong" id="price_display" itemprop="price" content="112">{{"7200" | money }}</span>
                                    <span class="item-price-compare price-compare">
                                        <span id="compare_price_display">{{"8000" | money }}</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-7.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                                <div class="item-price-container">
                                    <span class="item-price weight-strong" id="price_display" itemprop="price" content="112">{{"10200" | money }}</span>
                                    <span class="item-price-compare price-compare">
                                        <span id="compare_price_display">{{"13200" | money }}</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="js-vertical-scroller-two-prev scroller-btn scroller-prev scroller-btn-bottom hidden-phone">
                    {% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                </a>
                <a href="#" class="js-vertical-scroller-two-next scroller-btn scroller-next scroller-btn-bottom hidden-phone">
                    {% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                </a>
            </div>
        </div>
        <div class="span4">
            <div class="p-relative border-bottom m-bottom border-none-xs">
                <h6 class="subtitle">{{"Próximamente" | translate}}</h6>
                <div class="js-vertical-scroller-three secondary-products-scroller scroller scroller-vertical visible-when-content-ready">
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-8.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="item-small">
                            <div class="span3 item-image-container">
                                <a href="#" class="item-small-image">
                                   {% include "snipplets/svg/help-product-9.tpl" %}
                                </a>
                            </div>
                            <div class="span9 item-info-container font-small">
                                <div class="text-tertiary">
                                    {{ "CATEGORÍA DE EJEMPLO" | translate }}
                                </div>
                                <a href="/product/example" class="item-name" title="{{ product.name }}">{{ "Producto de ejemplo" | translate }}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="js-vertical-scroller-three-prev scroller-btn scroller-prev scroller-btn-bottom hidden-phone">
                    {% include "snipplets/svg/angle-up.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                </a>
                <a href="#" class="js-vertical-scroller-three-next scroller-btn scroller-next scroller-btn-bottom hidden-phone">
                    {% include "snipplets/svg/angle-down.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                </a>
            </div>
        </div>
    </div>
</div>