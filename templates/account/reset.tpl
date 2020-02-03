<div class="page-section-title">
    <div class="container">
        {% snipplet "breadcrumbs.tpl" %}
        <h1>{{ "Cambiar Contraseña" | translate }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            <div class="container-fluid clear-both">
                <div class="row-fluid">
                    <p>{{ 'Vamos a enviarte un email para que puedas cambiar tu contraseña.' | translate }}</p>
                </div>
                <div class="account-form-wrapper visible-when-content-ready row-fluid m-bottom">
                    <form action="" method="post" class="contact_form span6 offset3 m-top m-bottom">
                        {% if failure %}
                            <div class="alert alert-danger m-top">{{ 'No encontramos ninguna cuenta registrada con este email. Intentalo nuevamente chequeando que esté bien escrito.' | translate }}</div>
                        {% elseif success %}
                            <div class="alert alert-success m-top">{{ '¡Listo! Te enviamos un email a {1}' | translate(email) }}</div>
                        {% endif %}
                        <div class="form-group">
                            <label for="email" class="form-label">{{ 'Email' | translate }}</label>
                            <input autocorrect="off" autocapitalize="off" type="email" name="email" id="email" value="{{ email }}" class="form-control {% if failure %} input-error {% endif %}"/>
                        </div>
                        <input class="btn btn-out full-width-xs span6 pull-right" type="submit" value="{{ 'Enviar email' | translate }}" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
