{% for product in products %}
	{% if loop.index % 4 == 1 %}
    	<div class="grid-row">
    {% endif %}
    {% include 'snipplets/single_product.tpl' with {'quickshop_included' : true} %}
    {% if loop.index % 4 == 0 or loop.last %}
        </div>
    {% endif %}    
{% endfor %}