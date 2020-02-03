{% raw %}@charset "UTF-8":

{#/*============================================================================

critical-css.tpl

    -This file contains all the theme critical styles wich will be loaded inline before the rest of the site
    -Rest of styling can be found in:
      -static/css/style.css --> For non critical styles witch will be loaded asynchronously
      -static/css/main-color.scss.tpl --> For color and font styles related to config/settings.txt
      -static/css/checkout.scss.tpl --> For color and font styles related to config/settings.txt applied on the checkout

==============================================================================*/#}

{#/*============================================================================
  Table of Contents

  #External CSS libraries and plugins
    // Critical part of Bootstrap v2.3.1
    // Font Awesome Sizes
    // CSS Reset
  #Critical path utilities classes
  #Components
    // Animations
    // Placeholders and preloaders
    // Images
    // Pills
    // Labels
    // Sliders
    // Banners
    // Welcome
    // Thumbs scroller
    // Notifications
  #Header and nav
    // Nav desktop
    // Nav mobile
    // Search desktop
    // Logo
    // Cart widget desktop
  #Product grid
    // Grid item
  #Product detail
    // Image
  #Cart detail
  #Media queries
    // Min width 1368px
      //// Components
	// Min width 768px and max width 979px
		//// Components
  // Max width 767px
    //// Components
    //// Header and nav
    //// Product grid
    //// Product detail
  #Utilities classes

==============================================================================*/#}

{#/*============================================================================
  #External CSS libraries and plugins
==============================================================================*/#}

{# /* // Critical part of Bootstrap v2.3.1 */ #}

.badge,.label,sub,sup{vertical-align:baseline}.thumbnail>img,img,table{max-width:100%}.clearfix:after,.container-fluid:after,.container:after,.dl-horizontal:after,.row-fluid:after,.row:after{clear:both}.btn-group>.btn.active,.btn-group>.btn:active,.btn-group>.btn:focus,.btn-group>.btn:hover,.input-append .uneditable-input:focus,.input-append input:focus,.input-append select:focus,.input-prepend .uneditable-input:focus,.input-prepend input:focus,.input-prepend select:focus{z-index:2}.dropdown,.dropup,sub,sup{position:relative}.breadcrumb,.carousel-indicators,.dropdown-menu,.media-list,.nav,.pager,.thumbnails{list-style:none}.clearfix:after,.clearfix:before{display:table;line-height:0;content:""}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}article,aside,details,figcaption,figure,footer,header,hgroup,nav,section{display:block}audio,canvas,video{display:inline-block}audio:not([controls]){display:none}html{font-size:100%;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}a:focus{outline:#333 dotted thin;outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px}a:active,a:hover{outline:0}sub,sup{font-size:75%;line-height:0}sup{top:-.5em}sub{bottom:-.25em}img{width:auto\9;height:auto;vertical-align:middle;border:0;-ms-interpolation-mode:bicubic}#map_canvas img,.google-maps img{max-width:none}button,input,select,textarea{margin:0;font-size:100%;vertical-align:middle}button::-moz-focus-inner,input::-moz-focus-inner{padding:0;border:0}button,html input[type=button],input[type=reset],input[type=submit]{cursor:pointer;-webkit-appearance:button}button,input[type=button],input[type=reset],input[type=submit],input[type=radio],input[type=checkbox],label,select{cursor:pointer}input[type=search]{-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;-webkit-appearance:textfield}.btn-block,.progress .bar{-webkit-box-sizing:border-box}input[type=search]::-webkit-search-cancel-button,input[type=search]::-webkit-search-decoration{-webkit-appearance:none}textarea{overflow:auto}@media print{blockquote,img,pre,tr{page-break-inside:avoid}*{color:#000!important;text-shadow:none!important;background:0 0!important;box-shadow:none!important}a,a:visited{text-decoration:underline}a[href]:after{content:" (" attr(href) ")"}abbr[title]:after{content:" (" attr(title) ")"}.ir a:after,a[href^="#"]:after,a[href^="javascript:"]:after{content:""}blockquote,pre{border:1px solid #999}thead{display:table-header-group}img{max-width:100%!important}@page{margin:.5cm}h2,h3,p{orphans:3;widows:3}h2,h3{page-break-after:avoid}}.dropdown-menu,.popover{-moz-background-clip:padding}body{margin:0;font-family:"Helvetica Neue",Helvetica,Arial,sans-serif;font-size:14px;line-height:20px}.row-fluid:after,.row-fluid:before,.row:after,.row:before{display:table;line-height:0;content:""}a{text-decoration:none}a:focus,a:hover{text-decoration:underline}.img-rounded{-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,.1);box-shadow:0 1px 3px rgba(0,0,0,.1)}.img-circle{-webkit-border-radius:500px;-moz-border-radius:500px;border-radius:500px}.row{margin-left:-20px}[class*=span]{float:left;min-height:1px;margin-left:20px}.container,.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container{width:980px}.span12{width:940px}.span11{width:860px}.span10{width:780px}.span9{width:700px}.span8{width:620px}.span7{width:540px}.span6{width:460px}.span5{width:380px}.span4{width:300px}.span3{width:220px}.span2{width:140px}.span1{width:60px}.row-fluid,.row-fluid .span12{width:100%}.offset12{margin-left:980px}.offset11{margin-left:900px}.offset10{margin-left:820px}.offset9{margin-left:740px}.offset8{margin-left:660px}.offset7{margin-left:580px}.offset6{margin-left:500px}.offset5{margin-left:420px}.offset4{margin-left:340px}.offset3{margin-left:260px}.offset2{margin-left:180px}.offset1{margin-left:100px}.row-fluid [class*=span]{display:block;float:left;width:100%;min-height:20px;margin-left:2.127659574468085%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*=span]:first-child{margin-left:0}.row-fluid .controls-row [class*=span]+[class*=span]{margin-left:2.127659574468085%}.row-fluid .span11{width:91.48936170212765%}.row-fluid .span10{width:82.97872340425532%}.row-fluid .span9{width:74.46808510638297%}.row-fluid .span8{width:65.95744680851064%}.row-fluid .span7{width:57.44680851063829%}.row-fluid .span6{width:48.93617021276595%}.row-fluid .span5{width:40.42553191489362%}.row-fluid .span4{width:31.914893617021278%}.row-fluid .span3{width:23.404255319148934%}.row-fluid .span2{width:14.893617021276595%}.row-fluid .span1{width:6.382978723404255%}.row-fluid .offset12{margin-left:104.25531914893617%}.row-fluid .offset12:first-child{margin-left:102.12765957446808%}.row-fluid .offset11{margin-left:95.74468085106382%}.row-fluid .offset11:first-child{margin-left:93.61702127659574%}.row-fluid .offset10{margin-left:87.23404255319149%}.row-fluid .offset10:first-child{margin-left:85.1063829787234%}.row-fluid .offset9{margin-left:78.72340425531914%}.row-fluid .offset9:first-child{margin-left:76.59574468085106%}.row-fluid .offset8{margin-left:70.2127659574468%}.row-fluid .offset8:first-child{margin-left:68.08510638297872%}.row-fluid .offset7{margin-left:61.70212765957446%}.row-fluid .offset7:first-child{margin-left:59.574468085106375%}.row-fluid .offset6{margin-left:53.191489361702125%}.row-fluid .offset6:first-child{margin-left:51.063829787234035%}.row-fluid .offset5{margin-left:44.68085106382979%}.row-fluid .offset5:first-child{margin-left:42.5531914893617%}.row-fluid .offset4{margin-left:36.170212765957444%}.row-fluid .offset4:first-child{margin-left:34.04255319148936%}.row-fluid .offset3{margin-left:27.659574468085104%}.row-fluid .offset3:first-child{margin-left:25.53191489361702%}.row-fluid .offset2{margin-left:19.148936170212764%}.row-fluid .offset2:first-child{margin-left:17.02127659574468%}.row-fluid .offset1{margin-left:10.638297872340425%}.row-fluid .offset1:first-child{margin-left:8.51063829787234%}.row-fluid [class*=span].hide,[class*=span].hide{display:none}.container-fluid:after,.container-fluid:before,.container:after,.container:before{display:table;line-height:0;content:""}.row-fluid [class*=span].pull-right,[class*=span].pull-right{float:right}.container{margin-right:auto;margin-left:auto}.container-fluid{padding-right:20px;padding-left:20px}p{margin:0 0 10px}.lead{margin-bottom:20px;font-size:21px;font-weight:200;line-height:30px}dd,dt,li{line-height:20px}small{font-size:85%}strong{font-weight:700}em{font-style:italic}address,cite{font-style:normal}.muted{color:#999}a.muted:focus,a.muted:hover{color:grey}.text-warning{color:#c09853}a.text-warning:focus,a.text-warning:hover{color:#a47e3c}.text-error{color:#b94a48}a.text-error:focus,a.text-error:hover{color:#953b39}.text-info{color:#3a87ad}a.text-info:focus,a.text-info:hover{color:#2d6987}.text-success{color:#468847}a.text-success:focus,a.text-success:hover{color:#356635}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}h1,h2,h3,h4,h5,h6{margin:10px 0;font-family:inherit;font-weight:700;line-height:20px;color:inherit;text-rendering:optimizelegibility}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{font-weight:400;line-height:1;color:#999}h1,h2,h3{line-height:40px}h1{font-size:38.5px}h2{font-size:31.5px}h1 small,h3{font-size:24.5px}h2 small,h4{font-size:17.5px}h3 small,h4 small,h5{font-size:14px}h6{font-size:11.9px}.page-header{padding-bottom:9px;margin:20px 0 30px;border-bottom:1px solid #eee}blockquote p,ol ol,ol ul,ul ol,ul ul{margin-bottom:0}address,dl,legend,pre.prettyprint{margin-bottom:20px}ol,ul{padding:0;margin:0 0 10px 25px}ol.inline,ol.unstyled,ul.inline,ul.unstyled{margin-left:0;list-style:none}ol.inline>li,ul.inline>li{display:inline-block;padding-right:5px;padding-left:5px}dt{font-weight:700}dd{margin-left:10px}.dl-horizontal:after,.dl-horizontal:before{display:table;line-height:0;content:""}address,blockquote small,pre{line-height:20px;display:block}.dl-horizontal dt{float:left;width:160px;overflow:hidden;clear:left;text-align:right;text-overflow:ellipsis;white-space:nowrap}.controls-row:after,.dropdown-menu>li>a,.form-actions:after,.form-horizontal .control-group:after,.modal-footer:after,.nav-pills:after,.nav-tabs:after,.navbar-form:after,.navbar-inner:after,.pager:after,.thumbnails:after{clear:both}pre,pre code{white-space:pre}.dl-horizontal dd{margin-left:180px}hr{margin:20px 0;border:0;border-top:1px solid #eee;border-bottom:1px solid #fff}abbr[data-original-title],abbr[title]{cursor:help;border-bottom:1px dotted #999}abbr.initialism{font-size:90%;text-transform:uppercase}blockquote{padding:0 0 0 15px;margin:0 0 20px;border-left:5px solid #eee}blockquote p{font-size:17.5px;font-weight:300;line-height:1.25}blockquote small{color:#999}blockquote small:before{content:'\2014 \00A0'}blockquote.pull-right{float:right;padding-right:15px;padding-left:0;border-right:5px solid #eee;border-left:0}blockquote.pull-right p,blockquote.pull-right small{text-align:right}.btn,.pagination-centered{text-align:center}blockquote.pull-right small:before{content:''}blockquote.pull-right small:after{content:'\00A0 \2014'}blockquote:after,blockquote:before,q:after,q:before{content:""}code,pre{padding:0 3px 2px;font-family:Monaco,Menlo,Consolas,"Courier New",monospace;font-size:12px;color:#333;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}code{padding:2px 4px;color:#d14;white-space:nowrap;background-color:#f7f7f9;border:1px solid #e1e1e8}pre{padding:9.5px;margin:0 0 10px;font-size:13px;word-break:break-all;word-wrap:break-word;white-space:pre-wrap;background-color:#f5f5f5;border:1px solid #ccc;border:1px solid rgba(0,0,0,.15);-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}fieldset,legend,pre code{padding:0;border:0}pre code{color:inherit;white-space:pre-wrap;background-color:transparent}.pre-scrollable{max-height:340px;overflow-y:scroll}form{margin:0 0 20px}fieldset{margin:0}legend{display:block;width:100%;font-size:21px;line-height:40px;color:#333;border-bottom:1px solid #e5e5e5}legend small{font-size:15px;color:#999}button,input,label,select,textarea{font-size:12px;font-weight:300;line-height:20px}label{display:block;margin-bottom:5px}.uneditable-input,input[type=text],input[type=password],input[type=datetime],input[type=datetime-local],input[type=date],input[type=month],input[type=time],input[type=week],input[type=number],input[type=email],input[type=url],input[type=tel],input[type=color],input[type=search],select,textarea{display:inline-block;height:18px;padding:2px;margin:10px 0;font-size:14px;line-height:20px;color:#555;vertical-align:middle}.controls-row .checkbox[class*=span],.controls-row .radio[class*=span],.controls>.checkbox:first-child,.controls>.radio:first-child{padding-top:5px}.uneditable-input,input,textarea{width:206px}textarea{height:auto}.uneditable-input,input[type=text],input[type=password],input[type=datetime],input[type=datetime-local],input[type=date],input[type=month],input[type=time],input[type=week],input[type=number],input[type=email],input[type=url],input[type=tel],input[type=color],input[type=search],textarea{background-color:#fff;border:1px solid #e5e5e5}.uneditable-input:focus,input[type=text]:focus,input[type=password]:focus,input[type=datetime]:focus,input[type=datetime-local]:focus,input[type=date]:focus,input[type=month]:focus,input[type=time]:focus,input[type=week]:focus,input[type=number]:focus,input[type=email]:focus,input[type=url]:focus,input[type=tel]:focus,input[type=color]:focus,input[type=search]:focus,textarea:focus{border-color:rgba(82,168,236,.8);outline:0;outline:dotted thin\9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(82,168,236,.6)}input[type=radio],input[type=checkbox]{margin:4px 0 0;margin-top:1px\9;line-height:normal}input[type=button],input[type=reset],input[type=file],input[type=image],input[type=submit],input[type=radio],input[type=checkbox]{width:auto}input[type=file],select{height:30px;line-height:30px}select{width:220px;background-color:#fff;border:1px solid #ccc}select[multiple],select[size]{height:auto}input[type=file]:focus,input[type=radio]:focus,input[type=checkbox]:focus,select:focus{outline:#333 dotted thin;outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px}.uneditable-input,.uneditable-textarea{color:#999;cursor:not-allowed;background-color:#fcfcfc;border-color:#ccc;-webkit-box-shadow:inset 0 1px 2px rgba(0,0,0,.025);-moz-box-shadow:inset 0 1px 2px rgba(0,0,0,.025);box-shadow:inset 0 1px 2px rgba(0,0,0,.025)}.uneditable-input{overflow:hidden;white-space:nowrap}.uneditable-textarea{width:auto;height:auto}input:-moz-placeholder,textarea:-moz-placeholder{color:#999}input:-ms-input-placeholder,textarea:-ms-input-placeholder{color:#999}input::-webkit-input-placeholder,textarea::-webkit-input-placeholder{color:#999}.checkbox,.radio{min-height:20px;padding-left:20px}.checkbox input[type=checkbox],.radio input[type=radio]{float:left;margin-left:-20px}.checkbox.inline,.radio.inline{display:inline-block;padding-top:5px;margin-bottom:0;vertical-align:middle}.checkbox.inline+.checkbox.inline,.radio.inline+.radio.inline{margin-left:10px}.input-mini{width:60px}.input-small{width:90px}.input-medium{width:150px}.input-large{width:210px}.input-xlarge{width:270px}.input-xxlarge{width:530px}.row-fluid .uneditable-input[class*=span],.row-fluid input[class*=span],.row-fluid select[class*=span],.row-fluid textarea[class*=span],.uneditable-input[class*=span],input[class*=span],select[class*=span],textarea[class*=span]{float:none;margin-left:0}.input-append .uneditable-input[class*=span],.input-append input[class*=span],.input-prepend .uneditable-input[class*=span],.input-prepend input[class*=span],.row-fluid .input-append [class*=span],.row-fluid .input-prepend [class*=span],.row-fluid .uneditable-input[class*=span],.row-fluid input[class*=span],.row-fluid select[class*=span],.row-fluid textarea[class*=span]{display:inline-block}.controls-row:after,.controls-row:before,.form-actions:after,.form-actions:before{display:table;line-height:0;content:""}.uneditable-input,input,textarea{margin-left:0}.controls-row [class*=span]+[class*=span]{margin-left:20px}.uneditable-input.span12,input.span12,textarea.span12{width:926px}.uneditable-input.span11,input.span11,textarea.span11{width:846px}.uneditable-input.span10,input.span10,textarea.span10{width:766px}.uneditable-input.span9,input.span9,textarea.span9{width:686px}.uneditable-input.span8,input.span8,textarea.span8{width:606px}.uneditable-input.span7,input.span7,textarea.span7{width:526px}.uneditable-input.span6,input.span6,textarea.span6{width:446px}.uneditable-input.span5,input.span5,textarea.span5{width:366px}.uneditable-input.span4,input.span4,textarea.span4{width:286px}.uneditable-input.span3,input.span3,textarea.span3{width:206px}.uneditable-input.span2,input.span2,textarea.span2{width:126px}.uneditable-input.span1,input.span1,textarea.span1{width:46px}.controls-row [class*=span],.row-fluid .controls-row [class*=span]{float:left}input[disabled],input[readonly],select[disabled],select[readonly],textarea[disabled],textarea[readonly]{cursor:not-allowed;background-color:#eee}input[type=radio][disabled],input[type=radio][readonly],input[type=checkbox][disabled],input[type=checkbox][readonly]{background-color:transparent}.control-group.warning .checkbox,.control-group.warning .control-label,.control-group.warning .help-block,.control-group.warning .help-inline,.control-group.warning .radio,.control-group.warning input,.control-group.warning select,.control-group.warning textarea{color:#c09853}.control-group.warning input,.control-group.warning select,.control-group.warning textarea{border-color:#c09853;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.control-group.warning input:focus,.control-group.warning select:focus,.control-group.warning textarea:focus{border-color:#a47e3c;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #dbc59e;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #dbc59e;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #dbc59e}.control-group.warning .input-append .add-on,.control-group.warning .input-prepend .add-on{color:#c09853;background-color:#fcf8e3;border-color:#c09853}.control-group.error .checkbox,.control-group.error .control-label,.control-group.error .help-block,.control-group.error .help-inline,.control-group.error .radio,.control-group.error input,.control-group.error select,.control-group.error textarea{color:#b94a48}.control-group.error input,.control-group.error select,.control-group.error textarea{border-color:#b94a48;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.control-group.error input:focus,.control-group.error select:focus,.control-group.error textarea:focus{border-color:#953b39;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #d59392;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #d59392;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #d59392}.control-group.error .input-append .add-on,.control-group.error .input-prepend .add-on{color:#b94a48;background-color:#f2dede;border-color:#b94a48}.control-group.success .checkbox,.control-group.success .control-label,.control-group.success .help-block,.control-group.success .help-inline,.control-group.success .radio,.control-group.success input,.control-group.success select,.control-group.success textarea{color:#468847}.control-group.success input,.control-group.success select,.control-group.success textarea{border-color:#468847;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.control-group.success input:focus,.control-group.success select:focus,.control-group.success textarea:focus{border-color:#356635;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #7aba7b;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #7aba7b;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #7aba7b}.control-group.success .input-append .add-on,.control-group.success .input-prepend .add-on{color:#468847;background-color:#dff0d8;border-color:#468847}.control-group.info .checkbox,.control-group.info .control-label,.control-group.info .help-block,.control-group.info .help-inline,.control-group.info .radio,.control-group.info input,.control-group.info select,.control-group.info textarea{color:#3a87ad}.control-group.info input,.control-group.info select,.control-group.info textarea{border-color:#3a87ad;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)}.control-group.info input:focus,.control-group.info select:focus,.control-group.info textarea:focus{border-color:#2d6987;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #7ab5d3;-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #7ab5d3;box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #7ab5d3}.control-group.info .input-append .add-on,.control-group.info .input-prepend .add-on{color:#3a87ad;background-color:#d9edf7;border-color:#3a87ad}input:focus:invalid,select:focus:invalid,textarea:focus:invalid{color:#b94a48;border-color:#ee5f5b}input:focus:invalid:focus,select:focus:invalid:focus,textarea:focus:invalid:focus{border-color:#e9322d;-webkit-box-shadow:0 0 6px #f8b9b7;-moz-box-shadow:0 0 6px #f8b9b7;box-shadow:0 0 6px #f8b9b7}.form-actions{padding:19px 20px 20px;margin-top:20px;margin-bottom:20px;background-color:#f5f5f5;border-top:1px solid #e5e5e5}.help-block,.help-inline{color:#595959}.help-block{display:block;margin-bottom:10px}.help-inline{display:inline-block;padding-left:5px;vertical-align:middle}.input-append,.input-prepend{margin-bottom:10px;font-size:0;white-space:nowrap;vertical-align:middle}.input-append .dropdown-menu,.input-append .popover,.input-append .uneditable-input,.input-append input,.input-append select,.input-prepend .dropdown-menu,.input-prepend .popover,.input-prepend .uneditable-input,.input-prepend input,.input-prepend select{font-size:14px}.input-append .uneditable-input,.input-append input,.input-append select,.input-prepend .uneditable-input,.input-prepend input,.input-prepend select{position:relative;margin-bottom:0;vertical-align:top}.input-append .add-on,.input-prepend .add-on{display:inline-block;width:auto;height:20px;min-width:16px;padding:4px 5px;font-size:14px;font-weight:400;line-height:20px;text-align:center;text-shadow:0 1px 0 #fff;background-color:#eee;border:1px solid #ccc}.input-append .add-on,.input-append .btn,.input-append .btn-group>.dropdown-toggle,.input-prepend .add-on,.input-prepend .btn,.input-prepend .btn-group>.dropdown-toggle{vertical-align:top;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.input-append .active,.input-prepend .active{background-color:#a9dba9;border-color:#46a546}.input-prepend .add-on,.input-prepend .btn{margin-right:-1px}.input-prepend .add-on:first-child,.input-prepend .btn:first-child{-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.input-append .uneditable-input+.btn-group .btn:last-child,.input-append input+.btn-group .btn:last-child,.input-append select+.btn-group .btn:last-child{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-append .add-on,.input-append .btn,.input-append .btn-group{margin-left:-1px}.input-prepend.input-append .uneditable-input,.input-prepend.input-append input,.input-prepend.input-append select{-webkit-border-radius:0;-moz-border-radius:0;border-radius:0}.input-prepend.input-append .uneditable-input+.btn-group .btn,.input-prepend.input-append input+.btn-group .btn,.input-prepend.input-append select+.btn-group .btn{-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-prepend.input-append .add-on:first-child,.input-prepend.input-append .btn:first-child{margin-right:-1px;-webkit-border-radius:4px 0 0 4px;-moz-border-radius:4px 0 0 4px;border-radius:4px 0 0 4px}.input-prepend.input-append .add-on:last-child,.input-prepend.input-append .btn:last-child{margin-left:-1px;-webkit-border-radius:0 4px 4px 0;-moz-border-radius:0 4px 4px 0;border-radius:0 4px 4px 0}.input-prepend.input-append .btn-group:first-child{margin-left:0}input.search-query{padding-right:14px;padding-right:4px\9;padding-left:14px;padding-left:4px\9;margin-bottom:0;-webkit-border-radius:15px;-moz-border-radius:15px;border-radius:15px}.form-search .input-append .search-query{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px}.form-search .input-append .btn,.form-search .input-prepend .search-query{-webkit-border-radius:0 14px 14px 0;-moz-border-radius:0 14px 14px 0;border-radius:0 14px 14px 0}.form-search .input-prepend .btn{-webkit-border-radius:14px 0 0 14px;-moz-border-radius:14px 0 0 14px;border-radius:14px 0 0 14px}.btn,.btn-group,.btn-group-vertical{display:inline-block}.btn-block,input[type=button].btn-block,input[type=reset].btn-block,input[type=submit].btn-block{width:100%}.fade{opacity:0;-webkit-transition:opacity .15s linear;-moz-transition:opacity .15s linear;-o-transition:opacity .15s linear;transition:opacity .15s linear}.fade.in{opacity:1}.collapse{height:0;overflow:hidden;-webkit-transition:height .35s ease;-moz-transition:height .35s ease;-o-transition:height .35s ease;transition:height .35s ease}.collapse.in{height:auto}.close{float:right;font-size:20px;color:#000;text-shadow:0 1px 0 #fff;opacity:.2;filter:alpha(opacity=20)}.close:focus,.close:hover{color:#000;text-decoration:none;cursor:pointer;opacity:.4;filter:alpha(opacity=40)}button.close{padding:0;cursor:pointer;background:0 0;border:0;-webkit-appearance:none}.btn,.btn-danger,.btn-info,.btn-inverse,.btn-primary,.btn-success,.btn-warning,.navbar-inverse .btn-navbar,.navbar-inverse .navbar-inner,.progress,.progress .bar,.progress .bar-danger,.progress .bar-info,.progress .bar-success,.progress .bar-warning,.progress-danger .bar,.progress-info .bar,.progress-success .bar,.progress-warning .bar{background-repeat:repeat-x}.btn{padding:4px 12px;margin-bottom:0;font-size:14px;line-height:20px;color:#333;vertical-align:middle;cursor:pointer;background-color:#f5f5f5;background-image:-moz-linear-gradient(top,#fff,#e6e6e6);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fff),to(#e6e6e6));background-image:-webkit-linear-gradient(top,#fff,#e6e6e6);background-image:-o-linear-gradient(top,#fff,#e6e6e6);background-image:linear-gradient(to bottom,#fff,#e6e6e6);border:1px solid #ccc;border-color:#e6e6e6 #e6e6e6 #bfbfbf;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);border-bottom-color:#b3b3b3;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false);-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05)}.btn.active,.btn.disabled,.btn:active,.btn:focus,.btn:hover,.btn[disabled]{color:#333;background-color:#e6e6e6}.btn:focus,.btn:hover{color:#333;text-decoration:none;background-position:0 -15px;-webkit-transition:background-position .1s linear;-moz-transition:background-position .1s linear;-o-transition:background-position .1s linear;transition:background-position .1s linear}.btn:focus{outline:#333 dotted thin;outline:-webkit-focus-ring-color auto 5px;outline-offset:-2px}.btn.active,.btn:active{background-color:#ccc\9;background-image:none;outline:0;-webkit-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05);box-shadow:inset 0 2px 4px rgba(0,0,0,.15),0 1px 2px rgba(0,0,0,.05)}.btn.disabled,.btn[disabled]{cursor:default;background-image:none;opacity:.65;filter:alpha(opacity=65);-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.accordion-toggle,.btn-link,.nav>.dropdown.active>a:focus,.nav>.dropdown.active>a:hover{cursor:pointer}.btn-large{padding:11px 19px;font-size:17.5px;-webkit-border-radius:6px;-moz-border-radius:6px;border-radius:6px}.btn-large [class*=" icon-"],.btn-large [class^=icon-]{margin-top:4px}.btn-small{padding:2px 10px;font-size:11.9px;border-radius:3px}.btn-small [class*=" icon-"],.btn-small [class^=icon-]{margin-top:0}.btn-mini [class*=" icon-"],.btn-mini [class^=icon-]{margin-top:-1px}.btn-mini{padding:0 6px;font-size:10.5px;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.btn-block{display:block;padding-right:0;padding-left:0;-moz-box-sizing:border-box;box-sizing:border-box}.btn-block+.btn-block{margin-top:5px}.btn-primary{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#006dcc;background-image:-moz-linear-gradient(top,#08c,#04c);background-image:-webkit-gradient(linear,0 0,0 100%,from(#08c),to(#04c));background-image:-webkit-linear-gradient(top,#08c,#04c);background-image:-o-linear-gradient(top,#08c,#04c);background-image:linear-gradient(to bottom,#08c,#04c);border-color:#04c #04c #002a80;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0044cc', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-primary.active,.btn-primary.disabled,.btn-primary:active,.btn-primary:focus,.btn-primary:hover,.btn-primary[disabled]{color:#fff;background-color:#04c}.btn-primary.active,.btn-primary:active{background-color:#039\9}.btn-warning{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#faa732;background-image:-moz-linear-gradient(top,#fbb450,#f89406);background-image:-webkit-gradient(linear,0 0,0 100%,from(#fbb450),to(#f89406));background-image:-webkit-linear-gradient(top,#fbb450,#f89406);background-image:-o-linear-gradient(top,#fbb450,#f89406);background-image:linear-gradient(to bottom,#fbb450,#f89406);border-color:#f89406 #f89406 #ad6704;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fffbb450', endColorstr='#fff89406', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-warning.active,.btn-warning.disabled,.btn-warning:active,.btn-warning:focus,.btn-warning:hover,.btn-warning[disabled]{color:#fff;background-color:#f89406}.btn-warning.active,.btn-warning:active{background-color:#c67605\9}.btn-danger{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#da4f49;background-image:-moz-linear-gradient(top,#ee5f5b,#bd362f);background-image:-webkit-gradient(linear,0 0,0 100%,from(#ee5f5b),to(#bd362f));background-image:-webkit-linear-gradient(top,#ee5f5b,#bd362f);background-image:-o-linear-gradient(top,#ee5f5b,#bd362f);background-image:linear-gradient(to bottom,#ee5f5b,#bd362f);border-color:#bd362f #bd362f #802420;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffee5f5b', endColorstr='#ffbd362f', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-danger.active,.btn-danger.disabled,.btn-danger:active,.btn-danger:focus,.btn-danger:hover,.btn-danger[disabled]{color:#fff;background-color:#bd362f}.btn-danger.active,.btn-danger:active{background-color:#942a25\9}.btn-success{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#5bb75b;background-image:-moz-linear-gradient(top,#62c462,#51a351);background-image:-webkit-gradient(linear,0 0,0 100%,from(#62c462),to(#51a351));background-image:-webkit-linear-gradient(top,#62c462,#51a351);background-image:-o-linear-gradient(top,#62c462,#51a351);background-image:linear-gradient(to bottom,#62c462,#51a351);border-color:#51a351 #51a351 #387038;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff62c462', endColorstr='#ff51a351', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-success.active,.btn-success.disabled,.btn-success:active,.btn-success:focus,.btn-success:hover,.btn-success[disabled]{color:#fff;background-color:#51a351}.btn-success.active,.btn-success:active{background-color:#408140\9}.btn-info{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#49afcd;background-image:-moz-linear-gradient(top,#5bc0de,#2f96b4);background-image:-webkit-gradient(linear,0 0,0 100%,from(#5bc0de),to(#2f96b4));background-image:-webkit-linear-gradient(top,#5bc0de,#2f96b4);background-image:-o-linear-gradient(top,#5bc0de,#2f96b4);background-image:linear-gradient(to bottom,#5bc0de,#2f96b4);border-color:#2f96b4 #2f96b4 #1f6377;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bc0de', endColorstr='#ff2f96b4', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.btn-info.active,.btn-info.disabled,.btn-info:active,.btn-info:focus,.btn-info:hover,.btn-info[disabled]{color:#fff;background-color:#2f96b4}.btn-info.active,.btn-info:active{background-color:#24748c\9}.btn-inverse{color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,.25);background-color:#363636;background-image:-moz-linear-gradient(top,#444,#222);background-image:-webkit-gradient(linear,0 0,0 100%,from(#444),to(#222));background-image:-webkit-linear-gradient(top,#444,#222);background-image:-o-linear-gradient(top,#444,#222);background-image:linear-gradient(to bottom,#444,#222);border-color:#222 #222 #000;border-color:rgba(0,0,0,.1) rgba(0,0,0,.1) rgba(0,0,0,.25);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff444444', endColorstr='#ff222222', GradientType=0);filter:progid:DXImageTransform.Microsoft.gradient(enabled=false)}.alert,.nav-header,.nav-list .nav-header,.nav-list>li>a{text-shadow:0 1px 0 rgba(255,255,255,.5)}.btn-inverse.active,.btn-inverse.disabled,.btn-inverse:active,.btn-inverse:focus,.btn-inverse:hover,.btn-inverse[disabled]{color:#fff;background-color:#222}.btn-inverse.active,.btn-inverse:active{background-color:#080808\9}button.btn::-moz-focus-inner,input[type=submit].btn::-moz-focus-inner{padding:0;border:0}.btn-group>.btn,.btn-link{-webkit-border-radius:0;-moz-border-radius:0}.btn-link,.btn-link:active,.btn-link[disabled]{background-color:transparent;background-image:none;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.btn-link{color:#08c;border-color:transparent;border-radius:0}.btn-link:focus,.btn-link:hover{color:#005580;text-decoration:underline;background-color:transparent}.btn-link[disabled]:focus,.btn-link[disabled]:hover{color:#333;text-decoration:none}.modal-backdrop{position:fixed;top:0;right:0;bottom:0;left:0;z-index:1040;background-color:#FFF}.modal-backdrop.fade{opacity:0}.modal-backdrop,.modal-backdrop.fade.in{opacity:.9;filter:alpha(opacity=90)}.modal{position:fixed;top:10%;left:50%;z-index:1050;width:775px;margin-left:-280px;background-color:#fff;border:1px solid #b5b5b5;border:1px solid rgba(0,0,0,.3)}.modal.fade{top:-25%;-webkit-transition:opacity .3s linear,top .3s ease-out;-moz-transition:opacity .3s linear,top .3s ease-out;-o-transition:opacity .3s linear,top .3s ease-out;transition:opacity .3s linear,top .3s ease-out}.modal.fade.in{top:10%}.modal-header{padding:9px 15px;border-bottom:1px solid #eee}.modal-header .close{margin-top:2px}.modal-header h3{margin:0;line-height:30px}.modal-body{position:relative;max-height:600px;padding:15px;overflow-y:auto}.popover,.tooltip,.tooltip-arrow{position:absolute}.modal-footer{padding:14px 15px 15px;text-align:right;background-color:#f5f5f5;border-top:1px solid #ddd;-webkit-border-radius:0 0 6px 6px;-moz-border-radius:0 0 6px 6px;border-radius:0 0 6px 6px;-webkit-box-shadow:inset 0 1px 0 #fff;-moz-box-shadow:inset 0 1px 0 #fff;box-shadow:inset 0 1px 0 #fff}.modal-footer:after,.modal-footer:before{display:table;line-height:0;content:""}.modal-footer .btn+.btn{margin-bottom:0;margin-left:5px}.modal-footer .btn-group .btn+.btn{margin-left:-1px}.modal-footer .btn-block+.btn-block{margin-left:0}.pull-right{float:right}.pull-left{float:left}.hide{display:none}.show{display:block}.invisible{visibility:hidden}.affix{position:fixed}

.clearfix:after,.clearfix:before{display:table;line-height:0;content:""}.clearfix:after{clear:both}.hide-text{font:0/0 a;color:transparent;text-shadow:none;background-color:transparent;border:0}.input-block-level{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}@-ms-viewport{width:device-width}.hidden{display:none}.hidden-desktop,.visible-phone,.visible-tablet{display:none!important}.visible-desktop{display:inherit!important}.quick-content{width:775px}nav.mobile{display:none;border:none}@media (min-width:768px) and (max-width:979px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-tablet{display:inherit!important}.hidden-tablet{display:none!important}.quick-content{width:100%}}@media (max-width:767px){.hidden-desktop{display:inherit!important}.visible-desktop{display:none!important}.visible-phone{display:inherit!important}.hidden-phone{display:none!important}.quick-content{width:100%}nav.mobile{display:block;padding:10px 0}#menu,.col-price,.firstrow{display:none}}.visible-print{display:none!important}@media print{.visible-print{display:inherit!important}.hidden-print{display:none!important}}@media (min-width:1200px){.row-fluid:after,.row-fluid:before,.row:after,.row:before{display:table;line-height:0;content:""}.row-fluid:after,.row:after{clear:both}.row{margin-left:-30px}[class*=span]{float:left;min-height:1px;margin-left:30px}.container,.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container,.span12{width:1170px}.span11{width:1070px}.span10{width:970px}.span9{width:870px}.span8{width:770px}.span7{width:670px}.span6{width:570px}.span5{width:470px}.span4{width:370px}.span3{width:270px}.span2{width:170px}.span1{width:70px}.offset12{margin-left:1230px}.offset11{margin-left:1130px}.offset10{margin-left:1030px}.offset9{margin-left:930px}.offset8{margin-left:830px}.offset7{margin-left:730px}.offset6{margin-left:630px}.offset5{margin-left:530px}.offset4{margin-left:430px}.offset3{margin-left:330px}.offset2{margin-left:230px}.offset1{margin-left:130px}.row-fluid{width:100%}.row-fluid [class*=span]{display:block;float:left;width:100%;min-height:20px;margin-left:2.564102564102564%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*=span]:first-child{margin-left:0}.row-fluid #twitter [class*=span]{margin-left:10px;width:47%}.row-fluid .controls-row [class*=span]+[class*=span]{margin-left:2.564102564102564%}.row-fluid .span12{width:100%}.row-fluid .span11{width:91.45299145299145%}.row-fluid .span10{width:82.90598290598291%}.row-fluid .span9{width:74.35897435897436%}.row-fluid .span8{width:65.81196581196582%}.row-fluid .span7{width:57.26495726495726%}.row-fluid .span6{width:48.717948717948715%}.row-fluid .span5{width:40.17094017094017%}.row-fluid .span4{width:31.623931623931625%}.row-fluid .span3{width:23.076923076923077%}.row-fluid .span2{width:14.52991452991453%}.row-fluid .span1{width:5.982905982905983%}.row-fluid .offset12{margin-left:105.12820512820512%}.row-fluid .offset12:first-child{margin-left:102.56410256410257%}.row-fluid .offset11{margin-left:96.58119658119658%}.row-fluid .offset11:first-child{margin-left:94.01709401709402%}.row-fluid .offset10{margin-left:88.03418803418803%}.row-fluid .offset10:first-child{margin-left:85.47008547008548%}.row-fluid .offset9{margin-left:79.48717948717949%}.row-fluid .offset9:first-child{margin-left:76.92307692307693%}.row-fluid .offset8{margin-left:70.94017094017094%}.row-fluid .offset8:first-child{margin-left:68.37606837606839%}.row-fluid .offset7{margin-left:62.393162393162385%}.row-fluid .offset7:first-child{margin-left:59.82905982905982%}.row-fluid .offset6{margin-left:53.84615384615384%}.row-fluid .offset6:first-child{margin-left:51.28205128205128%}.row-fluid .offset5{margin-left:45.299145299145295%}.row-fluid .offset5:first-child{margin-left:42.73504273504273%}.row-fluid .offset4{margin-left:36.75213675213675%}.row-fluid .offset4:first-child{margin-left:34.18803418803419%}.row-fluid .offset3{margin-left:28.205128205128204%}.row-fluid .offset3:first-child{margin-left:25.641025641025642%}.row-fluid .offset2{margin-left:19.65811965811966%}.row-fluid .offset2:first-child{margin-left:17.094017094017094%}.row-fluid .offset1{margin-left:11.11111111111111%}.row-fluid .offset1:first-child{margin-left:8.547008547008547%}.uneditable-input,input,textarea{margin-left:0}.controls-row [class*=span]+[class*=span]{margin-left:30px}.uneditable-input.span12,input.span12,textarea.span12{width:1156px}.uneditable-input.span11,input.span11,textarea.span11{width:1056px}.uneditable-input.span10,input.span10,textarea.span10{width:956px}.uneditable-input.span9,input.span9,textarea.span9{width:856px}.uneditable-input.span8,input.span8,textarea.span8{width:756px}.uneditable-input.span7,input.span7,textarea.span7{width:656px}.uneditable-input.span6,input.span6,textarea.span6{width:556px}.uneditable-input.span5,input.span5,textarea.span5{width:456px}.uneditable-input.span4,input.span4,textarea.span4{width:356px}.uneditable-input.span3,input.span3,textarea.span3{width:256px}.uneditable-input.span2,input.span2,textarea.span2{width:156px}.uneditable-input.span1,input.span1,textarea.span1{width:56px}.thumbnails{margin-left:-30px}.thumbnails>li{margin-left:30px}.row-fluid .thumbnails{margin-left:0}}@media (min-width:768px) and (max-width:979px){.row-fluid:after,.row-fluid:before,.row:after,.row:before{display:table;line-height:0;content:""}.row-fluid:after,.row:after{clear:both}.row{margin-left:-20px}[class*=span]{float:left;min-height:1px;margin-left:20px}.container,.navbar-fixed-bottom .container,.navbar-fixed-top .container,.navbar-static-top .container,.span12{width:724px}.span11{width:662px}.span10{width:600px}.span9{width:538px}.span8{width:476px}.span7{width:414px}.span6{width:352px}.span5{width:290px}.span4{width:228px}.span3{width:166px}.span2{width:104px}.span1{width:42px}.row-fluid,.row-fluid .span12{width:100%}.offset12{margin-left:764px}.offset11{margin-left:702px}.offset10{margin-left:640px}.offset9{margin-left:578px}.offset8{margin-left:516px}.offset7{margin-left:454px}.offset6{margin-left:392px}.offset5{margin-left:330px}.offset4{margin-left:268px}.offset3{margin-left:206px}.offset2{margin-left:144px}.offset1{margin-left:82px}.row-fluid [class*=span]{display:block;float:left;width:100%;min-height:20px;margin-left:2.7624309392265194%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid [class*=span]:first-child{margin-left:0}.row-fluid .controls-row [class*=span]+[class*=span]{margin-left:2.7624309392265194%}.row-fluid .span11{width:91.43646408839778%}.row-fluid .span10{width:82.87292817679558%}.row-fluid .span9{width:74.30939226519337%}.row-fluid .span8{width:65.74585635359117%}.row-fluid .span7{width:57.18232044198895%}.row-fluid .span6{width:48.61878453038674%}.row-fluid .span5{width:40.05524861878453%}.row-fluid .span4{width:31.491712707182323%}.row-fluid .span3{width:22.92817679558011%}.row-fluid .span2{width:14.3646408839779%}.row-fluid .span1{width:5.801104972375691%}.row-fluid .offset12{margin-left:105.52486187845304%}.row-fluid .offset12:first-child{margin-left:102.76243093922652%}.row-fluid .offset11{margin-left:96.96132596685082%}.row-fluid .offset11:first-child{margin-left:94.1988950276243%}.row-fluid .offset10{margin-left:88.39779005524862%}.row-fluid .offset10:first-child{margin-left:85.6353591160221%}.row-fluid .offset9{margin-left:79.8342541436464%}.row-fluid .offset9:first-child{margin-left:77.07182320441989%}.row-fluid .offset8{margin-left:71.2707182320442%}.row-fluid .offset8:first-child{margin-left:68.50828729281768%}.row-fluid .offset7{margin-left:62.70718232044199%}.row-fluid .offset7:first-child{margin-left:59.94475138121547%}.row-fluid .offset6{margin-left:54.14364640883978%}.row-fluid .offset6:first-child{margin-left:51.38121546961326%}.row-fluid .offset5{margin-left:45.58011049723757%}.row-fluid .offset5:first-child{margin-left:42.81767955801105%}.row-fluid .offset4{margin-left:37.01657458563536%}.row-fluid .offset4:first-child{margin-left:34.25414364640884%}.row-fluid .offset3{margin-left:28.45303867403315%}.row-fluid .offset3:first-child{margin-left:25.69060773480663%}.row-fluid .offset2{margin-left:19.88950276243094%}.row-fluid .offset2:first-child{margin-left:17.12707182320442%}.row-fluid .offset1{margin-left:11.32596685082873%}.row-fluid .offset1:first-child{margin-left:8.56353591160221%}.uneditable-input,input,textarea{margin-left:0}.controls-row [class*=span]+[class*=span]{margin-left:20px}.uneditable-input.span12,input.span12,textarea.span12{width:710px}.uneditable-input.span11,input.span11,textarea.span11{width:648px}.uneditable-input.span10,input.span10,textarea.span10{width:586px}.uneditable-input.span9,input.span9,textarea.span9{width:524px}.uneditable-input.span8,input.span8,textarea.span8{width:462px}.uneditable-input.span7,input.span7,textarea.span7{width:400px}.uneditable-input.span6,input.span6,textarea.span6{width:338px}.uneditable-input.span5,input.span5,textarea.span5{width:276px}.uneditable-input.span4,input.span4,textarea.span4{width:214px}.uneditable-input.span3,input.span3,textarea.span3{width:152px}.uneditable-input.span2,input.span2,textarea.span2{width:90px}.uneditable-input.span1,input.span1,textarea.span1{width:28px}}@media (max-width:767px){body{padding-right:20px;padding-left:20px}.navbar-fixed-bottom,.navbar-fixed-top,.navbar-static-top{margin-right:-20px;margin-left:-20px}.controls-row [class*=span]+[class*=span],.dl-horizontal dd,.row,.row-fluid [class*=offset]:first-child,.thumbnails,.thumbnails>li{margin-left:0}.container-fluid{padding:0}.dl-horizontal dt{float:none;width:auto;clear:none;text-align:left}.container{width:auto;padding:0 30px}.row-fluid{width:100%}.thumbnails>li{float:none}.row-fluid [class*=span],.uneditable-input[class*=span],[class*=span]{display:block;float:none;width:100%;margin-left:0;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.row-fluid .span12,.span12{width:100%;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.input-large,.input-xlarge,.input-xxlarge,.uneditable-input,input[class*=span],select[class*=span],textarea[class*=span]{display:block;width:100%;min-height:30px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box}.input-append input,.input-append input[class*=span],.input-prepend input,.input-prepend input[class*=span]{display:inline-block;width:auto}.modal{position:fixed;top:20px;right:20px;left:20px;width:auto;margin:0}.modal.fade{top:-100px}.modal.fade.in{top:20px}}@media (max-width:480px){.form-horizontal .controls,.media-object{margin-left:0}.nav-collapse{-webkit-transform:translate3d(0,0,0)}.page-header h1 small{display:block;line-height:20px}input[type=checkbox],input[type=radio]{border:1px solid #ccc}.form-horizontal .control-label{float:none;width:auto;padding-top:0;text-align:left}.form-horizontal .control-list{padding-top:0}.form-horizontal .form-actions{padding-right:10px;padding-left:10px}.media .pull-left,.media .pull-right{display:block;float:none;margin-bottom:10px}.media-object{margin-right:0}.modal{top:10px;right:10px;left:10px}.modal-header .close{padding:10px;margin:-10px}.carousel-caption{position:static}}@media (max-width:979px){body{padding-top:0}.navbar-fixed-bottom,.navbar-fixed-top{position:static}.navbar-fixed-top{margin-bottom:20px}.navbar-fixed-bottom{margin-top:20px}.navbar-fixed-bottom .navbar-inner,.navbar-fixed-top .navbar-inner{padding:5px}.navbar .container{width:auto;padding:0}.navbar .brand{padding-right:10px;padding-left:10px;margin:0 0 0 -5px}.nav-collapse{clear:both}.nav-collapse .nav{float:none;margin:0 0 10px}.nav-collapse .dropdown-menu li+li a,.nav-collapse .nav>li>a{margin-bottom:2px}.nav-collapse .nav>li{float:none}.nav-collapse .nav>.divider-vertical{display:none}.nav-collapse .nav .nav-header{color:#777;text-shadow:none}.nav-collapse .dropdown-menu a,.nav-collapse .nav>li>a{padding:9px 15px;font-weight:700;color:#777;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.nav-collapse .btn{padding:4px 10px;font-weight:400;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}.nav-collapse .dropdown-menu a:focus,.nav-collapse .dropdown-menu a:hover,.nav-collapse .nav>li>a:focus,.nav-collapse .nav>li>a:hover{background-color:#f2f2f2}.navbar-inverse .nav-collapse .dropdown-menu a,.navbar-inverse .nav-collapse .nav>li>a{color:#999}.navbar-inverse .nav-collapse .dropdown-menu a:focus,.navbar-inverse .nav-collapse .dropdown-menu a:hover,.navbar-inverse .nav-collapse .nav>li>a:focus,.navbar-inverse .nav-collapse .nav>li>a:hover{background-color:#111}.nav-collapse.in .btn-group{padding:0;margin-top:5px}.nav-collapse .dropdown-menu{position:static;top:auto;left:auto;display:none;float:none;max-width:none;padding:0;margin:0 15px;background-color:transparent;border:none;-webkit-border-radius:0;-moz-border-radius:0;border-radius:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none}.nav-collapse .open>.dropdown-menu{display:block}.nav-collapse .dropdown-menu .divider,.nav-collapse .dropdown-menu:after,.nav-collapse .dropdown-menu:before,.nav-collapse .nav>li>.dropdown-menu:after,.nav-collapse .nav>li>.dropdown-menu:before{display:none}.nav-collapse .navbar-form,.nav-collapse .navbar-search{float:none;padding:10px 15px;margin:10px 0;border-top:1px solid #f2f2f2;border-bottom:1px solid #f2f2f2;-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);-moz-box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1);box-shadow:inset 0 1px 0 rgba(255,255,255,.1),0 1px 0 rgba(255,255,255,.1)}.navbar-inverse .nav-collapse .navbar-form,.navbar-inverse .nav-collapse .navbar-search{border-top-color:#111;border-bottom-color:#111}.navbar .nav-collapse .nav.pull-right{float:none;margin-left:0}.nav-collapse,.nav-collapse.collapse{height:0;overflow:hidden}.navbar .btn-navbar{display:block}.navbar-static .navbar-inner{padding-right:10px;padding-left:10px}}@media (min-width:980px){.nav-collapse.collapse{height:auto!important;overflow:visible!important}}

{# /* // Font Awesome Sizes */ #}

.svg-inline--fa{display:inline-block;font-size:inherit;height:1em;overflow:visible;vertical-align:-.125em}.svg-inline--fa.fa-lg{vertical-align:-.225em}.svg-inline--fa.fa-w-1{width:.0625em}.svg-inline--fa.fa-w-2{width:.125em}.svg-inline--fa.fa-w-3{width:.1875em}.svg-inline--fa.fa-w-4{width:.25em}.svg-inline--fa.fa-w-5{width:.3125em}.svg-inline--fa.fa-w-6{width:.375em}.svg-inline--fa.fa-w-7{width:.4375em}.svg-inline--fa.fa-w-8{width:.5em}.svg-inline--fa.fa-w-9{width:.5625em}.svg-inline--fa.fa-w-10{width:.625em}.svg-inline--fa.fa-w-11{width:.6875em}.svg-inline--fa.fa-w-12{width:.75em}.svg-inline--fa.fa-w-13{width:.8125em}.svg-inline--fa.fa-w-14{width:.875em}.svg-inline--fa.fa-w-15{width:.9375em}.svg-inline--fa.fa-w-16{width:1em}.svg-inline--fa.fa-w-17{width:1.0625em}.svg-inline--fa.fa-w-18{width:1.125em}.svg-inline--fa.fa-w-19{width:1.1875em}.svg-inline--fa.fa-w-20{width:1.25em}.fa-lg{font-size:1.33333em;line-height:.75em;vertical-align:-.0667em}.fa-xs{font-size:.75em}.fa-sm{font-size:.875em}.fa-1x{font-size:1em}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-6x{font-size:6em}.fa-7x{font-size:7em}.fa-8x{font-size:8em}.fa-9x{font-size:9em}.fa-10x{font-size:10em}.fa-spin{animation:fa-spin 2s infinite linear}@keyframes fa-spin{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}


{# /* // CSS Reset */ #}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym,
address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  vertical-align: baseline;
}
input[type=text], 
input[type=textarea], 
input, 
button, 
select, 
textarea{
  border-radius: 0;
}

:focus {outline: 0;}
ol, ul {list-style: none;}
table {border-collapse: separate;border-spacing: 0;}
caption, th, td {text-align: left;font-weight: normal;}
b, strong{font-weight:bold;}
i, em, address {font-style:italic;}

input[type='number'] {
  -moz-appearance:textfield;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}

{#/*============================================================================
  #Critical path utilities classes
==============================================================================*/#}

{# /* Hidden general content until rest of styling loads */ #}

.visible-when-content-ready{
  visibility: hidden!important;
}
.display-when-content-ready{
  display: none!important;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Animations */ #}

.rotate{
  -webkit-animation: rotate 2s infinite linear;
  -moz-transform: rotate 2s infinite linear;
	-ms-transform: rotate 2s infinite linear;
	-o-transform: rotate 2s infinite linear;
	transform: rotate 2s infinite linear;
}
@-webkit-keyframes rotate {
	from {
		-webkit-transform: rotate(0deg);
		-moz-transform: rotate(0deg);
		-ms-transform: rotate(0deg);
		-o-transform: rotate(0deg);
		transform: rotate(0deg);
	}
	to {
		-webkit-transform: rotate(359deg);
		-moz-transform: rotate(359deg);
		-ms-transform: rotate(359deg);
		-o-transform: rotate(359deg);
		transform: rotate(359deg);
	}
}
.placeholder-shine{
  position: absolute;
  top: 0;
  left: -100%;
  width: 100%;
  height: 100%;
  opacity: 0.3;
	-moz-animation: placeholder-shine 1.5s infinite;
	-webkit-animation: placeholder-shine 1.5s infinite;
	animation: placeholder-shine 1.5s infinite;
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,ffffff+41,ffffff+50,ffffff+60,7db9e8+100&0+0,0.63+41,1+50,0.45+60,0+100 */
	background: -moz-linear-gradient(left, rgba(30,87,153,0) 0%, rgba(255,255,255,0.63) 41%, rgba(255,255,255,1) 50%, rgba(255,255,255,0.45) 60%, rgba(125,185,232,0) 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(left, rgba(30,87,153,0) 0%,rgba(255,255,255,0.63) 41%,rgba(255,255,255,1) 50%,rgba(255,255,255,0.45) 60%,rgba(125,185,232,0) 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to right, rgba(30,87,153,0) 0%,rgba(255,255,255,0.63) 41%,rgba(255,255,255,1) 50%,rgba(255,255,255,0.45) 60%,rgba(125,185,232,0) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#001e5799', endColorstr='#007db9e8',GradientType=1 ); /* IE6-9 */
}
@keyframes placeholder-shine {
	from {
		left: -100%;
	}
	to {
		left: 100%;
	}
}

.transition-up {
  opacity: 0;
}

{# /* // Placeholders and preloaders */ #}

.page-loading-icon{
  display: inline-block;
  height: 40px;
  width: 40px;
  margin: 40px auto;
}
.product-loading-icon{
  height: 25px;
  width: 25px;
  margin: 30px auto;
}
.mobile-placeholder,
.page-loading-icon-container{
  display: none;
  width: 100%;
  text-align: center;
}
.lazyloaded + .placeholder-shine {
	display:none;
}
.item-preloader-container{
  height: 80px;
}
.item-preloader{
  width: 20px;
  height: 20px;
  margin: auto;
  z-index: 1;
}
.blur-up {
  -webkit-filter: blur(1px);
  filter: blur(1px);
  -moz-filter: blur(1px);
  -ms-filter: blur(1px);
  -o-filter: blur(1px);
  transition: filter .5s, -webkit-filter .5s;
}
.blur-up-big {
  -webkit-filter: blur(3px);
  filter: blur(3px);
  -moz-filter: blur(3px);
  -ms-filter: blur(3px);
  -o-filter: blur(3px);
  transition: filter .5s, -webkit-filter .5s;
}
.blur-up.lazyloaded,
.blur-up-big.lazyloaded {
  -webkit-filter: blur(0);
  filter: blur(0);
  -moz-filter: blur(0);
  -ms-filter: blur(0);
  -o-filter: blur(0);
}
.fade-in {
  opacity: 0;
  transition: opacity .5s;
}
.fade-in.lazyloaded {
  opacity: 1;
}
.slider-desktop-placeholder{
  height: 400px;
}
.spinner-ellipsis {
  display: inline-block;
  position: relative;
  width: 64px;
  height: 40px;
}
.spinner-ellipsis .point {
  position: absolute;
  top: 15px;
  width: 11px;
  height: 11px;
  animation-timing-function: cubic-bezier(0, 1, 1, 0);
}
.spinner-ellipsis .point:nth-child(1) {
  left: 6px;
  animation: spinner-ellipsis1 0.6s infinite;
}
.spinner-ellipsis .point:nth-child(2) {
  left: 6px;
  animation: spinner-ellipsis2 0.6s infinite;
}
.spinner-ellipsis .point:nth-child(3) {
  left: 26px;
  animation: spinner-ellipsis2 0.6s infinite;
}
.spinner-ellipsis .point:nth-child(4) {
  left: 45px;
  animation: spinner-ellipsis3 0.6s infinite;
}
@keyframes spinner-ellipsis1 {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes spinner-ellipsis3 {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}
@keyframes spinner-ellipsis2 {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(19px, 0);
  }
}

{# /* // Images */ #}

/* Used for images that have a placeholder before it loads. The image container should have a padding-bottom inline with the result of (image height/ image width) * 100 */
.img-absolute {
  position: absolute;
  left: 0;
  width: 100%;
  height: auto;
  vertical-align: middle;
  text-indent: -9999px;
  z-index: 1;
}

.img-absolute-centered{
  left: 50%;
  transform: translate3d(-50%, 0, 0);
  -webkit-transform: translate3d(-50%, 0, 0);
  -ms-transform: translate3d(-50%, 0, 0);
}

{# /* // Pills */ #}

.pills-container{
  margin: 0 0 10px 0;
  padding: 10px 0;
  -webkit-overflow-scrolling: touch;
}
.pills-container ul{
  list-style: none;
}
.pill{
  display: inline-block;
  margin: 10px 5px 10px 0;
}
.pill-link{
  padding: 5px 10px;
  font-size: 12px;
  text-transform: uppercase;
}

{# /* // Labels */ #}

.labels-floating{
  position: absolute;
  top: 0;
  right: 0;
  width: 100%;
  z-index: 2;
}
.label-circle {
  display: table;
  z-index: 1;
  float: left;
  width: 55px;
  height: 55px;
  padding: 0;
  white-space: normal;
  text-align: center;
  font-weight: normal;
  text-shadow: none;
  border-radius: 50%;
}
.label-circle-big{
  width: 80px;
  height: 80px;
}

.label-text{
  display: table-cell;
  vertical-align: middle;
  text-transform: uppercase;
  font-size: 12px;
  font-style: italic;
  line-height: initial;
}

.label-small{
  font-size: 60%;
  line-height: 112%;
  text-transform: lowercase;
}

{# /* // Sliders */ #}

.slider-wrapper{
  position: relative;
  width: 100%;
}
.slider-wrapper .bx-wrapper{
  height: 0;
  visibility: hidden;
  margin: 0 auto;
}
.slider {
  /* Fixes white flickering on Chrome */
  -webkit-perspective: 1000px;
  text-align: center;
}
.slider-slide{
  position: relative;
  min-width: 1px;
  min-height: 1px;
  overflow: hidden;
}
.slide-img{
  width: 100%;
}
.bx-pager,
.bx-pager-item{
  display: none;
}

{# /* // Banners */ #}

.text-banner { 
  position: relative; 
  margin-top: 20px; 
  padding-top: 40%;
  text-align: center;
  overflow: hidden; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.text-banner-promotional {
  margin-bottom: 30px;
  padding: 40px 0;
}
.text-banner-info{
  z-index: 9;
  margin: 30px 0;
  width: 100%;
  box-sizing: border-box;
}
.text-banner-promotional .text-banner-info{
  top: 50%;
  margin: 0;
  padding: 0 30px;
  transform: translate(0, -50%);
}
.text-banner-filter { 
	position: absolute; 
  top: 0;
  left: 0;
	width: 100%; 
	height: 100%; 
	z-index: 1; 
	opacity: 0;
}
.text-banner-promotional .text-banner-filter { 
  opacity: 0.4;
  -webkit-transition: all 0.8s ease;
  -ms-transition: all 0.8s ease;
  -moz-transition: all 0.8s ease;
  -o-transition: all 0.8s ease;
  transition: all 0.8s ease;
}
.text-banner-promotional:hover .text-banner-filter { 
  opacity: 0.6;
}

.text-banner-title {
  margin-bottom: 5px;
  font-weight: 700;
  text-transform: uppercase;
}
.text-banner-paragraph {
  margin-bottom: 20px;
}
.text-banner-link {
  padding: 6px 19px!important;
  font-size: 12px;
}

.without-text-container .wrap-banner{
  height: auto!important;/* this height overides desktop js fixed height*/
  padding: 0;
}
.without-text-container .text-banner-info{
  position: absolute;
  top: 0;
}
.banner-link{
  display: inline-block;
  padding: 10px 20px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
}
.banner-link:hover{
  text-decoration: none;
}
.image-banner {
  display: inline-block;
  position: relative;
  margin: 30px auto;
  width: 100%;
  overflow: hidden;
  text-align: center;
}
.image-banner img {
  width: 100%;
}
.services{
  padding: 20px 0px;
  margin-bottom: 20px;
}
.service-item{
  width: 100%;
  margin: auto;
}
.service-item .service-icon{
  float: right;
  margin-right: 5px;
  font-size: 34px;
}
.service-item .service-icon-big {
  font-size: 40px;
}
.service-title{
  text-transform: uppercase;
}

{# /* // Welcome */ #}

.welcome-container {
  width: 1170px;
  margin: 0 auto 20px auto;
}

.welcome-background {
  position: absolute;
  height: 100%;
  width: 100%;
  background-size: cover;
  background-position: center;
  opacity: 0.4;
}

.welcome-message-text {
  max-width: 80%;
  line-height: 30px;
  vertical-align: middle;
}

{# /* // Thumbs scroller */ #}

.scroller-horizontal-top {
  margin-top: 15px;
  padding-top: 5px; /* necessary to visualize shadow top on hover item */
}

.scroller .scroller-item{
  width: 240px;
  margin: 0 20px 0 0;
}

.scroller{
  position: relative; 
  overflow: hidden;
}

{# /* // Slick slider */ #}

.slick-slider {
  position: relative;
  display: block;
  box-sizing: border-box;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  -webkit-touch-callout: none;
  -khtml-user-select: none;
  -ms-touch-action: pan-y;
  touch-action: pan-y;
  -webkit-tap-highlight-color: transparent;
}

.slick-list {
  position: relative;
  display: block;
  margin: 0;
  padding: 0;
}
.slick-list:focus {
  outline: none;
}
.slick-list.dragging {
  cursor: pointer;
  cursor: hand;
}

.slick-slider .slick-track,
.slick-slider .slick-list {
  -webkit-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  -o-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}

.slick-track{
  position: relative;
  top: 0;
  left: 0;
  display: block;
  margin-left: auto;
  margin-right: auto;
}
.slick-track:before,
.slick-track:after {
  display: table;
  content: '';
}
.slick-track:after {
  clear: both;
}
.slick-loading .slick-track {
  visibility: hidden;
}

.slick-slide {
  display: none;
  float: left;
  height: 100%;
  min-height: 1px;
}
[dir='rtl'] .slick-slide {
  float: right;
}
.slick-slide img {
  display: block;
}
.slick-slide.slick-loading img {
  display: none;
}
.slick-slide.dragging img {
  pointer-events: none;
}
.slick-initialized .slick-slide {
  display: block;
}
.slick-loading .slick-slide {
  visibility: hidden;
}
.slick-vertical .slick-slide {
  display: block;
  height: 140px;
}
.slick-arrow.slick-hidden {
  display: none;
}
.slick-prev,
.slick-next {
  position: absolute;
  top: 50%;
  display: block;
  width: 20px;
  height: 20px;
  padding: 0;
  font-size: 0;
  line-height: 0;
  color: transparent;
  background: transparent;
  border: none;
  cursor: pointer;
  outline: none;
  -webkit-transform: translate(0, -50%);
  -ms-transform: translate(0, -50%);
  transform: translate(0, -50%);
}

.slick-prev {
  left: -25px;
}

.slick-next {
  right: -25px;
}

.slick-slide:last-child .scroller-img-container {
  margin-right: 0;
}

.primary-products-scroller + .scroller-btn,
.primary-products-scroller + .scroller-btn + .scroller-btn {
  visibility: hidden;
}

.primary-products-scroller.slick-initialized + .scroller-btn,
.primary-products-scroller.slick-initialized + .scroller-btn + .scroller-btn {
  visibility: visible;
}

{# /* // Notifications */ #}

.notification{
  width: 100%;
  padding: 10px;
  opacity: 0.98;
  box-sizing: border-box;
  text-align: center;
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Header */ #}

{# /* // Nav desktop */ #}

.desktop-nav {
  padding: 10px 0;
}
.desktop-nav-list {
  display: none;
}
.desktop-nav-item {
  position: relative;
  display: inline-block;
  margin: 5px 0;
}
.desktop-nav-link {
  padding: 5px 20px 5px 0;
  box-sizing: border-box;
  font-size: 13px; 
  font-weight: 700;
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 1px;
}
.desktop-nav > .desktop-nav-item > .desktop-nav-link > .desktop-nav-arrow{
  display:none;
}
.head-top-fixed{
	height: 0;
}

{# /* // Nav mobile */ #}

.mobile-nav-search-row, 
.mobile-nav-second-row,
.hamburger-panel{
  display: none;
}
.mobile-nav-empty-cart{
  position: fixed;
  top: 110px;
  left: 5%;
  display: none;
  box-sizing:border-box;
  width: 90%;
}

{# /* // Search desktop */ #}

.searchbox form {
  position: relative;
}

input.desktop-search-input{
  width: 100%;
  height: 30px;
  float: left;
  padding: 5px 40px 5px 10px;
  margin: 5px 0;
  box-sizing: border-box;
}
.desktop-search-input::-webkit-input-placeholder {
  font-style: italic;
}
.desktop-search-icon {
  margin-top: 10px;
  position: absolute;
  right: 10px;
  z-index: 1;
}
input.desktop-search-submit {
  position: absolute;
  right: 2px;
  top: 6px;
  height: 26px;
  width: 40px;
  background: none;
  border: 0;
  z-index: 2;
}

.head .desktop-search {
  width: 40%; 
  vertical-align: middle;  
}
.head input.desktop-search-input {
  height: 38px;
}
.head .desktop-search-icon {
  margin-top: 12px;
}

{# /* // Logo */ #}

.logo-container{
  display: inline-block;
  width: 31%;
  margin: 20px 0 10px 0;
}
.logo-container-wide{
  display: inline-block;
  width: 71.5670%;
  margin: 20px 0 10px 0;
}
.logo-img{
  max-width: 250px;
  max-height: 120px;
  vertical-align:middle;
}
.logo-text{
  font-size: 34px;
  font-weight: normal;
  line-height: initial;
}

{# /* // Icons widgets */ #}

.header-icons {
  display: inline-block;
  vertical-align: middle;
  width: 28%;
  margin: 0;
  text-align: right;
}

{# /* // Cart widget desktop */ #}

.cart-summary{
  display: inline-block;
  min-width: 220px;
  height: 34px;
  font-size: 12px;
  text-align: center;
}
.cart-summary-icon{
  float: right;
  height: 20px;
  width: 20px;
  padding: 8px;
}
.cart-summary-info{
  display: inline-block;
  margin-top: 7px;
}
.cart-summary-ammount{
  font-style: italic;
}

{#/*============================================================================
  #Product grid
==============================================================================*/#}

.sort-by-container{
  width: 220px;
  margin-bottom: 20px;
}

{# /* // Grid item */ #}

.grid-row{
  float: left;
  width: 100%;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
}
.item {
  position: relative;
  display: inline-block;
  padding: 10px;
  margin-bottom: 10px;
  vertical-align: top;
  box-sizing: border-box;
}
.item-image-container{
  position: relative;
  max-height: 300px;
  overflow: hidden;
}
.item-image{
  width: 200px;
  max-height: 300px;
}
.item-small .item-image-container,
.item-small .item-image{
  max-height: 120px;
}
.item-link,
.item-link:hover{
  text-decoration: none;
}
.item-quickshop-link{
  opacity: 0;
}
.item-price-compare{
  padding-left: 10px; 
  font-weight: bold;
  opacity: 0.8;
}
.price-compare{
  text-decoration: line-through;
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.mobile-zoom-panel{
  display: none;
}
.cloud-zoom-loading{
  display: none;
}
.product-single-image{
  height: 0;
}
.product-single-image > img{
  left: 50%;
  transform: translateX(-50%);
  -webkit-transform: translateX(-50%);
  -ms-transform: translateX(-50%);
}
.product-slider-image{
  height: 100%;
  width: auto;
}
.product-form-container{
  width: 100%;
  float: left;
  padding-bottom:15px;
}
.product-slider{
  visibility: hidden;
  height: 0;
}
.product-slider-container .bx-viewport{
  box-shadow: none;
  background: none;
}

/*============================================================================
  #Cart detail
==============================================================================*/

{# /* // Shipping Calculator */ #}

.shipping-calculator-head.with-zip {
  height: 45px;
}
.shipping-calculator-head.with-form {
  height: 85px;
}
.shipping-calculator-head.with-error {
  height: 145px;
}

{#/*============================================================================
  #Media queries
==============================================================================*/#}

{# /* // Min width 1368px */ #}

@media (min-width: 1368px) {

	{# /* //// Components */ #}

	{# /* Sliders */ #}

    .slider-wrapper .bx-wrapper {
      position: relative;
      max-width: 1240px !important;
      margin: 20px auto 0 auto;
    }
    .slider-wrapper-full .bx-wrapper {
      position: relative;
      max-width: 100% !important;
      margin: 0 auto;
    }
    .slider-image,
    .slider img {
      margin: 0 auto;
    }
} 

{# /* // Min width 768px and max width 979px */ #}

@media (max-width: 979px) and (min-width: 768px) {

	{# /* //// Components */ #}

  .container{
    width: 90%;
  }
	.banner {
    margin: 30px auto 10px auto;
  }
  .service-item{
    width: 90%;
    margin: auto;
  }
}

{# /* // Max width 767px */ #}

@media (max-width: 767px) {

	{# /* //// Components */ #}

	{# /* Wrappers */ #}

  .container {
    padding: 0 10px;
  }
  .main-content{
    padding-top: 94px;
  }
  .has_store_bar_thin .main-content{
    padding-top: 60px;
  }

  {# /* Placeholders and preloaders */ #}

  .blur-up-big {
    -webkit-filter: blur(2px);
    filter: blur(2px);
    -moz-filter: blur(2px);
    -ms-filter: blur(2px);
    -o-filter: blur(2px);
  }
  .slider-desktop-placeholder{
    display: none;
  }
  .mobile-placeholder,
  .page-loading-icon-container{
    display: block;
    box-sizing: border-box;
    overflow: hidden;
  } 
  .product-loading-icon-container{
    top: 50%;
    margin-top: -35px;
  }
  .placeholder-figures-container{
    position: relative;
    width: 100%;
    padding: 20% 10%;
    box-sizing: border-box;
    overflow: hidden;
  }
  .placeholder-left-col{
    width: 30%;
  }
  .placeholder-right-col{
    width: 60%;
    margin-left: 10%;
  }
  .placeholder-square{
    width: 100%;
  }
  .placeholder-square:after{
    content: "";
    display: block;
    padding-bottom: 100%;
  }
  .placeholder-line{
    position: relative;
    overflow: hidden;
  }
  .placeholder-line:after{
    content: "";
    display: block;
    padding-top: 10%;
  }
  .placeholder-line-medium{
    position: relative;
    height: 20px;
  }
  .placeholder-pager{
    position: absolute;
    width: 100%;
    left: 0;
    bottom: 10px;
    text-align: center;
  }
  .placeholder-page{
    width: 7px;
    height: 7px;
    margin: 0 3px;
    -moz-border-radius: 8px;
    -webkit-border-radius: 8px;
    border-radius: 8px;
  }
  .placeholder-circle{
    position: relative;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin:10px auto;
    overflow: hidden;
    opacity: 0.2;
  }
  .placeholder-icon{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 20%;
    transform: translate(-50%, -50%);
    -webkit-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
  } 
  .product-placeholder-container{
    position: relative;
    max-height: 300px;
    margin-bottom: 20px;
  }

  {# /* Animations */ #}

  .main-content{
    padding-top: 95px;
  }
  .has_store_bar_thin .main-content{
    padding-top: 65px;
  }
  .move-down{
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,0,0);
    -moz-transform: translate3d(0,0,0);
    -ms-transform: translate3d(0,0,0);
    -o-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
  }
  .move-up{
    top: 0;
    transition: all .5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,-70px,0);
    -moz-transform: translate3d(0,-70px,0);
    -ms-transform: translate3d(0,-70px,0);
    -o-transform: translate3d(0,-70px,0);
    transform: translate3d(0,-70px,0);
  }

  {# /* Critical mobile modal animation - rest of animations on style.scss.tpl */ #}
  
  .modal-xs-right.modal.fade,
  .modal-xs-right-out{
    transition: all 1s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(200%,0,0);
    -moz-transform: translate3d(200%,0,0);
    -ms-transform: translate3d(200%,0,0);
    -o-transform: translate3d(200%,0,0);
    transform: translate3d(200%,0,0);
  }
  .modal-xs-bottom.modal.fade,
  .modal-xs-bottom-out{
    transition: all 1.5s cubic-bezier(.16,.68,.43,.99);
    -webkit-transform: translate3d(0,100%,0);
    -moz-transform: translate3d(0,100%,0);
    -ms-transform: translate3d(0,100%,0);
    -o-transform: translate3d(0,100%,0);
    transform: translate3d(0,100%,0);
  }

  {# /* //// Labels */ #}

  .labels-floating-left-xs{
    right: initial;
    left: 0;
    width: auto;
  }

  {# /* Sliders */ #}

  .bx-pager{
    display: block;
  }
  .bx-pager-item{
    display: inline-block;
  }
  .bx-controls-direction{
    display: none!important;
  }
  
  {# /* Welcome */ #}

  .welcome-container {
    width: 100%;
    margin: 10px 0 40px 0;
  }

  {# /* Banners */ #}

  .banner-link{
    padding: 10px 15px;
    font-size: 14px;
  }
  .image-banner{
    margin: 10px 0;
  }
  .services{
    position: relative;
    margin-bottom: 10px;
    padding: 0;
  }
  .service-item{
    width: 90%;
    text-align: center;
  }
  .service-item .service-icon{
    float: none;
    font-size: 20px;
    margin-right: 0;
    margin-bottom: 5px;
  }
  .service-item .service-icon-big {
    font-size: 24px;
  }
  .service-text{
    width: 100%;
    clear: both;
    text-align: center;
  }
  .text-banner {
    margin-left: -10px;
    margin-right: -10px;
  }
  .text-banner-info {
    padding: 0 10px;
  }

  {# /* //// Header and nav */ #}

  .head { 
    padding: 5px 0;
  }

  {# /* //// Nav mobile */ #}

  .mobile-nav{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 4000;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.04),0 3px 1px -2px rgba(0,0,0,.04),0 1px 5px 0 rgba(0,0,0,.04);
  }
  .mobile-tabs{
    position: fixed;
    left: 0;
    width: 100%;
    z-index: 3000;
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.04),0 3px 1px -2px rgba(0,0,0,.04),0 1px 5px 0 rgba(0,0,0,.04);
  }
  .mobile-nav-first-row{
    height: 50px;
  }
  .mobile-nav-first-row-icon{
    width: 22px;
    height: 24px;
    padding: 6px;
  }
  .nav-svg{
    height: 20px;
    vertical-align: top;
  }
  .btn-hamburger-container {
    display: inline-block!important;
    vertical-align: middle;
  }
  .btn-hamburger { 
    height: 20px;
    margin-right: 15px;
    padding: 5px 6px;
    border: 3px solid;
  }

  {# /* // Notifications */ #}

  .notification-bar-close {
   right: 0;
  }

  {# /* Nav mobile title */ #}

  .mobile-nav-title{
    float: left;
    width: 70%;
    margin-left: 5px;
    margin-top: 14px;
    text-transform: uppercase;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  {# /* Nav mobile logo */ #}

  .logo-container,
  .logo-container-wide{
    display: inline-block;
    width: 50%;
    margin: 0;
  }
  .logo-text{
    margin-top: 20px;
    margin: 20px auto 10px auto;
    width: 100%;
    font-size: 24px;
    line-height: normal;
  }
  .logo-img{
    max-height: 60px;
    max-width: 60%;
    margin: 10px 0;
  }
  .mobile-logo-home .logo-img{
    max-height: 60px;
    max-width: 100%;
  }
  .logo-small .mobile-logo-home .logo-img{
    max-height: 40px;
    max-width: 100%;
  }

  {# /* Nav mobile icons */ #}

  .header-icons {
    width: calc( 50% - 65px );
  }
  .header-icons-container{
    display: inline-block!important;
    vertical-align: middle;
    line-height: normal;
  }
  .header-icons-container.hidden-phone {
    display: none!important;
  }

  .cart-summary { 
    display: block; 
    height: auto;
    min-width: auto;
  }
  .cart-summary-icon {
    height: 22px;
    width: 24px;
    padding: 6px;
  }

  {# /* Nav mobile tabs */ #}

  .mobile-nav-second-row {
    display: block;
    z-index: 3000;
  }
  .mobile-nav-tab {
    position: relative;
    width: 33.33333333%;
    float: left;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    text-transform: uppercase;
  }
  .mobile-nav-tab:focus,
  .mobile-nav-tab:hover{
    text-decoration: none;
  }
  .mobile-nav-tab-half {
    width: 50%;
  }
  .mobile-nav-cart-amount {
    z-index: 1;
    padding: 0 4px;
    margin-left: 2px;
    font-size: 12px;
  }
  .mobile-nav-tab-text{
    margin-left: 2px;
    vertical-align: middle;
    font-size: 12px;
  }
  .mobile-nav-tab-icon{
    width: 24px;
    height: 24px;
    vertical-align: bottom;
  }

  {# /* // Thumbs scroller */ #}

  .scroller.primary-products-scroller {
    visibility: visible !important; /* necessary to visualize featured products more quickly on mobile */
  }

  .scroller .scroller-item{
    margin: 0 0 20px 0;
  }


  {# /* //// Product grid */ #}

  .grid-row {
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-wrap: wrap;
    flex-wrap: wrap;
  }


  {# /* Sorty by and filters */ #}

  .sort-by-container{
    float: left;
    width: 50%;
    margin: 0;
    padding-right: 10px;
    box-sizing:border-box;
  }
  .sort-by{
    text-transform: uppercase;
  }
  .mobile-filters-btn{
    width: 50%;
    margin-top: 30px;
    box-sizing:border-box;
    text-transform: uppercase;
  }

  {# /* Grid item */ #}

  .item{
    width: 50%!important;/* !important necesary to override Bootstrap 2*/
    height: auto;
    padding: 0 5px;
    margin-bottom: 20px;
  }
  .item-name{
    text-overflow: ellipsis;
    overflow: hidden;
    -webkit-line-clamp: 2;
    display: -webkit-box;
    -webkit-box-orient: vertical;
  }
  .item-small{
    margin: 10px 0;
  }
  .item-small .item-image-container{
    width: 20%;
    float: left;
  }
  .item-small .item-info-container{
    width: 80%;
    float: left;
    padding-left: 10px;
  }
  .item-price-compare{
    font-size: 12px;
    padding-left: 5px;
  }

  .item-mobile-container {
    width: 50%;
  }
  .primary-products-scroller .item{
    width: 100%!important;
  }


  {# /* //// Product detail */ #}

  {# /* Image */ #}

  .product-slider-container {
    position: relative;
    display: block;
    float: left;
    width: 100%;
    text-align: center;
  }
  .product-slider-container .bx-wrapper{
    margin: 0;
  }
  .cloud-zoom-wrap .mousetrap{
    display: none;
  }
}

{#/*============================================================================
  #Utilities classes
==============================================================================*/#}

{# /*CSS properties like margins, paddings and text align minified, to unminify it you have to copy the code and paste it here http://unminify.com/, after that paste the unminified code here */ #}


.list-style-disc{list-style: disc}.col-centered{float:none!important;margin:0 auto!important}.overide-container-width{margin-left:-10px!important;margin-right:-10px!important}.text-danger{color:red}.input-error{border:1px solid #cc4845!important}.border-box{box-sizing:border-box}.d-flex{display: flex}.d-inline{display:inline}.d-block{display:block}.d-inline-block{display:inline-block}.p-relative{position:relative!important}.p-absolute{position:absolute!important}.p-fixed{position:fixed}.clear-both{clear:both!important}.opacity-80{opacity:.8!important}.opacity-50{opacity:.5!important}.opacity-10{opacity:.1!important}.full-height{height:100%!important}.full-width-container{width: 100%; float: left; clear: both;}.full-width{width:100%!important}.width-auto{width:auto}.m-top{margin-top:20px!important}.m-top-half{margin-top:10px!important}.m-top-quarter{margin-top:5px!important}.m-top-none{margin-top:0!important}.m-right{margin-right:20px!important}.m-right-double{margin-right:40px!important}.m-right-half{margin-right:10px!important}.m-right-quarter{margin-right:5px!important}.m-right-none{margin-right:0!important}.m-bottom{margin-bottom:20px!important}.m-bottom-double{margin-bottom:40px!important}.m-bottom-half{margin-bottom:10px!important}.m-bottom-quarter{margin-bottom:5px!important}.m-bottom-none{margin-bottom:0!important}.m-left{margin-left:20px!important}.m-left-half{margin-left:10px!important}.m-left-quarter{margin-left:5px!important}.m-left-none{margin-left:0!important}.m-all{margin:20px!important}.m-all-half{margin:10px!important}.m-all-quarter{margin:5px!important}.m-auto{margin:auto!important}.m-none{margin:0!important}.p-top{padding-top:20px!important}.p-top-double{padding-top:40px!important}.p-top-half{padding-top:10px!important}.p-top-quarter{padding-top:5px!important}.p-top-none{padding-top:0!important}.p-right{padding-right:20px!important}.p-right-double{padding-right:40px!important}.p-right-half{padding-right:10px!important}.p-right-quarter{padding-right:5px!important}.p-none-right{padding-right:0!important}.p-bottom{padding-bottom:20px!important}.p-bottom-double{padding-bottom:40px!important}.p-bottom-half{padding-bottom:10px!important}.p-bottom-quarter{padding-bottom:5px!important}.p-bottom-none{padding-bottom:0!important}.p-left{padding-left:20px!important}.p-left-double{padding-left:40px!important}.p-left-half{padding-left:10px!important}.p-left-quarter{padding-left:5px!important}.p-none-left{padding-left:0!important}.p-all{padding:20px!important}.p-all-double{padding:40px!important}.p-all-half{padding:10px!important}.p-all-quarter{padding:5px!important}.p-none{padding:0!important}.text-left{text-align:left!important}.text-right{text-align:right!important}.text-center{text-align:center!important}.text-justify{text-align:justify!important}.text-nowrap{white-space:nowrap!important}.text-lowercase{text-transform:lowercase!important}.text-uppercase{text-transform:uppercase!important}.text-capitalize{text-transform:capitalize!important}.text-wrap{-ms-word-break:break-all!important;word-wrap:break-word!important;-webkit-hyphens:auto!important;-moz-hyphens:auto!important;hyphens:auto!important}.line-height-initial{line-height:initial}.list-syle-disc{list-style: disc}ul.list-style-none li{list-style:none!important}.overflow-none{overflow:hidden!important}.border-thin{border-width:1px!important}.icon-align-middle{margin-top: 3px; vertical-align: middle;}.align-baseline{vertical-align:baseline!important}.align-top{vertical-align:top!important}.align-middle{vertical-align:middle!important}.align-bottom{vertical-align:bottom!important}.align-text-bottom{vertical-align:text-bottom!important}.align-text-top{vertical-align:text-top!important}

{# /* // Desktop helpers */ #}

@media (min-width: 770px) {
  .col-md-custom{float:left!important;margin-left:0!important}.col-md-2-custom{width:16.6666667%!important}.col-md-3-custom{width:25%!important}.col-md-4-custom{width:33.33333333333333%!important}.col-md-6-custom{width:50%!important}.col-md-8-custom{width: 66.66666666666666%!important}.col-md-9-custom{width:75%!important} .no-border-md{border:0!important}
}

{# /* // Mobile helpers */ #}

@media (max-width: 767px) {
  .m-height-auto-xs{min-height: auto!important}.col-xs-custom{float:left!important;margin-left:0!important}.col-xs-3-custom{width:25%!important}.col-xs-4-custom{width:33.33333333333333%!important}.col-xs-6-custom{width:50%!important}.col-xs-8-custom{width: 66.66666666666666%!important}.col-xs-9-custom{width:75%!important}.overide-container-width{width:100vw!important;}.overide-container-xs-width{width:100vw!important;margin-left:-10px!important;margin-right:-10px!important}.clear-both-xs{clear:both!important}.f-none-xs{float:none!important}.pull-left-xs{float:left!important}.pull-right-xs{float:right!important}.d-block-xs{display:block!important}.d-inline-block-xs{display:inline-block!important}.p-all-half-xs{padding:10px!important}.p-none-xs{padding:0!important}.p-top-xs{padding-top: 20px!important}.p-top-half-xs{padding-top:10px!important}.p-top-quarter-xs{padding-top:5px!important}.p-right-half-xs{padding-right:10px!important}.p-right-quarter-xs{padding-right:5px!important}.p-none-right-xs{padding-right:0!important}.p-bottom-xs{padding-bottom:20px!important}.p-bottom-double-xs{padding-bottom:40px!important}.p-bottom-half-xs{padding-bottom:10px!important}.p-left-half-xs{padding-left:10px!important}.p-left-quarter-xs{padding-left:5px!important}.p-none-left-xs{padding-left:0!important}.m-none-xs{margin:0!important}.m-none-right-xs{margin-right:0!important}.m-top-xs{margin-top:20px!important}.m-top-half-xs{margin-top:10px!important}.m-top-quarter-xs{margin-top:5px!important}.m-top-none-xs{margin-top:0!important}.m-bottom-xs{margin-bottom:20px!important}.m-bottom-half-xs{margin-bottom:10px!important}.m-bottom-quarter-xs{margin-bottom:5px!important}.m-bottom-none-xs{margin-bottom:0!important}.m-left-quarter-xs{margin-left:5px!important}.text-center-xs{text-align:center!important}.text-left-xs{text-align:left!important}.text-right-xs{text-align:right!important}.border-top-none-xs{border-top:0!important}.border-bottom-none-xs{border-bottom:0!important}.border-none-xs{border:0!important}.full-width-xs{width:100%!important}.horizontal-container{overflow-x:scroll!important;width:100%;}.horizontal-container::-webkit-scrollbar{width:1px!important;height:0!important}.horizontal-container::-webkit-scrollbar-track{background:0 0!important;border-radius:10px!important}.horizontal-container::-webkit-scrollbar-thumb{border-radius:1px!important}.horizontal-container-item{float:none!important;display:inline-block}.horizontal-container ul,.horizontal-products-scroller{white-space:nowrap!important}.wrap-list-xs{width:50%;float:left;clear:none!important;padding:4px;box-sizing:border-box}
}

{% endraw %}
