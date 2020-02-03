<div class="ad-container container-primary p-bottom-quarter  p-top-quarter">
	<div class="container advertising">
	    <div class="row-fluid">
	        <div class="span12  font-small text-center">
	           	{% if settings.ad_bar and settings.ad_text %}
	           	    {% if settings.ad_url %}
				        <a class="advertising-link" href="{{ settings.ad_url }}">
					{% endif %}  
			        	{% if settings.ad_text %}
			        		{{ settings.ad_text }}
			        	{% endif %} 
					{% if settings.ad_url %}
				        </a>
			        {% endif %}  
			    {% endif %}       	
	        </div>
	    </div>
	</div>
</div>