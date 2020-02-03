<div class="container{% if theme_version == 'full' %}-fluid p-none{% endif %} clear-both">
    {% set num_banners = 0 %}
    {% for banner in ['banner_home_promotional_01', 'banner_home_promotional_02', 'banner_home_promotional_03'] %}
        {% set banner_show = attribute(settings,"#{banner}_show") %}
        {% set banner_title = attribute(settings,"#{banner}_title") %}
        {% set banner_description = attribute(settings,"#{banner}_description") %}
        {% set banner_button_text = attribute(settings,"#{banner}_button_text") %}
        {% set has_banner =  banner_show and (banner_title or banner_description or banner_button_text or "#{banner}_image.jpg" | has_custom_image) %}
        {% if has_banner %}
            {% set num_banners = num_banners + 1 %}
        {% endif %}
    {% endfor %}

    {% if num_banners > 0 %}
        <div class="row-fluid">
    {% endif %}
    {% for banner in ['banner_home_promotional_01', 'banner_home_promotional_02', 'banner_home_promotional_03'] %}
        {% set banner_show = attribute(settings,"#{banner}_show") %}
        {% set banner_title = attribute(settings,"#{banner}_title") %}
        {% set banner_description = attribute(settings,"#{banner}_description") %}
        {% set banner_url = attribute(settings,"#{banner}_url") %}
        {% set banner_button_text = attribute(settings,"#{banner}_button_text") %}
        {% set banner_blank = attribute(settings,"#{banner}_blank")%}
        {% set has_banner =  banner_show and (banner_title or banner_description or (banner_url and banner_button_text) or "#{banner}_image.jpg" | has_custom_image) %}
        {% set has_banner_text =  banner_title or banner_description or banner_button_text %}
        {% if has_banner %}
            <div class="span{% if num_banners == 1 %}12{% elseif num_banners == 2 %}6{% if theme_version == 'full' %} col-md-6-custom{% endif %}{% elseif num_banners == 3 %}4{% if theme_version == 'full' %} col-md-4-custom{% endif %}{% elseif num_banners == 4 %}6{% endif %}{% if not has_banner_text %} without-text-container{% endif %}{% if theme_version == 'full' %} m-none{% endif %}">
                
                    {% if banner_url %}
                        <a href="{{ banner_url }}" {% if banner_blank %}target="_blank"{% endif %}>
                    {% endif %}
                    {% if "#{banner}_image.jpg" | has_custom_image %}
                        {% if store.thumbnails_enabled %}
                            <div class="js-wrap-banner text-banner text-banner-promotional lazyautosizes lazyload blur-up" data-bgset='{{ "#{banner}_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "#{banner}_image.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "#{banner}_image.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "#{banner}_image.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" style="background-image: url({{ "#{banner}_image.jpg" | static_url | settings_image_url('thumb') }});">
                        {% else %}
                            <div class="js-wrap-banner text-banner text-banner-promotional lazyload blur-up" data-bg='{{ "#{banner}_image.jpg" | static_url }}' style="background-image: url({{ "#{banner}_image.jpg" | static_url | settings_image_url('thumb') }});">
                        {% endif %}
                        {% if has_banner_text %}
                            <div class="text-banner-filter {{ banner_color }}"></div>
                        {% endif %}
                    {% else %}
                        <div class="js-wrap-banner text-banner text-banner-promotional">
                    {% endif %}
                    {% if has_banner_text %}
                        <div class="text-banner-info p-relative">
                            {% if banner_title %}
                                <h4 class="text-banner-title">{{ banner_title }}</h4>
                            {% endif %}
                            {% if banner_description %}
                                <p class="text-banner-paragraph">{{ banner_description }}</p>
                            {% endif %}
                            {% if banner_button_text and banner_url %}
                                <div class="btn btn-primary btn-inverse text-banner-link" {% if banner_blank %}target="_blank"{% endif %}>{{ banner_button_text }}</div>
                            {% endif %}
                        </div>
                    {% endif %}
                    </div>
                    {% if banner_url %}
                        </a>
                    {% endif %}
                
            </div>
        {% endif %}
    {% endfor %}
    {% if num_banners > 0 %}
 	    </div>
    {% endif %}
</div>