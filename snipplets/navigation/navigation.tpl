{% for item in navigation %}
    <li class="desktop-nav-item {{ item.current ? 'selected' : '' }} {{ loop.first ? 'first' : '' }}">
		{% if item.subitems %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
				{{ item.name }}
			</a>
			<ul class="desktop-nav-list">
				{% snipplet "navigation/navigation.tpl" with navigation = item.subitems %}
			</ul>
		{% else %}
			<a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %} class="desktop-nav-link">
				{{ item.name }}
			</a>
		{% endif %}
	</li>
{% endfor %}

