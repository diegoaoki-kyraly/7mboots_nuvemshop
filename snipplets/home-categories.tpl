<section class="horizontal-container pills-container container-fluid text-center text-left-xs{% if not settings.home_main_categories %} visible-phone{% endif %}">
	<h4 class="text-center weight-normal hidden-phone m-bottom-half m-top-half">{{ "Categorías principales" | translate }}</h4>
	<ul>
		{% for category in categories %}
			<li data-item="{{ loop.index }}" class="pill {% if loop.first %} m-left {% endif %} {% if loop.last %} p-right {% endif %}">
            	<a class="pill-link" href="{{ category.url }}" title="{{ category.name }}">{{ category.name }}</a>
            </li>
		{% endfor %}
	</ul>
</section>

