<div class="container clear-both">
        {% set num_banners = 0 %}
        {% for banner in ['banner_home_01', 'banner_home_02'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_button_text = attribute(settings,"#{banner}_button_text") %}
            {% set has_banner =  banner_show and (banner_title or banner_description or banner_button_text or "#{banner}_image.jpg" | has_custom_image) %}
            {% if has_banner %}
                {% set num_banners = num_banners + 1 %}
            {% endif %}
        {% endfor %}

   {% if num_banners != 4 %}
        <div class="row-fluid">
   {% endif %}
        {% for banner in ['banner_home_01', 'banner_home_02', 'banner_home_03', 'banner_home_04'] %}
            {% set banner_show = attribute(settings,"#{banner}_show") %}
            {% set banner_title = attribute(settings,"#{banner}_title") %}
            {% set banner_description = attribute(settings,"#{banner}_description") %}
            {% set banner_url = attribute(settings,"#{banner}_url") %}
            {% set banner_button_text = attribute(settings,"#{banner}_button_text") %}
            {% set banner_blank = attribute(settings,"#{banner}_blank")%}
            {% set has_banner =  banner_show and (banner_title or banner_description or (banner_url and banner_button_text) or "#{banner}_image.jpg" | has_custom_image) %}
            {% set has_banner_text =  banner_title or banner_description or (banner_url and banner_button_text) %}
            {% if has_banner %}
                {% if num_banners == 4 and loop.index % 2 == 1 %}
                    <div class="row-fluid">
                {% endif %}
                <div class="span{% if num_banners == 1 %}6 offset3{% elseif num_banners == 2 %}6{% elseif num_banners == 3 %}4{% elseif num_banners == 4 %}6{% endif %}{% if not has_banner_text %} without-text-container{% endif %}">
                    {% if "#{banner}_image.jpg" | has_custom_image %}
                        {% if banner_url %}
                            <a href="{{ banner_url }}" {% if banner_blank %}target="_blank"{% endif %}>
                        {% endif %}
                        {% if store.thumbnails_enabled %}
                            <div class="js-wrap-banner text-banner lazyautosizes lazyload blur-up-big" data-bgset='{{ "#{banner}_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}_image.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" style="background-image: url({{ "#{banner}_image.jpg" | static_url | settings_image_url('thumb') }});">
                                <div class="text-banner-filter {{ banner_color }}"></div>
                            </div>
                        {% else %}
                            <div class="js-wrap-banner text-banner lazyload blur-up-big" data-bg='{{ "#{banner}_image.jpg" | static_url }}' style="background-image: url({{ "#{banner}_image.jpg" | static_url | settings_image_url('thumb') }});">
                                <div class="text-banner-filter {{ banner_color }}"></div>
                            </div>
                        {% endif %}
                        {% if banner_url %}
                            </a>
                        {% endif %}
                    {% endif %}
                    <div class="text-banner-info p-relative">
                        {% if banner_title %}
                            <h4 class="text-banner-title">{{ banner_title }}</h4>
                        {% endif %}
                        {% if banner_description %}
                            <p class="text-banner-paragraph">{{ banner_description }}</p>
                        {% endif %}
                        {% if banner_url and banner_button_text %}
                            <a href="{{ banner_url }}" class="btn btn-primary text-banner-link" {% if banner_blank %}target="_blank"{% endif %}>{{ banner_button_text }}</a>
                        {% endif %}
                    </div>
                </div>
                {% if num_banners == 4 and loop.index % 2 == 0 %}
                    </div>
                {% endif %}
            {% endif %}
        {% endfor %}
    {% if num_banners != 4 %}
 	    </div>
    {% endif %}
</div>
