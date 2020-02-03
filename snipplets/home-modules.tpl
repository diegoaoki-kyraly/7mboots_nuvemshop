{% set num_modules = 0 %}
{% for module in ['module_01', 'module_02'] %}
    {% set module_show = attribute(settings,"#{module}_show") %}
    {% set module_image = "#{module}.jpg" | has_custom_image %}
    {% set module_title = attribute(settings,"#{module}_title") %}
    {% set module_text = attribute(settings,"#{module}_text") %}
    {% set module_button_text = attribute(settings,"#{module}_button") %}
    {% set has_module =  module_show and (module_title or module_text or module_image) %}
    {% if has_module %}
        {% set num_modules = num_modules + 1 %}
    {% endif %}
{% endfor %}

{% for module in ['module_01', 'module_02'] %}
    {% set module_show = attribute(settings,"#{module}_show") %}
    {% set module_image = "#{module}.jpg" | has_custom_image %}
    {% set module_title = attribute(settings,"#{module}_title") %}
    {% set module_text = attribute(settings,"#{module}_text") %}
    {% set module_button_text = attribute(settings,"#{module}_button") %}
    {% set module_url = attribute(settings,"#{module}_url") %}
    {% set module_align = attribute(settings,"#{module}_align") %}
    {% set has_module =  module_show and (module_title or module_text or module_image) %}
    {% set has_module_text =  module_title or (module_url and module_button_text) %}
    {% if has_module %}
        <div class="module-container{% if module == 'module_02' and num_modules == 2 %} module-secondary{% endif %}">
            <div class="container">
                <div class="row-fluid module-wrapper">
                    <div class="span8{% if module_align == 'right' %} pull-right{% endif %}">
                        <div class="module-image overide-container-xs-width">
                            {% if module_url %}
                                <a href="{{ module_url }}"{% if module_title %} alt="{{ module_title }}" title="{{ module_title }}"{% endif %}>
                            {% endif %}
                            {% if module_image %}
                                {% if store.thumbnails_enabled %}
                                    <img class="lazyautosizes lazyload blur-up-big" src="{{ "#{module}.jpg" | static_url | settings_image_url('thumb') }}" data-srcset='{{ "#{module}.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{module}.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" />
                                {% else %}
                                    <img class="lazyload blur-up-big" src="{{ "#{module}.jpg" | static_url | settings_image_url('thumb') }}" data-src='{{ "#{module}.jpg" | static_url }}' />
                                {% endif %}
                            {% else %}
                                <div class="placeholder">
                                    {% include "snipplets/svg/image.tpl" with {fa_custom_class: "svg-inline--fa fa-4x module-icon svg-text-fill"} %}
                                </div>
                            {% endif %}
                            {% if module_url %}
                                </a>
                            {% endif %}
                        </div>
                    </div>
                    <div class="span4{% if module_align == 'right' %} m-left-none{% endif %}">
                        <div class="module-text">
                            <div class="text-container">
                                {% if module_title %}
                                    <div class="module-text-title">{{ module_title }}</div>
                                {% endif %}
                                {% if module_text %}
                                    <div class="module-text-paragraph">{{ module_text }}</div>
                                {% endif %}
                                {% if module_url and module_button_text %}
                                    <a href="{{ module_url }}"{% if module_title %} alt="{{ module_title }}" title="{{ module_title }}"{% endif %}>
                                        <div class="btn btn-primary btn-small">{{ module_button_text }}</div>
                                    </a>
                                {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {% endif %}
{% endfor %}
