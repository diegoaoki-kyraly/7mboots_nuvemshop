{% if pages.numbers %}
	{% if pages.previous %}
        <a href="{{ pages.previous }}" class="pagination-arrow-link">
        	<span class="pagination-arrow-prev visible-phone pull-left">
				{% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
			</span>
			<span class="hidden-phone p-all-quarter"><</span>
        </a>
    {% endif %}
    {% for page in pages.numbers %}
	 	{% if page.selected %}
	 	<div class="js-page-link-{{ page.number }} pagination-input-container d-inline-block {% if not pages.previous %}pagination-input-container-wide{% endif %}">
	 		<span class="page-number selected text-secondary hidden-phone weight-strong p-all-quarter">{{ page.number }}</span>
	 		<span class="visible-phone m-right-quarter"> 
				{{ 'Página' | t }}
			</span> 
 			<input type="number" value="{{ page.number }}" class="js-mobile-paginator-input font-body pagination-input visible-phone text-center"/> 
 			<span class="visible-phone m-left-quarter"> 
				{{ 'de ' | t }} {{ pages.amount }}
			</span> 
		</div>
	 	{% else %}
	 		<a href="{{ page.url }}" class="js-page-link-{{ page.number }} hidden-phone p-all-quarter">{{ page.number }}</a>
	 	{% endif %}
	{% endfor %}
	{% if pages.next %}
		<a href="{{ pages.next }}" class="pagination-arrow-link">
			<span class="pagination-arrow-next visible-phone pull-right">
				{% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
			</span>
			<span class="hidden-phone p-all-quarter">&gt;</span>
		</a>
	{% endif %}
{% endif %}
