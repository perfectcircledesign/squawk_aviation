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
 *        jquery.wymeditor.safari.js
 *        Safari specific class and functions.
 *        See the documentation for more info.
 *
 * File Authors:
 *        Jean-Francois Hovinne (jf.hovinne a-t wymeditor dotorg)
 *        Scott Lewis (lewiscot a-t gmail dotcom)
 */
WYMeditor.WymClassSafari=function(e){this._wym=e,this._class="class",this._newLine="\n"},WYMeditor.WymClassSafari.prototype.initIframe=function(iframe){this._iframe=iframe,this._doc=iframe.contentDocument;var styles=this._doc.styleSheets[0],aCss=eval(this._options.editorStyles);this.addCssRules(this._doc,aCss),this._doc.title=this._wym._index,$("html",this._doc).attr("dir",this._options.direction),this._doc.designMode="on",this.html(this._wym._html),$.isFunction(this._options.preBind)&&this._options.preBind(this),this._wym.bindEvents(),$(this._doc).bind("keydown",this.keydown),$(this._doc).bind("keyup",this.keyup),$(this._doc).bind("paste",this.intercept_paste),$.isFunction(this._options.postInit)&&this._options.postInit(this),this.listen()},WYMeditor.WymClassSafari.prototype._exec=function(e,t){var i=this;if(!i.selected())return!1;switch(e){case WYMeditor.INDENT:case WYMeditor.OUTDENT:var s=i.selected(),o=i._iframe.contentWindow.getSelection(),a=o.anchorNode;if("#text"==a.nodeName&&(a=a.parentNode),s=i.findUp(s,WYMeditor.BLOCKS),a=i.findUp(a,WYMeditor.BLOCKS),s&&s==a&&s.tagName.toLowerCase()==WYMeditor.LI){var n=s.parentNode.parentNode;(s.parentNode.childNodes.length>1||$.inArray(n.tagName.toLowerCase(),[WYMeditor.OL,WYMeditor.UL])>-1)&&i._doc.execCommand(e,"",null)}break;case WYMeditor.INSERT_ORDEREDLIST:case WYMeditor.INSERT_UNORDEREDLIST:this._doc.execCommand(e,"",null);var s=this.selected(),r=this.findUp(s,WYMeditor.MAIN_CONTAINERS);r&&$(r).replaceWith($(r).html());break;default:t?this._doc.execCommand(e,"",t):this._doc.execCommand(e,"",null)}},WYMeditor.WymClassSafari.prototype.selected=function(e){null!=e&&"true"==e.toString()||(e=!1);var t=this._iframe.contentWindow.getSelection(),s=t.focusNode;if(s){if("#text"==s.nodeName){if(e&&t.toString().length>0){if(actual_node=null,parent_node=t.focusNode.parentNode,null!=parent_node)for(i=0;i<parent_node.childNodes.length;i++)child_node=parent_node.childNodes[i],child_node.textContent==t.toString()&&(actual_node=child_node.parentNode);return null==actual_node?(this._selected_item=this.switchTo(t,"span"),this._selected_item):actual_node}return s.parentNode}return s}return null},WYMeditor.WymClassSafari.prototype.toggleClass=function(e,t){var i=null;i=this._selected_image?$(this._selected_image):$(this.selected(!0)||this._selected_item),null!=t&&(i=$(i.parentsOrSelf(t))),i.toggleClass(e),i.attr(WYMeditor.CLASS)||i.removeAttr(this._class)},WYMeditor.WymClassSafari.prototype.addCssRule=function(e,t){e.insertRule(t.name+" {"+t.css+"}",e.cssRules.length)},WYMeditor.WymClassSafari.prototype.keydown=function(e){var t=WYMeditor.INSTANCES[this.title];e.ctrlKey?(66==e.keyCode&&(t._exec(WYMeditor.BOLD),e.preventDefault()),73==e.keyCode&&(t._exec(WYMeditor.ITALIC),e.preventDefault())):e.shiftKey&&13==e.keyCode&&(t._exec("InsertLineBreak"),e.preventDefault())},WYMeditor.WymClassSafari.prototype.keyup=function(e){var t=WYMeditor.INSTANCES[this.title];t._selected_image=null,$(t._iframe).contents().find(".selected_by_wym").removeClass("selected_by_wym");var i=null;13!=e.keyCode||e.shiftKey?$.inArray(e.keyCode,[8,17,46,224])!=-1||e.metaKey||e.ctrlKey||(i=t.selected(),i&&(name=i.tagName.toLowerCase())&&($.inArray(name,["strong","b","em","i","sub","sup","a","span"])>-1&&(name=i.parentNode.tagName.toLowerCase()),$.inArray(name,[WYMeditor.BODY,WYMeditor.DIV])>-1&&t._exec(WYMeditor.FORMAT_BLOCK,WYMeditor.P))):($(t._doc.body).children(WYMeditor.BR).remove(),i=t.selected(),i&&i.tagName.toLowerCase()==WYMeditor.PRE&&t._exec(WYMeditor.FORMAT_BLOCK,WYMeditor.P))},WYMeditor.WymClassSafari.prototype.openBlockTag=function(e,t){var t=this.validator.getValidTagAttributes(e,t);if("span"==e&&t.style){if(!(new_tag=this.getTagForStyle(t.style)))return;this._tag_stack.pop();var e=new_tag;this._tag_stack.push(new_tag),t.style="","string"==typeof t["class"]&&(t["class"]=t["class"].replace(/apple-style-span/gi,""))}this.output+=this.helper.tag(e,t,!0)},WYMeditor.WymClassSafari.prototype.getTagForStyle=function(e){return/bold/.test(e)?"strong":/italic/.test(e)?"em":/sub/.test(e)?"sub":!!/super/.test(e)&&"sup"};