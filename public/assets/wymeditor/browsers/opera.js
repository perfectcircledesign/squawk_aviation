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
 *        jquery.wymeditor.opera.js
 *        Opera specific class and functions.
 *        See the documentation for more info.
 *
 * File Authors:
 *        Jean-Francois Hovinne (jf.hovinne a-t wymeditor dotorg)
 */
WYMeditor.WymClassOpera=function(t){this._wym=t,this._class="class",this._newLine="\r\n"},WYMeditor.WymClassOpera.prototype.initIframe=function(iframe){this._iframe=iframe,this._doc=iframe.contentWindow.document;var styles=this._doc.styleSheets[0],aCss=eval(this._options.editorStyles);this.addCssRules(this._doc,aCss),this._doc.title=this._wym._index,$("html",this._doc).attr("dir",this._options.direction),this._doc.designMode="on",this.html(this._wym._html),$.isFunction(this._options.preBind)&&this._options.preBind(this),this._wym.bindEvents(),$(this._doc).bind("keydown",this.keydown),$(this._doc).bind("keyup",this.keyup),$(this._doc).bind("paste",this.intercept_paste),$.isFunction(this._options.postInit)&&this._options.postInit(this),this.listen()},WYMeditor.WymClassOpera.prototype._exec=function(t,e){e?this._doc.execCommand(t,!1,e):this._doc.execCommand(t)},WYMeditor.WymClassOpera.prototype.selected=function(){var t=this._iframe.contentWindow.getSelection(),e=t.focusNode;return e?"#text"==e.nodeName?e.parentNode:e:null},WYMeditor.WymClassOpera.prototype.addCssRule=function(t,e){t.insertRule(e.name+" {"+e.css+"}",t.cssRules.length)},WYMeditor.WymClassOpera.prototype.keydown=function(t){var e=WYMeditor.INSTANCES[this.title],i=e._iframe.contentWindow.getSelection();startNode=i.getRangeAt(0).startContainer,$(startNode).parentsOrSelf(WYMeditor.MAIN_CONTAINERS.join(","))[0]||$(startNode).parentsOrSelf("li")||t.keyCode==WYMeditor.KEY.ENTER||t.keyCode==WYMeditor.KEY.LEFT||t.keyCode==WYMeditor.KEY.UP||t.keyCode==WYMeditor.KEY.RIGHT||t.keyCode==WYMeditor.KEY.DOWN||t.keyCode==WYMeditor.KEY.BACKSPACE||t.keyCode==WYMeditor.KEY.DELETE||e._exec(WYMeditor.FORMAT_BLOCK,WYMeditor.P)},WYMeditor.WymClassOpera.prototype.keyup=function(){var t=WYMeditor.INSTANCES[this.title];t._selected_image=null,$(t._iframe).contents().find(".selected_by_wym").removeClass("selected_by_wym")};