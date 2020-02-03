<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ "Iniciar sesión" | translate }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            {# Page preloader #}
            <div class="pull-left full-width hidden-when-content-ready">
                <div class="page-loading-icon page-loading-icon opacity-80 rotate">
                    {% include "snipplets/svg/spinner.tpl" %}
                </div>
            </div>
            <div class="account-form-wrapper visible-when-content-ready m-bottom m-top row-fluid">
                <form id="login-form" action="" method="post" class="span6 offset3 contact_form">
                    {% if not result.facebook and result.invalid %}
                        <div class="alert alert-danger">{{ 'El email o la contraseña no coinciden. Chequeá que estén bien escritos.' | translate }}</div>
                    {% elseif result.facebook and result.invalid %}
                        <div class="alert alert-danger">{{ 'Hubo un problema con el login de Facebook.' | translate }}</div>
                    {% endif %}
                    {% if store_fb_app_id %}
                        <div class="row-fluid m-bottom">
                            <a class="btn btn-payment full-width facebook p-relative" onclick="loginFacebook();" >
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
                        <label class="form-label" for="email">{{ 'Email' | translate }}</label>
                        <input autocorrect="off" autocapitalize="off" type="email" name="email" value="{{ result.email }}" class="form-control {% if result.invalid %} input-error {% endif %}"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="password">{{ 'Contraseña' | translate }}</label>
                        <input type="password" name="password" autocomplete="off" class="form-control {% if result.invalid %} input-error{% endif %}"/>
                        <small class="forgot-password"><a href="{{ store.customer_reset_password_url }}">{{ '¿Olvidaste tu contraseña?' | translate }}</a></small>
                    </div>
                    <div class="row-fluid">
                        <input class="btn btn-primary full-width" type="submit" value="{{ 'Iniciar sesión' | translate }}" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
