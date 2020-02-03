<footer>
    <div class="js-hide-footer-while-scrolling footer">
        <div class="box-newsletter row-fluid">
            <div class="container">
                <div class="footer-title">
                    <div class="ico-newsletter"></div>
                </div>
                {% if settings.news_txt %}
                    <h6>{{ settings.news_txt }}</h6>
                {% endif %}
                {% snipplet "includes/newsletter.tpl" %}
            </div>
        </div>
        <div class="row-fluid visible-when-content-ready footer-middle">
            <div class="container">
                <ul class="span3 lista-institucional">
                    <h6 class="footer-title">Institucional</h6>
                    <li>
                        <a href="https://www.7mboots.com.br/sobre-a-7m-boots/">Sobre a marca</a>
                    </li>
                    <li>
                        <a href="https://blog.7mboots.com.br/" target=”_blank” >Nosso Blog</a>
                    </li>
                    <li>
                        <a href="https://www.7mboots.com.br/dicas-country/">Dicas Country</a>
                    </li>
                    <li>
                        <a href="https://www.7mboots.com.br/fotos-dos-clientes/">Nossos Clientes</a>
                    </li>
                </ul>
                {% if store.phone or store.address or store.blog %}
                    <div class="span3 footer-infos">
                        <h6 class="footer-title">Endereço</h6>
                        <ul class="footer-nav">
                            {% if store.address %}
                                <li class="footer-nav-item">{{ store.address }}</li>
                            {% endif %}
                            {% if store.blog %}
                                 <li class="footer-nav-item"><a target="_blank" href="{{ store.blog }}">{{ store.blog }}</a></li>
                            {% endif %}
                        </ul>
                    </div>

                    <div class="span3 footer-infos">
                        <h6 class="footer-title">Horário de Atendimento</h6>
                        <ul class="footer-nav">
                            {% if settings.horarios_line_one %}
                                <li class="footer-nav-item">Seg à Sex das: {{ settings.horarios_line_one }}</li>
                            {% endif %}
                            {% if settings.horarios_line_two %}
                                <li class="footer-nav-item">Sab e Feriados das: {{ settings.horarios_line_two }}</li>
                            {% endif %}
                            {% if settings.horarios_line_info_1 %}
                                <li class="footer-nav-item">{{ settings.horarios_line_info_1 }}</li>
                            {% endif %}
                            {% if settings.horarios_line_info_2 %}
                                <li class="footer-nav-item">{{ settings.horarios_line_info_2 }}</li>
                            {% endif %}
                            {% if settings.horarios_line_info_3 %}
                                <li class="footer-nav-item">{{ settings.horarios_line_info_3 }}</li>
                            {% endif %}
                        </ul>
                    </div>

                    <div class="span3 footer-infos">
                        <h6 class="footer-title">Contato</h6>
                        <ul class="footer-nav">
                            {% if store.phone %}
                                <li class="footer-nav-item"><a href="tel:{{ store.phone }}">{{ store.phone }}</a></li>
                            {% endif %}
                            {% if store.email %}
                                <li class="footer-nav-item">{{ store.email | mailto }}</li>
                            {% endif %}
                        </ul>
                    </div>
                {% endif %}
            </div>
        </div>
        <div class="row-fluid visible-when-content-ready footer-direitos">
            <div class="container">
                <div class="row-fluid">
                    <div class="span6">
                        <div class="copyright text-center-xs">
                            {{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
                        </div>
                    </div>
                    <div class="span6 text-center-xs text-right payments-box">
                        {% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
                            <ul class="selos-seguranca">
                                {% if store.afip %}
                                    <li class="afip seal-afip">
                                        {{ store.afip | raw }}
                                    </li>
                                {% endif %}
                                {% if ebit %}
                                    <li class="ebit seal-ebit">
                                        {{ ebit }}
                                    </li>
                                {% endif %}

                                <li class="safe-browsing">
                                    <a href="https://www.google.com.br/safebrowsing/diagnostic?site=https://www.7mboots.com.br/" target="_blank">
                                        <img src="{{ 'images/selo-google.png' | static_url }}" alt="Google Safe Browsing" title="Google Safe Browsing">
                                    </a>
                                </li>
                            </ul>
                        {% endif %}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-copy">
        <div class="container visible-when-content-ready">
            <div class="row-fluid">
                <div class="span12 text-center-xs">
                    <ul class="powered-by">
			<li class="kyraly">
                            <a href="https://www.kyraly.com" target="_blank"></a>
                 	 </li>
                        <li class="eva">
                            <a href="https://www.evacommerce.com.br" target="_blank"></a>
                        </li>
                        <li class="nuvemshop">
                            {{ new_powered_by_link }}
                        </li>
                    </ul>
                </div>

                <div class="js-go-to-top btn btn-secondary btn-inverse btn-small m-top m-bottom-half hidden-phone">
                    {{ "Subir" | translate }} ^
                </div>
            </div>
        </div>
    </div>
</footer>