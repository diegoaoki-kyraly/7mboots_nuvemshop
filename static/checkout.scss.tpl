{% if store.allows_checkout_styling %}

/*============================================================================
checkout.scss.tpl

    -This file contains all the theme styles related to the checkout based on settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/main-color.scss.tpl --> For color and font styles related to config/settings.txt
        -static/css/style.css --> For non critical styles witch will be loaded asynchronously
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/

{#/*============================================================================
  Global
==============================================================================*/#}

{# /* // Colors */ #}

$primary-brand-color: #000000;
$foreground-color: #000000;
$background-color: {{ settings.background_color | default('rgb(252, 252, 252)' | raw ) }};

{# /* // Color variations */ #}

$background-dark-10: darken($background-color, 10%);
$background-light-10: lighten($background-color, 10%);
$background-opac-03: rgba($background-color, 0.3);
$primary-opac-03: rgba($primary-brand-color, 0.3);
$primary-opac-01: rgba($primary-brand-color, 0.1);
$foreground-light-100: lighten($foreground-color, 100%);

{# /* // Font */ #}

$heading-font: {{ settings.font_headings | default('Arvo') | raw }};
$body-font: {{ settings.font_rest | default('Arial') | raw }};
$button-font: {{ settings.font_buttons | default('Istok Web') | raw }};

{# /* // Box */ #}

$box-border-color: null;
@if lightness($background-color) > 95% {
  $box-border-color: desaturate(darken($background-color, 15%), 10%);
} @else {
  $box-border-color: desaturate(darken($background-color, 8%), 10%);
}
$box-radius: 0;
$box-background: lighten($background-color, 10%);
$box-shadow: null;
@if lightness($background-color) > 50% {
  $box-shadow: 0px 1px 4px -2px rgba(0, 0, 0, 0.4);
} @else {
  $box-shadow: 0px 1px 4px -2px rgba(0, 0, 0, 0.5);
}

{# /* // Functions */ #}

@function set-background-color($background-color) {
  @if lightness($background-color) > 95% {
    @return lighten($background-color, 10%);
  } @else {
    @return desaturate(lighten($background-color, 7%), 5%);
  }
}

@function set-input-color($background-color, $foreground-color) {
  @if lightness($background-color) > 70% {
    @return desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    @return desaturate(lighten($background-color, 5%), 80%);
  }
}

{% if not store.is_react_checkout_eligible %}

{#/*============================================================================
  New-checkout
==============================================================================*/#}

body {
  font-family: $body-font;
  font-weight: 300;
  background-color: $background-color;
}
strong { 
  font-weight: 400; 
}
.main-container {
  background-color: $background-color;
}
.header { 
  background-color: #000;
}
.form-box {
  border-radius: 0;
  border: none;
  padding: 10px 20px 20px 20px;
  background: $background-light-10;
  border: 1px solid $background-dark-10;
}
.form-box h1 {
  font-family: $heading-font;
  color: $foreground-color;
  text-shadow: none;
  border-bottom: 1px solid $background-dark-10;
  text-transform: uppercase;
  font-weight: 300;
}
input[type=submit], 
button[type=submit], 
.btn-checkout {
  font-family: $button-font;
  text-transform: uppercase;
  border-radius: 0;
  background-color: $primary-brand-color;
}
.login-btn a,
.login-btn a:hover,
.btn-link,
.btn-link:hover {
  color: $primary-brand-color;
}
input[type=submit]:hover, 
input[type=submit]:focus, 
input[type=submit]:active, 
input[type=submit]:active:hover, 
button[type=submit]:hover, 
button[type=submit]:focus, 
button[type=submit]:active, 
button[type=submit]:active:hover,
.btn-checkout:hover,
.btn-checkout:focus,
.btn-checkout:active,
.ticket-container .ticket-txt a:hover, 
.ladda-button:active, 
.ladda-button[disabled], 
.ladda-button[disabled]:hover {
  background-color: $primary-brand-color;
  text-decoration: none;
  opacity: 0.9;
}

#breadcrumb{
  list-style:none;
  display: inline-block;
  padding: 0;
  margin: 0 0 10px 0;
  
  li{
    float:left;
    a{
      color: $foreground-light-100;
      display:block;
      background: $primary-brand-color;
      text-decoration: none;
      position:relative;
      height: 30px;
      line-height:30px;
      padding: 0 10px 0 5px;
      text-align: center;
      margin-right: 23px;
    }
    &:first-child{
      a{
        padding-left:15px;
        border-radius: 0;
        &:before{
          border:none;
         }
      }
      a.inactive:before{
        border-width: 0;
      }
      a.inactive:after{
        border-left-color: $primary-opac-03;
      }
    }

    &:last-child{
      a{
        padding-right:15px;
        border-radius: 0;
        &:after{
          border:none;
        }
      }
    }
    
    a{   
      &:before,
      &:after{
        content: "";
        position:absolute;
        top: 0;
        border:0 solid $primary-brand-color;
        border-width:15px 10px;
        width: 0;
        height: 0;
      }
      &:before{
        left:-20px;
        border-left-color:transparent;
      }
      &:after{
        left:100%;
        border-color:transparent;
        border-left-color:$primary-brand-color;
      }
      &:hover{
        opacity: 0.8;
        
        &:before{
          border-left-color:transparent;
         }
      }
      &:active{
        background-color: $primary-brand-color;
        
        &:before{
          border-color:$primary-brand-color;
          border-left-color:transparent;
         }
        &:after{
          border-left-color:$primary-brand-color;
        }
      }
    }
    a.previous {
        opacity: 0.6;
      &:hover{
        opacity: 1;
      }
    }
    a.inactive {
      background: $primary-opac-03;
      cursor: default;
      color: darken($primary-brand-color, 40%);
      &:before {
        content: "";
        position:absolute;
        top: 0;
        border:0 solid $primary-opac-03;
        border-width:15px 10px;
        width: 0;
        height: 0;
      }
      &:hover{
        opacity: 1;
      }
      &:before{
        left:-20px;
        border-left-color:transparent;
      }
      &:active{
        background-color: $primary-opac-03;
        
        &:before{
          border-color: $primary-opac-03;
          border-left-color:transparent;
         }
      }
    }
  }
}

div.help {
  background-color: $background-color;
  color: $foreground-color;
  border-radius: 0;
  a {
    color: $foreground-color;
  }
  &-warning {
    background-color: #DB3E3E;
    color: #fff;
  }
}

.form-divider {
  .form-divider-title {
    color: rgba($primary-brand-color, 0.3);
    background-color: $background-color;
  }
  hr {
    border-top-color: rgba($primary-brand-color, 0.3);
  }
}

.custom-checkbox > .box > .tick {
  border-bottom-color: $primary-brand-color;
  border-left-color: $primary-brand-color;
}
.customOption input:checked + label {
  border-color: $primary-brand-color;
  border-width: 3px;
}
.customOption input:checked + label span.custom-radio {
  background: $primary-brand-color;
}
.customOption.pickup label {
  border-color: $primary-opac-03;
  border-width: 3px;
}
.customOption input:checked + label .description .name {
  color: $primary-brand-color;
}

.thankyou .success-msg a {
  color: $primary-brand-color;
}
.thankyou .success-msg .title h1, 
.thankyou .success-msg h3, 
.thankyou .form-box .create-account span.label-email {
  font-family: $heading-font;
}

h5 {
  color: $foreground-color;
}
.form-control, select {
  font-family: $body-font;
  border-color: $primary-opac-03;
  border-radius: 0;
  border-width: 3px;
  background: lighten($primary-brand-color, 100%);
}
.form-control:focus, select:focus, textarea:focus {
  border-color: $primary-brand-color !important;
  outline: none;
  border-width: 3px;
}
.input-group-addon-focus {
  border-color: $primary-brand-color !important;
}
.whatsapp-content .whatsapp-form {
  input, .input-group-addon {
    border-color: $primary-brand-color;    
  }
}

.form-control-help {
  color: $primary-brand-color;

  &-icon {
    background-color: $primary-brand-color;
    color: $background-color;

    &:hover {
      color: $background-color;
    }

    &.pressed {
      background-color: $background-color;
      border-color: $box-border-color;
      color: $primary-brand-color;
    }
  }
}
.form-control-help-content {
  background-color: $primary-brand-color;

  .arrow-up {
    border-bottom-color: $primary-brand-color;
  }
  a {
    color: $background-color;
  }
}

.floated-label {
  font-family: $body-font;
}
span.select-label {
  font-family: $body-font;
}
.table::-webkit-scrollbar-thumb {
  background-color: $primary-brand-color;
}
.table-striped > tbody > tr:first-child {
  border-top: none;
}
.table-striped > tbody > tr:nth-of-type(odd) {
  border-top: 1px dotted rgba($primary-brand-color, 0.03);
  background: rgba($foreground-color, 0.02);
}
.table-striped > tbody > tr:nth-of-type(even) {
  border-top: 1px dotted $primary-opac-01;
  background: rgba($foreground-color, 0.01);
}
.header .header-container {
  padding-left: 0;
  padding-right: 8px;
}
.header .header-container div {
  padding: 0;
}
.header .header-container .store-name {
  padding-left: 0;
  text-align: left;
}
.header .header-container .store-name img {
  padding-top: 5px;
}
.summary-container .summary #total-box .table {
  border-radius: 0;
}
.summary-container .summary .table td {
  color: $foreground-color;
}
.summary-container .summary #total-box .table.total-table {
  border-radius: 0;
}
.summary-container .summary #total-box .table.total-table tr td {
  color: $primary-brand-color;
}
.summary-container .summary .slidingDiv {
  background-color: $background-light-10;
  border-radius: 0;
  border: 1px solid $background-dark-10;
}
.summary-container .summary #total-box .table td img {
  border-radius: 0;
} 
.summary-container .summary #total-box .table tbody.total {
  border-color: $primary-brand-color;
}
.summary-container .summary #total-box .table .success {
  border-color: $primary-brand-color;
}
.summary-container .summary #total-box .table tbody.total tr { 
  background: $background-color;
}
.summary-container .summary .show-cart-button .fa-circle, 
.summary-container .summary .show-cart-button .show-details {
  color: $primary-brand-color;
}
.summary-container .summary .show-cart-button span.total-cart {
  margin-top: 2px;
  background-color: $primary-brand-color;
}
.summary-container .summary #coupon-form .coupon-field button {
  background: $primary-brand-color;
  border: 1px solid $primary-brand-color;
}
.summary-container .summary #total-box .table tbody.total tr.discount {
  background-color: $primary-opac-01;
  color: $primary-brand-color;
}
.summary-container .summary #total-box .table .success td {
  color: $foreground-color;
  background-color: $primary-brand-color;
}
.summary-container .summary #total-box .table.total-table tr.success td {
  color: $background-light-10;
  font-weight: bold;
}
.error-msg-single, 
.bg-danger, 
.bg-success {
  font-family: $body-font;
}
.error-msg-single, 
.bg-danger, 
.bg-success, 
label.same-address, 
.form-box textarea, 
div.customOption label, 
.customOption input:checked + label {
  border-radius: 0;
}
.text-muted {
  color: rgba($foreground-color, 0.8);
}
.text-primary {
  color: $primary-brand-color;
}
.seals {
  border-color: $primary-opac-03;
}
.ticket-container .ticket-txt a, 
.custom-container .ticket-txt a {
  font-family: $heading-font;
  text-transform: uppercase;
  border-radius: 0;
  background-color: $primary-brand-color;
}

.ac-container {
  border-color: $primary-opac-01;
}
.ac-container label.accordion {
  font-family: $heading-font;
  color: $foreground-color;
  text-shadow: none;
  border-bottom-color: $primary-opac-01;
  background: $background-opac-03;
}
.ac-container label.accordion:hover {
  background: rgba($background-color, 0.02);
}
.ac-container input.accordion:checked + label span {
  background: $primary-brand-color;
}
.ac-container, 
.summary-container .summary .show-cart-button span.total-cart {
  font-family: $heading-font;
  border-radius: 0;
}
.ac-container article {
  box-shadow: 0px 3px 0px 0px $primary-brand-color inset;
  background-color: rgba($background-color, 0.8);
}
.ac-container div:first-child label.accordion {
  border-radius: 0;
}
.ac-container div:last-child label.accordion {
  border-radius: 0;
}
.ac-container input.accordion:checked + label.accordion, 
.ac-container input.accordion:checked + label.accordion:hover
 {
  background-color: $primary-brand-color;
  text-shadow: none;
  color: $background-light-10;
}
.ac-container input.accordion:checked ~ article {
  background: rgba($foreground-color, 0.02);
  box-shadow: none;
}
.ac-container div:last-child input.accordion:checked + label.accordion {
    border-radius: 0;
    border-bottom: 1px solid $primary-opac-01;
}
.ac-container label.accordion p {
  margin: 6px 0 5px 0;
}
.ac-container label.accordion p.tag-discount {
  color: $background-light-10;
  background-color: $primary-brand-color;
  border-radius: 0;
}
.ac-container input.accordion:checked + label.accordion p.tag-discount {
  color: $primary-brand-color;
  background-color: $background-light-10;
}
div.customOption p.name { 
  font-weight: 400; 
}

.thankyou .form-box {
  overflow: hidden;
}
.thankyou .form-box .create-account {
  padding: 10px 20px 20px 20px;
  color: lighten($background-color, 70%);
  background: rgba($foreground-color, 0.05);
  border-radius: 0;
  border: none;
}
.thankyou .form-box p {
  padding: 25px 0;
  margin-bottom: 20px;
  border-bottom: 1px solid $background-color;
}
.thankyou .form-box .create-account p {
  padding: 0;
  margin: 0;
  color: $foreground-color;
  border-bottom: none;
  font-weight: 300;
}
.create-account .label-email {
  font-weight: 400;
  color: $foreground-color;
  letter-spacing: 1px;
}
.thankyou .form-box .ticket-container {
  margin: 0 0 10px 0;
}
.form-password .btn-submit {
  float: none;
  margin-top: 4px;
  display: inline-block;
}
ul.list-unstyled {
  width: 145px;
  float: right;
}
.safe-box {
  overflow: hidden;
}
.safe-box img {
  max-width: 36px;
}
.safe-box p {
  width: 105px;
  text-align: left;
  float: right;
  padding: 2px 10px 0 4px;
  margin: 0;
  font-family: "Open sans", sans-serif;
  font-size: 11px;
}
label.custom-select:after {
  top: 26px;
}
.coupon-show-link {
  border-radius: 0;
  color: $primary-brand-color;
}
.submit-coupon-btn i.fa-stack-2x {
  color: $primary-brand-color;
}
.submit-coupon-btn:active i.fa-stack-2x {
  color: darken($primary-brand-color, 10%);
}
.coupon-success {
  background: $primary-brand-color;
  border-radius: 0;
  font-size: 14px;
}
.coupon-success .arrow-up {
  border-bottom-color: $primary-brand-color;
}

@media (min-width: 768px) {
  .thankyou .form-box .ticket-txt p {
    text-align: left;
  }
  input[type=submit], button[type=submit] {
    width: auto;
    padding: 11px 10px;
  }
}
@media (min-width: 992px) {
  .thankyou .success-msg {
      width: 66%;
  }
}

{% else %}


{#/*============================================================================
  React
==============================================================================*/#}

{# /* // Box */ #}
 
// $box-border-color: darken($background-color, 10%); should we keep this or the above one?
$box-radius: 0;
$box-background: lighten($background-color, 10%);
$box-text-shadow: null;
@if lightness($foreground-color) > 95% {
  $box-text-shadow: 0 2px 1px rgba(darken($foreground-color, 80%), 0.1);
} @else {
  $box-text-shadow: 0 2px 1px rgba(lighten($foreground-color, 80%), 0.1);
}

$base-red: #c13a3a;

$xs: 0;
$sm: 576px;
$md: 768px;
$lg: 992px;
$xl: 1200px;

body {
  font-family: $body-font;
  color: $foreground-color;
  @if lightness($background-color) < 10% {
    background-color: lighten($background-color, 5%);
  } @else if (lightness($background-color) >= 10% and lightness($background-color) < 95%) {
    background-color: desaturate(lighten($background-color, 3%), 2%);
  } @else {
    background-color: desaturate(lighten($background-color, 1%), 2%);
  }
}
a {
  color: darken($primary-brand-color, 5%);
  &:hover, &:focus {
    color: darken($primary-brand-color, 20%);
    
    svg {
      fill: darken($primary-brand-color, 20%);
    }
  }
  
  svg {
    fill: darken($primary-brand-color, 5%);
  }
}

{# /* // Text */ #}

.title {
  color: $foreground-color;
}

{# /* // Header */ #}

.header { 
  background-color: lighten($background-color, 10%);
  border-color: $primary-brand-color;
}

{# /* // Form */ #}

.form-control {
  border-color: $box-border-color;
  @if lightness($background-color) > 70% {
    color: desaturate(lighten($foreground-color, 5%), 80%);
  } @else {
    color: desaturate(lighten($background-color, 5%), 80%);
  }

  &:focus {
    border-color: $primary-brand-color;
    outline: none;    
  }
}
.form-options-content {
  color: lighten($foreground-color, 15%);
  border-color: rgba($box-border-color, .6);
}
.form-group {

  &-error { 

  .form-control {
      border-color: $base-red;

      &:focus {
        border-color: $base-red;
      }
    }
  }
}
.form-group input[type="radio"] + .form-options-content {
  .unchecked {
    fill: darken($background-color, 10%);
  }
  .checked {
    fill: $primary-brand-color;
  }
}
.form-group input[type="radio"]:checked + .form-options-content {
  border: 1px solid $primary-brand-color;
  border-color: darken($background-color, 10%);
  
  + .form-options-accordion {
    border-color: darken($background-color, 10%);
  }
  
  .checked {
    fill: $primary-brand-color;
  }
}
.form-group input[type="checkbox"]:checked + .form-options-content {
  .checked {
    fill: $foreground-color;
  }
}
.form-group input[disabled] + .form-options-content {
  border-color: darken($background-color, 10%) !important;
  
  .form-options-label {
    color: $foreground-color !important;
  }
  .checked {
    fill: $foreground-color !important;
  }
}
.form-group input[type="checkbox"] + .form-options-content {
  .unchecked {
    fill: $foreground-color;
  }
}

{# /* // Input */ #}

.input-label {
  
  @if lightness($background-color) > 50% {
    color: lighten($foreground-color, 8%);
  } @else {
    color: desaturate($background-color, 80%);
  }
}

{# /* // Buttons */ #}

.btn-primary {
  border-radius: 0;
  background: $primary-brand-color;

  &:hover,
  &:focus,
  &:active {
    background: $primary-brand-color;
    opacity: 0.9;
  }
}
.btn-secondary {
  background: darken($background-color, 5%);
  color: $foreground-color;
  border-color: darken($background-color, 12%);

  &:hover,
  &:focus,
  &:active,
  &:active:focus {
    background: darken($background-color, 10%);
    border-color: darken($background-color, 20%);
  }
  &.btn-icon-right {

    svg {
      fill: $foreground-color;
    }
  }
}
.btn-transparent {
  color: lighten($foreground-color, 15%);

  &:hover {
    color: $primary-brand-color;
    
    &.btn-icon-right {
    svg {
        fill: $primary-brand-color;
      }
    }
  }
  
  &.btn-icon-right {
  svg {
      fill: lighten($foreground-color, 15%);
    }
  }
}

.btn-link {
  color: $primary-brand-color;

  &:hover {
    color: darken($primary-brand-color, 10%);

    svg {
      fill: darken($primary-brand-color, 10%);
    }
  }
}

.btn-picker {
  border-color: $box-border-color;
}

{# /* // Breadcrumb */ #}

.breadcrumb {

  li {

    .breadcrumb-step {
      @if lightness($background-color) > 50% {
        background: darken($background-color, 5%);
      } @else {
        background: $background-color;
      }
      color: rgba($foreground-color, .6);

      &.active {
        background-color: $primary-brand-color;
        @if lightness($primary-brand-color) < 70% {
          color: #fff;
        } @else {
          color: $background-color;  
        }

        &:before {
          border-color: transparent transparent transparent lighten($primary-brand-color, 20%);
        }

        &:after {
          border-color: transparent transparent transparent $primary-brand-color;
        }
      }

      &.visited {
        background: lighten($primary-brand-color, 20%);
      }
    }
  }
}

{# /* // Accordion */ #}

.accordion {
  border-radius: $box-radius;

  @if lightness($background-color) < 10% {
    border-color: rgba($box-border-color, 0.7);
  } @else {
    border-color: rgba($box-border-color, 0.7);
  }
  
  &.open {
    border-color: darken($foreground-color, 10%);
  }

  .section {
    border-color: rgba($box-border-color, 0.5);

    &:first-child {
      border-radius: $box-radius;
    }
    &:last-child {
      border-radius: $box-radius;
    }
  }

  .section-body {
    @if lightness($background-color) < 10% {
      background: desaturate($background-color, 10%);
    } @else {
      background: desaturate(darken($background-color, 1%), 10%);
    }
    border-color: $foreground-color;
  }
}

{# /* // Summary */ #}

.mobile-discount-coupon_btn {
  border-radius: $box-radius;
  border-color: darken($background-color, 10%);
  color: lighten($foreground-color, 20%);
  
  .icon {
    color: lighten($foreground-color, 20%);
  }
}
.summary {
  
  .panel {
    @media (max-width: $sm) {
      border: 0;
    }
  }
}
.summary-details {
  background: lighten($background-color, 15%);
}
.summary-container {
  background: lighten($background-color, 4%);
}
.summary-total {
  color: $foreground-color;
  background: $background-color;
}
.summary-img-thumb {
  border-radius: $box-radius;
}
.summary-arrow {

  &-rounded {
    background: $primary-brand-color;
  }
}
.summary-arrow-icon {
  fill: $foreground-color;
}
.summary-title {
  color: darken($primary-brand-color, 10%);
}

{# /* // Radio */ #}

.radio-group {

  &.radio-group-accordion {
    border-color: $box-border-color;

    .radio {
      border-color: lighten($box-border-color, 2%);
    }
  }
}
.radio {

  input {

    &:checked + .selector:before {
      background-image: radial-gradient(circle, $foreground-color 0%, $foreground-color 40%, transparent 50%, transparent 100%);
      border-color: $foreground-color;
    }
    &:disabled:checked + .selector:before {
      background-image: radial-gradient(circle, rgba(0, 0, 0, 0.5) 0%, rgba(0, 0, 0, 0.5) 50%, transparent 50%, transparent 100%);
    }
  }
  .selector {

    &:before {
      border-color: rgba($foreground-color, 0.5);
    }
  }
}
.radio-content {
  border-color: $foreground-color;
  @if lightness($background-color) > 50% {
    background: darken($background-color, 2.5%);
  } @else {
    background: darken($background-color, 1.7%);
  }
}
.shipping-option {
  border-radius: $box-radius;
  border-color: rgba($box-border-color, 0.7);

  &.active {
    @if lightness($background-color) > 20% {
      border-color: $primary-brand-color;
    } @else {
      border-color: darken(rgba($background-color, 0.7), 10%);
      background: $background-color;
    }
  }
}

{# /* // Panel */ #}

.panel {
  color: lighten($foreground-color, 8%);
  box-shadow: $box-shadow;
  border-radius: $box-radius;
  background-color: set-background-color($background-color);
}
.panel-header {
  color: $foreground-color;
  text-shadow: none;
  border-color: rgba($box-border-color, 0.7);
  font-weight: bold;
}
.panel-header-tooltip {
  .tooltip-icon {
    fill: lighten($foreground-color, 20%);
  }
  &:hover {
    .tooltip-icon {
      fill: $foreground-color;
    }
  }
}
.panel-header-sticky {
  background-color: set-background-color($background-color);
}
.panel-footer {
  border-bottom-right-radius: $box-radius;
  border-bottom-left-radius: $box-radius;
  background: darken($background-color, 2%);
  &-wa {
    border-color: darken($background-color, 5%);
  }
}
.panel-footer-form {
  input {
    border-color: $foreground-color;
  }
  .input-group-addon {
    background: $background-color;
    border-color: $foreground-color;
  }
  .disabled {
    background: darken($background-color, 15%) !important;
  }
}

{# /* // Table */ #}

.table, 
.table-footer {
  color: desaturate(lighten($foreground-color, 5%), 80%);
  border-color: rgba($foreground-color, 0.09);
}

.table-subtotal {
  border-color: rgba($primary-brand-color, .9);
}

.table {
  .table-discount-coupon, .table-discount-promotion {
    border-color: rgba($foreground-color, 0.09);
    color: $primary-brand-color;
  }
}

{# /* // Shipping Options */ #}

.shipping-options {
  color: lighten($foreground-color, 7%);
}

.shipping-method-item-desc,
.shipping-method-item-name {
  color: desaturate(lighten($foreground-color, 10%), 80%)
}

.shipping-method-item-price {
  color: $primary-brand-color;
}

{# /* // Discount Coupon */ #}

.box-discount-coupon {

  button {
    @if lightness($foreground-color) < 90% {
      color: lighten($foreground-color, 80%);
    } @else {
      color: $foreground-color;
    }
    background: $primary-brand-color;

    &:hover {
      background: lighten($primary-brand-color, 15%) radial-gradient(circle,transparent 1%, lighten($primary-brand-color, 15%) 1%) center/15000%;
    }
  }
}

.box-discount-coupon-applied {
  background-color: rgba(darken($background-color, 5%), 0.5);
  border-color: darken($background-color, 5%);
  border-radius: $box-radius;
  color: $primary-brand-color;

  .coupon-icon {
    fill: $primary-brand-color;
  }
}

{# /* // Order Status */ #}

.orderstatus-footer {
  @media (max-width: $sm) {
    background: $background-color;
  }
}

{# /* // Bookmark */ #}

.bookmark {
  background-color: $background-color;
}

.bookmark-icon {
  fill: $primary-brand-color;
  color: $primary-brand-color;
}

{# /* // Delivery Address */ #}

.delivery-address {
  border-color: rgba($box-border-color, 0.5);
  
  &-icon {
    svg {
      fill: rgba($foreground-color, 0.6);
    }
  }
}

{# /* // History */ #}

.history-item {

  &-done {
    .history-item {
      &-title {
        color: $foreground-color;
      }
    }
  }
  &-failure {
    .history-item {
      &-title {
        color: $base-red;
      }
    }
  }
}
.history-item-progress-icon {

  svg {
    @if lightness($background-color) > 50% {
      fill: darken($background-color, 10%);  
    } @else {
      fill: $background-color;
    }
  }
  &:after {
    @if lightness($background-color) > 50% {
      fill: darken($background-color, 10%);
      border-color: darken($background-color, 10%);
    } @else {
      fill: $background-color;
      border-color: $background-color;
    }
  }
  &-failure {
    svg {
      fill: $base-red;
    }
  }
  &-success {
    svg {
      fill: $primary-brand-color;
    }
    &:after {
      border-color: $primary-brand-color;
    }
  }
}

{# /* // History Canceled */ #}

.history-canceled {
  border-top-right-radius: $box-radius;
  border-top-left-radius: $box-radius;
  
  &-round {
    border-bottom-right-radius: $box-radius;
    border-bottom-left-radius: $box-radius;
  }
}
.history-canceled-header {
  border-color: rgba($box-border-color, 0.7);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.history-canceled-icon {
  svg {
    fill: darken($background-color, 45%);
  }
}

{# /* // Offline Payment */ #}

.ticket-coupon {
  background: darken($background-color, 4%);
  border-color: $box-border-color;
}

{# /* // Status */ #}

.status {
  border-color: rgba($box-border-color, 0.5);
  border-top-left-radius: $box-radius;
  border-top-right-radius: $box-radius;
}
.status-icon {
  svg {
    fill: darken($background-color, 45%);
  }
}

{# /* // Tracking */ #}

.tracking-item-time {
  color: $foreground-color;
}
.user-detail-icon-circle {
  background: lighten($background-color, 5%);
  
  svg {
    fill: rgba(desaturate($foreground-color, 50%), .5);
  }
}

{# /* // Support */ #}

.support {
  border-color: rgba($box-border-color, .6);
  background: lighten($background-color, 5%);

  @media (min-width: $md) {
    background: none;
  }
  
  &-left {
    @media (max-width: $sm) {
      border-color: darken($background-color, 5%);
    }
    
    svg {
      fill: $foreground-color;
    }
  }
}

{# /* // WhatsApp Opt-in */ #}

.whatsapp-form {
  input, 
  .input-group-addon {
    border-color: $primary-brand-color;
  }
}

{# /* // Headbar */ #}

.headbar {
  background: lighten($background-color, 4%);
}

{# /* // Helpers */ #}

.border-top {
  border-color: rgba($box-border-color, .4);
}

{# /* // Errors */ #}

.general-error {
  background: $base-red;
  border-color: lighten($base-red, 10%);
}

{# /* // Badge */ #}

.badge {
  border-color: $box-border-color;
}

{# /* // Payment */ #}

.payment-item-discount {
  background-color: $primary-brand-color;
  color: $background-color;
}

{# /* // Overlay */ #}

.overlay {
  background: rgba(darken($background-color, 10%), 0.6);
}
.overlay-title {
  color: rgba($foreground-color, .7);
}

{# /* // List Picker */ #}

.list-picker {

  .unchecked {
    fill: $foreground-color;
  }
  li {
    border-color: $box-border-color;
    background: lighten($background-color, 10%);

    &.active {
      background: $background-color;
      color: $primary-brand-color;

      .checked {
        fill: $primary-brand-color;
      }
    }
  }
}
.list-picker-content {
  background: lighten($background-color, 10%);
  border-color: $box-border-color;
}

{# /* // Loading */ #}

.loading {
  background: rgba(darken($background-color, 2%), 0.5);
  color: $primary-brand-color;
}
.loading-spinner {
  color: $primary-brand-color;
}

{# /* // Spinner */ #}

.round-spinner {
  border-color: $primary-brand-color;
  border-left-color: darken($primary-brand-color, 5%);
  
  &:after {
    border-color: $primary-brand-color;
    border-left-color: darken($primary-brand-color, 5%);
  }
}

.spinner > .spinner-elem {
  background: $primary-brand-color;
}

.spinner-inverted > .spinner-elem {
  background: $background-color;
}

{# /* // Sign Up */ #}

.signup {
  &-success-header {
    color: $primary-brand-color;

    svg {
        fill: $primary-brand-color;
    }
  }
}

{# /* // Modal */ #}

.modal {
  &-dialog {
    background: $background-color;
  }
}

@media (max-width: $xs) {
  .modal-xs {
    background: $background-color;
  }
}

{# /* // List */ #}

.list-group-item {
  border-color: $box-border-color;
}

{%  endif %}

{%  endif %}