$((function(){$(document).on("click",".verify-customer-email-button",(function(o){o.preventDefault(),$("#confirm-verify-customer-email-button").data("action",$(o.currentTarget).prop("href")),$("#verify-customer-email-modal").modal("show")})),$(document).on("click","#confirm-verify-customer-email-button",(function(o){o.preventDefault();var e=$(o.currentTarget);e.addClass("button-loading"),$.ajax({type:"POST",cache:!1,url:e.data("action"),success:function(o){o.error?HuberwayCMS.showError(o.message):(HuberwayCMS.showSuccess(o.message),setTimeout((function(){window.location.reload()}),2e3)),e.removeClass("button-loading"),e.closest(".modal").modal("hide")},error:function(o){HuberwayCMS.handleError(o),e.removeClass("button-loading")}})}))}));