(()=>{function t(e){return t="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},t(e)}function e(t,e){for(var n=0;n<e.length;n++){var a=e[n];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(t,o(a.key),a)}}function o(e){var o=function(e,o){if("object"!=t(e)||!e)return e;var n=e[Symbol.toPrimitive];if(void 0!==n){var a=n.call(e,o||"default");if("object"!=t(a))return a;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===o?String:Number)(e)}(e,"string");return"symbol"==t(o)?o:String(o)}var n={},a=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}var o,a,i;return o=t,i=[{key:"loadWidget",value:function(e,o,a,i){var r=e.closest(".widget-item"),d=r.prop("id"),l=r.find(".card");void 0!==i&&(n[d]=i);var s=r.find("a.collapse-expand");if(!s.length||!s.hasClass("collapse")){HuberwayCMS.showLoading(l),void 0!==a&&null!=a||(a={});var c=r.find(".dropdown.predefined_range .dropdown-item.active");c.length&&(a.predefined_range=c.data("key")),$httpClient.makeWithoutErrorHandler().get(o,a).then((function(o){var a=o.data;e.html(a.data),void 0!==i?i():n[d]&&n[d](),t.initSortable()})).catch((function(t){var o,n=t.response,a=t.message,i=null==n||null===(o=n.data)||void 0===o?void 0:o.data;!i&&a&&(i='<div class="empty"><p class="empty-subtitle text-muted">'.concat(a,"</p></div>")),e.html(i)})).finally((function(){HuberwayCMS.hideLoading(l)}))}}},{key:"initSortable",value:function(){var t=$('[data-bb-toggle="widgets-list"]');t.length>0&&Sortable.create(t[0],{group:"widgets",sort:!0,delay:0,disabled:!1,store:null,animation:150,handle:".card-header",ghostClass:"sortable-ghost",chosenClass:"sortable-chosen",dataIdAttr:"data-id",forceFallback:!1,fallbackClass:"sortable-fallback",fallbackOnBody:!1,scroll:!0,scrollSensitivity:30,scrollSpeed:10,onUpdate:function(){var t=[];$.each($(".widget-item"),(function(e,o){t.push($(o).prop("id"))})),$httpClient.makeWithoutErrorHandler().post(route("dashboard.update_widget_order"),{items:t}).then((function(t){var e=t.data;HuberwayCMS.showSuccess(e.message)}))}})}}],(a=[{key:"init",value:function(){$('[data-bb-toggle="widgets-list"]').on("click",".page-link",(function(e){e.preventDefault();var o=$(e.currentTarget),n=o.prop("href");n&&t.loadWidget(o.closest(".widget-item").find(".widget-content"),n)})),$(document).on("click",".card-actions .dropdown.predefined_range .dropdown-item",(function(e){e.preventDefault();var o=$(e.currentTarget);o.closest(".dropdown").find(".dropdown-toggle").text(o.data("label")),o.closest(".dropdown").find(".dropdown-item").removeClass("active"),o.addClass("active"),t.loadWidget(o.closest(".widget-item").find(".widget-content"),o.closest(".widget-item").data("url"),{changed_predefined_range:1})}))}}])&&e(o.prototype,a),i&&e(o,i),Object.defineProperty(o,"prototype",{writable:!1}),t}();$((function(){(new a).init(),window.BDashboard=a,$(document).on("submit",'[data-bb-toggle="widgets-management-modal"] form',(function(t){t.preventDefault();var e=$(t.currentTarget),o=$(this).closest(".modal");$httpClient.make().withButtonLoading(e.find('button[type="submit"]')).postForm(e.prop("action"),new FormData(e[0])).then((function(t){var e=t.data;HuberwayCMS.showSuccess(e.message),setTimeout((function(){window.location.reload()}),1e3)})).finally((function(){o.modal("hide")}))})).on("change",'[data-bb-toggle="widgets-management-item"]',(function(t){var e=$(t.currentTarget);e.prop("checked")?e.closest("td").removeClass("text-decoration-line-through text-muted"):e.closest("td").addClass("text-decoration-line-through text-muted")}))}))})();