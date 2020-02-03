<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xmlns:og="http://opengraphprotocol.org/schema/">
<head>
    <link rel="preconnect" href="https://d26lpennugtm8s.cloudfront.net" />
    <link rel="dns-prefetch" href="https://d26lpennugtm8s.cloudfront.net" />

    {{ 'dist/css/main.css' | static_url | css_tag }}

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">

    <meta name="theme-color" content="#000000">
    <meta name="apple-mobile-web-app-status-bar-style" content="#000000">
    <meta name="msapplication-navbutton-color" content="#000000">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="#000000">

    {% if template == 'home' %}
	<title>Botas Texanas e Botas Country é na 7MBoots |Frete Grátis </title>
    {% endif %}

    {% if template == 'category' %}
	<title>{{ category.name }} é na 7MBoots |Frete Grátis</title>
    {% endif %}

    {% if template == 'product' %}
	<title>{{ product.name }} | 7MBoots</title>
    {% endif %}

    {% if template == 'page' %}
   	<title>{{ page_title}}</title>
    {% endif %}

    <meta name="description" content="{{ page_description }}" />
    {% if settings.fb_admins %}
        <meta property="fb:admins" content="{{ settings.fb_admins }}" />
    {% endif %}
    {% if store_fb_app_id %}
        <meta property="fb:app_id" content="{{ store_fb_app_id }}" />
    {% elseif not store.has_custom_domain %}
        <meta property="fb:app_id" content="{{ fb_app.id }}" />
    {% endif %}
    {{ store.name | og('site_name') }}
    {% if template == 'home' and store.logo %}
        {{ ('http:' ~ store.logo) | og('image') }}
        {{ ('https:' ~ store.logo) | og('image:secure_url') }}
    {% endif %}
    
    {# OG tags to control how the page appears when shared on Facebook. See http://ogp.me/ #}
    {% snipplet "metas/facebook-og.tpl" %}
    {# Twitter tags to control how the page appears when shared on Twitter. See https://dev.twitter.com/cards/markup #}
    {% if template == 'product' %}
        {# Twitter #}
        {% snipplet "metas/twitter-product.tpl" %}
        {# Facebook #}
        {% snipplet "metas/facebook-product-og.tpl" %}
    {% elseif template == 'category' %}
        {# Facebook #}
        {% snipplet "metas/facebook-category-og.tpl" %}
    {% endif %}

    {# Critical CSS to improve the percieved performance on first load #}
    <style>
        {% snipplet 'css/critical-css.tpl' %}
    </style>

    {# load fonts #}

    {% if params.preview %}

        {# If page is loaded from customization page on the admin, load all fonts #}

        {{ '//fonts.googleapis.com/css?family=Lato:700,400italic,700italic|Poppins:400,400i,600,600i|Open+Sans:400,300,700|Slabo+27px|Oswald:400,300,700|Lora:400,700|Montserrat:400,700|Source+Sans+Pro:400,300,700|Droid+Sans:400,700|Roboto+Condensed:400italic,700italic,300,400,700|Istok+Web:400,700,400italic,700italic|Arvo:400,700,400italic,700italic|Paytone+One|Raleway:700|Lato:700|Ubuntu:700|Roboto+Slab:700&display=swap' | css_tag }}

    {% else %}

        {# If page is NOT loaded from customization only load saved fonts #}

        {# Get only the saved fonts on settings #}

        {{ [settings.font_logo, 
        settings.font_rest, 
        settings.font_navigation, 
        settings.font_headings, 
        settings.font_headingsprods,
        settings.font_buttons] | google_fonts_url('300, 400, 700') | css_tag }}

    {% endif %}

    {# Aynsc CSS for the non-critical stylesheets and Font Awesome CSS #}

    {% snipplet 'js/load-css-async.tpl' %}

    {# Store colors CSS #}
    
    {{ 'css/main-color.scss.tpl' | static_url | css_tag }}

    {{ '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js' | script_tag(true) }}
    
    {# Pagination metatags #}
    {% if pages.previous %}
        <link rel="prev" href="{{ pages.previous }}" />
    {% endif %}
    {% if pages.next %}
        <link rel="next" href="{{ pages.next }}" />
    {% endif %}

    {% set nojquery = true %}
    {% set async_js = true %}

    {% head_content %}
    <!--[if lte IE 7]>
    {{ "css/ie.css" | static_url | css_tag }}
    <![endif]-->
    <style>
        {{ settings.css_code | raw }}
    </style>
</head>

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
<body itemscope itemtype="http://schema.org/WebPage" itemid="body" class="{% if customer %}customer-logged-in{% endif %} template-{{ template | replace('.', '-') }} {{page.handle}}{{category.handle}} {{product.handle}}">

{# Social JS for Facebook comments on product page #}

{% if template == 'product' %}

    {# Facebook comment box JS #}

    {% if settings.show_product_fb_comment_box %}
        {{ fb_js }}
    {% endif %}
    
    {# Pinterest share button JS #}

    {{ pin_js }}
{% endif %}

{% if template == 'account.login' or template == 'account.register' %}

{{ fb_js }}

<script>
    
    {# Facbook login #}

    function loginFacebook() {
        LS.ready.then(function(){
            LS.facebookLogin(FB, function(status, hasEmail) {
                if (status === 'connected') {
                    if (hasEmail) {
                        window.location = "{{ store.url }}/account/facebook_login/";
                    } else {
                        $('#login-form').prepend(
                                "<div class=\"st error c\">{{ 'Tienes que compartír tu e-mail.' | translate }}</div>");
                    }
                } else {
                    $('#login-form').prepend(
                            "<div class=\"st error c\">{{ 'Debes completar el login.' | translate }}</div>");
                }
            });
        });
    }
</script>
{% endif %}
{{back_to_admin}}

{% set theme_version = settings.version_theme %}

    {# Hamburger panel #}
    <nav id="nav-hamburger" class="js-modal new-modal modal-left hamburger-panel" style="display: none;">
        {% snipplet "navigation/navigation-hamburger-panel.tpl" %}
    </nav>
    <div class="js-modal-overlay site-overlay visible-phone"></div>

    <div class="js-main-content js-body-position main-content {% if theme_version == 'full' %}content-full{% endif %}">

        {% snipplet "includes/header.tpl" %}

        <div class="corpo">
            {% template_content %}
        </div>
        
        {% snipplet "includes/footer.tpl" %}
        
    </div>

    {# AJAX Cart Panel #}
    {% if not store.is_catalog and template != 'cart' and settings.ajax_cart %}
        {% snipplet "cart-panel-ajax.tpl" %}
    {% endif %}
    
    {# Whatsapp chat button #}
    {% if store.whatsapp %}
        <a href="{{ store.whatsapp }}" target="_blank" class="js-statsd-wa-event-click btn-whatsapp btn-floating fixed-bottom visible-when-content-ready">
            {% include "snipplets/svg/whatsapp.tpl" %}
        </a>
    {% endif %}

{# External JS: Plugins and libraries #}

{# without dependencies #}
{{ "js/external-no-dependencies.js" | static_url | script_tag }}

{# with dependencies #}
<script>
    LS.ready.then(function(){
        {% snipplet "js/external.js.tpl"  %}
    });
</script>

{# Store JS #}

<script type="text/javascript">

{# Lazy load #}
document.addEventListener('lazybeforeunveil', function(e){
    if ((e.target.parentElement) && (e.target.nextElementSibling)) {
        var parent = e.target.parentElement;
        var sibling = e.target.nextElementSibling;
        if (sibling.classList.contains('js-lazy-loading-preloader')) {
            sibling.style.display = 'none';
            parent.style.display = 'block';
        }
    }
});
LS.ready.then(function(){

    {# Newsletter #}

    LS.newsletter_avoid_siteblindado_bot();

    {% if contact and contact.type == 'newsletter' %}
        $(window).scrollTop($("#newsletter").offset().top - 100);
    {% endif %}

    {% if settings.show_news_box %}

        var $newspopup_mandatory_field = $('#news-popup-form').find(".js-mandatory-field");

        $('#news-popup-form').submit(function () {
            $(".js-news-spinner").show();
            $newspopup_mandatory_field.removeClass("input-error");
            $(".js-news-popup-submit").prop("disabled", true);
            ga_send_event('contact', 'newsletter', 'popup');
        });
        LS.newsletter('#news-popup-form-container', '#news-popup', '{{ store.contact_url | escape('js') }}', function (response) {
            $(".js-news-spinner").hide();
            var selector_to_use = response.success ? '.js-news-popup-success' : '.js-news-popup-failed';
            $(this).find(selector_to_use).fadeIn(100).delay(4000).fadeOut(500);
            if ($(".js-news-popup-success").css("display") == "block") {
                setTimeout(function () {
                    $("#news-popup").modal('hide');
                }, 2500);
            } else {
                $newspopup_mandatory_field.addClass("input-error");
            }
            $(".js-news-popup-submit").prop("disabled", false);
        });
        $(document).ready(function () {
            LS.newsletterPopup({
                selector: "#news-popup"
            });
        });

    {% endif %}
});

{# Function to get installments #}

function get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests) {
    if (parseInt(number_of_installment) > parseInt(max_installments_without_interests[0])) {
        if (installment_data.without_interests) {
            return [number_of_installment, installment_data.installment_value.toFixed(2)];
        }
    }
    return max_installments_without_interests;
}

function get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests) {
    if (parseInt(number_of_installment) > parseInt(max_installments_with_interests[0])) {
        if (installment_data.without_interests == false) {
            return [number_of_installment, installment_data.installment_value.toFixed(2)];
        }
    }
    return max_installments_with_interests;
}


function refreshInstallmentv2(price){
    $(".js-modal-installment-price" ).each(function( index ) {
        const installment = Number($(this).data('installment'));
        $(this).text(LS.currency.display_short + (price/installment).toLocaleString('de-DE', {maximumFractionDigits: 2, minimumFractionDigits: 2}));
    });
}

function changeVariant(variant){
    $(".js-product-detail .js-shipping-calculator-response").hide();
    $("#shipping-variant-id").val(variant.id);

    var parent = $("body");
    if (variant.element){
        parent = $(variant.element);
    }

    var sku = parent.find('#sku');
    if(sku.length) {
        sku.text(variant.sku).show();
    }

    var installment_helper = function($element, amount, price){
        $element.find('.js-installment-amount').text(amount);
        $element.find('.js-installment-price').attr("data-value", price);
        $element.find('.js-installment-price').text(LS.currency.display_short + parseFloat(price).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
        if(variant.price_short && Math.abs(variant.price_number - price * amount) < 1) {
            $element.find('.js-installment-total-price').text((variant.price_short).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
        } else {
            $element.find('.js-installment-total-price').text(LS.currency.display_short + (price * amount).toLocaleString('de-DE', { minimumFractionDigits: 2 }));
        }
    };

    if (variant.installments_data) {
        var variant_installments = JSON.parse(variant.installments_data);
        var max_installments_without_interests = [0,0];
        var max_installments_with_interests = [0,0];
        $.each(variant_installments, function(payment_method, installments) {
            $.each(installments, function(number_of_installment, installment_data) {
                max_installments_without_interests = get_max_installments_without_interests(number_of_installment, installment_data, max_installments_without_interests);
                max_installments_with_interests = get_max_installments_with_interests(number_of_installment, installment_data, max_installments_with_interests);
                var installment_container_selector = '#installment_' + payment_method + '_' + number_of_installment;

                if(!parent.hasClass("js-quickshop-container")){
                    installment_helper($(installment_container_selector), number_of_installment, installment_data.installment_value.toFixed(2));
                }
            });
        });
        var $installments_container = $(variant.element + ' .js-max-installments-container .js-max-installments');
        var $installments_modal_link = $(variant.element + ' #btn-installments');
        var $payments_module = $(variant.element + ' .js-product-payments-container');
        var $installmens_card_icon = $(variant.element + ' .js-installments-credit-card-icon');

        {% if product.has_direct_payment_only %}
        var installments_to_use = max_installments_without_interests[0] >= 1 ? max_installments_without_interests : max_installments_with_interests;

        if(installments_to_use[0] <= 0 ) {
        {%  else %}
        var installments_to_use = max_installments_without_interests[0] > 1 ? max_installments_without_interests : max_installments_with_interests;

        if(installments_to_use[0] <= 1 ) {
        {% endif %}
            $installments_container.hide();
            $installments_modal_link.hide();
            $payments_module.hide();
            $installmens_card_icon.hide();
        } else {
            $installments_container.show();
            $installments_modal_link.show();
            $payments_module.show();
            $installmens_card_icon.show();
            installment_helper($installments_container, installments_to_use[0], installments_to_use[1]);
        }
    }

    if(!parent.hasClass("js-quickshop-container")){
    	$('#installments-modal .js-installments-one-payment').text(variant.price_short).attr("data-value", variant.price_number);
	}
    
    if (variant.price_short){
        parent.find('.js-price-display').text(variant.price_short).show();
        parent.find('.js-price-display').attr("content", variant.price_number);
    } else {
        parent.find('.js-price-display').hide();
    }

    if ((variant.compare_at_price_short) && !(parent.find(".js-price-display").css("display") == "none")) {
        parent.find('.js-compare-price-display').text(variant.compare_at_price_short).show();
    } else {
        parent.find('.js-compare-price-display').hide();
    }

    var button = parent.find('.js-addtocart');
    button.removeClass('cart').removeClass('contact').removeClass('nostock');
    var $product_shipping_calculator = parent.find("#product-shipping-container");
    {% if not store.is_catalog %}
    if (!variant.available){
        button.val('{{ "Sin stock" | translate }}');
        button.addClass('nostock');
        button.attr('disabled', 'disabled');
        $product_shipping_calculator.hide();
    } else if (variant.contact) {
        button.val('{{ "Consultar precio" | translate }}');
        button.addClass('contact');
        button.removeAttr('disabled');
        $product_shipping_calculator.hide();
    } else {
        button.val('{{ "Agregar al carrito" | translate }}');
        button.addClass('cart');
        button.removeAttr('disabled');
        $product_shipping_calculator.show();
    }

    {% endif %}

    {% if template == 'product' %}
        const base_price = Number($("#price_display").attr("content"));
        refreshInstallmentv2(base_price);
    {% endif %}

    {% if store.has_shipping_polish %}
    
        {# Update shipping on variant change #}

        LS.updateShippingProduct();
        
        zipcode_on_changevariant = $("#product-shipping-container .js-shipping-input").val();
        $("#product-shipping-container .js-shipping-calculator-current-zip").text(zipcode_on_changevariant);
    {% endif %}
}
LS.ready.then(function(){
    $(document).ready(function(){

         {# Header Fixed #}

            if ($(window).width() < 768) {
                var height_head = $(".js-head").height() + 8;
                var height_headtabs = $(".js-head").height() + 48;

                {% if settings.tab_menu  %} 
                    $(".js-main-content").css("padding-top", height_headtabs); 
                    $(".js-mobile-nav-second-row").css("top", height_head); 
                    $(".js-categories-mobile-container-list").css("top", height_headtabs);
                    $(".js-mobile-nav-subcategories-panel").css("top", height_head);
                {% else %}
                    $(".js-main-content").css("padding-top", height_head);                    
                {% endif %}
            };

        {# Stats D Events for WhatsApp Button #}

        $(".js-statsd-wa-event-click").on('click', function() {
            const event_click = "whatsapp_btn_click";
            LS.sendFrontendEvent(event_click);
        });

        {# Mobile gestures and functions #}

        if ($(window).width() < 768) {

            {# Detect if device is IOS #}

            var is_ios = /(iPad|iPhone|iPod)/g.test( navigator.userAgent );
            if(is_ios){
                {% if not settings.continue_buying %}
                    {# Apply big size to fixed CTAs to avoid 44px IOS not tapable ghost area #}
                    $(".js-ios-fixed-bottom").addClass("big");
                {% endif %}
                $(".js-ajax-cart-panel").addClass("modal-xs-tall");
            };
        }

        {# Cart quantity changes functions related to input quantity #}

        $(document).on("keypress", ".js-cart-quantity-input", function (e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        });

        $(document).on("focusout", ".js-cart-quantity-input", function (e) {
            $(".js-shipping-calculator-response").hide().empty();
            $(".js-go-checkout-btn").prop("disabled", true);
            var itemID = $(this).attr("data-item-id");
            var itemVAL = $(this).val();
            if (itemVAL == 0) {
                var r = confirm("{{ '¿Seguro que quieres borrar este artículo?' | translate }}");
                if (r == true) {
                    LS.removeItem(itemID, true);
                } else {
                    $(this).val(1);
                }
            } else {
                LS.changeQuantity(itemID, itemVAL, true);
            }
        });

        {# Cart hide no stock alert on dismiss action #}

        $(".js-hide-alert").click(function(e){
            e.preventDefault();
            $(this).closest(".alert").hide();
        })

        {# Empty cart alert #}

        $(".js-trigger-empty-cart-alert").click(function (e) {
            e.preventDefault();
            $(".js-mobile-nav-empty-cart-alert").fadeIn(100).delay(1500).fadeOut(500);
        });

        {% if settings.ajax_cart %}

            {# Ajax cart functions #}

            const ajax_cart_panel = $(".js-ajax-cart-panel");

            {# Clean url hash #}

            cleanURLHash = function(){
                const uri = window.location.toString();
                const clean_uri = uri.substring(0, uri.indexOf("#"));
                window.history.replaceState({}, document.title, clean_uri);
            };

            {# Toggle ajax cart on mobile #}

            mobileToggleAjaxCart = function(){

                if(!$("body").hasClass("mobile-categories-visible")){
                    $("body").toggleClass("overflow-none");
                }

                if(ajax_cart_panel.hasClass("modal-xs-right-in")){

                    {# Clean cart hash and go back 1 step on history #}
                    cleanURLHash();
                    history.back();

                    ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                    setTimeout(function() { 
                        ajax_cart_panel.hide();
                    }, 300);
                }else{
                    
                    {# Opened cart StatsD Event #}
                    
                    const event_cart_opened = ajax_cart_panel.data('stats-frontend-cart-open-event');
                    LS.sendFrontendEvent(event_cart_opened);


                    {# Add cart hash #}
                    window.location.hash = 'cart-opened';

                    ajax_cart_panel.show();
                    setTimeout(function() { 
                        ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                    }, 300);
                }
            };

            if ($(window).width() < 768) {

                if(window.location.href.indexOf("cart-opened") > -1) {
                    cleanURLHash();
                }

                {# Hide panels on browser backbutton #}

                window.onhashchange = function() {
                    if(window.location.href.indexOf("cart-opened") <= -1) {
                        $("body").removeClass("overflow-none");
                        ajax_cart_panel.toggleClass("modal-xs-right-in modal-xs-right-out");
                        setTimeout(function() { 
                            ajax_cart_panel.hide();
                        }, 300);
                    }
                }

                {# Cart: Hide panel on swipe right #}

                ajax_cart_panel.on( "swiperight", function() { 
                    mobileToggleAjaxCart();
                });

                {# Stats D Events for cart #}

                $(".js-statsd-event-click").on('click', function() {
                    const event_click = $(this).data('stats-frontend-cart-event');
                    LS.sendFrontendEvent(event_click);
                });

                $(".js-statsd-event-swipe").on( "swiperight", function() { 
                    const event_swipe = $(this).data('stats-frontend-cart-event');
                    LS.sendFrontendEvent(event_swipe);
                });

                {# Reduce fixed CTA button when shipping input is focused and keyboard displayed #}

                var ajax_shipping_input = $(".js-ajax-cart-panel .js-shipping-input");

                ajax_shipping_input.focus(function() {
                    $(".js-ajax-cart-fixed-bottom").hide();
                });

                ajax_shipping_input.focusout(function(e){
                    $(".js-ajax-cart-fixed-bottom").show();
                }); 
            }

            {# Ajax cart add to cart function #}

            $(document).on("click", ".js-addtocart", function (e) {
                if (!$(this).hasClass('contact')) {
                    e.preventDefault();
                    var callback_add_to_cart = function(){
                        if ($(window).width() < 768) {
                            
                            mobileToggleAjaxCart();

                            {# Show or hide sitcky mobile CTA depending the amount of products #}

                            if ($(".js-cart-item").length >= 4){
                                $(".js-visible-when-many-items").show().addClass("sticky");
                            }else{
                                $(".js-visible-when-many-items").slideUp().removeClass("sticky");
                            }
                        }else{
                            $(".js-ajax-backdrop").toggle();
                            ajax_cart_panel.toggle();
                        }    
                        $(".js-shipping-filled-cart").show();
                    }
                    $prod_form = $(this).closest("form");
                    LS.addToCartEnhanced(
                        $prod_form,
                        '{{ "Agregar al carrito" | translate }}',
                        '{{ "Agregando..." | translate }}',
                        '{{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito." | translate }}',
                        {{ store.editable_ajax_cart_enabled ? 'true' : 'false' }},
                        callback_add_to_cart
                    );
                }
            });

            {# Ajax cart show or hide #}

            $(document).on("click", ".js-toggle-cart", function (e) {
                e.preventDefault();
                if ($(window).width() < 768) {
                    mobileToggleAjaxCart();
                }else{
                    $(".js-ajax-backdrop").toggle();
                    ajax_cart_panel.toggle();
                }            
            });
        
        {% endif %}

        {# Mobile navigation tabs and search #}

        var $top_nav = $(".js-mobile-nav");
        var $head = $(".js-head");
        var $page_main_content = $(".js-main-content");
        var $mobile_categories_btn = $(".js-toggle-mobile-categories");
        var $main_categories_mobile_container = $(".js-categories-mobile-container");
        var $search_backdrop = $(".js-search-backdrop");

        {# Mobile nav search #}

        $(".js-toggle-mobile-search").click(function(e){
            e.preventDefault;
            var $mobile_tab_navigation = $(".js-mobile-nav-second-row");
            $(".js-mobile-first-row").toggle();
            $(".js-mobile-search-row").toggle();
            $mobile_tab_navigation.toggle();
            $(".js-search-input").val();
            $search_backdrop.toggle().toggleClass("search-open");
            if(!$("body").hasClass("mobile-categories-visible")){
                $("body").toggleClass("overflow-none");
            }else{
                $("body").removeClass("mobile-categories-visible");
            }
            $main_categories_mobile_container.hide();
            if($page_main_content.hasClass("move-up")){
                $head.removeClass("move-up").addClass("move-down");
                $page_main_content.removeClass("move-up").addClass("move-down");
                $search_backdrop.removeClass("move-up").addClass("move-down");
                setTimeout(function() { 
                    $page_main_content.removeClass("move-down");
                }, 200);
            }else{
                $head.removeClass("move-down").addClass("move-up");
                $page_main_content.removeClass("move-down").addClass("move-up");
                $search_backdrop.removeClass("move-down").addClass("move-up");
            }
            if($mobile_categories_btn.hasClass("selected")){
                $mobile_categories_btn.removeClass("selected");
                $(".js-current-page").addClass("selected");
            }
        });
        var $mobile_search_input = $(".js-mobile-search-input");
        $(".js-toggle-mobile-search-open").click(function(e){
            e.preventDefault;
            $mobile_search_input.focus();
        });
        $(".js-search-back-btn").click(function(e){
            $(".js-search-suggest").hide();
            $mobile_search_input.val('');
        });

        {# Mobile nav categories #}

        $top_nav.addClass("move-down").removeClass("move-up");
        $mobile_categories_btn.click(function (e) {
            e.preventDefault();
            $("body").toggleClass("overflow-none mobile-categories-visible");
            if ($mobile_categories_btn.hasClass("selected")) {
                $mobile_categories_btn.removeClass("selected");
                $(".js-current-page").addClass("selected");
            } else {
                $mobile_categories_btn.addClass("selected");
                $(".js-current-page").removeClass("selected");
            }
            $main_categories_mobile_container.toggle();
            if ($top_nav.hasClass("move-up")) {
                $main_categories_mobile_container.toggleClass("move-list-up");
            }
        });

        {# Mobile nav subcategories #}

        $(".js-open-mobile-subcategory").click(function (e) {
            e.preventDefault();
            var $this = $(this);
            var this_link_id_val = $this.data("target");
            var $subcategories_panel_to_be_visible = $this.closest($main_categories_mobile_container).find("#" + this_link_id_val);
            $subcategories_panel_to_be_visible.detach().insertAfter(".js-categories-mobile-container > .js-mobile-nav-subcategories-panel:last-child");
            $subcategories_panel_to_be_visible.addClass("modal-xs-right-out").show();
            setTimeout(function () {
                $subcategories_panel_to_be_visible.toggleClass("modal-xs-right-in modal-xs-right-out");
            }, 100);
        });

        $(".js-go-back-mobile-categories").click(function (e) {
            e.preventDefault();
            var $this = $(this);
            var $subcategories_panel_to_be_closed = $this.closest(".js-mobile-nav-subcategories-panel");
            $(".js-mobile-nav-subcategories-panel").scrollTop(0);
            $subcategories_panel_to_be_closed.toggleClass("modal-xs-right-in modal-xs-right-out");
            setTimeout(function () {
                $subcategories_panel_to_be_closed.removeClass("modal-xs-right-out").hide();
            }, 300);
        });

        {# Mobile nav hamburger subitems #}

        $(".js-toggle-hamburger-panel").click(function(e){
            e.preventDefault();
            $("body, .js-hamburger-overlay, .js-hamburger-panel, .js-main-content").toggleClass("hamburger-panel-animated");
        });

        $(".js-toggle-page-accordion").click(function (e) {
            e.preventDefault();
            $(this).toggleClass("selected").closest(".js-hamburger-panel-toggle-accordion").next(".js-pages-accordion").slideToggle(300);
        });

        {# /* Modals v2 - applied for now only on hamburguer panel */ #}

        var $modal_close = $('.js-modal-close');
        var $modal_open = $('.js-modal-open');
        var $modal_overlay = $('.js-modal-overlay');

        $modal_open.click(function (e) {
            e.preventDefault(); 
            var $modal_id = $(this).data('toggle');
            $("body").toggleClass("overflow-none modal-active");
            if ($($modal_id).hasClass("modal-show")) {
                $($modal_id).removeClass("modal-show").delay(200).hide(0);
            } else {
                $($modal_id).show(0).addClass("modal-show");
            }             
        });

        $modal_close.click(function (e) {
            e.preventDefault();  
            $("body").toggleClass("overflow-none modal-active");
            $(this).closest(".js-modal").removeClass("modal-show").delay(200).hide(0);      
        });

        $modal_overlay.click(function (e) {
            e.preventDefault();  
            $("body").toggleClass("overflow-none modal-active");
            $(".js-modal").removeClass("modal-show").delay(200).hide(0);      
        });

        {# Modals above all elements #}

        $(document).on("click", ".js-trigger-modal-zindex-top", function (e) {
            e.preventDefault();
            var modal_id = $(this).attr("href");
            $(modal_id).detach().insertAfter(".modal-backdrop");
            $(".modal-backdrop").addClass("modal-backdrop-zindex-top");
        });

        {# Show and hide mobile nav on scroll #}

        {# Only hide and show nav on scroll when page is not cart #}

        {% if template != 'cart' %}

            var didScroll;
            var lastScrollTop = 0;
            var delta = 20;
            var navbarHeight = $('header').outerHeight();

            $(window).scroll(function(event){
                didScroll = true;
            });

            setInterval(function() {
                if (didScroll) {
                    hasScrolled();
                    didScroll = false;
                }
            }, 250);

            function hasScrolled() {
                var st = $(this).scrollTop();
                
                // Make sure they scroll more than delta
                if(Math.abs(lastScrollTop - st) <= delta)
                    return;
                
                // If they scrolled down and are past the navbar, add class .move-up.
                if (st > lastScrollTop && st > navbarHeight){
                    // Scroll Down
                        if(!$("body").hasClass("mobile-categories-visible")){
                            $top_nav.addClass("move-up").removeClass("move-down");
                        }
                        $(".backdrop").addClass("move-up").removeClass("move-down");
                        $(".js-head").addClass("logo-small");
                        $(".js-mobile-nav-second-row").addClass("move-up").removeClass("move-down");
                } else {
                    // Scroll Up
                    if(st + $(window).height() < $(document).height()) {
                        if(!$("body").hasClass("mobile-categories-visible")){
                            $top_nav.removeClass("move-up").addClass("move-down");
                        }
                        $top_nav.removeClass("move-up").addClass("move-down");
                        $(".backdrop").removeClass("move-up").addClass("move-down");
                        $(".js-head").removeClass("logo-small");
                        $(".js-mobile-nav-second-row").removeClass("move-up").addClass("move-down");
                    }
                }
                
                lastScrollTop = st;
            }

        {% else %}

        {# If page is cart hide the nav on scroll and show it only if you are on top of window #}

            $(window).scroll(function(event){
                var scrollTop = $(this).scrollTop();
                if (scrollTop <= 0) {
                    if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.removeClass("move-up").addClass("move-down");
                    }
                    $top_nav.removeClass("move-up").addClass("move-down");
                } else {
                    if(!$("body").hasClass("mobile-categories-visible")){
                        $top_nav.addClass("move-up").removeClass("move-down");
                    }
                }
            });

        {% endif %}

        {# Search suggestions #}
        
        LS.search($(".js-search-input"), function(html, count){
            $search_suggests = $(this).closest(".js-search-container").next(".js-search-suggest");
            if(count > 0){
                $search_suggests.html(html).show();
            }else{
                $search_suggests.hide();
            }
        }, {
            snipplet: 'navigation/search-results.tpl'
        });
        if ($(window).width() > 768) {
            $("body").click(function(){
                $(".js-search-suggest").hide();
            })
        }

        $(".js-search-suggest").on("click", ".js-search-suggest-all-link", function(e){
            e.preventDefault();
            $this_closest_form = $(this).closest(".js-search-suggest").prev(".js-search-container").find(".js-search-form");
            $this_closest_form.submit();
        });

        {# Home slider #}

        window.homeSlider = {
            getSliderConfiguration: function() {
                return {
                    //JS For home slider Preloader - hides the images until loaded
                    onSliderLoad: function(){
                        $(".js-home-slider-container img").css("visibility", "visible");
                        $(".js-home-slider-placeholder, .js-slider-desktop-placeholder").hide();
                        $(".js-home-slider, .js-home-slider-container .bx-wrapper").css({"visibility" : "visible" , "height" : "auto"});
                        $(".js-home-slider-container .bx-controls-direction, .js-home-slider-container .bx-pager").show();
                        project.home.slider();
                    },
                    onSlideBefore: function() {
                        project.home.slider();
                    },
                    onSlideAfter: function() {
                        project.home.slider();
                    },
                    pause: 5000,
                    autoHover: true,
                    adaptiveHeight: false,
                    nextText:'<span class="btn btn-primary btn-inverse btn-small">{% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}<span>',
                    prevText:'<span class="btn btn-primary btn-inverse btn-small">{% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}<span>',
                };
            },
            getAutoRotation: function() {
                return {% if settings.slider_auto %}true{% else %}false{% endif %};
            },
            create: function() {
                var config = this.getSliderConfiguration();
                config.auto = this.getAutoRotation() && this.get$Element().children().size() > 1;
                this._instance = this.get$Element().bxSlider(config);
                return this;
            },
            getInstance: function() {
                return this._instance;
            },
            get$Element: function() {
                return $('.js-home-slider');
            },
            get$Wrapper: function() {
                return $('.js-home-slider-container');
            }
        };
        window.homeSlider.create();

        {# Fabricantes slider #}

        if($('body').hasClass('template-home')){
            var slider_fabricantes = {
                infinite:true,
                slidesToShow:10,
                slidesToScroll:1,
                autoplay: true,
                responsive:[
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    }
                ]
            };

            $(".js-fabricantes-slider").slick(slider_fabricantes).css("visibility" , "visible");
        }

        {% if settings.slider | length == 1 %}
            $('.js-home-slider-container .bx-pager').remove();
        {% endif %}

        {# Banner services slider #}

        var $banner_services_slider = $('.js-mobile-services');
        var has_more_than_one_banner_service = $banner_services_slider.find('.js-service-item').length /
        $banner_services_slider.length  > 1;
        $banner_services_slider.bxSlider({
            // When only one element, don't spin. It's 3 because there is always two more elements to achieve the sliding effect.
            auto: false,
            touchEnabled: has_more_than_one_banner_service,
            controls: false,
            adaptiveHeight: false,
            onSliderLoad: function(){
                $banner_services_slider.css("visibility", "visible");
                $(".js-mobile-services-container .bx-has-pager").css("visibility", "visible");
                $(".js-services-placeholder").hide();
                $(".js-mobile-services-container").css({"visibility" : "visible", "height" : "auto"});
            }
        });
        
        if(!has_more_than_one_banner_service){
            $(".js-mobile-services-container .bx-has-pager").hide();
        }

        {# Banners #}

        // Ensure all banners have the same height
        // This has to go before the infite scrolling hides them and `$(this).height()` returns 0.
        var maxHeight = 0;
        $('.js-wrap-banner').each(function(){
            maxHeight = $(this).height() > maxHeight ? $(this).height() : maxHeight;
        });
        $('.js-wrap-banner').css("height", maxHeight);

        {# Resgister on product change variant to update quickshop image #}

        LS.registerOnChangeVariant(function(variant){
            var current_image = $('img', '#quick' + variant.product_id);
            current_image.attr('src', variant.image_url);
        });

        {# Scroll top #}

        $('.js-go-to-top').click(function(){
            $("html, body").animate({scrollTop:"0px"});
        });

        {# Go to previous page #}

        $('.js-go-back').click(function(){
            window.history.back();
        });

        {# Bottom sheet modal #}

        $('.js-sheet-bottom').on('show.bs.modal', function (e) {
            setTimeout(function(){
                $('.modal-backdrop').addClass('sheet-bottom-backdrop');
            });
        });

        {# Contact form analytics events #}

        {% if contact and contact.success %}
            {% if contact.type == 'newsletter' %}
                ga_send_event('contact', 'newsletter', 'standard');
            {% elseif contact.type == 'contact' %}
                ga_send_event('contact', 'contact-form');
            {% endif %}
        {% endif %}

        {# Submit to contact form when product has no price #}

        $(".js-product-form").submit(function(e){
            var button = $(this).find(':submit');
            button.attr('disabled', 'disabled');
            if ((button.hasClass('contact')) || (button.hasClass('catalog'))) {
                e.preventDefault();
                var product_id = $(this).find("input[name='add_to_cart']").val();
                window.location = "{{ store.contact_url | escape('js') }}?product=" + product_id;
            } else if (button.hasClass('cart')) {
                button.val('{{ "Agregando..." | translate }}');
            }
        });

        {# Show and hide labels on product variant change. Also recalculates discount percentage #}

        $(document).on("change", ".js-variation-option", function(e) {
            var $this_compare_price =  $(this).closest(".js-product-container").find(".js-compare-price-display");
            var $this_price = $(this).closest(".js-product-container").find(".js-price-display");
            var $installment_container = $(this).closest(".js-product-container").find(".js-product-payments-container");
            var $installment_text = $(this).closest(".js-product-container").find(".js-max-installments-container");
            var $this_add_to_cart =  $(this).closest(".js-product-container").find(".js-prod-submit-form");
            var $this_product_container = $(this).closest(".js-product-container");
            // Get the current product discount percentage value
            var current_percentage_value = $this_product_container.find(".js-offer-percentage");
            // Get the current product price and promotional price
            var compare_price_value = $this_compare_price.html();
            var price_value = $this_price.html();
            // Filter prices to only have numbers
            old_price_value_filtered = parseInt(compare_price_value.replace(/[^0-9]/gi, ''), 10)/100;
            current_price_value_filtered = parseInt(price_value.replace(/[^0-9]/gi, ''), 10)/100;
            // Calculate new discount percentage based on difference between filtered old and new prices
            price_difference = (old_price_value_filtered-current_price_value_filtered);
            updated_discount_percentage = Math.round(((price_difference*100)/old_price_value_filtered));
            $this_product_container.find(".js-offer-percentage").html(updated_discount_percentage);
            if ($this_compare_price.css("display") == "none") {
                $this_product_container.find(".js-offer-label").hide();
            }
            else {
                $this_product_container.find(".js-offer-label").css("display" , "table");
            }
            if ($this_add_to_cart.hasClass("nostock")) {
                $this_product_container.find(".js-stock-label").show();
            }
            else {
                $this_product_container.find(".js-stock-label").hide();
            }
            if ($this_price.css('display') == 'none'){
                $installment_container.hide();
                $installment_text.hide();
            }else{
                $installment_text.show();
            }
        });

        {# Color and size variations #}

        $(document).on("click", ".js-insta-variant", function(e) {
            e.preventDefault();
            $this = $(this);
            $this.siblings().removeClass("selected");
            $this.addClass("selected");

            var option_id = $this.data('option');
            $selected_option = $this.closest('.js-variants-container').find('.js-variation-option option').filter(function() {
                return this.value == option_id;
            });
            $selected_option.prop('selected', true).trigger('change');

            $this.closest("[class^='variation']").find('.js-insta-variation-label').html(option_id);
        });

        {# Shipping calculator functions #}

        {# Click on new shipping method only for cart #}

        {# /* // Select and save shipping function */ #}

        selectAndSaveShippingOption = function(elem){
            $(".js-shipping-method, .js-branch-method").removeClass('js-selected-shipping-method');
            $(elem).addClass('js-selected-shipping-method');
            LS.saveCalculatedShipping(true);
            if($(elem).hasClass("js-shipping-method-hidden")){

                {# Toggle other options visibility depending if they are pickup or delivery for cart and product at the same time #}

                if($(elem).hasClass("js-pickup-option")){
                    $(".js-other-pickup-options, .js-show-other-pickup-options .js-shipping-see-less").show();
                    $(".js-show-other-pickup-options .js-shipping-see-more").hide();

                }else{
                    $(".js-other-shipping-options, .js-show-more-shipping-options .js-shipping-see-less").show();
                    $(".js-show-more-shipping-options .js-shipping-see-more").hide()
                }          
            }
        };

        {% if store.has_shipping_polish %}

            {# Remove shipping suboptions from DOM to avoid duplicated modals #}

            removeShippingSuboptions = function(){
                var shipping_suboptions_id = $(".js-modal-shipping-suboptions").attr("id");
                $("#" + shipping_suboptions_id).remove();
                $('.js-modal-overlay[data-modal-id="#' + shipping_suboptions_id + '"').remove();
            };

        {% endif %}

        {# Toggle branches link #}

        $(document).on("click", ".js-toggle-branches", function (e) {
            e.preventDefault();
            $(this).closest('.js-shipping-calculator-container').find(".js-store-branches-container").slideToggle();
            $(this).find(".js-see-branches, .js-hide-branches").toggle();
        });

        {# Shipping radio buton click #}

        $(document).on("change", ".js-shipping-method, .js-branch-method", function () {
            selectAndSaveShippingOption(this);
            $(".js-shipping-method-unavailable").hide();
        });

        {# Click on shipping radio button #}

        $('.js-shipping-method:checked').livequery(function () {
            let shippingPrice = $(this).attr("data-price");
            LS.addToTotal(shippingPrice);
            selectAndSaveShippingOption(this);
        });

        {% if provinces_json %}
        $('select[name="country"]').change(function () {
            var provinces = {{ provinces_json | default('{}') | raw }};
            LS.swapProvinces(provinces[$(this).val()]);
        }).change();
        {% endif %}


        {# Click on shipping calculator input #}

        $(".js-shipping-input").keydown(function (e) {
            var key = e.which ? e.which : e.keyCode;
            var enterKey = 13;
            if (key === enterKey) {
                e.preventDefault();
                $(this).parent().find(".js-calculate-shipping").click();
                $(this).blur();
            }
        });

        {# Click on shipping calculator CTA #}

        $(".js-calculate-shipping").click(function (e) {
            e.preventDefault();

            {# Take the Zip code to all shipping calculators on screen #}
            let shipping_input_val = $(this).closest(".js-shipping-calculator-form").find(".js-shipping-input").val();

            {% if not store.has_shipping_polish %}
            if (shipping_input_val.length != 0){
            {% endif %}
                $(".js-shipping-input").val(shipping_input_val);
            {% if not store.has_shipping_polish %}
            }
            {% endif %}

            {% if store.has_shipping_polish %}

                {# Calculate on page load for both calculators: Product and Cart #}

                {% if template == 'product' %}
                    LS.calculateShippingAjax(
                        $('#product-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#product-shipping-container").closest(".js-shipping-calculator-container") );
                {% endif %}

                if ($(".js-cart-item").length) {
                    LS.calculateShippingAjax(
                        $('#cart-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#cart-shipping-container").closest(".js-shipping-calculator-container") );
                }

                $(".js-shipping-calculator-current-zip").html(shipping_input_val);
                removeShippingSuboptions();

            {% else %}
                LS.calculateShippingAjax(
                    $(this).parent().find(".js-shipping-input").val(),
                    '{{ store.shipping_calculator_url | escape('js') }}',
                    $(this).closest(".js-shipping-calculator-container"));
            {% endif %}
        });

        {# /* // Toggle more shipping options */ #}

        $(document).on("click", ".js-toggle-more-shipping-options", function(e) {
            e.preventDefault();

            {# Toggle other options depending if they are pickup or delivery for cart and product at the same time #}

            if($(this).hasClass("js-show-other-pickup-options")){
                $(".js-other-pickup-options").slideToggle(600);
                $(".js-show-other-pickup-options .js-shipping-see-less, .js-show-other-pickup-options .js-shipping-see-more").toggle();
            }else{
                $(".js-other-shipping-options").slideToggle(600);
                $(".js-show-more-shipping-options .js-shipping-see-less, .js-show-more-shipping-options .js-shipping-see-more").toggle();
            }
        });

        {# Only shipping input has value, cart has saved shipping and there is no branch selected #}

        calculateCartShippingOnLoad = function(){

            {% if store.has_shipping_polish %}

            {# Triggers function when a previous selection is not necesary #}

            if($("#cart-shipping-container .js-shipping-input").val() && !$(".js-branch-method").hasClass('js-selected-shipping-method')){
            {% else %}

            {# Triggers function only when there is a saved option on cart #}

            if($("#cart-shipping-container .js-shipping-input").val() && !$(".js-branch-method").hasClass('js-selected-shipping-method') && $(".js-cart-total").hasClass('js-cart-saved-shipping')){
            {% endif %}
           
                // If user already had calculated shipping: recalculate shipping

                setTimeout(function() { 
                    LS.calculateShippingAjax(
                        $('#cart-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#cart-shipping-container").closest(".js-shipping-calculator-container") );
                    {% if store.has_shipping_polish %}
                        removeShippingSuboptions();
                    {% endif %}
                }, 100);
            }else if($(".js-branch-method").hasClass('js-selected-shipping-method')){
                $("#cart-shipping-container .js-toggle-branches").click();

                // Trigger function only for free pickup stores
                LS.saveCalculatedShipping(false);
            }
        };

        calculateCartShippingOnLoad();

        {% if store.has_shipping_polish %}

            {# /* // Calculate product detail shipping on page load */ #}

            {% if cart.shipping_zipcode and template == 'product' %}
                setTimeout(function() { 
                    LS.calculateShippingAjax(
                        $('#product-shipping-container').find(".js-shipping-input").val(), 
                        '{{store.shipping_calculator_url | escape('js')}}',
                        $("#product-shipping-container").closest(".js-shipping-calculator-container") );
                    
                    removeShippingSuboptions();
                }, 100);
            {% endif %}

            {# /* // Change CP */ #}

            $(document).on("click", ".js-shipping-calculator-change-zipcode", function(e) {
                e.preventDefault();
                $(".js-shipping-calculator-response").fadeOut(100);
                $(".js-shipping-calculator-head").addClass("with-form").removeClass("with-zip");
                $(".js-shipping-calculator-with-zipcode").removeClass("transition-up-active");
                $(".js-shipping-calculator-form").addClass("transition-up-active");
            }); 

        {% endif %}

        {# Sort by products #}

        $('.js-sort-by').change(function(){
            var params = LS.urlParams;
            params['sort_by'] = $(this).val();
            var sort_params_array = [];
            for (var key in params) {
                if ($.inArray(key, ['results_only', 'page']) == -1) {
                    sort_params_array.push(key + '=' + params[key]);
                }
            }
            var sort_params = sort_params_array.join('&');
            window.location = window.location.pathname + '?' + sort_params;
        });

        {# Thumb scroller #}

        window.onload=function(){

            if($('body').hasClass('template-home')){
                var thumbnail_config_horizontal = {
                    infinite:true,
                    slidesToShow:4,
                    slidesToScroll:1,
                    autoplay: true,
                    prevArrow:$('.js-horizontal-scroller-prev'),
                    nextArrow:$('.js-horizontal-scroller-next'),
                    responsive:[
                        {
                            breakpoint: 768,
                            settings: {
                                slidesToShow: 1,
                                slidesToScroll: 1
                            }
                        }
                    ]
                };
            } else {
                var thumbnail_config_horizontal = {
                    infinite:false,
                    slidesToShow:4,
                    slidesToScroll:{% if template == 'product' %}3{% else %}1{% endif %},
                    variableWidth:{% if template == 'product' %} true {% else %} false {% endif %},
                    prevArrow:$('.js-horizontal-scroller-prev'),
                    nextArrow:$('.js-horizontal-scroller-next'),
                    responsive:[{breakpoint:768,settings:"unslick"}]
                };
            }

            $(".js-horizontal-scroller").slick(thumbnail_config_horizontal).css("visibility" , "visible");
            
            {% if template == 'home' and (sections.recent.products or sections.offer.products or sections.coming.products or show_help) %}

                var thumbnail_config_vertical = $.extend({}, thumbnail_config_horizontal, {slidesToShow:3,slidesToScroll:3,vertical:true,verticalSwiping:true,variableWidth:false,prevArrow:$('.js-vertical-scroller-one-prev'),nextArrow:$('.js-vertical-scroller-one-next')});
                $(".js-vertical-scroller-one").slick(thumbnail_config_vertical);

                var thumbnail_config_vertical_two = $.extend({}, thumbnail_config_vertical, {prevArrow:$('.js-vertical-scroller-two-prev'),nextArrow:$('.js-vertical-scroller-two-next')});
                $(".js-vertical-scroller-two").slick(thumbnail_config_vertical_two);

                var thumbnail_config_vertical_three = $.extend({}, thumbnail_config_vertical, {prevArrow:$('.js-vertical-scroller-three-prev'),nextArrow:$('.js-vertical-scroller-three-next')});
                $(".js-vertical-scroller-three").slick(thumbnail_config_vertical_three);

            {% endif %}

        }

        {# Show modal on body if slick js is active #}
        
        {% if not (template == 'category' or template == 'product') and (sections.primary.products and settings.quick_shop and store.allow_quickshop) %}
            
            $('.js-item-modal').appendTo("body");

        {% endif %}
        

        {# Spinner input  #}

        $('.js-quantity .js-quantity-up').on('click', function() {
            $quantity_input = $(this).closest(".js-quantity").find(".js-quantity-input");
            $quantity_input.val( parseInt($quantity_input.val(), 10) + 1);
        });

        $('.js-quantity .js-quantity-down').on('click', function() {
            $quantity_input = $(this).closest(".js-quantity").find(".js-quantity-input");
            quantity_input_val = $quantity_input.val();
            if (quantity_input_val>1) { 
                $quantity_input.val( parseInt($quantity_input.val(), 10) - 1);
            }
        });

        {# Mobile filters #}

        $(".js-toggle-mobile-filters").click(function (e) {
            e.preventDefault();
            $(".js-mobile-filters-panel").toggleClass("modal-xs-right-in modal-xs-right-out");
            $("body").toggleClass("overflow-none");
        });

        LS.ready.then(function() {
            LS.showWhiteListedFilters("{{ filters|json_encode() }}");
        });

        {# Mobile pagination #}

        $(".js-mobile-paginator-input").focusout(function(e){
            e.preventDefault();
            LS.paginateMobile();
        });
        
        {# notification #}

        var $js_notification = $(".js_notification");
        if ($js_notification.size() > 0){
            if (LS.shouldShowOrderStatusNotification($js_notification.data('url'))){
                $js_notification.show();
            };
            $(".js_notification_close").on( "click", function(e) {
                e.preventDefault();
                LS.dontShowOrderStatusNotificationAgain($js_notification.data('url'));
                $(".js_notification").hide();
                $(".js-main-content").removeClass('with-notification-bar');
            });
            if($js_notification.css('display') == 'none'){
              $(".js-main-content").removeClass('with-notification-bar');
            };
        }    

    });
});
</script>
{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
    <script type="text/javascript">
        LS.ready.then(function(){
            $(function() {

                {# Show more products function #}

                {% if pages.current == 1 and not pages.is_last %}
                    LS.hybridScroll({
                        productGridSelector: '.js-product-table',
                        spinnerSelector: '#js-infinite-scroll-spinner',
                        loadMoreButtonSelector: '.js-load-more-btn',
                        hideWhileScrollingSelector: ".js-hide-footer-while-scrolling",
                        productsBeforeLoadMoreButton: 50,
                        productsPerPage: {{ settings.category_quantity_products }}
                    });
                {% endif %}
            });
        });
    </script>
{% endif %}


{% if template == 'home' or template == 'category' %}
    <script type="text/javascript">

        {# Main categories sidebar #}

        LS.ready.then(function(){
            var categoriesList = $(".js-category-sidebar-item");
            var categoriesAmount = 10;

            if (categoriesList.length > categoriesAmount) {
                $("#show-more-categories").show();
                for (i = categoriesAmount; i < categoriesList.length; i++) {
                    $(categoriesList[i]).hide();
                }
            }

            $("#show-more-categories").click(function(e){
                e.preventDefault();
                for (i = categoriesAmount; i < categoriesList.length; i++) {
                    $(categoriesList[i]).toggle();
                }
                $(this).find(".js-btn-categories-icon").toggleClass("active");
            });
        });
    </script>
{% endif %}

{% if template == 'home' and (settings.video_embed or settings.show_instafeed) %}
<script type="text/javascript">
    LS.ready.then(function(){
        $(document).ready(function(){

            {# Youtube or Vimeo video embed #}

            {% if settings.video_embed %}
                function parseVideo (url) {

                    url.match(/(http:|https:|)\/\/(player.|www.)?(vimeo\.com|youtu(be\.com|\.be|be\.googleapis\.com))\/(video\/|embed\/|watch\?v=|v\/)?([A-Za-z0-9._%-]*)(\&\S+)?/);

                    if (RegExp.$3.indexOf('youtu') > -1) {
                        var type = 'youtube';
                    } else if (RegExp.$3.indexOf('vimeo') > -1) {
                        var type = 'vimeo';
                    }

                    return {
                        type: type,
                        id: RegExp.$6
                    };
                }

                var videoObj = parseVideo('{{ settings.video_embed }}');
                var $iframe = $('.js-video-home');
                if (videoObj.type == 'youtube') {
                    $('.js-play-button').click(function() {
                        $iframe.html('<iframe class="embed-responsive-item" src="https://youtube.com/embed/' + videoObj.id + '?color=white&amp;rel=0&amp;showinfo=0&amp;autoplay=1" allow="autoplay; encrypted-media"></iframe>');
                    });
                    var thumbYoutube = ('https://img.youtube.com/vi/' + videoObj.id + '/maxresdefault.jpg');
                    $('.js-video-image img').attr('data-src', thumbYoutube);
                } else if (videoObj.type == 'vimeo') {
                    $('.js-play-button').click(function() {
                        $iframe.html('<iframe class="embed-responsive-item" src="https://player.vimeo.com/video/' + videoObj.id + '?color={{ settings.brand_color | ltrim('#') }}&title=0&byline=0&portrait=0&autoplay=1" frameborder="0" webkitallowfullscreen mozallowfullscreen></iframe>');
                    });
                    $.get('https://vimeo.com/api/v2/video/' + videoObj.id + '.json', function(data) {
                      var thumbVimeo = data[0].thumbnail_large;
                      var thumbSplit = thumbVimeo.split(/\d{3}(?=.jpg)/);
                      $(".js-video-image img").attr('data-src', thumbSplit[0] + '1280x720' + thumbSplit[1]);
                    });
                }
            {% endif %}

            {# Instagram Feed #}

            {% if settings.show_instafeed %}
                var width = window.innerWidth;
                if (width > 767) {  
                    var feedqty = 8;
                    var resolution = "standard_resolution"; 
                } else {
                    var feedqty = 6;
                    var resolution = "low_resolution";
                }
                {% set userid = settings.instafeed_accesstoken|split('.')|first %}

                {% set instlink = '{{link}}' %}
                {% set instimg = '{{image}}' %}
                {% set instlike = '{{likes}}' %}
                {% set instcomm = '{{comments}}' %}

                var userFeed = new Instafeed({
                get: 'user',
                    userId: '{{ userid }}',
                    accessToken: '{{ settings.instafeed_accesstoken }}',
                    resolution: resolution,
                    template: '<div class="instafeed-item {% if not settings.video_embed %}col-md-2-custom{% else %}col-md-4-custom{% endif %} col-xs-4-custom"><a href="{{instlink}}" class="instafeed-link p-relative d-block" target="_blank"><div class="instafeed-img lazyload" data-bg="{{instimg}}"></div>{% if settings.instafeed_like or settings.instafeed_comments %}<div class="instafeed-info transition-soft font-small-extra">{% if settings.instafeed_like %}<span class="instafeed-info-item like">{% include "snipplets/svg/heart.tpl" with {fa_custom_class: "svg-inline--fa instafeed-icon svg-back-fill"} %} {{instlike}}</span>{% endif %}{% if settings.instafeed_comments %}<span class="instafeed-info-item comments">{% include "snipplets/svg/comment.tpl" with {fa_custom_class: "svg-inline--fa instafeed-icon svg-back-fill"} %} {{instcomm}}</span>{% endif %}</div>{% endif %}</a></div>',
                    limit: feedqty
               });
               userFeed.run();
           {% endif %}
        });
    });
</script>
{% endif %}

{% if template == "product" %}
<script type="text/javascript">
    LS.ready.then(function(){
        $(document).ready(function(){

            {# Pinterest sharing #}
            $('.js-pinterest-share').click(function(e){
                e.preventDefault();
                $(".pinterest-hidden a")[0].click();
            });

            {# Product mobile slider #}

            slider = $('#product-slider').bxSlider({
                onSliderLoad: function(){
                    //Add class to active slider image
                    $('#product-slider > .js-product-slide').eq(1).addClass('js-product-active-image');
                    $(".js-product-slider-placeholder, .js-product-detail-loading-icon").hide();
                    $("#product-slider").css({"visibility" : "visible", "height" : "auto"});
                    $("#product-slider-container").css({"visibility" : "visible", "height" : "auto"});
                },
                onSlideAfter: function (currentSlideNumber, totalSlideQty, currentSlideHtmlObject) {
                    $('#product-slider .js-product-active-image').removeClass('js-product-active-image');
                    //Add class to active slider image
                    $('#product-slider > .js-product-slide').eq(currentSlideHtmlObject + 1).addClass('js-product-active-image');
                },
                controls: false,
            });

            {% if product.images_count > 1 %}
              LS.registerOnChangeVariant(function(variant){
                    var liImage = $('#product-slider').find("[data-image='"+variant.image+"']");
                    var selectedPosition = liImage.data('image-position');
                    var slideToGo = parseInt(selectedPosition);
                    slider.goToSlide(slideToGo);
                });
            {% endif %}

            $(".js-product-thumb").click(function(e){
                e.preventDefault();
                var current_thumb_index = $(this).attr("data-slide-index");
                var match_thumb_image = $('#product-slider').find("[data-image-position='"+current_thumb_index+"']").not( ".bx-clone" );
                var selectedPosition = match_thumb_image.attr("data-image-position");
                var slideToGo = parseInt(selectedPosition);
                slider.goToSlide(slideToGo);        
            });

            {# Analytics events #}

            $('.js-social-share').click(function(){
                ga_send_event('social-sharing-product', $(this).data('network'))
            });

            $('.js-product-detail-payment-logo').click(function(){
                ga_send_event('product-detail-payment-logo');
            });

            {# Mobile Zoom #}

            //Save scrolling position for fixed body on Mobile Zoom opened
            var scrollPos = $(document).scrollTop();
            $(window).scroll(function(){
                scrollPos = $(document).scrollTop();
            });
            var savedScrollPos = scrollPos;

            // Add tap class to product image
            if ($(window).width() < 768) {
                $(".js-image-open-mobile-zoom").addClass("js-open-mobile-zoom");
            }

            // Mobile zoom open event
            $(".js-open-mobile-zoom").click(function(e){
                e.preventDefault();
                savedScrollPos = scrollPos;
                $('body').css({
                    position: 'fixed',
                    top: -scrollPos
                });
                LS.openMobileZoom();
            });

            // Mobile zoom close event
            $(".js-close-mobile-zoom").click(function(e){
                e.preventDefault();
                LS.closeMobileZoom(100);
            });

            {# Mobile variants with offcanvas panels #}
            
            $(document).on("click", ".js-mobile-vars-btn", function(e) {
                $(this).next(".js-mobile-vars-panel").removeClass('js-var-panel modal-xs-right-out').addClass('js-var-panel modal-xs-right-in');
                $(this).closest(".modal").scrollTop(0), "fast";
                $("body").addClass("overflow-none");
            });
            function closeVarPanel() {
            setTimeout(function(){
                $('.js-var-panel').removeClass('js-var-panel modal-xs-right-in').addClass('js-var-panel modal-xs-right-out')}, 300);
                $("body").removeClass("overflow-none");
            };
            $(document).on("click", ".js-close-panel", function(e) {
              closeVarPanel();
            });
            $(".js-quickshop-mobile-vars-property").on( "click", function() {
              $(this).closest(".modal").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars_btn").offset().top);
              closeVarPanel();
            });
            $(".js-mobile-vars-property").on( "click", function() {
              var selectedoption = $(this).data("option");
              var varname = $(this).closest(".js-mobile-vars-panel").data("custom");
              $(this).closest(".js-mobile-vars").find(".js-mobile-vars-selected-label").html(selectedoption);
              $(this).closest(".js-product-detail").scrollTop($(this).closest(".js-mobile-vars").find(".js-mobile-vars-btn").offset().top);
              closeVarPanel();
            });
            $(document).on("click", ".js-mobile-vars-property", function(e) {
                e.preventDefault();
                $this = $(this);
                $this.siblings().removeClass("selected");
                $this.addClass("selected");
                var option_id = $this.data('option');
                $selected_option = $this.closest('.js-mobile-variations-container').find('.js-variation-option option[value="'+option_id+'"]');
                $selected_option.prop('selected', true).trigger('change');
            });
        });
    });
</script>
{% endif %}

{% if show_help %}
    {% snipplet "defaults/show_help_js.tpl" %}
{% endif %}
{% if store.live_chat %}
    <!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
    window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
    /* custom configuration goes here (www.olark.com/documentation) */
    olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/
</script>
    <!-- end olark code -->
{% endif %}

{# External store codes #}

<script>
    LS.ready.then(function() {
        var trackingCode = $.parseHTML('{{ store.assorted_js| escape("js") }}', document, true);
        $('body').append(trackingCode);
    });
</script>
{# Google Survey #}
{% if store.google_merchant_id %}
    <script src="https://apis.google.com/js/platform.js?onload=renderBadge"
      async defer>
    </script>
    <script>
      window.renderBadge = function() {
        var ratingBadgeContainer = document.createElement("div");
        document.body.appendChild(ratingBadgeContainer);
        window.gapi.load('ratingbadge', function() {
          window.gapi.ratingbadge.render(
            ratingBadgeContainer, {
              "merchant_id": {{ store.google_merchant_id | escape('js') }},
              "position": "BOTTOM_LEFT"
            });
        });
    };
      window.___gcfg = {
        lang: '{% if store.country == 'BR' %}pt_BR{% else %}es{% endif %}'
      };
    </script>
{% endif %}

{{ "dist/js/main.js" | static_url | script_tag }}

</body>
</html>
