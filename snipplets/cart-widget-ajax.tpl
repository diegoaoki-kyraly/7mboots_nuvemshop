<div class="cart-summary">
    <a href="#" class="js-toggle-cart cart-summary-link">
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
