<div class="page-section-title">
    <div class="container">
        <h1>{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta') | translate }}</h1>
    </div>
</div>

<div id="corpo-account">
    <div class="row-fluid">
        <div class="container">
            <div class="account-form-wrapper visible-when-content-ready row-fluid m-bottom">
                <form action="" method="post" class="contact_form span6 offset3 m-top m-bottom">
                    {% if failure %}
                        <div class="alert alert-danger">{{ 'Las contraseñas que escribiste no coinciden. Chequeá que sean iguales entre sí.' | translate }}</div>
                    {% endif %}
                    <div class="form-group">
                        <label for="password" class="form-label">{{ 'Contraseña' | translate }}</label>
                        <input type="password" name="password" id="password" autocomplete="off" class="form-control {% if failure %} input-error {% endif %}"/>
                    </div>
                    <div class="form-group">
                        <label for="password_confirm" class="form-label"> {{ 'Confirmar Contraseña' | translate }}</label>
                        <input type="password" name="password_confirm" id="password_confirm" autocomplete="off" class="form-control {% if failure %} input-error {% endif %}"/>
                    </div>
                    <input class="btn btn-out full-width" type="submit" value="{{ (customer.password ? 'Cambiar Contraseña' : 'Activar cuenta')  | translate }}" />
                </form>
            </div>
        </div>
    </div>
</div>
