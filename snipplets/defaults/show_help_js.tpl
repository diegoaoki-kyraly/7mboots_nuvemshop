<script type="text/javascript">
    LS.ready.then(function(){
        $(document).ready(function(){

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
                nextText:'{% include "snipplets/svg/chevron-right-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}',
                prevText:'{% include "snipplets/svg/chevron-left-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-2x"} %}',

            });

            {# 404 handling to show the example product #}
            if ( window.location.pathname === "/product/example/" ) {
                document.title = "{{ "Producto de ejemplo" | translate | escape('js') }}";
                $("#404").hide();
                $("#product-example").show();
            } else {
                $("#product-example").hide();
            }
        });
    });
</script>