{% if "foto-contacto.jpg" | has_custom_image %}
    <div class="row-fluid">
        <div class="image-banner">
            {% if settings.foto_contacto_url != '' %}
            <a href="{{ settings.foto_contacto_url }}">
            {% endif %}
                {% if store.thumbnails_enabled %}
                    <img class="lazyautosizes lazyload blur-up-big" src="{{ "foto-contacto.jpg" | static_url | settings_image_url('small')}}" data-srcset='{{ "foto-contacto.jpg" | static_url | settings_image_url('large') }} 480w, {{ "foto-contacto.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "foto-contacto.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "foto-contacto.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" />
                {% else %}
                    <img class="lazyload blur-up-big" src="{{ "foto-contacto.jpg" | static_url | settings_image_url('small')}}" data-src='{{ "foto-contacto.jpg" | static_url }}' />
                {% endif %}
            {% if settings.foto_contacto_url != '' %}
            </a>
            {% endif %}
        </div>
    </div>
{% endif %}
<div class="container-inverse row-fluid p-top-double p-bottom-double m-bottom">
	<div class="container">
    	<div class="span6">
            <h1 class="h1-lg h2-xs text-uppercase weight-normal m-bottom">{{ "Contacto" | translate }}</h1>
            {% if settings.descr_contacto %}
                <p class="m-bottom">{{ settings.descr_contacto }}</p>
            {% endif %}
            {% if store.contact_intro %}
                <p class="m-bottom">{{ store.contact_intro }}</p>
            {% endif %}
		</div>
        <div class="span6">
            {% if product %}
                <div class="contact-product m-bottom">
                    <p class="m-bottom-half">
                        {{ "Consultar por:" | translate }} {{ product.name | a_tag(product.url , {class : 'text-underline'}) }}
                    </p>
                    <img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.featured_image.alt }}" />
                </div>
            {% endif %}
            <form action="/winnie-pooh" method="post" onsubmit="$(this).attr('action', '');">
                {% if contact and contact.type == 'contact' %}
                    <div class="row-fluid">
                        {% if contact.success %}
                            <div class="alert alert-success span12">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
                        {% else %}
                            <div class="alert alert-error span12">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
                        {% endif %}
                    </div>
                {% endif %}
                <input type="hidden" value="{{ product.id }}" name="product"/>
                <input type="hidden" name="type" value="contact" />

                <div class="form-group form-group-transparent">
                	<input type="text" id="name" name="name" placeholder="{{ "Nombre" | translate }}" class="form-control form-control-transparent"/>
                </div>
                <div class="form-group form-group-transparent">
                	<input type="email" id="email" name="email" placeholder="{{ "Email" | translate }}" class="form-control form-control-transparent"/>
                </div>
                <div class="field winnie-pooh hidden">
                    <label for="winnie-pooh">{{ "No completar este campo" | translate }}</label>
                    <input id="winnie-pooh" type="text" name="winnie-pooh"/>
                </div>
                <div class="form-group form-group-transparent">
                	<input type="text" id="phone" name="phone" placeholder="{{ "Teléfono" | translate }} ({{ "Opcional" | translate }})" class="form-control form-control-transparent"/>
                </div>
                <div class="form-group form-group-transparent">
                	<textarea id="message" name="message" cols="20" rows="5" placeholder="{{ "Mensaje" | translate }} ({{ "Opcional" | translate }})" class="form-control form-control-transparent full-width"></textarea>
                    <input type="hidden" name="type" value="contact" />
                </div>
                <input type="submit" class="btn btn-secondary btn-inverse pull-right full-width-xs" value="{{ 'Enviar' | translate }}" name="contact"/>
            </form>
        </div>
    </div>
</div>
{% if store.address or store.phone or store.email or store.blog %}
    {% set show_map = settings.map_contacto and store.address %}
    <div class="row-fluid visible-when-content-ready m-bottom">
        <div class="container">
            <div class="span{% if show_map %}6{% else %}12{% endif %}">
                <h6 class="text-uppercase border-bottom p-bottom-half m-bottom">{{ "Datos de contacto" | translate }}</h6>
                <ul class="m-bottom p-bottom-half">
                    {% if store.address %}
                        <li class="h6 font-body-xs m-bottom-half">{% include "snipplets/svg/map-marker-alt.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %} {{ store.address }}</li>
                    {% endif %}
                    {% if store.phone %}
                        <li class="h6 font-body-xs m-bottom-half">{% include "snipplets/svg/phone-square.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %} <a href="tel:{{ store.phone }}">{{ store.phone }}</a></li>
                    {% endif %}
                    {% if store.email %}
                        <li class="h6 font-body-xs m-bottom-half">{% include "snipplets/svg/envelope.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %} {{ store.email | mailto }}</li>
                    {% endif %}
                    {% if store.blog %}
                        <li class="h6 font-body-xs m-bottom-half">{% include "snipplets/svg/quote-right.tpl" with {fa_custom_class: "svg-inline--fa m-right-quarter svg-text-fill"} %} <a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                    {% endif %}
                </ul>
            </div>
            {% if show_map %}
                <div class="span6">
                    <h6 class="text-uppercase border-bottom p-bottom-half m-bottom">{{ "Mapa de ubicación" | translate }}</h6>
                    <iframe id="gmap_canvas" class="map" src="https://maps.google.com/maps?q={{ store.address }}&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
                    </iframe>
                </div>
            {% endif %}
        </div>
    </div>
{% endif %}


    
	
