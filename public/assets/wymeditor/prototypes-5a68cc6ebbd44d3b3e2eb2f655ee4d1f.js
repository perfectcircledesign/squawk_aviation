WYMeditor.editor.prototype.init=function(){if($.browser.msie)var WymClass=new WYMeditor.WymClassExplorer(this);else if($.browser.mozilla)var WymClass=new WYMeditor.WymClassMozilla(this);else if($.browser.opera)var WymClass=new WYMeditor.WymClassOpera(this);else if($.browser.webkit)var WymClass=new WYMeditor.WymClassSafari(this);if(WymClass){$.isFunction(this._options.preInit)&&this._options.preInit(this);var SaxListener=new WYMeditor.XhtmlSaxListener;$.extend(SaxListener,WymClass),this.parser=new WYMeditor.XhtmlParser(SaxListener),(this._options.styles||this._options.stylesheet)&&this.configureEditorUsingRawCss(),this.helper=new WYMeditor.XmlHelper;for(var prop in WymClass)this[prop]=WymClass[prop];this._box=$(this._element).hide().after(this._options.boxHtml).next().addClass("wym_box_"+this._index),$.isFunction($.fn.data)&&($.data(this._box.get(0),WYMeditor.WYM_INDEX,this._index),$.data(this._element.get(0),WYMeditor.WYM_INDEX,this._index));var h=WYMeditor.Helper,iframeHtml=this._options.iframeHtml;iframeHtml=h.replaceAll(iframeHtml,WYMeditor.INDEX,this._index),iframeHtml=h.replaceAll(iframeHtml,WYMeditor.IFRAME_BASE_PATH,this._options.iframeBasePath);var boxHtml=$(this._box).html();boxHtml=h.replaceAll(boxHtml,WYMeditor.LOGO,this._options.logoHtml),boxHtml=h.replaceAll(boxHtml,WYMeditor.TOOLS,this._options.toolsHtml),boxHtml=h.replaceAll(boxHtml,WYMeditor.CONTAINERS,this._options.containersHtml),boxHtml=h.replaceAll(boxHtml,WYMeditor.CLASSES,this._options.classesHtml),boxHtml=h.replaceAll(boxHtml,WYMeditor.HTML,this._options.htmlHtml),boxHtml=h.replaceAll(boxHtml,WYMeditor.IFRAME,iframeHtml),boxHtml=h.replaceAll(boxHtml,WYMeditor.STATUS,this._options.statusHtml);for(var aTools=eval(this._options.toolsItems),sTools="",i=0;i<aTools.length;i++){var oTool=aTools[i];if(oTool.name&&oTool.title){var sTool=this._options.toolsItemHtml,sTool=h.replaceAll(sTool,WYMeditor.TOOL_NAME,oTool.name);sTool=h.replaceAll(sTool,WYMeditor.TOOL_TITLE,this._options.stringDelimiterLeft+oTool.title+this._options.stringDelimiterRight),sTool=h.replaceAll(sTool,WYMeditor.TOOL_CLASS,oTool.css),sTools+=sTool}}boxHtml=h.replaceAll(boxHtml,WYMeditor.TOOLS_ITEMS,sTools);for(var aClasses=eval(this._options.classesItems),sClasses="",i=0;i<aClasses.length;i++){var oClass=aClasses[i];if(oClass.name)if(oClass.rules&&oClass.rules.length>0){var sRules="",wym=this;$.each(oClass.rules,function(e,t){sClass=wym._options.classesItemHtml,sClass=h.replaceAll(sClass,WYMeditor.CLASS_NAME,oClass.name+(oClass.join||"")+(t.name||t)),sClass=h.replaceAll(sClass,WYMeditor.CLASS_TITLE,t.title||titleize(t.name||t)),sRules+=sClass});var sClassMultiple=this._options.classesItemHtmlMultiple;sClassMultiple=h.replaceAll(sClassMultiple,WYMeditor.CLASS_TITLE,oClass.title||titleize(oClass.name)),sClassMultiple=h.replaceAll(sClassMultiple,"{classesItemHtml}",sRules),sClasses+=sClassMultiple}else sClass=this._options.classesItemHtml,sClass=h.replaceAll(sClass,WYMeditor.CLASS_NAME,oClass.name),sClass=h.replaceAll(sClass,WYMeditor.CLASS_TITLE,oClass.title||titleize(oClass.name)),sClasses+=sClass}boxHtml=h.replaceAll(boxHtml,">"+WYMeditor.APPLY_CLASS+"<",">"+this._options.stringDelimiterLeft+WYMeditor.APPLY_CLASS+this._options.stringDelimiterRight+"<"),boxHtml=h.replaceAll(boxHtml,WYMeditor.CLASSES_ITEMS,sClasses);for(var aContainers=eval(this._options.containersItems),sContainers="",i=0;i<aContainers.length;i++){var oContainer=aContainers[i];if(oContainer.name&&oContainer.title){var sContainer=this._options.containersItemHtml;sContainer=h.replaceAll(sContainer,WYMeditor.CONTAINER_NAME,oContainer.name),sContainer=h.replaceAll(sContainer,WYMeditor.CONTAINER_TITLE,this._options.stringDelimiterLeft+oContainer.title+this._options.stringDelimiterRight),sContainer=h.replaceAll(sContainer,WYMeditor.CONTAINER_CLASS,oContainer.css),sContainers+=sContainer}}boxHtml=h.replaceAll(boxHtml,WYMeditor.CONTAINERS_ITEMS,sContainers),boxHtml=this.replaceStrings(boxHtml),$(this._box).html(boxHtml),$(this._box).find(this._options.htmlSelector).hide(),this.loadSkin(),$(this._element).data("wymeditor",this)}},WYMeditor.editor.prototype.bindEvents=function(){var wym=this;$(this._box).find(this._options.toolSelector).click(function(){return wym._iframe.contentWindow.focus(),wym.exec($(this).attr(WYMeditor.NAME)),!1}),$(this._box).find(this._options.containerSelector).click(function(){return wym.container($(this).attr(WYMeditor.NAME)),!1}),$(this._box).find(this._options.htmlValSelector).keyup(function(){$(wym._doc.body).html($(this).val())}).focus(function(){$(this).toggleClass("hasfocus")}).blur(function(){$(this).toggleClass("hasfocus")}),$(this._box).find(this._options.classSelector).bind("click",function(e){var aClasses=eval(wym._options.classesItems),sName=$(this).attr(WYMeditor.NAME),oClass=WYMeditor.Helper.findByName(aClasses,sName),replacers=$([]);null==oClass&&$.each(aClasses,function(e,t){if(null==oClass&&t.rules&&t.rules.length>0){var o=sName.replace(t.name+(t.join||""),""),i=null;$.each(t.rules,function(e,s){o==(s.name||s)?i=e:replacers.push(t.name+(t.join||"")+(s.name||s))}),null!=i&&(oClass={expr:t.rules[i].expr||null})}}),oClass&&(replacers.each(function(e,t){wym.removeClass(t,oClass.expr)}),wym.toggleClass(sName,oClass.expr)),wym.exec(WYMeditor.APPLY_CLASS),wym._iframe.contentWindow.focus(),e.preventDefault()}),$(this._options.updateSelector).bind(this._options.updateEvent,function(){wym.update()})},WYMeditor.editor.prototype.ready=function(){return null!=this._doc},WYMeditor.editor.prototype.box=function(){return this._box},WYMeditor.editor.prototype.html=function(e){return"string"!=typeof e?$(this._doc.body).html():void $(this._doc.body).html(e)},WYMeditor.editor.prototype.intercept_paste=function(e){var t=WYMeditor.INSTANCES[this.title];t.format_block(),t.exec(WYMeditor.PASTE),e&&e.preventDefault()},WYMeditor.editor.prototype.xhtml=function(){return this.parser.parse(this.html())},WYMeditor.editor.prototype.exec=function(e){switch(e){case WYMeditor.CREATE_LINK:((container=this.container())||this._selected_image)&&this.dialog(WYMeditor.DIALOG_LINK);break;case WYMeditor.INSERT_IMAGE:this.dialog(WYMeditor.DIALOG_IMAGE);break;case WYMeditor.INSERT_TABLE:this.dialog(WYMeditor.DIALOG_TABLE);break;case WYMeditor.PASTE:this.dialog(WYMeditor.DIALOG_PASTE);break;case WYMeditor.TOGGLE_HTML:this.update(),this.toggleHtml();break;case WYMeditor.PREVIEW:this.dialog(WYMeditor.PREVIEW);break;case WYMeditor.APPLY_CLASS:wym=this,$(wym._box).find(this._options.classUnhiddenSelector).find("a[name]").each(function(e,t){$(wym.selected()).hasClass($(t).attr("name"))?$(t).parent().addClass("enabled"):$(t).parent().removeClass("enabled")});break;default:this._exec(e)}},WYMeditor.editor.prototype.container=function(e){if(!e)return this.selected();var t=null;if(e.toLowerCase()==WYMeditor.TH){switch(t=this.container(),t.tagName.toLowerCase()){case WYMeditor.TD:case WYMeditor.TH:break;default:var o=new Array(WYMeditor.TD,WYMeditor.TH);t=this.findUp(this.container(),o)}null!=t&&(e=t.tagName.toLowerCase()==WYMeditor.TD?WYMeditor.TH:WYMeditor.TD,this.switchTo(t,e),this.update())}else{var o=new Array(WYMeditor.P,WYMeditor.H1,WYMeditor.H2,WYMeditor.H3,WYMeditor.H4,WYMeditor.H5,WYMeditor.H6,WYMeditor.PRE,WYMeditor.BLOCKQUOTE);if(t=this.findUp(this.container(),o)){var i=null;if(e.toLowerCase()==WYMeditor.BLOCKQUOTE){var s=this.findUp(this.container(),WYMeditor.BLOCKQUOTE);if(null==s)i=this._doc.createElement(e),t.parentNode.insertBefore(i,t),i.appendChild(t),this.setFocusToNode(i.firstChild);else{var r=s.childNodes,n=r.length,a=null;n>0&&(a=r.item(0));for(var l=0;l<n;l++)s.parentNode.insertBefore(r.item(0),s);s.parentNode.removeChild(s),a&&this.setFocusToNode(a)}}else this.setFocusToNode(this.switchTo(t,e));this.update()}}},WYMeditor.editor.prototype.toggleClass=function(e,t){var o=$(this._selected_image?this._selected_image:this.selected(!0));null!=t&&(o=$(o.parentsOrSelf(t))),o.toggleClass(e),o.attr(WYMeditor.CLASS)||o.removeAttr(this._class)},WYMeditor.editor.prototype.toggleClassSelector=function(){var e=this,t=$(e._box).find(e._options.classUnhiddenSelector).hasClass(e._options.classHiddenSelector.substring(1));t?($(e._box).find(e._options.classUnhiddenSelector).removeClass(e._options.classHiddenSelector.substring(1)),$(e._box).find("a[name="+WYMeditor.APPLY_CLASS+"]").addClass("selected").parent().addClass("activated")):($(e._box).find(e._options.classUnhiddenSelector).addClass(e._options.classHiddenSelector.substring(1)),$(e._box).find("a[name="+WYMeditor.APPLY_CLASS+"]").removeClass("selected").parent().removeClass("activated")),e.exec(WYMeditor.APPLY_CLASS)},WYMeditor.editor.prototype.removeClass=function(e,t){var o=$(this._selected_image?this._selected_image:$(this.selected(!0)));null!=t&&(o=$(o.parentsOrSelf(t))),o.removeClass(e),o.attr(WYMeditor.CLASS)||o.removeAttr(this._class)},WYMeditor.editor.prototype.findUp=function(e,t){if(e){var o=e.tagName.toLowerCase();if(typeof t==WYMeditor.STRING)for(;o!=t&&o!=WYMeditor.BODY;)e=e.parentNode,o=e.tagName.toLowerCase();else for(var i=!1;!i&&o!=WYMeditor.BODY;){for(var s=0;s<t.length;s++)if(o==t[s]){i=!0;break}i||(e=e.parentNode,o=e.tagName.toLowerCase())}return o!=WYMeditor.BODY?e:null}return null},WYMeditor.editor.prototype.switchTo=function(e,t){e.getRangeAt&&(this.exec(WYMeditor.BOLD),e=e.focusNode.parentNode);var o=$(e).html(),i=this._doc.createElement(t),s=$(e).attr("class");return"undefined"!=typeof s&&$.each($(e).attr("class").split(" "),function(e,t){$(i).addClass(t)}),e.parentNode.replaceChild(i,e),$(i).html(o),this.setFocusToNode(i),i},WYMeditor.editor.prototype.replaceStrings=function(sVal){var wym=this;if(!WYMeditor.STRINGS[wym._options.lang])try{eval($.ajax({url:wym._options.langPath+wym._options.lang+".js",async:!1}).responseText)}catch(e){return WYMeditor.console&&WYMeditor.console.error("WYMeditor: error while parsing language file."),sVal}return $.each(WYMeditor.STRINGS[wym._options.lang],function(e,t){sVal=WYMeditor.Helper.replaceAll(sVal,wym.encloseString(e),t)}),sVal},WYMeditor.editor.prototype.encloseString=function(e){return this._options.stringDelimiterLeft+e+this._options.stringDelimiterRight},WYMeditor.editor.prototype.status=function(e){$(this._box).find(this._options.statusSelector).html(e)},WYMeditor.editor.prototype.update=function(){var e=this,t=e.xhtml().replace(/<\/([A-Za-z0-9]*)></g,function(e){return e.split(">").join(">\n")});t=t.replace(/src=\"system\/images/g,'src="/system/images'),$(t).find(bad_spans="span[id|=wym], span[id=undefined]").add($(t).filter(bad_spans)).each(function(o,i){html_to_replace_with=e.parser.parse($(i).html()),html_to_replace=e.parser.parse($(i).wrap("<div />").parent().html()),$.browser.msie&&(html_to_replace=new RegExp(html_to_replace.replace(/(\ [^\=]+\=)([^\ >]+)/,'$1"$2"'),"ig")),t=t.replace(html_to_replace,html_to_replace_with)}),t=t.replace(/(\ ?id=(\"|\')last\_paste(\"|\'))/gim,""),t=t.replace(/[%$]+wym-[^%$]*[%$]+/gim,""),t=t.replace(/^<br\ ?\/?>$/,""),$(e._element).val(t),$(e._box).find(e._options.htmlValSelector).not(".hasfocus").val(t)},WYMeditor.editor.prototype.dialog=function(e){var t=this;t.update();var o=this._wym._options.dialogPath+e+"?wymeditor=true&"+window.location.href.match(/switch_locale=[a-z]{2}/);t._current_unique_stamp=t.uniqueStamp(),t._undo_on_cancel=!1,t._redo_on_cancel=!1;var i=this.selected();e!=WYMeditor.DIALOG_TABLE&&t.format_block(),e==WYMeditor.DIALOG_LINK&&$.browser.mozilla&&(selection=t._iframe.contentWindow.getSelection(),matches=$($(i).html().match(new RegExp(RegExp.escape(selection.anchorNode.textContent)+"(.*)"+RegExp.escape(selection.focusNode.textContent)))),null!=matches&&matches.length>0&&(possible_anchor_tag=matches.last()).length>0&&null!=(href_matches=possible_anchor_tag.get(0).match(/href="([^"]*)"/))&&null!=(href=$(href_matches).last().get(0))&&$(t._doc).find("a").each(function(e,t){$(t).html()==selection&&(i=t)})),ajax_loaded_callback=function(){t.dialog_ajax_callback(i)};var s=t._selected_image?t._selected_image.parentNode:i;if("undefined"!=typeof s&&null!==s)if(s.tagName.toLowerCase()!=WYMeditor.A){if(null==t._selected_image)if(null!=i&&i.tagName.toLowerCase()!=WYMeditor.A&&t._iframe.contentWindow.getSelection)if(selection=t._iframe.contentWindow.getSelection(),selection.focusNode.insertData){if(selection.anchorOffset>selection.focusOffset?(start_node=selection.focusNode,start=selection.focusOffset,end_node=selection.anchorNode,end=selection.anchorOffset):(start_node=selection.anchorNode,start=selection.anchorOffset,end_node=selection.focusNode,end=selection.focusOffset),"undefined"==typeof start_node.insertData){for(var r=start_node.childNodes.length-1,n=start_node;"function"!=typeof end_node.insertData||!r;)start_node=n.childNodes[r--];start=0}if("undefined"==typeof end_node.insertData){for(var a=end_node.childNodes.length-1,l=end_node;"function"!=typeof end_node.insertData||!a;)end_node=l.childNodes[a--];end=end_node.length}start_tag="%%"+t._current_unique_stamp+"%%",end_tag="$$"+t._current_unique_stamp+"$$",start_node===end_node&&(end+=start_tag.length),start_node.insertData(start,start_tag),end_node.insertData(end,end_tag),$(i).html($(i).html().replace(start_tag,"<span id='"+t._current_unique_stamp+"'>").replace(end_tag,"</span>"))}else t.wrap("<span id='"+t._current_unique_stamp+"'>","</span>");else t.wrap("<span id='"+t._current_unique_stamp+"'>","</span>")}else t._selected_image||(s._id_before_replaceable=s.id,s.id=""+this._current_unique_stamp,$(s).attr("_id_before_replaceable",s._id_before_replaceable)),e!=WYMeditor.DIALOG_PASTE&&e!=WYMeditor.DIALOG_TABLE&&(o+=o.indexOf("?")==-1?"?":"&",port=window.location.port.length>0?":"+window.location.port:"",o+="current_link="+s.href.replace(window.location.protocol+"//"+window.location.hostname+port,""),o+="&target_blank="+("_blank"==s.target?"true":"false"));switch(dialog_title=t.replaceStrings(t.encloseString(e)),dialog_container=$("<div id='"+t._options.dialogId+"' class='editor_dialog'></div>"),e){case WYMeditor.DIALOG_TABLE:dialog_container.html(t.replaceStrings(t._options.dialogTableHtml)).dialog($.extend(t._options.dialogInlineFeatures,{title:dialog_title})),ajax_loaded_callback();break;case WYMeditor.DIALOG_PASTE:dialog_container.html(t.replaceStrings(t._options.dialogPasteHtml)).dialog($.extend(t._options.dialogInlineFeatures,{title:dialog_title})),ajax_loaded_callback();break;default:$("<img id='dialog_loading' src='/assets/refinery/dialogLoadingAnimation-7e4f4da6094268bfbba789dade7a8552.gif' width='208' height='13' />").appendTo(dialog_container),dialog_container.dialog($.extend(t._options.dialogFeatures,{title:dialog_title})).load(o,ajax_loaded_callback)}},WYMeditor.editor.prototype.dialog_ajax_callback=function(e){wym=this,_selected=e,$("#"+wym._options.dialogId+".editor_dialog").css("height","auto"),$("#"+wym._options.dialogId+" .button").corner("6px"),(iframes=$("#"+this._options.dialogId).find("iframe")).load(function(){WYMeditor.INIT_DIALOG(wym,_selected,!0),$(this).unbind("load")}),0==iframes.length&&WYMeditor.INIT_DIALOG(this,e)},WYMeditor.editor.prototype.toggleHtml=function(){$(this._box).find(this._options.htmlSelector).toggle()},WYMeditor.editor.prototype.uniqueStamp=function(){return"wym-"+(new Date).getTime()},WYMeditor.editor.prototype.paste=function(e){wym=this,wym.format_block();var t;replaceable=$(wym._doc.body).find("#"+wym._current_unique_stamp),container=replaceable.get(0)||this.selected();var o=e.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").split(wym._newLine+wym._newLine),i=new RegExp(wym._newLine,"g");if(container&&container.tagName.toLowerCase()!=WYMeditor.BODY)for(contentAfterBreak="",insertedContentAfterBreak="",x=o.length-1;x>=0;x--)if(t=o[x].replace(i,"<br />"),0==x)o.length>1&&"span"==$(container).get(0).tagName.toLowerCase()&&$(container).attr("id")==""+wym._current_unique_stamp&&"p"==$(container).parent().get(0).tagName.toLowerCase()?(p=$(container).parent(),matches=p.html().match(new RegExp("([\\s\\S]*)<span id=['|\"]"+wym._current_unique_stamp+"['|\"]>.*</span>")),t=matches[1]+t+$(container).html(),p.html(t),null!=insertedContentAfterBreak&&insertedContentAfterBreak.length>0&&p.after(insertedContentAfterBreak),null!=contentAfterBreak&&contentAfterBreak.length>0&&(1==(last_paste=p.parent().find("p#last_paste")).length?last_paste.attr("id",null).html(last_paste.html()+contentAfterBreak):p.next().after("<p>"+contentAfterBreak+"</p>"))):$(container).html($(container).html().replace(/^<br\/?>$/,"")+t);else{if(o.length-1==x){var s=$(container).parent().html().match(new RegExp("<span id=['|\"]"+wym._current_unique_stamp+"['|\"]>.*</span>([\\s\\S]*)"));s&&s[1]&&(contentAfterBreak=s[1].split("</p>")[0]),t="<p id='last_paste'>"+t+"</p>"}else t="<p>"+t+"</p>";""==insertedContentAfterBreak?insertedContentAfterBreak+=t:insertedContentAfterBreak=t+insertedContentAfterBreak}else for(x=0;x<o.length;x++)t=o[x],t=t.replace(i,"<br />"),0==x&&0==$(container).html().replace(/<br\ ?\/?>/,"").length?$(container).html(t):$(wym._doc.body).append("<p>"+t+"</p>");null!=replaceable.get(0)&&("span"==replaceable.get(0).tagName.toLowerCase()&&replaceable.replaceWith(replaceable.html()),replaceable.attr("id",replaceable.get(0)._id_before_replaceable||null))},WYMeditor.editor.prototype.insert=function(e){null!=this._iframe.contentWindow.getSelection().focusNode?this._exec(WYMeditor.INSERT_HTML,e):this.paste(e)},WYMeditor.editor.prototype.wrap=function(e,t,o){e="undefined"!=typeof e?e:"",t="undefined"!=typeof t?t:"",null==o&&(o=this._iframe.contentWindow.getSelection()),null!=o.focusNode&&this._exec(WYMeditor.INSERT_HTML,e+o.toString()+t)},WYMeditor.editor.prototype.unwrap=function(e){null==e&&(e=this._iframe.contentWindow.getSelection()),null!=e.focusNode&&this._exec(WYMeditor.INSERT_HTML,e.toString())},WYMeditor.editor.prototype.setFocusToNode=function(e,t){var o=this._doc.createRange(),i=this._iframe.contentWindow.getSelection();t=t?0:1,o.selectNodeContents(e),i.addRange(o),i.collapse(e,t),this._iframe.contentWindow.focus()},WYMeditor.editor.prototype.addCssRules=function(e,t){var o=e.styleSheets[0];if(o)for(var i=0;i<t.length;i++){var s=t[i];s.name&&s.css&&this.addCssRule(o,s)}},WYMeditor.editor.prototype.format_block=function(e){var t=this,o=e||t.selected()||$(t._iframe).contents().find("body").get(0),i=o.tagName.toLowerCase();$.inArray(i,["strong","b","em","i","sub","sup","a"])>-1&&(i=o.parentNode.tagName.toLowerCase()),i==WYMeditor.BODY&&(t._selected_image=null,$(t._iframe).contents().find(".selected_by_wym").removeClass("selected_by_wym"),t._exec(WYMeditor.FORMAT_BLOCK,WYMeditor.P))},WYMeditor.editor.prototype.computeBasePath=function(){return null!=(script_path=this.computeWymPath())?((src_parts=script_path.split("/")).length>1&&src_parts.pop(),src_parts.join("/")+"/"):null},WYMeditor.editor.prototype.computeWymPath=function(){return $("script[src*=jquery.refinery.wymeditor]").attr("src")},WYMeditor.editor.prototype.computeJqueryPath=function(){return $($.grep($("script"),function(e){return e.src&&e.src.match(/jquery(-(.*)){0,1}(\.pack|\.min|\.packed)?\.js(\?.*)?$/)})).attr("src")},WYMeditor.editor.prototype.computeCssPath=function(){return $($.grep($("link"),function(e){return e.href&&e.href.match(/wymeditor\/skins\/(.*)screen\.css(\?.*)?$/)})).attr("href")},WYMeditor.editor.prototype.configureEditorUsingRawCss=function(){var e=new WYMeditor.WymCssParser;this._options.stylesheet?e.parse($.ajax({url:this._options.stylesheet,async:!1}).responseText):e.parse(this._options.styles,!1),0==this._options.classesItems.length&&(this._options.classesItems=e.css_settings.classesItems),0==this._options.editorStyles.length&&(this._options.editorStyles=e.css_settings.editorStyles),0==this._options.dialogStyles.length&&(this._options.dialogStyles=e.css_settings.dialogStyles)},WYMeditor.editor.prototype.listen=function(){$(this._doc.body).bind("mousedown",this.mousedown);for(var e=this._doc.body.getElementsByTagName("img"),t=0;t<e.length;t++)$(e[t]).bind("mousedown",this.mousedown);$(this._doc).find("a[href]").click(function(e){e.preventDefault()})},WYMeditor.editor.prototype.mousedown=function(e){var t=WYMeditor.INSTANCES[this.ownerDocument.title];t._selected_image=e.target.tagName.toLowerCase()==WYMeditor.IMG?e.target:null,$(t._iframe).contents().find(".selected_by_wym").removeClass("selected_by_wym"),$.browser.mozilla||$(t._selected_image).addClass("selected_by_wym"),$.browser.webkit||e.stopPropagation()},WYMeditor.editor.prototype.loadSkin=function(){if(this._options.loadSkin&&!WYMeditor.SKINS[this._options.skin]){var found=!1,rExp=new RegExp(this._options.skin+"/"+WYMeditor.SKINS_DEFAULT_CSS+"([?].+?)?$");$("link").each(function(){this.href.match(rExp)&&(found=!0)}),found||WYMeditor.loadCss(this._options.cssCompiledSkinPath+WYMeditor.SKINS_DEFAULT_CSS)}$(this._box).addClass("wym_skin_"+this._options.skin),this._options.initSkin&&!WYMeditor.SKINS[this._options.skin]&&eval($.ajax({url:this._options.jsCompiledSkinPath+WYMeditor.SKINS_DEFAULT_JS,async:!1}).responseText),WYMeditor.SKINS[this._options.skin]&&WYMeditor.SKINS[this._options.skin].init&&WYMeditor.SKINS[this._options.skin].init(this)};