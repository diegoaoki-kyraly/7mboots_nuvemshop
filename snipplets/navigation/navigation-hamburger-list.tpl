{% for item in navigation %}
	{% if settings.tab_menu %}
	    {% if not item.isRootCategory and not item.isHomePage %}
		    {% if item.subitems %}
		    	<li class="item-with-subitems p-relative">
		    		<div class="js-hamburger-panel-toggle-accordion">
			            <a class="hamburger-panel-link p-right-double weight-normal" href="{{ item.url }}">
			                {{ item.name }}
			            </a>
			             <span class="hamburger-panel-arrow js-toggle-page-accordion p-all-quarter p-absolute transition-soft">{% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa fa-lg p-all-half hamburger-panel-arrow-icon"} %}</span> 
			         </div>
	 				<ul class="js-pages-accordion list-subitems hamburger-panel-accordion" style="display:none;">
						{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
					</ul>
				</li>
			{% else %}
				 <li>
		            <a class="hamburger-panel-link weight-normal" href="{{ item.url }}">
		                {{ item.name }}</a>
		         </li>
			{% endif %}
	    {% endif %}
	{% else %}
		{% if item.subitems %}
	    	<li class="item-with-subitems p-relative">
	    		<div class="js-hamburger-panel-toggle-accordion">
		            <a class="hamburger-panel-link p-right-double weight-normal" href="{{ item.url }}">
		                {{ item.name }}
		            </a>
		             <span class="hamburger-panel-arrow js-toggle-page-accordion p-all-quarter p-absolute transition-soft">{% include "snipplets/svg/chevron-down.tpl" with {fa_custom_class: "svg-inline--fa fa-lg p-all-half hamburger-panel-arrow-icon"} %}</span> 
		         </div>
 				<ul class="js-pages-accordion list-subitems hamburger-panel-accordion" style="display:none;">
					{% snipplet "navigation/navigation-hamburger-list.tpl" with navigation = item.subitems %}
				</ul>
			</li>
		{% else %}
			 <li>
	            <a class="hamburger-panel-link weight-normal" href="{{ item.url }}">
	                {{ item.name }}</a>
	         </li>
		{% endif %}
	{% endif %}
{% endfor %}
