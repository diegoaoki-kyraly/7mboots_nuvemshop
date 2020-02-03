{% for item in menus[settings.footer_menu] %}
	<li class="footer-nav-item">
        <a href="{{ item.url }}" {% if item.url | is_external %}target="_blank"{% endif %}>{{ item.name }}</a>
	</li>
{% endfor %}