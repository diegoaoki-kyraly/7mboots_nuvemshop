{#/*============================================================================

main-color.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        -static/css/style.css --> For non critical styles witch will be loaded asynchronously
        -snipplets/css/critical-css.tpl --> For critical CSS rendered inline before the rest of the site
        -static/css/checkout.scss.tpl --> For color and font styles related to config/settings.txt applied on the checkout

==============================================================================*/#}

{#/*============================================================================
  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // Texts
  #Components
    // Mixins
    // Functions
    // Wrappers
    // SVG Icons
    // Placeholders
    // Buttons
    // Links
    // Modals
    // Badges
    // Dividers
    // Forms
    // Alerts and notifications
    // Breadcrumbs
    // Sliders
    // Banners
    // Thumbs scroller
    // Tabs
    // Panels
    // Pills
    // Labels
    // Tables
    // Instafeed
    // Facebook
  #Header and nav
    // Nav desktop
    // Cart widget desktop
    // Search desktop
    // Nav mobile
    // Search suggestions
    // Advertising
  #Product grid
    // Filters and categories
    // Grid item
  #Product detail
    // Image
    // Color variations
    // Shipping calculator
  #Footer
  #Construction page
  #Contact page
  #Cart page
    // Table
    // Ajax cart
  #Media queries
    // Max width 767px
        //// Texts
        //// Components
        //// Header and nav
        //// Product detail
        //// Cart page

==============================================================================*/#}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}

{# /* // Colors */ #}

$main-background: {{ settings.background_color }};
$main-foreground: {{ settings.text_color }};
$primary-color: #FB6A40;
$secondary-color: {{ settings.background_color_secondary }};
$tertiary-color: {{ settings.brand_color_secondary }};

{# /* // Font families */ #}

$font-logo: {{ settings.font_logo | raw }};
$font-body: {{ settings.font_rest | raw }};
$font-nav: {{ settings.font_navigation | raw }};
$font-headings: {{ settings.font_headings | raw }};
$font-headings-prod: {{ settings.font_headingsprods | raw }};
$font-btn: {{ settings.font_buttons | raw }};

{# /* // Opacities */ #}

$opac1: 0.1;
$opac2: 0.2;
$opac4: 0.4;
$opac6: 0.6;
$opac8: 0.8;

{# /* // Texts */ #}

{# /* Headings */ #}

.h1-lg{
    font-size: 36px;
    font-family: $font-headings;
}
h1, .h1 {
  font-size: 28px;
  font-family: $font-headings;
}
h2, .h2 {
  font-size: 24px;
  font-family: $font-headings;
}
h3, .h3 {
  font-size: 22px;
  font-family: $font-headings;
}
h4, .h4 {
  font-size: 20px;
  font-family: $font-headings;
}
h5, .h5 {
    font-size: 18px;
    font-family: $font-headings;
}
h6, .h6 {
    font-size: 16px;
    font-family: $font-headings;
}
h1, 
h2, 
h3, 
h4, 
h5, 
h6{
    small{
        color: $main-foreground;
    }
}

.title-container{
    float: left;
    width: 100%;
    margin-bottom: 20px;
    border-bottom: 1px solid rgba($secondary-color, .6); 
    h1,
    .h1{
        padding: 40px 0 20px 0;
        font-size: 34px;
        font-weight: 300;
        letter-spacing: 1px;
    }
}
.subtitle{
    margin-bottom: 20px;
    padding-bottom: 10px;
    text-transform: uppercase;
    border-bottom: 1px solid rgba($main-foreground, .3);
}
.frame-title{
    margin: 40px 0;
    padding: 30px;
    text-align: center;
    border: 3px solid $primary-color;
    *{
        letter-spacing: 10px;
    } 
    h1{
        color: $primary-color;
        letter-spacing: 10px;
        text-transform: uppercase;
        font-weight: normal;
    }
}

.box-title {
    float: left;
    width: 100%;
    padding-bottom: 10px;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 12px;
}

{# /* Body */ #}

body,
.font-body {
  font-size: 14px;
}
.font-small {
  font-size: 12px;
}
.font-small-extra {
  font-size: 10px;
}

{# /* Icons */ #}

.fa-min {
  font-size: 8px;
}

{# /* Weight */ #}

.weight-normal {
  font-weight: 400;
}
.weight-strong {
  font-weight: 700;
}
.weight-light {
  font-weight: 300;
}

{# /* Color */ #}

.text-foreground {
    color: $main-foreground;
}
.text-primary {
   color: $primary-color;
}
.text-tertiary {
    color: #555; 
}
.text-background {
   color: $main-background;
}
.background-primary {
    background-color: $primary-color; 
}
.border-top-contrast{
  border-top: 1px solid $main-background;
}
.border-bottom-contrast{
  border-bottom: 1px solid $main-background;
}
.border-top{
  border-top: 1px solid rgba($main-foreground, .2);
}
.border-bottom{
  border-bottom: 1px solid rgba($main-foreground, .2);
}
.border-left{
  border-left: 1px solid rgba($main-foreground, .2);
}
.border-right{
  border-right: 1px solid rgba($main-foreground, .2);
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Mixins */ #}

@mixin border-radius($radius) {
    border-radius: $radius !important;
}
@mixin border-box() {
    box-sizing: border-box;
}
@mixin box-shadow-none() {
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
}
@mixin webkit-appearance-none() {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
@mixin text-decoration-none(){
    text-decoration: none;
    &:hover,
    &:focus{
        text-decoration: none;
    }
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
   #{$property}: $value;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
    @if (lightness($bg-color) > 50) {
        @return $foreground-color; // Lighter backgorund, return dark color
    } @else {
        @return lighten($foreground-color, 15%); // Darker background, return light color
    }
}

@function set-foreground-color-footer($bg-color, $foreground-color) {
    @if (lightness($bg-color) > 50) {
        @return $foreground-color; // Lighter backgorund, return dark color
    } @else {
        @return lighten($foreground-color, 30%); // Darker background, return light color
    }
}


{# /* // Wrappers */ #}

body {
    font-family: $font-body;
    color: $main-foreground;
}
.container-inverse  { 
    background: rgba($secondary-color, $opac8); 
    color: $main-background;
    a{
        color: $main-background;
    }
}
.container-primary{
    background: $primary-color; 
    color: $main-background;
}
.box-container{
    float: left;
    width: 100%;
    box-sizing: border-box;
    margin-bottom: 20px;
    padding:10px;
    border:1px solid rgba($main-foreground, 0.2);
}

.divider-container{
    @extend .box-container;
    padding: 10px 0;
    border-left:0;
    border-right:0;
}

.box-shadow {
    float: left;
    width: 100%;
    box-sizing: border-box;
    padding:10px;
    border: 1px solid rgba($main-foreground, .05);
    box-shadow: 0 0 5px rgba($main-foreground, $opac2);
    box-sizing: border-box;
}

{# /* // SVG Icons */ #}

.svg-primary-fill{
    fill:$primary-color;
    color:$primary-color;
}
.svg-secondary-fill{
    fill:$secondary-color;
    color:$secondary-color;
}
.svg-tertiary-fill{
    fill:$tertiary-color;
    color:$tertiary-color;
}
.svg-text-fill{
    fill:$main-foreground;
    color:$main-foreground;
}
.svg-back-fill{
    fill:$main-background;
    color:$main-background;
}

{# /* // Placeholders */ #}

.placeholder-container{
    background-color:rgba($main-foreground, 0.05);
}
.product-placeholder-preloader{
    fill:rgba($main-foreground, 0.07);
}
.placeholder-color{
    background-color:rgba($main-foreground, 0.3);
}
.placeholder-icon{
    fill:rgba($main-foreground, 0.07);
}

.placeholder-page{
    background: $main-background;
    border: 1px solid $main-foreground;
    &:hover,
    &.active{
        background: $main-foreground;
        opacity: 0.8;
    }
}
.spinner-ellipsis {
  .point {
    background-color: rgba($main-foreground, 0.2);
  }
}

{# /* // Buttons */ #}

button {
    font-family: $font-btn;
    &:focus{
        outline: none;
        box-shadow: none;
    }
}
.btn{
    padding: 10px 15px;
    font-family:$font-btn;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 700;
    text-shadow: none;
    background-image:none;
    @include border-radius(0);
    @include webkit-appearance-none();
    @include box-shadow-none();
    @include border-box();
    border:0;
    text-align:center;
    &:hover,
    &:focus,
    &.active{
        background-image:none;
        background-color:transparent;
        outline: 0;
        -webkit-box-shadow: none;
        box-shadow: none;
        opacity: 0.9;
    }
    &[disabled],
    &[disabled]:hover{
        background-color: #DDD;
        border: 2px solid #DDD;
    }
}
.btn-primary{
    color: $primary-color; 
    background: #00cb60;
    color: #FFF; 
    &:hover{
        @include prefix(transition, 0.3s ease-in-out, webkit ms moz);
        color: #FFF; 
        background: #009148; 
    }
    &:focus{
        color: #FFF; 
        background: #009148; 
    }
    &.btn-inverse{
        color: $main-background; 
        background: $primary-color;
        fill: $main-background;
    }
}
.btn-secondary,
.filter-remove{
    background: transparent;
    color:  $main-foreground;
    border: 2px solid $main-foreground;
    &:hover{
        @include prefix(transition, 0.3s ease-in-out, webkit ms moz);
        background-color:$main-foreground;
        color: $main-background;
    }
    &:focus{
        background-color:$main-foreground;
        color: $main-background;
    }
    &.btn-inverse{
        background: transparent;
        color: $main-background; 
        border: 2px solid $main-background;
    }
}
.filter-remove:after{
    content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" fill="%23{{ settings.text_color |trim('#') }}"><path d="M207.6 256l107.72-107.72c6.23-6.23 6.23-16.34 0-22.58l-25.03-25.03c-6.23-6.23-16.34-6.23-22.58 0L160 208.4 52.28 100.68c-6.23-6.23-16.34-6.23-22.58 0L4.68 125.7c-6.23 6.23-6.23 16.34 0 22.58L112.4 256 4.68 363.72c-6.23 6.23-6.23 16.34 0 22.58l25.03 25.03c6.23 6.23 16.34 6.23 22.58 0L160 303.6l107.72 107.72c6.23 6.23 16.34 6.23 22.58 0l25.03-25.03c6.23-6.23 6.23-16.34 0-22.58L207.6 256z"/></svg>');
}
.btn-default {
    color: $main-foreground; 
    border: 3px solid rgba($main-foreground, .5); 
    font-family: $font-btn; 
    background-color:transparent;
    &:hover{
        opacity: 0.6;
    }
}
.btn-small{
    padding: 7px;
    font-size: 12px;
    font-weight: normal;
    @include border-radius(0);
}

.btn-smallest{
    @extend .btn-small;
    padding: 5px 10px;
}
.btn-link{
    position:relative;
    color: $tertiary-color;
    fill: $tertiary-color;
    text-decoration: underline;
    font-size: 12px;
    text-transform: uppercase;
    &:hover{
        color: $tertiary-color;
        opacity:0.8;
    }
    &-centered{
        float: left;
        width: 100%;
        padding: 15px;
        text-align: center;
    }
}
.btn-floating{
    position:absolute;
    top: 0;
    right: 0;
    padding: 8px 10px;
    border-radius: 30px;
    color:rgba($main-foreground, .7);
    fill:rgba($main-foreground, .7);
    background-color:$main-background;
    border:1px solid rgba($main-foreground, .1 );
    z-index: 10;
    svg, 
    i {
        float: left;
    }
    &:hover,
    &:focus {
        opacity: 0.8;
    }
    &.fixed-bottom {
        position: fixed;
        top: auto;
        bottom: 20px;
        right: 20px;
    }
}
.btn-whatsapp {
    padding: 2px 5px;
    color: white;
    background-color:#4dc247;
    box-shadow: 2px 2px 6px rgba(0,0,0,0.4);
    z-index:5;
    border-radius: 50%;
    svg {
        width: 35px;
        height: 35px;
        padding: 5px 2px;
        fill: white;
        vertical-align:middle;
    }
}

{# /* // Links */ #}

a {  
    color: $main-foreground; 
    &:hover{
        text-decoration: underline;
    }
    &:active,
    &:focus,
    &:hover {
        outline: 0;
        box-shadow: none;
    }
}

.link-module{
    border-bottom: 1px solid rgba($main-foreground, .2); 
}

.link-module + .link-module{
    border-top:0;
}

.link-module-icon{
    fill:$main-foreground;
}

{# /* // Modals */ #}

.modal,
.modal-right,
.modal-xs-dialog{
    background: $main-background;
    color: $main-foreground;
}
.modal-header {
    border-bottom:1px solid rgba($main-foreground, 0.1);
}

.modal-footer {
    background: $main-background;
    color: $main-foreground;
    border-top:1px solid rgba($main-foreground, 0.1);
    box-shadow:none;
}

.modal-xs-footer-fixed,
.sticky-cta {
    background: $main-background;
}

.modal-backdrop{
    background: rgba($secondary-color, $opac8); 
}

{# /* // Badges */ #}

.badge { 
    background-color: rgba($secondary-color, $opac1); 
    color: rgba($secondary-color, $opac8); 
    font-family: $font-body; 
}

{# /* // Dividers */ #}

hr{
    border: 1px solid rgba($main-foreground, .1);
    border-bottom:0;
}
.divider{
    float: left;
    width: 100%;
    margin: 20px 0;
    border-bottom:1px solid rgba($main-foreground, .2);
}

{# /* // Forms */ #}

.form-group{
    float: left;
    width: 100%;
    clear: both;
    margin-bottom: 15px;
    input.form-control,
    textarea.form-control{
        width: 100%;
    }
    &-transparent{
        input::-webkit-input-placeholder,
        textarea::-webkit-input-placeholder {
          color: rgba($main-background, .8);
        }
        input::-webkit-input-placeholder,
        textarea::-webkit-input-placeholder {
          color: rgba($main-background, .8);
        }
        input::-moz-placeholder,
        textarea::-moz-placeholder { 
          color: rgba($main-background, .8);
        }
        input:-ms-input-placeholder,
        textarea:-ms-input-placeholder {
          color: rgba($main-background, .8);
        }
        input:-moz-placeholder,
        textarea:-moz-placeholder { 
          color: rgba($main-background, .8);
        }
    }
}
.form-label{
    font-size: 12px;
    font-weight: 300;
}
input.form-control,
textarea.form-control{
    margin: 0;
    @include border-radius(0);
    @include border-box();
    @include webkit-appearance-none();
    font-family: $font-body;
    color: #8d8d8d; 
    border: 2px solid #8d8d8d; 
    background-color: $main-background; 
    &:focus{
        outline: none;
        @include prefix(box-shadow, none, webkit ms moz);
        border: 2px solid $main-foreground; 
    }
    &.form-control-secondary{
        color: $main-foreground; 
        border: 3px solid rgba($main-foreground, 0.2); 
    }
    &.form-control-transparent{
        color: $main-background; 
        background-color: transparent; 
        border-color: rgba($main-background, .8); 
        &::-webkit-input-placeholder,
        &::-moz-placeholder,
        &:-ms-input-placeholder{
            color: rgba($main-background, .6);
        }
        &:focus{
            border-color: $main-background;  
        }
    }
}
input.form-control{
    height: 40px;
    padding:7px;
    &.form-control-small{
        height: 36px;
    }
    &.form-control-big{
        height: 47px;
        font-size: 18px;
    }
}

input[disabled], 
input[disabled]:hover {
    background: $primary-color;
    border-color: $primary-color;
    opacity: 0.6;
    cursor: initial;
    color: $main-background;
}
input,
textarea{
    font-family: $font-body; 
}

input::-webkit-input-placeholder,
textarea::-webkit-input-placeholder {
  color: rgba($main-foreground, .6);
}
input::-moz-placeholder,
textarea::-moz-placeholder { 
  color: rgba($main-foreground, .6);
}
input:-ms-input-placeholder,
textarea:-ms-input-placeholder {
  color: rgba($main-foreground, .6);
}
input:-moz-placeholder,
textarea:-moz-placeholder { 
  color: rgba($main-foreground, .6);
}

select{ 
    font-family: $font-body; 
    border: 3px solid rgba($main-foreground, .2); 
}
.quantity-btn{
    background-color: rgba($main-foreground, 0.05);
}

::selection {
    background-color: $main-foreground;
    color: $main-background;
}

.radio-button-container{
    .radio-button {
        &-content{
          border-bottom: 1px solid rgba($main-foreground, 0.1);
        }
        input[type="radio"]{
            & +  .radio-button-content .unchecked{
                border: 2px solid rgba($main-foreground, .6);
            }
            &:checked +  .radio-button-content .unchecked{
                border-color: $primary-color;
            }
            & +  .radio-button-content .checked{
                background-color: $primary-color;
            }
            & + .radio-button-content .radio-bg-selected{
                background-color: rgba($main-foreground, .03) ;
            }
        }
    }
}

{# /* Lists */ #}

.list-readonly {
    .list-item {
        border-bottom: 1px solid rgba($main-foreground, 0.1);
        .radio-button-content{
            border-bottom: none;
        }
    }
    .shipping-extra-options .radio-button-item:first-child .list-item {
        border-top: 1px solid rgba($main-foreground, 0.1);
        .radio-button-content{
            border-top: none;
        }
    }
    .radio-button-item:only-child .list-item,
    .radio-button-item:last-of-type .list-item{
        border-bottom: none;
    }
    .list-item:last-of-type .radio-button-content{
        border-bottom: none;
    } 
}

{# /* // Alerts and notifications */ #}

.alert{
    font-family: $font-headings;
    &-primary {
        color: $primary-color;
        background-color: rgba($primary-color, .1);
        .btn-link{
            color: $main-foreground;
        }
    }
    &-danger,
    &-error{
        color: set-foreground-color($main-background, #cc4845);
        background-color: rgba(#cc4845, .1); 
    }
    &-warning{
        color: set-foreground-color($main-background, #c09853);
        background-color: rgba(#c09853, .1); 
    }
    &-info{
        color: set-foreground-color($main-background, #3a87ad);
        background-color: rgba(#3a87ad, .1); 
    }
    &-success{
        color: set-foreground-color($main-background, #3caf65);
        background-color: rgba(#3caf65, .1); 
    }
}

.notification{
    font-family: $font-headings;
    &-primary {
        color: $primary-color;
        background-color: rgba($primary-color, .1);
        border-top: 1px solid rgba($primary-color, .2);
    }
    &-secondary {
        background: darken($main-background, 3%);
        color: rgba($main-foreground, .8);
        border-bottom: 1px solid darken($main-background, 10%);
        a {
            color: $secondary-color;
            font-weight: 600;
        }
    }
}

{# /* // Breadcrumbs */ #}

.breadcrumbs {
    margin-bottom: 0;
    padding: 60px 0 10px 0;
    font-size: 12px;
    font-style: italic;
    font-family: $font-headings; 
    text-align: right;
    .breadcrumb-crumb{
        color:  rgba($secondary-color, .4); 
    }
    .breadcrumb-divider{
        padding: 0 5px;
    }
    .active{
        font-weight: 300px;
        color: $secondary-color;
    }
}

{# /* // Sliders */ #}

.bx-viewport {
    height: auto !important;
}
.bx-pager {
    position: absolute;
    bottom: 0;
    width: 100%;
    text-align: center;
    color: $main-foreground;
    &-item {
        *zoom: 1;
        *display: inline;
        a{
            display: block;
            width: 7px;
            height: 7px;
            margin: 0 3px;
            text-indent: -9999px;
            border-radius: 50%;
            background: $main-background;
            border: 1px solid $main-foreground;
            &:hover,
            &.active{
                background: $main-foreground;
                opacity: 0.8;
            }
        }
    }
}
.bx-wrapper {
    .bx-controls-direction{
        a{
            position: absolute;
            top: 50%;
            margin-top: -45px;
            width: 40px;
            height: 45px;
            overflow: hidden;
            color: rgba($main-background, $opac6);
            &.bx-prev{
                left: 20px;
            }
            &.bx-next{
                right: 20px;
            }
        }
    }
}

{# /* // Banners */ #}

.service-icon {
    fill:$primary-color;
    color:$primary-color;
}

.text-banner {
    background-color: $primary-color;
    &.secondary{
        background-color: $tertiary-color; 
    }
    &.none{
        background-color: transparent; 
    }
    &.default_font{
        color: $main-background;
    }
    &.brand_font{
        color: $primary-color;
    }
    &.txt_font{
        color: $main-foreground;
    }
    &-filter {
        background: $primary-color;
        &.secondary{
            background: $tertiary-color; 
        }
        &.none{
            background: transparent; 
        }
    }
    &-promotional {
        background-color: $main-foreground;
        .text-banner-info { 
            color: $main-background;
        }
    }
}

.banner-link {
    background: $main-background; 
    color: $primary-color; 
    font-family: $font-nav;
    &:hover {
        background: $primary-color; 
        color: $main-background; 
    }
}

.services{
    background: rgba($secondary-color, $opac1);
    .has-3-banners:not(:last-child) {
        border-right: 1px solid rgba($secondary-color, $opac1);
    }
}

{# /* // Modules with image and text */ #}

.module-container {
    padding: 40px 0;
    background-color:rgba($main-foreground, 0.03);
    &.module-secondary {
        margin-bottom: 40px;
        padding-top: 10px;
    }
}

.module-text-title {
    font-family: $font-headings;
}


{# /* // Thumbs scroller */ #}

.scroller-btn{
    background-color: rgba($main-background, .5);
}

{# /* // Tabs */ #}

.nav-tabs-container{
    border-bottom:1px solid rgba($main-foreground, 0.1);
}
.nav-tabs-links{
    border-bottom:0;
}
.nav-tabs {
    .tab.active{
        .tab-link{
            color: $primary-color;
            background-color:transparent;
            border:0;
            border-bottom:2px solid $primary-color;
        }
    }
    .tab-link{
        background-color: transparent;
        &:hover,
        &:focus{
            background-color: transparent!important;
        }
    }
    .tab-check.active{
        .tab-check-link,
        .tab-check-link:focus{
            outline:2px solid $primary-color;
        }
    }
    .tab-check-link-text{
        outline:1px solid rgba($main-foreground, .3);
    }
    .tab-check-icon{
        color: $primary-color;
    }
    .tab-check-icon{
        .fa-inverse{
            color:$main-background;
        }
    }
}

{# /* // Panels */ #}

.panel{
    margin-bottom: 20px;
    @include border-box();
    border:1px solid rgba($secondary-color, .2);
    background-color: $main-background;
    &-heading{
        padding:10px;
        border-bottom:1px solid rgba($secondary-color, .2);
    }
    &-body{
        padding:10px;
    }
    &-footer{
        padding:10px;
        border-top:1px solid rgba($secondary-color, .2);
    }
}

{# /* // Pills */ #}

.pills-container{
    background-color:rgba($main-foreground, 0.03);
}
.pill-link{
    font-family: $font-btn;
    border:2px solid $primary-color;
    &:hover,
    &:focus{
        opacity: 0.6;
    }
}

{# /* // Labels */ #}


.label-primary{
    background: $primary-color;
}
.label-secondary{
    background: rgba($secondary-color, $opac4);
}
.label-text{
    font-family: $font-nav; 
    color: $main-background; 
}

{# /* // Tables */ #}

.table-striped {
    tbody>tr:nth-child(odd) {
        >th,
        >td {
            background-color: rgba($main-foreground, .03);
        }
    }
}

{# /* // Instafeed */ #}

.instafeed-info {
  background: rgba($secondary-color, $opac6); 
  .instafeed-info-item {
    color: $main-background;
  }
}

{# /*  // Facebook */ #}

{% if has_logo %}
.fb-page-img-container{
  background: $main-background;
}
{% endif %}


{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Nav desktop */ #}

.desktop-nav {
    font-family: $font-nav;
    &-item{
        font-family: $font-nav;
    }
    &-item.selected > .desktop-nav-link{
        color:$primary-color;
    }
    &-list{
        background-color: $main-background;
        border: 1px solid rgba($secondary-color, .2);
    }
}
.head-top-fixed {
    background: $main-background;
    box-shadow: -2px 0 5px rgba($main-foreground,$opac2);
}
.head-top {
    background-color: rgba($main-foreground,.05);
}
.info-head a {  
    color: $primary-color; 
    font-family: $font-headings; 
}
.logo-text {  
    font-family: $font-logo;
}

{# /* // Cart widget desktop */ #}

.cart-summary-info { 
    color: $secondary-color;  
    font-family: $font-nav;
}
.cart-summary-icon{ 
    background: $primary-color; 
    color: $main-background;
}

{# /* // Nav mobile */ #}

.btn-hamburger {
    border-color: $primary-color;
}
.hamburger-panel{
    background-color: #FFFFFF;
    &-link{
        color: #8d8d8d;
        border-top: 1px solid rgba($main-background, 0.1);
        &:hover{
            color: #FB6A40;
        }
    }
    &-arrow{
        svg{
            background:rgba(131, 131, 131, 0.4);
            fill:white;
        }
        &.selected{
            i{
                background: $main-background;
            }
        }
    }
    &-first-row,
    &-accordion{
        background:rgba(131, 131, 131, 0.4);
        color:white;
    }
    .mobile-accounts {
        &-link {
            color: rgba($main-background, 0.8);
        }
    }
    .btn-hamburger-close {
        fill: #555555;
    }
    .hamburger-panel-arrow {
        color: $main-background;
    }
}


.mobile-nav{
    &-tab-text{
        font-family: $font-headings;
        color: $main-foreground;
    }
    &-tab{
        &-icon{
            color: $main-foreground;
            fill: $main-foreground;
        }
    }
    &-tab.selected{
        .mobile-nav-tab-text,
        .mobile-nav-tab-icon{
            color: $primary-color;
            fill: $primary-color;
        }
    }
    &-cart-amount{
        background-color: $primary-color;
        color:$main-background;
    }
    input.mobile-search-input{
        background-color:$main-background;
    }
}
.mobile-nav-categories-container{
    background-color: $main-background;
    box-shadow: 2px 0px 1px 1px rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

{# /* // Search suggestions */ #}

.search-suggest{
    background-color: $main-background;
    &-link,
    &-icon{
        color: rgba($main-foreground, 0.8);
        fill: rgba($main-foreground, 0.8);
        &:hover,
        &:focus{
            color: rgba($main-foreground, 0.6);
            background-color: darken($main-background, 3%);
            fill: rgba($main-foreground, 0.6);
        }
    }
    &-price{
        color: $primary-color;
        font-weight: bold;
    }
    &-text{
        font-family: $font-headings-prod;
    }
    &-all-link{
        background-color: darken($main-background, 3%);
    }
}

{# /* // Advertising */ #}

.advertising {
    &-link { 
    color: $main-background;
    }
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}


{# /* // Filters and categories */ #}

.btn-filter{
    background: transparent;
    color:$main-foreground;
    border: 1px solid $main-foreground;
    &:hover{
        opacity: 0.6;
    }
}

.btn-more-categories {
    border-top: 1px solid rgba($main-foreground, .2);
    .btn-categories-icon{
        background: $main-background;
        border-left: 1px solid rgba($main-foreground, .2);
        border-right: 1px solid rgba($main-foreground, .2);
        border-bottom: 1px solid rgba($main-foreground, .2);
    }
}

{# /* // Grid item */ #}

.item:hover {
    box-shadow: 0 0 5px rgba($main-foreground,$opac2);
}
.item-quickshop-link {
    background: $secondary-color;
    border: 1px solid rgba($secondary-color,$opac2);
    color: $main-background;
    box-shadow: 0 0 5px rgba($main-foreground,$opac2);
    font-family: $font-nav;
 }

.item-price,
.item-name{ 
    font-family: $font-headings-prod;
}


{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.cloud-zoom-big {
    background-color: $main-background;
}

.cloud-zoom-loading { 
    color:$main-background; 
    border: 1px solid; 
    border-color: rgba($secondary-color, $opac2); 
    background:$main-foreground; 
}

{# /* // Form and info */ #}

.product-name{
    margin-bottom: 10px;
    @extend .h1;
    font-weight: normal;
}
.product-price-container{
    margin-bottom: 10px;
    font-weight: bold;
    .product-price{
        @extend .h3;
        color: $primary-color;
    }
    .product-price-compare{
        padding-left: 10px;
        text-decoration: line-through;
        opacity: 0.5;
        @extend .h3;

    }
}

{# /* // Color variations */ #}

{#/*============================================================================
  #Footer
==============================================================================*/#}

.footer-social {  
    background: rgba($secondary-color, $opac2); 
}
.footer {  
    background: rgba($secondary-color, $opac1); 
}
.footer-ship-pay {  
    background: $primary-color; 
}
.footer-legal { 
    background: rgba($secondary-color, $opac8); 
    color: rgba($main-background, $opac8) ; 
}
.social-link { 
    border: 3px solid $primary-color;
    color: $primary-color;
    fill: $primary-color;
    &:hover{
        opacity: 0.8;
    }
 }

.powered-by-logo svg { 
    fill: $main-background; 
}

{#/*============================================================================
  #Cart page
==============================================================================*/#}

{# /* // Table */ #}

.cart-table-header {
    color: $secondary-color;
    font-family: $font-headings;
    border-bottom: 1px solid rgba($secondary-color, $opac6);
}
.cart-table-row{
    border-bottom: 1px solid;
    border-color: rgba($main-foreground, .2 );
    &:hover{
        background-color: rgba($main-foreground, 0.04 );
    }
}
.cart-quantity-btn{
    color: $main-foreground; 
    fill: $main-foreground;
    border: 0;
}
input.cart-quantity-input {
  display: inline-block;
  width: 50px;
  margin: 0px;
  padding: 5px;
  color: #353535;
  font-size: 16px;
  text-align: center;
  -moz-appearance:textfield;
  &::-webkit-outer-spin-button,
  &::-webkit-inner-spin-button{
    -webkit-appearance: none;
  }
}
input.cart-quantity-input-small{
  width: 40px;
  height: 30px;
  font-size: 14px;
}
.cart-total{
    color: $primary-color;
}
.cart-promotion-number{
    color: $primary-color;
}

{# /* // Ajax cart */ #}

.ajax-cart-container{
    background: $main-background; 
    .ajax-cart-title{
        font-family: $font-headings;
    }
    .ajax-cart-table-header{ 
        font-family: $font-headings;
        border-top: 1px solid rgba($main-foreground, 0.1);
        border-bottom: 1px solid rgba($main-foreground, 0.1);
    }
    .ajax-cart-item { 
        border-bottom: 1px solid rgba($main-foreground, 0.1); 
    }
    .ajax-cart-shipping-calculator{
        background-color: rgba($main-foreground, 0.01); 
        border-top: 1px solid rgba($main-foreground, 0.1); 
        border-bottom: 1px solid rgba($main-foreground, 0.1); 
    }
}

{#/*============================================================================
  #Media queries page
==============================================================================*/#}

{# /* // max width 767px  */ #}

@media (max-width: 767px) {

    {# /* //// Texts */ #}

    {# /* Headings */ #}
    
    .h1-xs {
        font-size: 40px;
    }
    .h2-xs {
        font-size: 24px;
    }
    .h3-xs {
        font-size: 22px;
    }
    .h4-xs {
        font-size: 20px;
    }
    .h5-xs {
        font-size: 18px;
    }
    .h6-xs {
        font-size: 16px;
    }

    .title-container{
        text-align: center;
        h1{
            padding: 0;
            font-size: 24px;
        }
    }
    .frame-title{
        padding: 20px 10px;
    }

    {# /* Body */ #}
    
    .font-body-xs {
        font-size: 14px;
    }
    .font-small-xs {
      font-size: 12px;
    }
    .font-small-extra-xs {
        font-size: 10px;
    } 

    {# /* Weight */ #}

    .weight-normal-xs {
        font-weight: 400;
    }
    .weight-strong-xs {
        font-weight: 700;
    }
    .weight-light-xs {
        font-weight: 300;
    }

    {# /* //// Components */ #}

    {# /* // Wrappers */ #}


    .sticky-footer {
        position: sticky;
        bottom:0;
    }

    .sticky {
        float: left;
        width: 100%;
        display: block;
        @include prefix(position, sticky, webkit ms moz);
        top: 0;
        left: 0;
        padding: 15px;
        @include border-box();
        z-index: 1;
        background-color: $main-background;
        border-top: 1px solid rgba($main-foreground, 0.1);
        transform: translate3d(0, 0, 0);
        box-shadow: 0 2px 2px 0 rgba(0,0,0,.04), 0 3px 1px -2px rgba(0,0,0,.04), 0 1px 5px 0 rgba(0,0,0,.04);
        &-in-page {
            width: 100vw;
            top: 40px;
            margin: 0 0 20px -10px;
            border:0;
        }
    }

    {# /* // Buttons and links */ #}

   .btn-module {
        border: 3px solid rgba($secondary-color, $opac2);
        border-radius: 0;
        background: $main-background;
        &-icon{
            fill:$primary-color;
        }
    }
    .link-module{
        border-bottom: 1px solid rgba($main-foreground, .2); 
        border-top: 1px solid rgba($main-foreground, .2); 
    }

    {# /* // Forms */ #}

    .quantity{
        border-top:1px solid rgba($main-foreground, .1);
        border-bottom:1px solid rgba($main-foreground, .1);
    }

    {# /* // Breadcrumbs */ #}

    .breadcrumbs {
        padding: 0 0 10px 0;
        text-align: center;
    }

    {# /* Modals */ #}

    .modal-xs{
        background-color:$main-background; 
        &.sheet-bottom {
           background-color: transparent;
        }
        .sheet-bottom-body {
            background-color:$main-background; 
        }
        &-header{
            color: $primary-color;
            fill: $primary-color;
            &.sheet-bottom-header{
                background-color:darken($main-background, 2%);
                &:active{
                    background-color:darken($main-background, 2%);
                    color:$main-foreground;
                }
            }
            &:active{
                background-color:$primary-color;
                color:$main-background;
                fill:$main-background;
                &-icon{
                    color:$main-background;
                    fill:$main-background;
                }
            }
        }
    }

    .modal-xs-list-item{
        color: $main-foreground;
        border-bottom: 1px solid rgba($main-foreground, .25);
        &.darker{
            background-color:rgba($main-foreground, 0.02);
        }
        .modal-xs-list-icon{
            fill:$primary-color;
        }
        &:active{
            background-color:$primary-color;
            color:$main-background;
            .modal-xs-list-icon{
                color:$main-background;
                fill:$main-background;
            }
        }
        .modal-xs-radio-icon i{
            visibility: hidden;
        }
        &.selected{
            color: $main-background;
            border-right: 0;
            border-left: 0;
            border-bottom: 0;
            background: $primary-color;
            .modal-xs-radio-icon {
                background: $main-background;
                i{
                    visibility: visible; 
                    color: $primary-color;
                }
            }
        }
        .modal-xs-radio-icon {
            background: rgba($primary-color, .4);
            color: $primary-color;
        }
    }

    .modal-footer {
        border: 0;
    }

    {# /* Search */ #}

    .search-container {
         background: $main-background;
    }
    .mobile-search-input-back {
        color: $primary-color;
        background: $main-background;
    }
    .mobile-search-input-submit {
        color: $primary-color;
        background: $main-background;
    }

    {# /* // Modules with image and text */ #}

    .module-container {
        padding: 20px 0;
    }

    {# /* //// Header and nav */ #}

    .search-backdrop{
        background: rgba($main-background, .9);
    }
    .cart-box {
        border: none;
    }
    .cart-summary-icon{ 
        background: none; 
        color: $primary-color;
    }
    
    {# /* //// Product detail */ #}

    .mobile-zoom-panel{
        background:$main-background;
    }
    .product-name{
        font-size: 24px;
        text-align: center;
    }
    .product-price-container{
        margin-bottom: 20px;
        text-align: center;
    }

    {# /* //// Cart page */ #}

    input.cart-quantity-input-small{
        width: 40px;
        height: 35px;
    }
}
