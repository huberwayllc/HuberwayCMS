$((function(){"use strict";var e=function(){var e=window.themeIcons||[];e&&$(document).find(".icon-select").each((function(t,n){var a=$(n);if(!a.data("check-initialized")||!a.hasClass("select2-hidden-accessible")){var c=a.children("option:selected").val();c=c||0;var i='<option value="0">'+a.data("empty-value")+"</option>";e.forEach((function(e){i+='<option value="'+e+'">'+e+"</option>"})),a.html(i),a.val(c);var o=function(e){return e.id?$('<span><i class="'.concat(e.id,'"></i></span> ').concat(e.text,"</span>")):e.text};HuberwayCMS.select(n,{templateResult:function(e){return o(e)},templateSelection:function(e){return o(e)},placeholder:a.data("empty-value")})}}))};e(),document.addEventListener("core-init-resources",(function(){e()}))}));