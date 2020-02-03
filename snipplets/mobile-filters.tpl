<div class="js-mobile-filters-panel mobile-filters modal-xs modal-xs-right modal-xs-right-out visible-phone">
	<div class="modal-xs-dialog">
	    <a class="js-toggle-mobile-filters modal-xs-header" href="#">
		 	<span class="modal-xs-header-icon modal-xs-right-header-icon">
	            {% include "snipplets/svg/arrow-left.tpl" with {fa_custom_class: "svg-inline--fa fa-lg"} %}
	        </span>
	        <span class="modal-xs-header-text modal-xs-right-header-text">{{ 'Filtrar por:' | translate }}</span>
	    </a>
	    <div class="modal-content">
		    <div class="modal-xs-body">
		        {% include "snipplets/filters.tpl" with {'filters_mobile': true} %}
		    </div>
	    </div>
	</div>
</div>
