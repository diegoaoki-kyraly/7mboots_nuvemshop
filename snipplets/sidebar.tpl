<div class="sidebar">
    <div class="container">
    	{% snipplet "categories.tpl" %}
	    <div class="hidden-phone filtros-side">
			<h4>Filtrar por</h4>
		    {% include "snipplets/filters.tpl" with {'filters_mobile': false} %}
		</div>
    </div>
</div>