!function(t){t.extend(t,{placeholder:{browser_supported:function(){return void 0!==this._supported?this._supported:this._supported=!!("placeholder"in t('<input type="text">')[0])},shim:function(e){var i={color:"#888",cls:"placeholder",lr_padding:4,selector:"input[placeholder], textarea[placeholder]"};t.extend(i,e),!this.browser_supported()&&t(i.selector)._placeholder_shim(i)}}}),t.extend(t.fn,{_placeholder_shim:function(e){function i(i){var s=t(i).offsetParent().offset(),o=t(i).offset();return{top:o.top-s.top+(t(i).outerHeight()-t(i).height())/2,left:o.left-s.left+e.lr_padding,width:t(i).width()-e.lr_padding}}return this.each(function(){if(t(this).data("placeholder")){var s=t(this).data("placeholder");return s.css(i(t(this))),!0}var o={};"auto"!=t(this).css("height")&&(o={lineHeight:t(this).css("height")});var r=t("<label />").text(t(this).attr("placeholder")).addClass(e.cls).css(t.extend({position:"absolute",display:"inline","float":"none",overflow:"hidden",whiteSpace:"nowrap",textAlign:"left",color:e.color,cursor:"text",paddingTop:t(this).css("padding-top"),paddingLeft:t(this).css("padding-left"),fontSize:t(this).css("font-size"),fontFamily:t(this).css("font-family"),fontStyle:t(this).css("font-style"),fontWeight:t(this).css("font-weight"),textTransform:t(this).css("text-transform"),zIndex:99},o)).css(i(this)).attr("for",this.id).data("target",t(this)).click(function(){t(this).data("target").focus()}).insertBefore(this);t(this).data("placeholder",r).focus(function(){r.hide()}).blur(function(){r[t(this).val().length?"hide":"show"]()}).triggerHandler("blur"),t(window).resize(function(){var t=r.data("target");r.css(i(t))})})}})}(jQuery),jQuery(document).add(window).bind("ready load",function(){jQuery.placeholder&&jQuery.placeholder.shim()});