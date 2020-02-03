{# Mobile home slider placeholder: to be hidden after content loaded #}
{% if settings.slider and settings.slider is not empty %}
    <div class="js-home-slider-placeholder mobile-placeholder placeholder-container">
        <div class="placeholder-figures-container">
            <div class="placeholder-icon">{% include "snipplets/svg/images.tpl" %}</div>
            <div class="placeholder-pager">
                {% for slide in settings.slider %}
                    <span class="placeholder-page d-inline-block {% if loop.first %}active {% endif %}"></span>
                {% endfor %}
            </div>
        </div>
        <div class="placeholder-shine">
        </div>
    </div>
    <div class="js-slider-desktop-placeholder slider-desktop-placeholder">
    </div>
{% endif %}

{% if settings.slider_mobile and settings.slider_mobile is not empty %}
    <div class="js-home-slider-placeholder mobile-placeholder placeholder-container">
        <div class="placeholder-figures-container">
            <div class="placeholder-icon">{% include "snipplets/svg/images.tpl" %}</div>
            <div class="placeholder-pager">
                {% for slide in settings.slider_mobile %}
                    <span class="placeholder-page d-inline-block {% if loop.first %}active {% endif %}"></span>
                {% endfor %}
            </div>
        </div>
        <div class="placeholder-shine">
        </div>
    </div>
    <div class="js-slider-desktop-placeholder slider-desktop-placeholder">
    </div>
{% endif %}

{% if settings.slider_fabricantes and settings.slider_fabricantes is not empty %}
    {% for slide in settings.slider_fabricantes %}
        <span class="placeholder-fabricante {% if loop.first %}active {% endif %}"></span>
    {% endfor %}
{% endif %}