!function(t){var e={};function n(o){if(e[o])return e[o].exports;var i=e[o]={i:o,l:!1,exports:{}};return t[o].call(i.exports,i,i.exports,n),i.l=!0,i.exports}n.m=t,n.c=e,n.d=function(t,e,o){n.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:o})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,e){if(1&e&&(t=n(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var i in t)n.d(o,i,function(e){return t[e]}.bind(null,i));return o},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="",n(n.s=0)}([function(t,e,n){"use strict";n.r(e);n(1);window.project={},n(2),n(3),n(4),n(5),LS.ready.then((function(){$(window).load((function(){$("body")})),$(document).ajaxStop((function(){$("body").hasClass("template-home")&&project.home.slider()}));var t=$("body");project.header.init(),t.hasClass("template-home"),t.hasClass("template-product")&&project.product.init(),t.hasClass("virada-de-ano-country")&&project.countdown.init(),$(".menu-sections-tab").length>0&&$(document).on("click touchend",".menu-sections-tab li",(function(t){t.preventDefault();var e=$(this).data("section");if($(".menu-sections-tab li").removeClass("active"),$(this).addClass("active"),$(".section-contents .tab-cont").removeClass("active"),$(".section-contents #"+e).addClass("active"),$("body").hasClass("template-home")){$(".js-horizontal-scroller").slick("unslick");var n={infinite:!0,slidesToShow:4,slidesToScroll:1,autoplay:!0,prevArrow:$(".js-horizontal-scroller-prev"),nextArrow:$(".js-horizontal-scroller-next"),responsive:[{breakpoint:768,settings:{slidesToShow:1,slidesToScroll:1}}]};$(".js-horizontal-scroller").slick(n).css("visibility","visible")}}))}))},function(t,e,n){},function(t,e){project.header={init:function(){}}},function(t,e){project.home={init:function(){},slider:function(){$(".bx-pager-item").removeClass("border-active"),$(".bx-pager-link").each((function(){$(this).hasClass("active")&&$(this).parents("div").addClass("border-active")}))}}},function(t,e){var n;project.product=(n=function(){var t=$(window).width();t>979&&$(document).on("click touchend","#menuInstitucional li a",(function(t){t.preventDefault();var e=$(this).attr("href");$("html, body").animate({scrollTop:$(e).offset().top},1e3)})),t<979&&$(document).on("click touchend","#menuInstitucional li a",(function(t){t.preventDefault();var e=$(this).attr("href");$(".secoes-intitucionais").hide(),$(e).show()}))},{init:function(){n()}})},function(t,e){var n;Date.prototype.addDays=function(t){var e=new Date(this.valueOf());return e.setDate(e.getDate()+t),e},project.countdown=(n=function(){var t,e=(new Date).addDays(4),n=1e3,o=60*n,i=60*o,r=24*i;t=setInterval((function(){var a=new Date,c=e-a;if(c<0)clearInterval(t);else{Math.floor(c/r);var s=Math.floor(c%r/i),l=Math.floor(c%i/o),u=Math.floor(c%o/n);document.getElementById("horas").innerHTML=s<10?"0"+s:s,document.getElementById("minutos").innerHTML=l<10?"0"+l:l,document.getElementById("segundos").innerHTML=u<10?"0"+u:u}}),1e3)},{init:function(){n()}})}]);