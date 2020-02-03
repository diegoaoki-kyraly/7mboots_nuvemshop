{% set newsletter_contact_error = contact.type == 'newsletter' and not contact.success %}
<div id="newsletter">
    <form method="post" action="/winnie-pooh" onsubmit="$(this).attr('action', '');" autocomplete="off">
        <div class="input-append">
            <input type="text" id="name" name="name" placeholder="{{ "Nombre" | translate }}" class="form-control m-right-quarter m-bottom-half-xs d-block-xs full-width-xs {% if newsletter_contact_error %} input-error {% endif %}"/>
            <input type="email" id="news-mail" class="form-control m-bottom-half-xs d-block-xs full-width-xs {% if newsletter_contact_error %} input-error {% endif %}" name="email" placeholder="{{ "Email" | translate }}" />
            <div class="winnie-pooh hidden">
                <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
            </div>
            <input type="hidden" name="message" value="{{ "Pedido de inscripción a newsletter" | translate }}" />
            <input type="hidden" name="type" value="newsletter" />
            <input type="submit" name="contact" class="btn btn-primary btn-inverse btn-small full-width-xs" value='{{ "Enviar" | translate }}'>
        </div>
    </form>

	{% if contact and contact.type == 'newsletter' %}
        {% if contact.success %}
            <div class="alert alert-success">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
        {% else %}
            <div class='alert alert-error' role='alert'>{{ "Ingresá tu nombre y tu mail" | translate }}</div>
        {% endif %}
    {% endif %}
</div>