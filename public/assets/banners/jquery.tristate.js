!function(e){e.fn.tristate=function(c){var n={selector:e(this).selector,checked:null,container:null,siblings:null};e.extend(n,c);return this.each(function(){var c=e(this),i=function(){var i={};return i.init=function(){e('input[type="checkbox"]',c).change(function(){n.checked=e(this).prop("checked"),n.container=e(this).parent(),n.siblings=n.container.siblings(),n.container.find('input[type="checkbox"]').prop({indeterminate:!1,checked:n.checked}),i.checkSiblings(n.container)}),e("input[type=checkbox]:checked",c).each(function(){i.checkSiblings(e(this).parent())})},i.checkSiblings=function(c){var t=c.parent().parent(),h=!0;c.siblings().each(function(){return h=e(this).children('input[type="checkbox"]').prop("checked")===n.checked}),h&&n.checked?(t.children('input[type="checkbox"]').prop({indeterminate:!1,checked:n.checked}),i.checkSiblings(t)):h&&!n.checked?(t.children('input[type="checkbox"]').prop("checked",n.checked),t.children('input[type="checkbox"]').prop("indeterminate",t.find('input[type="checkbox"]:checked').length>0),i.checkSiblings(t)):c.parents("li").children('input[type="checkbox"]').prop({indeterminate:!0,checked:!1})},i}();i.init(),i.checkSiblings(c)})}}(jQuery);