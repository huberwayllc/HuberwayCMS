(()=>{var t;function e(t){return e="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},e(t)}function a(t,e){for(var a=0;a<e.length;a++){var r=e[a];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,o(r.key),r)}}function r(t,e,a){return(e=o(e))in t?Object.defineProperty(t,e,{value:a,enumerable:!0,configurable:!0,writable:!0}):t[e]=a,t}function o(t){var a=function(t,a){if("object"!=e(t)||!t)return t;var r=t[Symbol.toPrimitive];if(void 0!==r){var o=r.call(t,a||"default");if("object"!=e(o))return o;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===a?String:Number)(t)}(t,"string");return"symbol"==e(a)?a:String(a)}var n=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t),r(this,"setProductVariationDefault",(function(){$(document).on("click",".table-hover-variants input[name=variation_default_id]",(function(t){var e=$(t.currentTarget).data("url");e&&$.ajax({url:e,method:"POST",success:function(t){t.error?HuberwayCMS.showError(t.message):HuberwayCMS.showSuccess(t.message)},error:function(t){HuberwayCMS.handleError(t)}})}))})),this.$body=$("body"),this.initElements(),this.handleEvents(),this.handleChangeSaleType(),this.handleShipping(),this.handleStorehouse(),this.handleModifyAttributeSets(),this.handleAddVariations(),this.handleDeleteVariations(),this.setProductVariationDefault(),this.handleCalculateDiscountPercents(),window.productAttributeSets=[],window.loadedProductAttributeSets=!1,this.productAttributeSets();$.fn.select2.amd.require(["select2/data/array","select2/utils"],(function(t,e){function a(t,e){a.__super__.constructor.call(this,t,e)}e.Extend(a,t),a.prototype.query=function(t,e){var a;a=t.term&&""!==t.term?_.filter(this.options.options.data,(function(e){return e.text.toUpperCase().indexOf(t.term.toUpperCase())>=0})):this.options.options.data,"page"in t||(t.page=1),e({results:a.slice(50*(t.page-1),50*t.page),pagination:{more:50*t.page<a.length}})},window.CustomDataApdapterSelect2=a}))}var e,o,n;return e=t,(o=[{key:"productAttributeSets",value:function(){var t=$(".product-attribute-sets-url").data("url");t?$.ajax({url:t,success:function(t){!1===t.error?(window.productAttributeSets=t.data,window.loadedProductAttributeSets=!0):window.loadedProductAttributeSets=null},error:function(t){HuberwayCMS.handleError(t)}}):window.loadedProductAttributeSets=!0}},{key:"handleEvents",value:function(){var t=this;t.$body.on("click",".select-all",(function(t){t.preventDefault();var e=$($(t.currentTarget).attr("href"));e.find("option").attr("selected",!0),e.trigger("change")})),t.$body.on("click",".deselect-all",(function(t){t.preventDefault();var e=$($(t.currentTarget).attr("href"));e.find("option").removeAttr("selected"),e.trigger("change")})),t.$body.on("change","#attribute_sets",(function(t){var e=$("#attribute_set_group"),a=$(t.currentTarget).val();e.find(".panel").hide(),a&&_.forEach(a,(function(t){e.find('.panel[data-id="'+t+'"]').show()})),$(".select2-select").select2()})),$("#attribute_sets").trigger("change"),t.$body.on("change",".is-variation-default input",(function(t){var e=$(t.currentTarget),a=e.is(":checked");$(".is-variation-default input").prop("checked",!1),a&&e.prop("checked",!0)})),$(document).on("change",".table-check-all",(function(t){$(t.currentTarget).prop("checked")?$(".btn-trigger-delete-selected-variations").show():$(".btn-trigger-delete-selected-variations").hide()})),$(document).on("change",".checkboxes",(function(t){$(t.currentTarget).closest(".table-hover-variants").find(".checkboxes:checked").length>0?$(".btn-trigger-delete-selected-variations").show():$(".btn-trigger-delete-selected-variations").hide()})),$(document).on("click",".btn-trigger-delete-selected-variations",(function(t){t.preventDefault();var e=$(t.currentTarget),a=[];if($(".table-hover-variants").find(".checkboxes:checked").each((function(t,e){a[t]=$(e).val()})),0===a.length)return HuberwayCMS.showError(HuberwayCMSVariables.languages.tables.please_select_record),!1;$("#delete-selected-variations-button").data("href",e.data("target")),$("#delete-variations-modal").modal("show")})),$("#delete-selected-variations-button").off("click").on("click",(function(e){e.preventDefault();var a=$(e.currentTarget);a.addClass("button-loading");var r=$(".table-hover-variants"),o=[];r.find(".checkboxes:checked").each((function(t,e){o[t]=$(e).val()})),$.ajax({url:a.data("href"),type:"POST",data:{_method:"DELETE",ids:o},success:function(e){e.error?HuberwayCMS.showError(e.message):(HuberwayCMS.showSuccess(e.message),t.afterDeleteVersion(e,r),$(".btn-trigger-delete-selected-variations").hide(),a.closest(".modal").modal("hide"),r.find(".table-check-all").prop("checked",!1).prop("indeterminate",!1))},error:function(t){HuberwayCMS.handleError(t)},complete:function(){a.removeClass("button-loading")}})}))}},{key:"afterDeleteVersion",value:function(t,e){if(e||(e=$("#product-variations-wrapper").find("table")),0==t.data.total_product_variations){var a=this;$("#main-manage-product-type").load(window.location.href+" #main-manage-product-type > *",(function(){a.initElements(),a.handleEvents()}))}else e.length&&window.LaravelDataTables&&LaravelDataTables[e.attr("id")]&&LaravelDataTables[e.attr("id")].draw()}},{key:"initElements",value:function(){$(".select2-select").select2(),$(".form-date-time").datetimepicker({format:"YYYY-MM-DD HH:mm:ss",toolbarPlacement:"bottom",showTodayButton:!0,stepping:1}),$("#attribute_set_group .panel-collapse").on("shown.bs.collapse",(function(){$(".select2-select").select2()})),$('a[data-bs-toggle="tab"]').on("shown.bs.tab",(function(){$(".select2-select").select2()}))}},{key:"handleChangeSaleType",value:function(){this.$body.on("click",".turn-on-schedule",(function(t){t.preventDefault();var e=$(t.currentTarget),a=e.closest(".price-group");e.hide(),a.find(".turn-off-schedule").show(),a.find(".detect-schedule").val(1),a.find(".scheduled-time").show()})),this.$body.on("click",".turn-off-schedule",(function(t){t.preventDefault();var e=$(t.currentTarget),a=e.closest(".price-group");e.hide(),a.find(".turn-on-schedule").show(),a.find(".detect-schedule").val(0),a.find(".scheduled-time").hide()}))}},{key:"handleStorehouse",value:function(){this.$body.on("click","input.storehouse-management-status",(function(t){var e=$(".storehouse-info");!0===$(t.currentTarget).prop("checked")?(e.show(),$(".stock-status-wrapper").hide()):(e.hide(),$(".stock-status-wrapper").show())}))}},{key:"handleShipping",value:function(){this.$body.on("click",".change-measurement .dropdown-menu a",(function(t){t.preventDefault();var e=$(t.currentTarget),a=e.closest(".change-measurement");a.find("input[type=hidden]").val(e.attr("data-alias")),a.find(".dropdown-toggle .alias").html(e.attr("data-alias"))}))}},{key:"handleModifyAttributeSets",value:function(){this.$body.on("click","#store-related-attributes-button",(function(t){t.preventDefault();var e=$(t.currentTarget),a=[];e.closest(".modal-content").find(".attribute-set-item:checked").each((function(t,e){a[t]=$(e).val()})),$.ajax({url:e.data("target"),type:"POST",data:{attribute_sets:a},beforeSend:function(){e.addClass("button-loading")},success:function(t){t.error?HuberwayCMS.showError(t.message):(HuberwayCMS.showSuccess(t.message),$("#select-attribute-sets-modal").modal("hide"),$("form").removeClass("dirty"),window.location.reload())},error:function(t){HuberwayCMS.handleError(t)},complete:function(){e.removeClass("button-loading")}})}))}},{key:"handleAddVariations",value:function(){var t=this,e=function(t){var e=t.closest(".modal-content").find(".variation-form-wrapper form"),a=new FormData(e[0]);a=HuberwayCMS.unmaskInputNumber(e,a),$.ajax({url:t.data("target"),type:"POST",data:a,processData:!1,contentType:!1,beforeSend:function(){t.addClass("button-loading")},success:function(e){if(e.error)HuberwayCMS.showError(e.message);else{HuberwayCMS.showSuccess(e.message),t.closest(".modal.fade").modal("hide");var a=$("#product-variations-wrapper").find("table");a.length&&window.LaravelDataTables&&LaravelDataTables[a.attr("id")]&&LaravelDataTables[a.attr("id")].draw(),t.closest(".modal-content").find(".variation-form-wrapper").remove()}},complete:function(){t.removeClass("button-loading")},error:function(t){HuberwayCMS.handleError(t)}})};t.$body.on("click","#store-product-variation-button",(function(t){t.preventDefault(),e($(t.currentTarget))})),t.$body.on("click","#update-product-variation-button",(function(t){t.preventDefault(),e($(t.currentTarget))})),$("#add-new-product-variation-modal").on("hidden.bs.modal",(function(t){$(this).find(".modal-content .variation-form-wrapper").remove()})),$("#edit-product-variation-modal").on("hidden.bs.modal",(function(t){$(this).find(".modal-content .variation-form-wrapper").remove()})),t.$body.on("click","#generate-all-versions-button",(function(t){t.preventDefault();var e=$(t.currentTarget);$.ajax({url:e.data("target"),type:"POST",beforeSend:function(){e.addClass("button-loading")},success:function(t){t.error?HuberwayCMS.showError(t.message):(HuberwayCMS.showSuccess(t.message),$("#generate-all-versions-modal").modal("hide"),window.LaravelDataTables[$("#product-variations-wrapper .dataTables_wrapper table").prop("id")].draw())},complete:function(){e.removeClass("button-loading")},error:function(t){HuberwayCMS.handleError(t)}})})),$(document).on("click",".btn-trigger-add-new-product-variation",(function(e){e.preventDefault();var a=$(e.currentTarget);$("#add-new-product-variation-modal .modal-body .loading-spinner").show(),$("#add-new-product-variation-modal .modal-body .variation-form-wrapper").remove(),$("#add-new-product-variation-modal").modal("show"),$.ajax({url:a.data("load-form"),type:"GET",success:function(e){e.error?HuberwayCMS.showError(e.message):($("#add-new-product-variation-modal .modal-body .loading-spinner").hide(),$("#add-new-product-variation-modal .modal-body").append(e.data),$("#add-new-product-variation-modal .select-attributes").map((function(t,e){var a=productAttributeSets.find((function(t){return t.id===$(e).data("id")}));a&&(a=a.attributes.map((function(t){return{id:t.id,text:t.title}})),HuberwayCMS.select(e,{data:a,ajax:{},dataAdapter:CustomDataApdapterSelect2,dropdownParent:$("#add-new-product-variation-modal")}))})),t.initElements(),HuberwayCMS.initResources(),$("#store-product-variation-button").data("target",a.data("target")),$(".list-gallery-media-images").each((function(t,e){var a=$(e);a.data("ui-sortable")&&a.sortable("destroy"),a.sortable()})))},error:function(t){HuberwayCMS.handleError(t)}})})),$(document).on("click",".btn-trigger-edit-product-version",(function(e){e.preventDefault();var a=$(e.currentTarget);$("#update-product-variation-button").data("target",$(e.currentTarget).data("target")),$("#edit-product-variation-modal .modal-body .loading-spinner").show(),$("#edit-product-variation-modal .modal-body .variation-form-wrapper").remove(),$("#edit-product-variation-modal").modal("show"),$.ajax({url:a.data("load-form"),type:"GET",success:function(e){e.error?HuberwayCMS.showError(e.message):($("#edit-product-variation-modal .modal-body .loading-spinner").hide(),$("#edit-product-variation-modal .modal-body").append(e.data),$("#edit-product-variation-modal .select-attributes").map((function(t,e){var a=productAttributeSets.find((function(t){return t.id==$(e).data("id")}));a&&(a=a.attributes.map((function(t,e){return{id:t.id,text:t.title}})),HuberwayCMS.select(e,{data:a,ajax:{},dataAdapter:CustomDataApdapterSelect2,dropdownParent:$("#edit-product-variation-modal")}))})),t.initElements(),HuberwayCMS.initResources(),$(".list-gallery-media-images").each((function(t,e){var a=$(e);a.data("ui-sortable")&&a.sortable("destroy"),a.sortable()})))},error:function(t){HuberwayCMS.handleError(t)}})})),t.$body.on("click",".btn-trigger-add-attribute-to-simple-product",(function(t){t.preventDefault();var e=$(t.currentTarget),a=[],r=[];$.each($(".list-product-attribute-items-wrap .product-attribute-set-item"),(function(t,e){var o=$(e).find(".product-select-attribute-item").val();""!==o&&(a.push($(e).find(".product-select-attribute-item-value").val()),r.push(o))})),a.length&&$.ajax({url:e.data("target"),type:"POST",data:{added_attributes:a,added_attribute_sets:r},beforeSend:function(){e.addClass("button-loading")},success:function(t){t.error?HuberwayCMS.showError(t.message):($("form").removeClass("dirty"),window.location.reload(),HuberwayCMS.showSuccess(t.message))},complete:function(){e.removeClass("button-loading")},error:function(t){HuberwayCMS.handleError(t)}})}))}},{key:"handleDeleteVariations",value:function(){var t=this;$(document).on("click",".btn-trigger-delete-version",(function(t){t.preventDefault(),$("#delete-version-button").data("target",$(t.currentTarget).data("target")).data("id",$(t.currentTarget).data("id")),$("#confirm-delete-version-modal").modal("show")})),t.$body.on("click","#delete-version-button",(function(e){e.preventDefault();var a=$(e.currentTarget);$.ajax({url:a.data("target"),type:"POST",beforeSend:function(){a.addClass("button-loading")},success:function(e){e.error?HuberwayCMS.showError(e.message):(t.afterDeleteVersion(e),$("#confirm-delete-version-modal").modal("hide"),HuberwayCMS.showSuccess(e.message))},complete:function(){a.removeClass("button-loading")},error:function(t){HuberwayCMS.handleError(t)}})}))}},{key:"handleCalculateDiscountPercents",value:function(){$(document).on("keyup",'input[name="price"], input[name="sale_price"]',(function(){var t=$('input[name="sale_price"]'),e=$('input[name="price"]').val(),a=t.val(),r=0;e&&"0"!==e&&a>=0&&(e=parseInt(e.replace(/,/g,"")),(a=parseInt(a.replace(/,/g,"")))<e&&(r=100-Math.round(100*a/e)));var o=t.data("sale-percent-text");t.closest(".input-group").siblings("small.form-hint").html(o.replace(":percent","<strong>".concat(r,"%</strong>")))}))}}])&&a(e.prototype,o),n&&a(e,n),Object.defineProperty(e,"prototype",{writable:!1}),t}();t=n,r(n,"tableInitComplete",(function(e,a){a.oInit.paging&&t.initHeaderFilterColumns(e,a)})),r(n,"initHeaderFilterColumns",(function(e,a){var r=t;if(window.loadedProductAttributeSets){var o=document.createElement("tr");$(o).prop("role","row").addClass("dataTable-custom-filter");var n=a.searchDelay||0,i=$.fn.dataTable.util.throttle,d=$(a.nTableWrapper);if(e.columns().every((function(t){var e,r=this,d=r.settings()[0].aoColumns[t],c=$(document.createElement("th")).appendTo($(o));if(d.searchable&&"customSelect"==(null==d||null===(e=d.search_data)||void 0===e?void 0:e.type)){var l=$("<div><select class='form-select input-sm' data-placeholder='".concat(d.search_data.placeholder||"Select","'></select></div>"));c.append(l),l=c.find("select");var s=productAttributeSets.find((function(t){return t.id==d.search_data.attribute_set_id})),u=[{id:"",text:""}];s&&(u=u.concat(s.attributes.map((function(t,e){return{id:t.id,text:t.title}})))),HuberwayCMS.select(l,{data:u,width:"100%",dropdownAutoWidth:!0,allowClear:!0,ajax:{},dataAdapter:CustomDataApdapterSelect2}),l.on("change",(function(){!function(t,e){n&&i((function(){t.search(e).draw()}),n)()}(r,$(this).val()||"")}))}a.oInit.responsive&&(r.responsiveHidden()&&r.visible()||c.hide())})),$(o).appendTo(d.find("thead")),a.oInit.responsive){e.on("responsive-resize",(function(t,e,a){!function(t){for(var e=0;e<t.length;e++)t[e]?d.find(".dataTable-custom-filter th:eq("+e+")").show():d.find(".dataTable-custom-filter th:eq("+e+")").hide()}(a)}))}}else{if(null==window.loadedProductAttributeSets)return;setTimeout((function(){r.initHeaderFilterColumns(e,a)}),1500)}})),$((function(){new n,window.EcommerceProduct=n,$("body").on("click",".list-gallery-media-images .btn_remove_image",(function(t){t.preventDefault(),$(t.currentTarget).closest("li").remove()})),$(document).on("click",".btn-trigger-select-product-attributes",(function(t){t.preventDefault(),$("#store-related-attributes-button").data("target",$(t.currentTarget).data("target")),$("#select-attribute-sets-modal").modal("show")})),$(document).on("click",".btn-trigger-generate-all-versions",(function(t){t.preventDefault(),$("#generate-all-versions-button").data("target",$(t.currentTarget).data("target")),$("#generate-all-versions-modal").modal("show")})),$(document).on("click",".btn-trigger-add-attribute",(function(t){t.preventDefault(),$(".list-product-attribute-wrap").toggle(),$(".list-product-attribute-values-wrap").toggle();var e=$(t.currentTarget);e.toggleClass("adding_attribute_enable text-warning"),e.hasClass("adding_attribute_enable")?($("#is_added_attributes").val(1),$(".list-product-attribute-items-wrap .product-attribute-set-item").length||a()):$("#is_added_attributes").val(0);var r=e.data("toggle-text");e.data("toggle-text",e.text()),e.text(r)}));var t=function(){var t=$(".list-product-attribute-items-wrap .product-attribute-set-item select.product-select-attribute-item option");$.each(t,(function(t,e){var a=$(e),r=a.prop("value");r!==a.closest("select").val()&&(0===$(".list-product-attribute-items-wrap .product-attribute-set-item select.product-select-attribute-item[data-set-id=".concat(r,"]")).length?a.prop("disabled",!1):a.prop("disabled",!0))}));var e=[];$.each($("select.product-select-attribute-item"),(function(t,a){""!==$(a).val()&&e.push(t)})),e.length?$(".btn-trigger-add-attribute-to-simple-product").show():$(".btn-trigger-add-attribute-to-simple-product").hide()};$(document).on("change",".product-select-attribute-item",(function(e){var a=$(e.currentTarget),r=a.closest(".product-attribute-set-item"),o=a.val();r.find(".product-select-attribute-item").attr("data-set-id",a.val());var n=r.find(".product-select-attribute-item-value");n.prop("name","added_attributes["+o+"]");var i=productAttributeSets.find((function(t){return t.id==o}));null!=i&&i.attributes&&(n.empty().select2({data:i.attributes.map((function(t){return{id:t.id,text:t.title}})),ajax:{},dataAdapter:CustomDataApdapterSelect2}),t())}));var e,a=function(){var t=$("#attribute_item_wrap_template"),e="product-attribute-set-"+(Math.random()+1).toString(36).substring(7),a=t.html().replace("__id__",e),r=null;$(".list-product-attribute-items-wrap .product-attribute-set-item").length&&$.each($(".product-attribute-set-item .product-select-attribute-item option"),(function(t,e){var a=$(e),o=a.prop("value");if(o!==a.closest("select").val()&&!1===a.prop("disabled"))return r=o,!1}));var o=$(".list-product-attribute-items-wrap");o.append(a);var n=$("#"+e).find(".product-select-attribute-item");n.select2({data:productAttributeSets.map((function(t){return{id:t.id,text:t.title}}))}),r?n.val(r).trigger("change"):n.trigger("change"),o.find(".product-attribute-set-item").length==productAttributeSets.length&&$(".btn-trigger-add-attribute-item").hide()};$(document).on("click",".btn-trigger-add-attribute-item",(function(e){e.preventDefault(),a(),$(".product-set-item-delete-action").show(),t()})),$(document).on("click",".product-set-item-delete-action button",(function(e){e.preventDefault(),$(e.currentTarget).closest(".product-attribute-set-item").remove();var a=$(".list-product-attribute-items-wrap .product-attribute-set-item").length;a<2?$(".product-set-item-delete-action").hide():a<productAttributeSets.length&&$(".btn-trigger-add-attribute-item").show(),t()})),"undefined"!=typeof RvMediaStandAlone&&new RvMediaStandAlone(".images-wrapper .btn-trigger-edit-product-image",{filter:"image",view_in:"all_media",onSelectFiles:function(t,e){var a=_.first(t),r=e.closest(".product-image-item-handler").find(".image-box"),o=e.closest(".list-gallery-media-images");r.find(".image-data").val(a.url),r.find(".preview_image").attr("src",a.thumb).show(),_.forEach(t,(function(t,e){if(e){var a=$(document).find("#product_select_image_template").html().replace(/__name__/gi,r.find(".image-data").attr("name")),n=$('<li class="product-image-item-handler">'+a+"</li>");n.find(".image-data").val(t.url),n.find(".preview_image").attr("src",t.thumb).show(),o.append(n)}}))}}),$(document).on("click",".btn-trigger-remove-product-image",(function(t){t.preventDefault(),$(t.currentTarget).closest(".product-image-item-handler").remove(),0===$(".list-gallery-media-images").find(".product-image-item-handler").length&&$(".default-placeholder-product-image").show()})),$(document).on("click",".list-search-data .selectable-item",(function(t){t.preventDefault();var e=$(t.currentTarget),a=e.closest(".box-search-advance").find("input[type=hidden]");if(a.length){var r=a.val().split(",");$.each(r,(function(t,e){r[t]=parseInt(e)})),$.inArray(e.data("id"),r)<0&&(a.val()?a.val("".concat(a.val(),",").concat(e.data("id"))):a.val(e.data("id")))}var o=$(document).find("#".concat(e.closest(".box-search-advance").data("template"))).html().replace(/__name__/gi,e.data("name")).replace(/__id__/gi,e.data("id")).replace(/__url__/gi,e.data("url")).replace(/__image__/gi,e.data("image")).replace(/__attributes__/gi,e.find("a span").text());e.closest(".box-search-advance").find(".list-selected-products").show(),e.closest(".box-search-advance").find(".list-selected-products").append(o),e.closest(".card").hide()})),$(document).on("click",'[data-bb-toggle="product-search-advanced"]',(function(t){var e=$(t.currentTarget),a=e.closest(".box-search-advance").find(".card");a.show(),a.addClass("active"),0===a.find(".card-body").length&&(HuberwayCMS.showLoading(a),$.ajax({url:e.data("bb-target"),type:"GET",success:function(t){t.error?HuberwayCMS.showError(t.message):a.html(t.data)},error:function(t){HuberwayCMS.handleError(t)},complete:function(){HuberwayCMS.hideLoading(a)}}))}));var r=!1;$(document).on("keyup",'[data-bb-toggle="product-search-advanced"]',(function(t){t.preventDefault();var a=$(t.currentTarget),o=a.closest(".box-search-advance").find(".card");setTimeout((function(){HuberwayCMS.showLoading(o),r&&e.abort(),r=!0,e=$.ajax({url:a.data("bb-target"),data:{keyword:a.val()},type:"GET",success:function(t){t.error?HuberwayCMS.showError(t.message):o.html(t.data),r=!1},error:function(t){"abort"!==t.statusText&&HuberwayCMS.handleError(t)},complete:function(){HuberwayCMS.hideLoading(o)}})}),500)})),$(document).on("click",".box-search-advance .page-link",(function(t){t.preventDefault();var e=$(t.currentTarget).closest(".box-search-advance").find('[data-bb-toggle="product-search-advanced"]');if(!e.closest(".page-item").hasClass("disabled")&&e.data("bb-target")){var a=e.closest(".box-search-advance").find(".card");HuberwayCMS.showLoading(a),$.ajax({url:$(t.currentTarget).prop("href"),data:{keyword:e.val()},type:"GET",success:function(t){t.error?HuberwayCMS.showError(t.message):a.html(t.data)},error:function(t){HuberwayCMS.handleError(t)},complete:function(){HuberwayCMS.hideLoading(a)}})}})),$(document).on("click","body",(function(t){var e=$(".box-search-advance");e.is(t.target)||0!==e.has(t.target).length||e.find(".card").hide()})),$(document).on("click",'[data-bb-toggle="product-delete-item"]',(function(t){t.preventDefault();var e=$(t.currentTarget).closest(".box-search-advance").find("input[type=hidden]"),a=e.val().split(",");$.each(a,(function(t,e){e=e.trim(),_.isEmpty(e)||(a[t]=parseInt(e))}));var r=a.indexOf($(t.currentTarget).data("bb-target"));r>-1&&a.splice(r,1),e.val(a.join(",")),$(t.currentTarget).closest(".list-selected-products").find(".list-group-item").length<2&&$(t.currentTarget).closest(".list-selected-products").hide(),$(t.currentTarget).closest(".list-group-item").remove()}));$((function(){var t;(t=$(".wrap-relation-product")).length&&(HuberwayCMS.showLoading(t),$.ajax({url:t.data("target"),type:"GET",success:function(e){e.error?HuberwayCMS.showError(e.message):(t.html(e.data),HuberwayCMS.initResources())},error:function(t){HuberwayCMS.handleError(t)},complete:function(){HuberwayCMS.hideLoading(t)}}))})),$(document).on("click",".digital_attachments_btn",(function(t){t.preventDefault(),$(t.currentTarget).closest(".product-type-digital-management").find("input[type=file]").last().trigger("click")})),$(document).on("change","input[name^=product_files_input]",(function(t){var e=$(t.currentTarget),a=e[0].files[0];if(a){var r=e.closest(".product-type-digital-management"),o=e.data("id"),n=$("#digital_attachment_template").html();n=n.replace(/__id__/gi,o).replace(/__file_name__/gi,a.name).replace(/__file_size__/gi,function(t){var e=!(arguments.length>1&&void 0!==arguments[1])||arguments[1],a=arguments.length>2&&void 0!==arguments[2]?arguments[2]:2,r=e?1e3:1024;if(Math.abs(t)<r)return t+" B";var o=e?["kB","MB","GB","TB","PB","EB","ZB","YB"]:["KiB","MiB","GiB","TiB","PiB","EiB","ZiB","YiB"],n=-1,i=Math.pow(10,a);do{t/=r,++n}while(Math.round(Math.abs(t)*i)/i>=r&&n<o.length-1);return HuberwayCMS.numberFormat(t,a,",",".")+" "+o[n]}(a.size));var i=Math.floor(26*Math.random())+Date.now();r.find("table tbody").append(n),r.find(".digital_attachments_input").append('<input type="file" name="product_files_input[]" data-id="'.concat(i,'">'))}})),$(document).on("change","input.digital-attachment-checkbox",(function(t){var e=$(t.currentTarget),a=e.closest("tr");e.is(":checked")?a.removeClass("detach"):a.addClass("detach")})),$(document).on("click",".remove-attachment-input",(function(t){var e=$(t.currentTarget).closest("tr"),a=e.data("id");$("input[data-id="+a+"]").remove(),e.fadeOut(300,(function(){$(this).remove()}))})),$(document).on("click",".digital_attachments_external_btn",(function(t){t.preventDefault();var e=$(t.currentTarget).closest(".product-type-digital-management"),a=Math.floor(26*Math.random())+Date.now(),r=$("#digital_attachment_external_template").html();r=r.replace(/__id__/gi,a),e.find("table tbody").append(r)})),$(document).on("click",".btn-trigger-duplicate-product",(function(t){$("#confirm-duplicate-product-button").data("url",$(t.currentTarget).data("url")),$("#duplicate-product-modal").modal("show")})).on("click","#confirm-duplicate-product-button",(function(t){var e=$(t.currentTarget);$.ajax({url:e.data("url"),type:"POST",beforeSend:function(){e.prop("disabled",!0),e.addClass("button-loading")},success:function(t){var e=t.error,a=t.message,r=t.data;e?HuberwayCMS.showError(a):(HuberwayCMS.showSuccess(a),$("#duplicate-product-modal").modal("hide"),setTimeout((function(){return window.location.href=r.next_url}),1e3))},error:function(t){HuberwayCMS.handleError(t)},complete:function(){e.removeClass("button-loading"),e.prop("disabled",!1)}})}))}))})();