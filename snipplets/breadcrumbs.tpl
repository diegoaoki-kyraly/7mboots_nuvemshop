<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body" class="bread-section">
    <div class="breadcrumbs  m-top-xs" itemprop="breadcrumb">
        <a class="breadcrumb-crumb" href="https://www.7mboots.com.br" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
        {% if template == 'cart' %}
            <span class="breadcrumb-divider">-</span>
            <span class="breadcrumb-crumb">{{ "Carrito de compras" | translate }}</span>
        {% endif %}
        {% for crumb in breadcrumbs %}
            <span class="breadcrumb-divider">-</span>
            {% if crumb.last %}
                <span class="breadcrumb-crumb active">{{ crumb.name }}</span>
            {% else %}
                <a class="breadcrumb-crumb" href="{{ crumb.url }}/" title="{{ crumb.name }}">{{ crumb.name }}</a>
            {% endif %}
        {% endfor %}
    </div>
</div>
