
<div class="js-search-container search-container">
    <div class="js-mobile-search-row mobile-nav-search-row">
        <form action="{{ store.search_url }}" method="get" class="js-search-form">
            <div class="input-prepend mobile-search-input-container">
                <span class="js-search-back-btn js-toggle-mobile-search mobile-search-input-back add-on">
                    {% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                </span>
                <input class="js-mobile-search-input js-search-input mobile-search-input" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}"/>
               
                <button type="submit" class="add-on mobile-search-input-submit" value="">
                     {% include "snipplets/svg/search.tpl" with {fa_custom_class: "svg-inline--fa svg-primary-fill"} %}
                </button>
            </div>
        </form>
    </div>
</div>
<div class="js-search-suggest search-suggest">
    {# AJAX container for search suggestions #}
</div>
<div class="js-search-backdrop js-toggle-mobile-search search-backdrop backdrop container-fluid full-width" style="display: none;"></div>
