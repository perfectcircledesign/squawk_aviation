/*
 * WYMeditor : what you see is What You Mean web-based editor
 * Copyright (c) 2005 - 2009 Jean-Francois Hovinne, http://www.wymeditor.org/
 * Dual licensed under the MIT (MIT-license.txt)
 * and GPL (GPL-license.txt) licenses.
 *
 * For further information visit:
 *        http://www.wymeditor.org/
 *
 * File Name:
 *        jquery.wymeditor.mozilla.js
 *        Gecko specific class and functions.
 *        See the documentation for more info.
 *
 * File Authors:
 *        Jean-Francois Hovinne (jf.hovinne a-t wymeditor dotorg)
 *        Volker Mische (vmx a-t gmx dotde)
 *        Bermi Ferrer (wymeditor a-t bermi dotorg)
 *        Frédéric Palluel-Lafleur (fpalluel a-t gmail dotcom)
 */
WYMeditor.WymClassMozilla=function(e){this._wym=e,this._class="class",this._newLine="\n"},WYMeditor.WymClassMozilla.prototype.initIframe=function(iframe){var wym=this;this._iframe=iframe,this._doc=iframe.contentDocument;var styles=this._doc.styleSheets[0],aCss=eval(this._options.editorStyles);this.addCssRules(this._doc,aCss),this._doc.title=this._wym._index,$("html",this._doc).attr("dir",this._options.direction),$(".fieldWithErrors iframe").contents().find("body").addClass("fieldWithErrors"),this.html(this._wym._html),this.enableDesignMode(),$.isFunction(this._options.preBind)&&this._options.preBind(this),this._wym.bindEvents(),$(this._doc).bind("keydown",this.keydown),$(this._doc).bind("keyup",this.keyup),$(this._doc).bind("paste",this.intercept_paste),$(this._doc).bind("focus",function(){wym.enableDesignMode.call(wym)}),$.isFunction(this._options.postInit)&&this._options.postInit(this),this.listen()},WYMeditor.WymClassMozilla.prototype.html=function(e){if("string"!=typeof e)return $(this._doc.body).html();try{this._doc.designMode="off"}catch(e){}e=e.replace(/<em(\b[^>]*)>/gi,"<i$1>").replace(/<\/em>/gi,"</i>").replace(/<strong(\b[^>]*)>/gi,"<b$1>").replace(/<\/strong>/gi,"</b>"),$(this._doc.body).html(e),this.enableDesignMode()},WYMeditor.WymClassMozilla.prototype._exec=function(e,t){if(!this.selected())return!1;switch(e){case WYMeditor.INDENT:case WYMeditor.OUTDENT:var i=this.selected(),o=this._iframe.contentWindow.getSelection(),s=o.anchorNode;if("#text"==s.nodeName&&(s=s.parentNode),i=this.findUp(i,WYMeditor.BLOCKS),s=this.findUp(s,WYMeditor.BLOCKS),i&&i==s&&i.tagName.toLowerCase()==WYMeditor.LI){var n=i.parentNode.parentNode;(i.parentNode.childNodes.length>1||$.inArray(n.tagName.toLowerCase(),[WYMeditor.OL,WYMeditor.UL])>-1)&&this._doc.execCommand(e,"",null)}break;default:t?this._doc.execCommand(e,"",t):this._doc.execCommand(e,"",null)}var r=this.selected();r.tagName.toLowerCase()==WYMeditor.BODY&&this._exec(WYMeditor.FORMAT_BLOCK,WYMeditor.P)},WYMeditor.WymClassMozilla.prototype.selected=function(e){null!=e&&"true"==e.toString()||(e=!1);var t=this._iframe.contentWindow.getSelection(),o=t.focusNode;if(o){if("#text"==o.nodeName){if(e&&t.toString().length>0){if(actual_node=null,parent_node=t.focusNode.parentNode,null!=parent_node)for(i=0;i<parent_node.childNodes.length;i++)child_node=parent_node.childNodes[i],"#text"!=child_node.nodeName&&child_node.innerHTML==t.toString()&&(actual_node=child_node);return null==actual_node?this.switchTo(t,"span"):actual_node}return o.parentNode}return o}return null},WYMeditor.WymClassMozilla.prototype.addCssRule=function(e,t){e.insertRule(t.name+" {"+t.css+"}",e.cssRules.length)},WYMeditor.WymClassMozilla.prototype.keydown=function(e){var t=WYMeditor.INSTANCES[this.title];if(e.ctrlKey){if(66==e.keyCode)return t._exec(WYMeditor.BOLD),!1;if(73==e.keyCode)return t._exec(WYMeditor.ITALIC),!1}else 13==e.keyCode&&(e.shiftKey||(container=t.selected(),container&&container.tagName.toLowerCase()==WYMeditor.PRE&&(e.preventDefault(),t.insert("<p></p>"))))},WYMeditor.WymClassMozilla.prototype.keyup=function(e){if(null!=(wym=WYMeditor.INSTANCES[this.title])){wym._selected_image=null,$(wym._iframe).contents().find(".selected_by_wym").removeClass("selected_by_wym");var t=null;13!=e.keyCode||e.shiftKey?$.inArray(e.keyCode,[8,17,46,224])!=-1||e.metaKey||e.ctrlKey||wym.format_block():($(wym._doc.body).children(WYMeditor.BR).remove(),(t=wym.selected())&&t.tagName.toLowerCase()==WYMeditor.PRE&&wym._exec(WYMeditor.FORMAT_BLOCK,WYMeditor.P))}},WYMeditor.WymClassMozilla.prototype.enableDesignMode=function(){if("off"==this._doc.designMode)try{this._doc.designMode="on",this._doc.execCommand("styleWithCSS","",!1)}catch(e){}},WYMeditor.WymClassMozilla.prototype.openBlockTag=function(e,t){var t=this.validator.getValidTagAttributes(e,t);if("span"==e&&t.style){var i=this.getTagForStyle(t.style);if(!i)return;this._tag_stack.pop();var e=i;this._tag_stack.push(i),t.style=""}this.output+=this.helper.tag(e,t,!0)},WYMeditor.WymClassMozilla.prototype.getTagForStyle=function(e){return/bold/.test(e)?"strong":/italic/.test(e)?"em":/sub/.test(e)?"sub":!!/super/.test(e)&&"super"};