<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ page.name }}</h1>
    </div>
</div>

{% if 'botas-texanas-em' in page.handle %}
	<div class="visible-when-content-ready" data-template={{"geocontent/#{page.handle}.tpl"}}>
		<div class="container-front geo-localizacao-cidades">
			<h1>{{ page.name }}</h1>
			{% include "geocontent/#{page.handle}.tpl" %}

			<section class="lista-sugestoes lista-produtos">
			    <div class="container-front">
			        <h2>Separamos alguns produtos para você</h2>

			        <ul>
			            {% for product in sections.sugestoes.products %}
			                {% snipplet "prateleira/home.tpl" %}
			            {% endfor %}
			        </ul>
			    </div>
			</section>
		</div>
	</div>
{% else %}
    <div id="corpo-page">
        <div class="row-fluid">
            <div class="container">
                {% if "foto-nosotros.jpg" | has_custom_image %}
                    <div class="span6 image-banner m-none">
                        {% if settings.foto_nosotros_url != '' %}
                        <a href="{{ settings.foto_nosotros_url }}">
                        {% endif %}
                            {% if store.thumbnails_enabled %}
                                <img class="lazyautosizes lazyload blur-up-big" src="{{ "foto-nosotros.jpg" | static_url | settings_image_url('small')}}" data-srcset='{{ "foto-nosotros.jpg" | static_url | settings_image_url('large') }} 480w, {{ "foto-nosotros.jpg" | static_url | settings_image_url('huge') }} 640w, {{ "foto-nosotros.jpg" | static_url | settings_image_url('original') }} 1024w, {{ "foto-nosotros.jpg" | static_url | settings_image_url('1080p') }} 1920w' data-sizes="auto" />
                            {% else %}
                                <img class="lazyload blur-up-big" src="{{ "foto-nosotros.jpg" | static_url | settings_image_url('small')}}" data-src='{{ "foto-nosotros.jpg" | static_url }}' />
                            {% endif %}
                        {% if settings.foto_nosotros_url != '' %}
                        </a>
                        {% endif %}
                    </div>
                {% endif %}
                <div class="user-content {% if "foto-nosotros.jpg" | has_custom_image %} span6 {% else %} span8 offset2 {% endif %}">
                    {{ page.content }}
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% if 'black-friday' in page.handle %}
	<section class="lista-produtos">
	    <div class="container-front">
	        <ul>
	            {% for product in sections.blackfriday_queima.products %}
	                {% snipplet "prateleira/home.tpl" %}
	            {% endfor %}
	        </ul>
	    </div>
	</section>
{% endif %}

{% if 'virada-de-ano-country' in page.handle %}
<div id="natalinou-content">
    <div class="black-top">
        <h1>Tenha o seu 2020 mais Country do Brasil!</h1>
    </div>

    <div class="black-bottom">
        <div class="container-front">
            <div id="divcountparent">
                <p>O pre&ccedil;o j&aacute; era b&atilde;o. Agora fico mi&oacute; ainda!</p>

                <div class="contador">
                    <div class="divcount">
                        <p class="spancount" id="horas">23</p>

                        <p class="pcount">Horas</p>
                    </div>

                    <div class="divcount">
                        <p class="spancount" id="minutos">59</p>

                        <p class="pcount">Minutos</p>
                    </div>

                    <div class="divcount">
                        <p class="spancount" id="segundos">59</p>

                        <p class="pcount">Segundos</p>
                    </div>
                </div>
            </div>

            <div id="divnewsletterparent">
                <h3>PROMO&Ccedil;&Atilde;O QUE VOC&Ecirc; NUNCA VIU NA 7M</h3>
            </div>
            <p class="duvidas">Em caso de dúvidas, entre em contato com <a href="https://api.whatsapp.com/send?phone=5516982181139" target="_blank">(16) 98218-1139</a></p>
        </div>
    </div>

	<section class="lista-produtos">
	    <div class="container">
	        <div class="grid-row">
                {% if sections.natalinou.products %}
                    {% for product in sections.natalinou.products %}
                        {% include 'snipplets/single_product.tpl' with {'quickshop_included' : true} %}
                    {% endfor %}
                {% endif %}
	        </ul>
	    </div>
	</section>
</div>
{% endif %}
