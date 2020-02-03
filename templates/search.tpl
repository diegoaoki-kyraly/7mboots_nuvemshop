{% paginate by settings.category_quantity_products %}
<div class="row-fluid" id="category-page">
    {% if products %}
        <div class="page-section-title">
            <div class="container">
                {% snipplet "breadcrumbs.tpl" %}
                <h1>{{ "Resultados de búsqueda" | translate }}</h1>
            </div>
        </div>
    {% endif %}
    <div class="corpo-category">
    	<div class="container controller">
            {% if products %}        
                <div class="js-product-table product-table">
                    {% snipplet "product_grid.tpl" %}
                </div>
                {% if settings.infinite_scrolling and pages.current == 1 and not pages.is_last %}
                    <div class="clear-both text-center m-top m-bottom p-bottom-half visible-when-content-ready visible-when-content-ready">
                        <a class="js-load-more-btn btn btn-primary clear-both full-width-xs col-centered">
                            <span class="js-load-more-spinner" style="display:none;">
                                {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin m-left-half pull-right svg-primary-fill"} %}
                            </span>
                            {{ 'Mostrar más productos' | t }}
                        </a>
                    </div>
                    <div id="js-infinite-scroll-spinner" class="m-bottom-double text-center m-top pull-left full-width" style="display:none">
                        {% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-2x fa-spin svg-text-fill"} %}
                    </div>
                {% endif %}
                <div class="crumbPaginationContainer bottom visible-when-content-ready" {% if settings.infinite_scrolling %}style="display:none"{% endif %}>
                    <div class='pagination'>
                        {% snipplet "pagination.tpl" %}
                    </div>
                </div>
            {% else %}
                <div class="frame-title span6 offset3 m-top">
                    <h1 class="h3-xs">{{ "No hubo resultados para tu búsqueda" | translate }}</h1>
                </div>

                {% if sections.primary.products %}
                    <div class="container p-relative m-bottom clear-both">
                        <h6 class="subtitle m-none">{{"Productos destacados" | translate}}</h6>
                        {% set primary_section_products %}
                            {% for product in sections.primary.products %}
                                {% include 'snipplets/single_product.tpl' with {'thumb_scroller': true, 'quickshop_included' : true} %}
                            {% endfor %}
                        {% endset %}
                        <div class="js-horizontal-scroller primary-products-scroller scroller scroller-horizontal-top grid-row" style="visibility: hidden;">
                            {{ primary_section_products }}
                        </div>
                        <a href="#" class="js-horizontal-scroller-prev scroller-btn scroller-btn-prev scroller-btn-top hidden-phone">
                            {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                        </a>
                        <a href="#" class="js-horizontal-scroller-next scroller-btn scroller-btn-next scroller-btn-top hidden-phone">
                            {% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
                        </a>
                    </div>
                {% endif %}
            {% endif %}
        </div>
    </div>
</div>
