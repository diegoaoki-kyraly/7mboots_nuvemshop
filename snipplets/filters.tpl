{% set default_lang = current_language.lang %}
{% set filter_colors = insta_colors|length > 0 %}
{% set filter_more_colors = other_colors|length > 0 %}
{% set filter_sizes = size_properties_values|length > 0 %}
{% set filter_other = variants_properties|length > 0 %}

{% if default_lang == 'pt' %}
    {% set color_name = 'Cor' %}
    {% set size_name = 'Tamanho' %}
{% endif %}
{% if default_lang == 'es' %}
    {% set color_name = 'Color' %}
    {% set size_name = 'Talle' %}
{% endif %}
{% if default_lang == 'en' %}
    {% set color_name = 'Color' %}
    {% set size_name = 'Size' %}
{% endif %}
<div id="filters-container">
    <div id="filters-column" class="filters {% if not filters_mobile %}m-top{% endif %}">    
        {% if filter_colors %}
            <div class="filters-container">
                <h5 class="weight-normal m-bottom">{{ 'Color' | translate }}</h5>
                {% for name,color in insta_colors %}
                    <button type="button" class="btn-filter btn-filter-color color-filter font-body-xs" style="background-color: {{ color[name] }};" title="{{ name }}" onclick="LS.urlAddParam('{{ color_name|replace("'","%27") }}', '{{ name|replace("'","%27") }}');">
                    </button>
                {% endfor %}
            </div>
        {% endif %}
        {% if filter_more_colors %}
            <div class="filters-container">
                {% if filter_colors %}
                    <h5 class="weight-normal m-bottom">{{ 'Más colores' | translate }}</h5>
                {% else %}
                    <h5 class="weight-normal m-bottom">{{ 'Color' | translate }}</h5>
                {% endif %}
                {% for color in other_colors %}
                    <button type="button" class="btn-filter size-filter font-body-xs" onclick="LS.urlAddParam('{{ color_name|replace("'","%27") }}', '{{ color|replace("'","%27") }}');">{{ color }}
                    </button>
                {% endfor %}
            </div>
        {% endif %}
        {% if filter_sizes %}
            <div class="filters-container">
                <h5 class="weight-normal m-bottom">{{ 'Talle' | translate }}</h5>
                {% for size in size_properties_values %}
                    <button type="button" class="btn-filter size-filter font-body-xs" onclick="LS.urlAddParam('{{ size_name|replace("'","%27") }}', '{{ size|replace("'","%27") }}');">{{ size }}
                    </button>
                {% endfor %}
            </div>
        {% endif %}

        {% for variants_property in variants_properties %}
            {% if filter_other %}
                <div class="filters-container">
                    <h5 class="weight-normal m-bottom">{{ variants_property }}</h5>
                    {% for value in variants_properties_values[variants_property] %}
                        <button type="button" class="btn-filter other-filter font-body-xs" onclick="LS.urlAddParam('{{ variants_property|replace("'","%27") }}', '{{ value|replace("'","%27") }}');">{{value}}
                        </button>
                    {% endfor %}
                </div>
            {% endif %}
        {% endfor %}
    </div>
</div>