<div class="corpo-404">
    {# Only remove this if you want to take away the theme onboarding advices #}
    {% set show_help = not has_products %}
    <div class="row-fluid" id="404">
        <div class="container content">
            <div class="frame-title span6 offset3 visible-when-content-ready">
                <h1>- {{ "Error" | translate }} -</h1>
                <h2 class="h1">{{ "404" | translate }}</h2>
                <p>{{ "La página que estás buscando no existe." | translate }}</p>
            </div>

            {% if sections.primary.products %}
                <div class="sugestoes p-relative m-bottom clear-both">
                    <h6 class="subtitle m-none">{{ "Quizás te interesen los siguientes productos." | translate }}</h6>
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
        </div>
    </div>
    {# Here we will add an example as a help, you can delete this after you upload your products #}
    {% if show_help %}
    <div class="row-fluid" id="product-example">
        {% snipplet 'defaults/show_help_product.tpl' %}
    </div>
    {% endif %}
</div>
