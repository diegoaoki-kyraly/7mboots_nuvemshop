{# Mobile Sharing #}
<div class="m-bottom text-center botoes-compartilhamento">
	<div class="m-bottom-quarter text-uppercase">{{ "Compartir" | translate }}</div>
	<div class="m-bottom-half">
		{# Whatsapp button #}
		<a class="js-social-share d-inline-block p-all-half-xs" data-network="whatsapp" target="_blank" href="whatsapp://send?text={{ product.social_url }}">
			{% include "snipplets/svg/whatsapp-solid.tpl" with {fa_custom_class: "svg-inline--fa fa-lg visible-phone svg-text-fill"} %}
		</a>
		{# Facebook button #}
		<a class="js-social-share d-inline-block p-all-half" data-network="facebook" target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={{ product.social_url }}" title="Share on Facebook">
			{% include "snipplets/svg/facebook-f.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}
		</a>
		{# Twitter button #}
		<a class="js-social-share d-inline-block p-all-half" data-network="twitter" target="_blank" href="https://twitter.com/share?url={{ product.social_url }}" title="Share on Twitter">
			{% include "snipplets/svg/twitter.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}
		</a>
		{# Pinterest button that triggers real pin button hidden with CSS #}
		<a class="js-social-share js-pinterest-share d-inline-block p-all-half" href="#" target="_blank">
			{% include "snipplets/svg/pinterest-p.tpl" with {fa_custom_class: "svg-inline--fa fa-lg svg-text-fill"} %}
		</a>
		<div class="pinterest-hidden hidden" data-network="pinterest">
			{{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
		</div>
	</div>
</div>