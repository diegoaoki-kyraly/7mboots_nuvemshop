{% set is_pickup = store.has_shipping_segmentation and pickup %}

{# On first calculation select as default the first option: If store only has pickup option selects pickup else selects shipping option #}

{% if store.has_shipping_segmentation %}
	{% if has_featured_shipping %}
		{% set checked_option = featured_option and loop.first and not pickup %}
	{% else %}
		{% set checked_option = featured_option and loop.first and pickup %}
	{% endif %}
{% else %}
	{% set checked_option = featured_option and loop.first %}
{% endif %}
<li class="js-shipping-list-item radio-button-item list-item">
	<label class="js-shipping-radio radio-button shipping-option">
    	<input 
        id="{% if featured_option %}featured-{% endif %}shipping-{{loop.index}}" 
        class="js-shipping-method {% if not featured_option %}js-shipping-method-hidden{% endif %} shipping-method {% if is_pickup %}js-pickup-option{% endif %}"
        data-price="{{option.cost.value}}" 
        data-code="{{option.code}}" 
        data-name="{{option.name}}" 
        data-cost="{% if option.show_price %} {% if option.cost.value == 0  %}{{ 'Gratis' | translate }}{% else %}{{option.cost}}{% endif %}{% else %} {{ 'A convenir' | translate }} {% endif %}" 
        type="radio" 
        value="{{option.code}}" 
        {% if checked_option %}checked="checked"{% endif %} name="option" 
        style="display:none" />
    	<span class="row-fluid radio-button-content">
    		<div class="radio-bg-selected"></div>
			<div class="radio-button-icons-container">
				<span class="radio-button-icons">
					<span class="radio-button-icon unchecked"></span>
					<span class="radio-button-icon checked"></span>
				</span>
			</div>
			<span class="radio-button-label">
				<div class="row-fluid radio-button-text">
					<div class="span9 col-xs-9-custom pull-left-xs p-right-half">
						<div class="font-body opacity-80 shipping-method-name {% if option.payment_rules or option.time or option.suboptions is not empty %}m-bottom-quarter{% endif %}">
							{{option.short_name}} {% if option.method == 'branch' %}<span class="m-left-quarter">{{ option.extra.extra }}</span>{% endif %}
						</div>
						{% if option.time %}
                            <div class="font-body {% if option.suboptions is not empty or option.payment_rules %}m-bottom-quarter{% endif %}">
				    			{% if store.has_smart_dates %}
				    				{{option.dates}}
			    				{% else %}
			    					{{option.time}}
			    				{% endif %}
				    		</div>
                        {% endif %}						
                        {% if option.suboptions is not empty %}
                        	<div {% if option.payment_rules %}class="m-bottom-quarter"{% endif %}>
					            {% include "snipplets/shipping_suboptions/#{option.suboptions.type}.tpl" with {'suboptions': option.suboptions} %}
					        </div>
				        {% endif %}		
						{% if option.payment_rules %}
				    		<div class="font-small">
                                <span class="d-table pull-left">
                                    {% include "snipplets/svg/info-circle.tpl" with {fa_custom_class: "svg-inline--fa opacity-80 svg-icon-text m-right-quarter"} %}
                                </span>
                                <span class="d-table">
                                    <i>{{option.payment_rules}}</i>
                                </span>
                            </div>
						{% endif %}	
			        	{% if option.warning['enable'] %}
				            <div class="alert alert-warning pull-right m-top m-bottom-none">
			              		{{ option.warning['message'] }}
				            </div>
			          	{% endif %}
					</div>
					{% if option.show_price %} 
						<div class="span3 col-xs-3-custom pull-right-xs h6 text-right">
							<strong class="shipping-method-price {% if option.cost.value == 0 %}text-primary{% endif %}">
								{% if option.cost.value == 0  %}
									{{ 'Gratis' | translate }}
								{% else %}
									{{option.cost}}
								{% endif %}
							</strong>
							{% if option.cost.value == 0 and option.old_cost.value %}
								<span class="price-compare m-left-quarter opacity-50 font-small">{{option.old_cost}}</span>
							{% endif %}
			    		</div>
					{% endif %}
				</div>
			</span>
		</span>
    </label>
</li>