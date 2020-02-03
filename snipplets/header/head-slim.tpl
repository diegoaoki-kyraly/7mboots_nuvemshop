<div id="header-slim" class="head-top-fixed container hidden-phone visible-when-content-ready">
    <div class="row-fluid display-when-content-ready">
        <div class="container">
            <div class="span4">
                <div class="logo">
                    {% if "slim-logo.jpg" | has_custom_image %}
                        {{ "slim-logo.jpg" | static_url | img_tag('', {class: 'logo-img logo-fixed'}) | a_tag(https://7mboots.com.br/) }}
                    {% elseif has_logo %}
                        {{ store.logo('large') | img_tag('', {class: 'logo-img logo-fixed'}) | a_tag(https://7mboots.com.br/) }}
                    {% else %}
                        <a class="logo-text h4"  href="https://7mboots.com.br/">{{ store.name }}</a>
                    {% endif %}
                </div>
            </div>
            <div class="span8">
                <ul class="js-desktop-nav desktop-nav text-right">
                    {% snipplet "navigation/navigation.tpl" %}
                </ul>
            </div>
        </div>
    </div>
</div>