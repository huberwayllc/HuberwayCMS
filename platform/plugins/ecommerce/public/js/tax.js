$((function(){var e="ecommerce-tax-rule-table",r="#"+e,a=r+"_wrapper",t=$(".create-tax-rule-form-modal"),o=t.find(".modal-body"),n=t.find(".modal-title strong"),l=function(e){o.html(e.data.html),n.text(e.message||"...")};t.on("show.bs.modal",(function(){o.html('<div class=\'w-100 text-center py-3\'><div class="spinner-border" role="status">\n        <span class="visually-hidden">Loading...</span>\n    </div></div>'),n.text("...")})),$(document).on("click",a+" .create-tax-rule-item",(function(e){e.preventDefault();var r=$(e.currentTarget);t.modal("show"),$.ajax({url:r.find("[data-action=create]").data("href"),success:function(e){0==e.error?(l(e),HuberwayCMS.initResources()):HuberwayCMS.showError(e.message)},error:function(e){HuberwayCMS.handleError(e)}})})),$(document).on("click",r+" .btn-edit-item",(function(e){e.preventDefault();var r=$(e.currentTarget);t.modal("show"),$.ajax({url:r.prop("href"),success:function(e){0==e.error?(l(e),HuberwayCMS.initResources()):HuberwayCMS.showError(e.message)},error:function(e){HuberwayCMS.handleError(e)}})})),$(document).on("submit","#ecommerce-tax-rule-form",(function(r){r.preventDefault();var a=$(r.currentTarget);$.ajax({url:a.prop("action"),method:"POST",data:a.serializeArray(),success:function(r){0==r.error?(window.LaravelDataTables&&window.LaravelDataTables[e]&&LaravelDataTables[e].draw(),t.modal("hide")):HuberwayCMS.showError(r.message)},error:function(e){HuberwayCMS.handleError(e)}})}))}));