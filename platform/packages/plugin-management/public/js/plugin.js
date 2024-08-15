(()=>{function t(e){return t="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},t(e)}function e(t,e){var r="undefined"!=typeof Symbol&&t[Symbol.iterator]||t["@@iterator"];if(!r){if(Array.isArray(t)||(r=function(t,e){if(!t)return;if("string"==typeof t)return n(t,e);var r=Object.prototype.toString.call(t).slice(8,-1);"Object"===r&&t.constructor&&(r=t.constructor.name);if("Map"===r||"Set"===r)return Array.from(t);if("Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r))return n(t,e)}(t))||e&&t&&"number"==typeof t.length){r&&(t=r);var o=0,a=function(){};return{s:a,n:function(){return o>=t.length?{done:!0}:{done:!1,value:t[o++]}},e:function(t){throw t},f:a}}throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}var i,u=!0,c=!1;return{s:function(){r=r.call(t)},n:function(){var t=r.next();return u=t.done,t},e:function(t){c=!0,i=t},f:function(){try{u||null==r.return||r.return()}finally{if(c)throw i}}}}function n(t,e){(null==e||e>t.length)&&(e=t.length);for(var n=0,r=new Array(e);n<e;n++)r[n]=t[n];return r}function r(){"use strict";/*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */r=function(){return n};var e,n={},o=Object.prototype,a=o.hasOwnProperty,i=Object.defineProperty||function(t,e,n){t[e]=n.value},u="function"==typeof Symbol?Symbol:{},c=u.iterator||"@@iterator",l=u.asyncIterator||"@@asyncIterator",s=u.toStringTag||"@@toStringTag";function f(t,e,n){return Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}),t[e]}try{f({},"")}catch(e){f=function(t,e,n){return t[e]=n}}function p(t,e,n,r){var o=e&&e.prototype instanceof w?e:w,a=Object.create(o.prototype),u=new B(r||[]);return i(a,"_invoke",{value:_(t,n,u)}),a}function h(t,e,n){try{return{type:"normal",arg:t.call(e,n)}}catch(t){return{type:"throw",arg:t}}}n.wrap=p;var v="suspendedStart",d="suspendedYield",m="executing",y="completed",g={};function w(){}function b(){}function x(){}var k={};f(k,c,(function(){return this}));var L=Object.getPrototypeOf,$=L&&L(L(C([])));$&&$!==o&&a.call($,c)&&(k=$);var E=x.prototype=w.prototype=Object.create(k);function j(t){["next","throw","return"].forEach((function(e){f(t,e,(function(t){return this._invoke(e,t)}))}))}function O(e,n){function r(o,i,u,c){var l=h(e[o],e,i);if("throw"!==l.type){var s=l.arg,f=s.value;return f&&"object"==t(f)&&a.call(f,"__await")?n.resolve(f.__await).then((function(t){r("next",t,u,c)}),(function(t){r("throw",t,u,c)})):n.resolve(f).then((function(t){s.value=t,u(s)}),(function(t){return r("throw",t,u,c)}))}c(l.arg)}var o;i(this,"_invoke",{value:function(t,e){function a(){return new n((function(n,o){r(t,e,n,o)}))}return o=o?o.then(a,a):a()}})}function _(t,n,r){var o=v;return function(a,i){if(o===m)throw new Error("Generator is already running");if(o===y){if("throw"===a)throw i;return{value:e,done:!0}}for(r.method=a,r.arg=i;;){var u=r.delegate;if(u){var c=S(u,r);if(c){if(c===g)continue;return c}}if("next"===r.method)r.sent=r._sent=r.arg;else if("throw"===r.method){if(o===v)throw o=y,r.arg;r.dispatchException(r.arg)}else"return"===r.method&&r.abrupt("return",r.arg);o=m;var l=h(t,n,r);if("normal"===l.type){if(o=r.done?y:d,l.arg===g)continue;return{value:l.arg,done:r.done}}"throw"===l.type&&(o=y,r.method="throw",r.arg=l.arg)}}}function S(t,n){var r=n.method,o=t.iterator[r];if(o===e)return n.delegate=null,"throw"===r&&t.iterator.return&&(n.method="return",n.arg=e,S(t,n),"throw"===n.method)||"return"!==r&&(n.method="throw",n.arg=new TypeError("The iterator does not provide a '"+r+"' method")),g;var a=h(o,t.iterator,n.arg);if("throw"===a.type)return n.method="throw",n.arg=a.arg,n.delegate=null,g;var i=a.arg;return i?i.done?(n[t.resultName]=i.value,n.next=t.nextLoc,"return"!==n.method&&(n.method="next",n.arg=e),n.delegate=null,g):i:(n.method="throw",n.arg=new TypeError("iterator result is not an object"),n.delegate=null,g)}function P(t){var e={tryLoc:t[0]};1 in t&&(e.catchLoc=t[1]),2 in t&&(e.finallyLoc=t[2],e.afterLoc=t[3]),this.tryEntries.push(e)}function T(t){var e=t.completion||{};e.type="normal",delete e.arg,t.completion=e}function B(t){this.tryEntries=[{tryLoc:"root"}],t.forEach(P,this),this.reset(!0)}function C(n){if(n||""===n){var r=n[c];if(r)return r.call(n);if("function"==typeof n.next)return n;if(!isNaN(n.length)){var o=-1,i=function t(){for(;++o<n.length;)if(a.call(n,o))return t.value=n[o],t.done=!1,t;return t.value=e,t.done=!0,t};return i.next=i}}throw new TypeError(t(n)+" is not iterable")}return b.prototype=x,i(E,"constructor",{value:x,configurable:!0}),i(x,"constructor",{value:b,configurable:!0}),b.displayName=f(x,s,"GeneratorFunction"),n.isGeneratorFunction=function(t){var e="function"==typeof t&&t.constructor;return!!e&&(e===b||"GeneratorFunction"===(e.displayName||e.name))},n.mark=function(t){return Object.setPrototypeOf?Object.setPrototypeOf(t,x):(t.__proto__=x,f(t,s,"GeneratorFunction")),t.prototype=Object.create(E),t},n.awrap=function(t){return{__await:t}},j(O.prototype),f(O.prototype,l,(function(){return this})),n.AsyncIterator=O,n.async=function(t,e,r,o,a){void 0===a&&(a=Promise);var i=new O(p(t,e,r,o),a);return n.isGeneratorFunction(e)?i:i.next().then((function(t){return t.done?t.value:i.next()}))},j(E),f(E,s,"Generator"),f(E,c,(function(){return this})),f(E,"toString",(function(){return"[object Generator]"})),n.keys=function(t){var e=Object(t),n=[];for(var r in e)n.push(r);return n.reverse(),function t(){for(;n.length;){var r=n.pop();if(r in e)return t.value=r,t.done=!1,t}return t.done=!0,t}},n.values=C,B.prototype={constructor:B,reset:function(t){if(this.prev=0,this.next=0,this.sent=this._sent=e,this.done=!1,this.delegate=null,this.method="next",this.arg=e,this.tryEntries.forEach(T),!t)for(var n in this)"t"===n.charAt(0)&&a.call(this,n)&&!isNaN(+n.slice(1))&&(this[n]=e)},stop:function(){this.done=!0;var t=this.tryEntries[0].completion;if("throw"===t.type)throw t.arg;return this.rval},dispatchException:function(t){if(this.done)throw t;var n=this;function r(r,o){return u.type="throw",u.arg=t,n.next=r,o&&(n.method="next",n.arg=e),!!o}for(var o=this.tryEntries.length-1;o>=0;--o){var i=this.tryEntries[o],u=i.completion;if("root"===i.tryLoc)return r("end");if(i.tryLoc<=this.prev){var c=a.call(i,"catchLoc"),l=a.call(i,"finallyLoc");if(c&&l){if(this.prev<i.catchLoc)return r(i.catchLoc,!0);if(this.prev<i.finallyLoc)return r(i.finallyLoc)}else if(c){if(this.prev<i.catchLoc)return r(i.catchLoc,!0)}else{if(!l)throw new Error("try statement without catch or finally");if(this.prev<i.finallyLoc)return r(i.finallyLoc)}}}},abrupt:function(t,e){for(var n=this.tryEntries.length-1;n>=0;--n){var r=this.tryEntries[n];if(r.tryLoc<=this.prev&&a.call(r,"finallyLoc")&&this.prev<r.finallyLoc){var o=r;break}}o&&("break"===t||"continue"===t)&&o.tryLoc<=e&&e<=o.finallyLoc&&(o=null);var i=o?o.completion:{};return i.type=t,i.arg=e,o?(this.method="next",this.next=o.finallyLoc,g):this.complete(i)},complete:function(t,e){if("throw"===t.type)throw t.arg;return"break"===t.type||"continue"===t.type?this.next=t.arg:"return"===t.type?(this.rval=this.arg=t.arg,this.method="return",this.next="end"):"normal"===t.type&&e&&(this.next=e),g},finish:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var n=this.tryEntries[e];if(n.finallyLoc===t)return this.complete(n.completion,n.afterLoc),T(n),g}},catch:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var n=this.tryEntries[e];if(n.tryLoc===t){var r=n.completion;if("throw"===r.type){var o=r.arg;T(n)}return o}}throw new Error("illegal catch attempt")},delegateYield:function(t,n,r){return this.delegate={iterator:C(t),resultName:n,nextLoc:r},"next"===this.method&&(this.arg=e),g}},n}function o(t,e,n,r,o,a,i){try{var u=t[a](i),c=u.value}catch(t){return void n(t)}u.done?e(c):Promise.resolve(c).then(r,o)}function a(t){return function(){var e=this,n=arguments;return new Promise((function(r,a){var i=t.apply(e,n);function u(t){o(i,r,a,u,c,"next",t)}function c(t){o(i,r,a,u,c,"throw",t)}u(void 0)}))}}function i(t,e){for(var n=0;n<e.length;n++){var r=e[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,u(r.key),r)}}function u(e){var n=function(e,n){if("object"!=t(e)||!e)return e;var r=e[Symbol.toPrimitive];if(void 0!==r){var o=r.call(e,n||"default");if("object"!=t(o))return o;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===n?String:Number)(e)}(e,"string");return"symbol"==t(n)?n:String(n)}var c=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}var n,o,u,c,l;return n=t,o=[{key:"init",value:function(){var t=this;$(document).on("click",".btn-trigger-remove-plugin",(function(t){t.preventDefault(),$("#confirm-remove-plugin-button").data("plugin",$(t.currentTarget).data("plugin")),$("#remove-plugin-modal").modal("show")})),$(document).on("click","#confirm-remove-plugin-button",(function(t){t.preventDefault();var e=$(t.currentTarget);$httpClient.make().withButtonLoading(e).delete(route("plugins.remove",{plugin:e.data("plugin")})).then((function(t){var e=t.data;HuberwayCMS.showSuccess(e.message),window.location.reload()})).finally((function(){return $("#remove-plugin-modal").modal("hide")}))})),$(document).on("click",".btn-trigger-update-plugin",(function(t){t.preventDefault();var e=$(t.currentTarget),n=e.data("uuid"),r=e.data("name");e.prop("disabled",!0),$httpClient.make().withButtonLoading(e).post(route("plugins.marketplace.ajax.update",{id:n,name:r})).then((function(t){var e=t.data;HuberwayCMS.showSuccess(e.message),setTimeout((function(){return window.location.reload()}),2e3)})).finally((function(){return e.prop("disabled",!1)}))})),$(document).on("click",".btn-trigger-change-status",function(){var e=a(r().mark((function e(n){var o,a;return r().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(n.preventDefault(),o=$(n.currentTarget),a=o.data("plugin"),1!==o.data("status")){e.next=7;break}return e.next=6,t.activateOrDeactivatePlugin(a);case 6:return e.abrupt("return");case 7:$httpClient.makeWithoutErrorHandler().withButtonLoading(o).post(route("plugins.check-requirement",{name:a})).then((function(){return t.activateOrDeactivatePlugin(a)})).catch((function(t){var e=t.response.data,n=e.data,r=e.message;if(n&&n.existing_plugins_on_marketplace){var o=$("#confirm-install-plugin-modal");return o.find(".modal-body #requirement-message").html(r),o.find('input[name="plugin_name"]').val(a),o.find('input[name="ids"]').val(n.existing_plugins_on_marketplace),void o.modal("show")}HuberwayCMS.showError(r)}));case 8:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}()),$(document).on("click","#confirm-install-plugin-button",function(){var n=a(r().mark((function n(o){var a,i,u,c,l,s,f,p,h,v,d,m;return r().wrap((function(n){for(;;)switch(n.prev=n.next){case 0:a=$(o.currentTarget),HuberwayCMS.showButtonLoading(a),i=a.parent().parent(),u=i.find('input[name="plugin_name"]').val(),c=i.find('input[name="ids"]').val(),l=[],s=e(c.split(",")),n.prev=7,s.s();case 9:if((f=s.n()).done){n.next=17;break}return p=f.value,n.next=13,t.installPlugin(p);case 13:(h=n.sent)&&l.push(h.name);case 15:n.next=9;break;case 17:n.next=22;break;case 19:n.prev=19,n.t0=n.catch(7),s.e(n.t0);case 22:return n.prev=22,s.f(),n.finish(22);case 25:v=0,d=l;case 26:if(!(v<d.length)){n.next=33;break}return m=d[v],n.next=30,t.activateOrDeactivatePlugin(m,!1);case 30:v++,n.next=26;break;case 33:return n.next=35,t.activateOrDeactivatePlugin(u);case 35:HuberwayCMS.hideButtonLoading(a),a.text(a.data("text"));case 37:case"end":return n.stop()}}),n,null,[[7,19,22,25]])})));return function(t){return n.apply(this,arguments)}}()),$(document).on("keyup",'input[type="search"][name="search"]',(function(t){t.preventDefault();var e=$(t.currentTarget).val().toLowerCase();$(".plugin-item").each((function(t,n){var r=$(n),o=r.data("plugin"),a=o.name.toLowerCase(),i=o.description.toLowerCase();a.includes(e)||i.includes(e)?r.show():r.hide()})),0===$(".plugin-item:visible").length?$(".empty").show():$(".empty").hide()})),this.checkUpdate()}},{key:"checkUpdate",value:function(){$httpClient.make().post(route("plugins.marketplace.ajax.check-update")).then((function(t){var e=t.data;e.data&&Object.keys(e.data).forEach((function(t){var n=e.data[t];$('button[data-check-update="'.concat(n.name,'"]')).data("uuid",n.id).show()}))}))}},{key:"activateOrDeactivatePlugin",value:(l=a(r().mark((function t(e){var n,o=arguments;return r().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return n=!(o.length>1&&void 0!==o[1])||o[1],t.abrupt("return",$httpClient.make().put(route("plugins.change.status",{name:e})).then((function(t){var e=t.data;HuberwayCMS.showSuccess(e.message),n&&window.location.reload()})));case 2:case"end":return t.stop()}}),t)}))),function(t){return l.apply(this,arguments)})},{key:"installPlugin",value:(c=a(r().mark((function t(e){return r().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,$httpClient.make().post(route("plugins.marketplace.ajax.install",{id:e})).then((function(t){var e=t.data;return e.error?[]:e.data}));case 2:return t.abrupt("return",t.sent);case 3:case"end":return t.stop()}}),t)}))),function(t){return c.apply(this,arguments)})}],o&&i(n.prototype,o),u&&i(n,u),Object.defineProperty(n,"prototype",{writable:!1}),t}();$((function(){(new c).init()}))})();