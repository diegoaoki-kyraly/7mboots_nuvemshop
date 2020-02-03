<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ "Crear cuenta" | translate }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            {# Page preloader #}
            <div class="page-loading-icon-container full-width hidden-when-content-ready">
                <div class="page-loading-icon page-loading-icon opacity-80 rotate">
                    {% include "snipplets/svg/spinner.tpl" %}
                </div>
            </div>
            <div class="account-form-wrapper visible-when-content-ready m-bottom m-top row-fluid">
                <form id="login-form" action="" method="post" class="span6 offset3 contact_form">
                    {% if store_fb_app_id %}
                        <div class="row-fluid m-bottom">
                            <a class="btn btn-out full-width facebook p-relative" onclick="loginFacebook();" >
                                {% include "snipplets/svg/facebook.tpl" %}
                                {{ 'Facebook login' | translate }}
                            </a>
                        </div>
                        <div class="row-fluid text-center">
                            <span class="badge">{{ 'o' | translate }}</span>
                            <hr class="divider-with-circle"></hr>
                        </div>
                    {% endif %}
                    <div class="form-group">
                        <label for="name" class="form-label">{{ 'Nombre' | translate }}</label>
                        <input type="text" name="name" id="name" value="{{ result.name }}" class="form-control {% if result.errors.name %} input-error {% endif %}" />
                    </div>
                    {% if result.errors.name %}
                        <div class="alert alert-danger">{{ 'Necesitamos tu nombre para registrarte.' | translate }}</div>
                    {% endif %}
                    <div class="form-group">
                        <label for="email" class="form-label">{{ 'Email' | translate }}</label>
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ result.email }}" class="form-control {% if result.errors.email == 'exists' or result.errors.email %} input-error {% endif %}"/>
                    </div>
                    {% if result.errors.email == 'exists' %}
                        <div class="alert alert-danger">{{ 'Encontramos otra cuenta que ya usa este email. Intentá usando otro.' | translate }}</div>
                    {% elseif result.errors.email %}
                        <div class="alert alert-danger">{{ 'Necesitamos tu email para registrarte. Lo vamos a usar para enviarte el estado de tus compras.' | translate }}</div>
                    {% endif %}
                     <div class="form-group">
                        <label for="phone" class="form-label">{{ 'Teléfono' | translate }} {{ '(opcional)' | translate }}</label>
                        <input type="text" name="phone" id="phone" value="{{ result.phone }}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="password" class="form-label">{{ 'Contraseña' | translate }}</label>
                        <input type="password" name="password" id="password" autocomplete="off" class="form-control {% if result.errors.password == 'required' %} input-error {% endif %}"/>
                    </div>
                     {% if result.errors.password == 'required' %}
                        <div class="alert alert-danger">{{ 'Necesitamos una contraseña para registrarte.' | translate }}</div>
                    {% endif %}
                    <div class="form-group">
                        <label for="password_confirmation" class="form-label">{{ 'Confirmar Contraseña' | translate }}</label>
                        <input type="password" name="password_confirmation" id="password_confirmation" autocomplete="off" class="form-control {% if result.errors.password == 'confirmation' %} input-error {% endif %}"/>
                    </div>
                    {% if result.errors.password == 'confirmation' %}
                        <div class="alert alert-danger">{{ 'Las contraseñas que escribiste no coinciden. Chequeá que sean iguales entre sí.' | translate }}</div>
                    {% endif %}
                    <input class="btn btn-out full-width" type="submit" value="{{ 'Crear cuenta' | translate }}" />
                </form>
            </div>
        </div>
    </div>
</div>
