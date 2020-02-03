<div class="cart-summary">
    <a href="{{ store.cart_url }}" class="cart-summary-link pull-left full-width">
      <span class="cart-summary-info">
        <span class="cart-summary-ammount">
          <span class="js-cart-widget-amount">
            {{ "{1}" | translate(cart.items_count ) }}
          </span>
        </span>
        <span class="js-cart-widget-total cart-summary-total">{{ cart.total | money }}</span>
      </span>
    </a>
</div>

