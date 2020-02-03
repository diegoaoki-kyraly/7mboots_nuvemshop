{# Only remove this if you want to take away the theme onboarding advices #}
{# Products that work as examples #}
<div class="row-fluid">
	<div class="row-fluid m-top">
		<div class="container p-relative m-bottom">
			<h6 class="subtitle m-none">{{"Productos de ejemplo" | translate}}</h6>
			<div class="js-horizontal-scroller primary-products-scroller scroller scroller-horizontal-top grid-row" style="visibility: hidden;">
				<div class="item-mobile-container">
					<div class="item span3 scroller-item pull-left">
						<a href="/product/example" title="{{ product.name }}" class="item-link">
							<div class="item-image-container">
								<div class="labels-floating">
									<div class="pull-right">
										<div class="label-circle label-primary clear-both m-bottom-quarter">
											<span class="label-text">
												<div>33%</div>
												<div>OFF</div>
											</span>
										</div>
									</div>
								</div>
								{% include "snipplets/svg/help-product-2.tpl" %}
							</div>
							<div class="item-info-container m-top-half m-bottom-half">
								<h6 class="item-name weight-normal font-body m-bottom-quarter">
									{{ "Producto de ejemplo" | translate }}
								</h6>
								<div class="item-price-container">
									<span class="item-price weight-strong text-primary" id="price_display" itemprop="price" content="1000">{{"100000" | money }}</span>
									<span class="item-price-compare price-compare weight-strong p-left-half p-left-quarter-xs font-small-xs opacity-80">
										<span id="compare_price_display" >{{"150000" | money }}</span>
									</span>
								</div>
							</div>
						</a>
						<div class="text-uppercase font-small-extra m-top-quarter">
							<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
						</div>
					</div>
				</div>
				<div class="item-mobile-container">
					<div class="item span3 scroller-item pull-left">
						<a href="/product/example" title="{{ product.name }}" class="item-link">
							<div class="item-image-container">
								<div class="labels-floating">
									<div class="pull-right">
										<div class="label-circle label-primary clear-both">
											<span class="label-text font-small-extra">{{ "Envío gratis" | translate }}</span>
										</div>
									</div>
								</div>
								{% include "snipplets/svg/help-product-1.tpl" %}
							</div>
							<div class="item-info-container m-top-half m-bottom-half">
								<h6 class="item-name weight-normal font-body m-bottom-quarter">
									{{ "Producto de ejemplo" | translate }}
								</h6>
								<div class="item-price-container">
									<span class="item-price weight-strong text-primary" id="price_display" itemprop="price" content="1000">{{"44200" | money }}</span>
								</div>
							</div>
						</a>
						<div class="text-uppercase font-small-extra m-top-quarter">
							<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
						</div>
					</div>
				</div>
				<div class="item-mobile-container">
					<div class="item span3 scroller-item pull-left">
						<a href="/product/example" title="{{ product.name }}" class="item-link">
							<div class="item-image-container">
								<div class="labels-floating">
									<div class="pull-right">
										<div class="label-circle label-primary clear-both m-bottom-quarter">
											<span class="label-text">
												<div>23%</div>
												<div>OFF</div>
											</span>
										</div>
									</div>
								</div>
								{% include "snipplets/svg/help-product-6.tpl" %}
							</div>
							<div class="item-info-container m-top-half m-bottom-half">
								<h6 class="item-name weight-normal font-body m-bottom-quarter">
									{{ "Producto de ejemplo" | translate }}
								</h6>
								<div class="item-price-container">
									<span class="item-price weight-strong text-primary" id="price_display" itemprop="price" content="1000">{{"10200" | money }}</span>
									<span class="item-price-compare price-compare weight-strong p-left-half p-left-quarter-xs font-small-xs opacity-80">
										<span id="compare_price_display" >{{"13200" | money }}</span>
									</span>
								</div>
							</div>
						</a>
						<div class="text-uppercase font-small-extra m-top-quarter">
							<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
						</div>
					</div>
				</div>
				<div class="item-mobile-container">
					<div class="item span3 scroller-item pull-left">
						<a href="/product/example" title="{{ product.name }}" class="item-link">
							<div class="item-image-container">
								<div class="labels-floating">
									<div class="label-circle label-secondary label-circle-big">
										<span class="label-text">{{ "Sin stock" | translate }}</span>
									</div>
								</div>
								{% include "snipplets/svg/help-product-3.tpl" %}
							</div>
							<div class="item-info-container m-top-half m-bottom-half">
								<h6 class="item-name weight-normal font-body m-bottom-quarter">
									{{ "Producto de ejemplo" | translate }}
								</h6>
								<div class="item-price-container">
									<span class="item-price weight-strong text-primary" id="price_display" itemprop="price" content="1000">{{"44200" | money }}</span>
								</div>
							</div>
						</a>
						<div class="text-uppercase font-small-extra m-top-quarter">
							<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
						</div>
					</div>
				</div>
				<div class="item-mobile-container">
					<div class="item span3 scroller-item pull-left">
						<a href="/product/example" title="{{ product.name }}" class="item-link">
							<div class="item-image-container">
								{% include "snipplets/svg/help-product-4.tpl" %}
							</div>
							<div class="item-info-container m-top-half m-bottom-half">
								<h6 class="item-name weight-normal font-body m-bottom-quarter">
									{{ "Producto de ejemplo" | translate }}
								</h6>
								<div class="item-price-container">
									<span class="item-price weight-strong text-primary" id="price_display" itemprop="price" content="1000">{{"11200" | money }}</span>
								</div>
							</div>
						</a>
						<div class="text-uppercase font-small-extra m-top-quarter">
							<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
						</div>
					</div>
				</div>
				<div class="item-mobile-container">
					<div class="item span3 scroller-item pull-left">
						<a href="/product/example" title="{{ product.name }}" class="item-link">
							<div class="item-image-container">
								{% include "snipplets/svg/help-product-6.tpl" %}
							</div>
							<div class="item-info-container m-top-half m-bottom-half">
								<h6 class="item-name weight-normal font-body m-bottom-quarter">
									{{ "Producto de ejemplo" | translate }}
								</h6>
								<div class="item-price-container">
									<span class="item-price weight-strong text-primary" id="price_display" itemprop="price" content="1000">{{"13200" | money }}</span>
								</div>
							</div>
						</a>
						<div class="text-uppercase font-small-extra m-top-quarter">
							<a href="{{store.products_url}}" title="{{ product.category.name }}">{{ "CATEGORÍA DE EJEMPLO" | translate }}</a>
						</div>
					</div>
				</div>
			</div>
			<a href="#" class="js-horizontal-scroller-prev scroller-btn scroller-btn-prev scroller-btn-top hidden-phone">
				{% include "snipplets/svg/angle-left.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
			</a>
			<a href="#" class="js-horizontal-scroller-next scroller-btn scroller-btn-next scroller-btn-top hidden-phone">
				{% include "snipplets/svg/angle-right.tpl" with {fa_custom_class: "svg-inline--fa fa-2x svg-text-fill"} %}
			</a>
		</div>
	</div>
</div>