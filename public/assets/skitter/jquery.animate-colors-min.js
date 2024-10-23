/*
 Color animation jQuery-plugin
 http://www.bitstorm.org/jquery/color-animation/
 Copyright 2011 Edwin Martin <edwin@bitstorm.org>
 Released under the MIT and GPL licenses.
*/
!function(r){function e(){var e=r("script:first"),s=e.css("color"),t=!1;if(/^rgba/.test(s))t=!0;else try{t=s!=e.css("color","rgba(0, 0, 0, 0.5)").css("color"),e.css("color",s)}catch(r){}return t}function s(e,s,t){var o="rgb"+(r.support.rgba?"a":"")+"("+parseInt(e[0]+t*(s[0]-e[0]),10)+","+parseInt(e[1]+t*(s[1]-e[1]),10)+","+parseInt(e[2]+t*(s[2]-e[2]),10);return r.support.rgba&&(o+=","+(e&&s?parseFloat(e[3]+t*(s[3]-e[3])):1)),o+=")"}function t(r){var e,s;return(e=/#([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})/.exec(r))?s=[parseInt(e[1],16),parseInt(e[2],16),parseInt(e[3],16),1]:(e=/#([0-9a-fA-F])([0-9a-fA-F])([0-9a-fA-F])/.exec(r))?s=[17*parseInt(e[1],16),17*parseInt(e[2],16),17*parseInt(e[3],16),1]:(e=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(r))?s=[parseInt(e[1]),parseInt(e[2]),parseInt(e[3]),1]:(e=/rgba\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9\.]*)\s*\)/.exec(r))&&(s=[parseInt(e[1],10),parseInt(e[2],10),parseInt(e[3],10),parseFloat(e[4])]),s}r.extend(!0,r,{support:{rgba:e()}});var o=["color","backgroundColor","borderBottomColor","borderLeftColor","borderRightColor","borderTopColor","outlineColor"];r.each(o,function(e,o){r.fx.step[o]=function(e){e.init||(e.a=t(r(e.elem).css(o)),e.end=t(e.end),e.init=!0),e.elem.style[o]=s(e.a,e.end,e.pos)}}),r.fx.step.borderColor=function(e){e.init||(e.end=t(e.end));var n=o.slice(2,6);r.each(n,function(o,n){e.init||(e[n]={a:t(r(e.elem).css(n))}),e.elem.style[n]=s(e[n].a,e.end,e.pos)}),e.init=!0}}(jQuery);