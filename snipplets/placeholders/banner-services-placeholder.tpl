{# Mobile services banners slider placeholder: to be hidden after content loaded #}
{% if loop.first %}
    <div class="js-services-placeholder mobile-placeholder">
        <div class="services p-top-quarter p-bottom-half">
            <div class="service-item">
                <div class="placeholder-circle placeholder-color">
                    <div class="placeholder-shine"></div>
                </div>
                <div class="service-text">
                    <h6 class="service-title font-body-xs">{{ banner_services_title }}</h6>
                    <p>{{ banner_services_description }}</p>
                </div>
            </div>
        </div>
    </div>
{% endif %}
