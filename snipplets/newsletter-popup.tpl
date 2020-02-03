<div id="news-popup" class="modal hide fade news-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-body">
        <button type="button" class="close news" data-dismiss="modal" aria-hidden="true">×</button>
        <div class="row-fluid">
            <div class='{% if "newsletter_image.jpg" | has_custom_image %} span6 {% else %} span6 offset3 {% endif %}'>
                <div class="logo-img-container text-center {% if not has_logo %}hidden{% endif %}">
                    <img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ store.logo('large') }}" class="lazyload logo-img">
                </div>
                <a class="logo-text h2 pull-left {% if has_logo %} hidden {% endif %}" href="{{ store.url }}">{{ store.name }}</a>
                {% if settings.news_popup_txt %}
                    <p class="newsletter p-top p-bottom-quarter text-center clear-both">{{ settings.news_popup_txt }}</p>
                {% else %}
                    <p class="newsletter p-top p-bottom-quarter text-center clear-both">{{ '¿Te gusta lo que ves? ¡Suscribite y recibí todas nuestras novedades!'  | translate }}</p>
                {% endif %}
                <div id="news-popup-form-container">
                    <form id="news-popup-form"  method="post" action="/winnie-pooh">
                        <div class="form-group">
                            <input type="text"class="js-mandatory-field form-control" name="name" placeholder="{{ "Nombre" | translate }}" />
                        </div>
                        <div class="form-group">
                            <input type="email" class="js-mandatory-field form-control" name="email" placeholder="{{ "Email" | translate }}" />
                        </div>
                        <div class="winnie-pooh hidden">
                            <label for="winnie-pooh-newsletter">{{ "No completar este campo" | translate }}</label>
                            <input id="winnie-pooh-newsletter" type="text" name="winnie-pooh"/>
                        </div>
                        <input type="hidden" name="message" value='{{ "Pedido de inscripción a newsletter" | translate }}' />
                        <input type="hidden" name="type" value="newsletter-popup" />
                        <input type="submit" name="contact" class="js-news-popup-submit btn btn-primary btn-inverse btn-small pull-right span6" value='{{ 'enviar' | translate }}' />
                    </form>
                     <div style='display: none;' class="js-news-spinner pull-left m-top">{% include "snipplets/svg/spinner-third.tpl" with {fa_custom_class: "svg-inline--fa fa-spin svg-text-fill"} %} {{ "Enviando..." | translate }}</div>
                    <div style='display: none;' class="js-news-popup-success alert alert-success m-top">{{ "¡Gracias por suscribirte! A partir de ahora vas a recibir nuestras novedades en tu email" | translate }}</div>
                    <div style='display: none;' class="js-news-popup-failed alert alert-error m-top" role='alert'>{{ "Necesitamos tu email para enviarte nuestras novedades." | translate }}</div>
                </div>
            </div>
             {% if "newsletter_image.jpg" | has_custom_image %}
                <div class="span6">
                    {% if store.thumbnails_enabled %}
                        <img class="lazyautosizes lazyload full-width img-responsive p-left p-right border-box" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset='{{ "newsletter_image.jpg" | static_url | settings_image_url('large') }} 480w, {{ "newsletter_image.jpg" | static_url | settings_image_url('huge') }} 640w' data-sizes="auto" />
                    {% else %}
                        <img class="lazyload img-responsive p-left p-right border-box" src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ 'newsletter_image.jpg' | static_url }}">
                    {% endif %}
                </div>
            {% endif %}
        </div>  
    </div>
</div>
