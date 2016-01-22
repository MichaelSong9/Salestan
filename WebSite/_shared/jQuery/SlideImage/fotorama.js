/*! Fotorama 2.0 (v1311) | http://fotoramajs.com/license.txt */
(function(e){function oa(b){for(var a={},e=0;e<X.length;e++){var w=X[e][0],x=X[e][1];if(b){var m=b.attr("data-"+w);m&&("number"==x?(m=Number(m),isNaN(m)||(a[w]=m)):"boolean"==x?"true"==m?a[w]=!0:"false"==m&&(a[w]=!1):"string"==x?a[w]=m:"boolean-number"==x&&("true"==m?a[w]=!0:"false"==m?a[w]=!1:(m=Number(m),isNaN(m)||(a[w]=m))))}else a[w]=X[e][2]}return a}function pa(b,a){for(var e={},w=0;w<Ea.length;w++)e[Ea[w]+b]=a;return e}function qa(b,a){if(ra)return pa("transform",a?"translate(0,"+b+"px)":"translate("+
b+"px,0)");var e={};e[a?"top":"left"]=b;return e}function pb(){return!1}function sa(b){return pa("transition-duration",b+"ms")}function qb(b){b.mousemove(function(a){a.preventDefault()}).mousedown(function(a){a.preventDefault()})}function Nb(){document.selection&&document.selection.empty?document.selection.empty():window.getSelection&&window.getSelection().removeAllRanges()}function Ta(f,a){function ob(c,d,b){c&&(ua.no.test(c)||ua.px.test(c)?(ga=k=Number((""+c).replace("px","")),Y=ha=!1):ua["%"].test(c)?
(Ua=Number((""+c).replace("%",""))/100,ha=!a().flexible,k||(k=f.width()*(s?1:Ua)-(a().vertical&&C.length?C.width():0)),Y=!1):Y=!0);d&&(ua.no.test(d)||ua.px.test(d)?(va=j=Number((""+d).replace("px","")),Z=!1):Z=!0);if("auto"==c||!c||"auto"==d||!d){var b=Number(b),n=z.filter(function(){return"error"!=e(this).data("state")}).filter(":first").data("srcKey");if(isNaN(b)||!b)b=null,n&&(b=q[n].imgRatio);if(b){Fa=Ga=D=b;if(n){if("auto"==c||!c)ga=k=q[n].imgWidth,Y=!0;if("auto"==d||!d)va=j=q[n].imgHeight,Z=
!0}Z&&b&&!Y&&(va=j=Math.round(k/b));!Z&&b&&Y&&(ga=k=Math.round(j*b))}}}function w(c){var d;if(a().fitToWindowHeight||s)d=A.height();if(!D||c)Fa=Ga=D=k/j;a().thumbs&&!G&&(G=a().vertical?C.width():C.height());D=rb?Fa:Ga;f.css({overflow:ha||s?"hidden":""});ha||s?k=f.width()*(s?1:Ua)-(a().vertical&&G?G:0):ga&&(k=ga);s?(j=d-(!a().vertical&&G?G:0),D=k/j):Z?j=Math.round(k/D):(j=va,D=k/j);if(a().fitToWindowHeight&&!s&&j>d-20-(!a().vertical&&G?G:0))j=d-20-(!a().vertical&&G?G:0),D=k/j}function x(c,d,b){w(c);
d||(d=0);var n=k!=Da||j!=sb||D!=tb;if(c||n){a().vertical?(r=j,Ha=k):(r=k,Ha=j);p.add(z).animate({width:k,height:j},d);a().thumbs&&a().vertical&&(a().thumbsOnRight?C.animate({left:k},d):p.animate({left:G},d));a().touchStyle?(Va=(r+a().margin)*y-a().margin,ub=Ha,c={},c[L]=Va,c[S]=ub,F.animate(c,d).data(c).data({minPos:-(Va-r),maxPos:0})):F.animate({width:k,height:j},d);a().thumbs&&(a().vertical?C.animate({height:j},d):C.animate({width:k},d),a().thumbsPreview&&n&&vb(d,b),C.css({visibility:"visible"}));
Wa&&!a().vertical&&(a().arrows&&ia.animate({top:j/2},d),c={},c[Ia]=Ha/2,O.animate(c,d));if("loading"==Ja||"error"==Ja)c={},c[H]=(a().touchStyle?B:0)*(r+a().margin)+r/2,O.animate(c,d);I&&a().touchStyle&&(b=-B*(r+a().margin),$(F,b,0));wb=!0;var g=0;e(Xa).each(function(){clearTimeout(this)});Xa=[];P(I,B,d);z.each(function(a){if(a!=B){var c=e(this);c.data("img")&&c.data("img").css({visibility:"hidden"});var d=setTimeout(function(){P(c,a)},50*g+50);Xa.push(d);g++}})}Da=k;sb=j;tb=D}function m(){var c=I.data("srcKey");
c&&q[c].imgWidth&&q[c].imgHeight&&q[c].imgRatio&&(ga=k=q[c].imgWidth,va=j=q[c].imgHeight,Ga=D=q[c].imgRatio,x(!1,a().transitionDuration))}function wa(c,d,ta){function n(){a().touchStyle||(d=0);O.css(H,d*(r+a().margin)+r/2);xb=setTimeout(function(){O.stop().show().fadeTo(0,1)},100)}clearTimeout(xb);"loading"==c?(n(),f.addClass(b+"_loading").removeClass(b+"_error"),Ya||O.html("<span>&middot;&middot;&middot;</span>").css({backgroundImage:"none"})):"error"==c?(n(),f.addClass(b+"_error").removeClass(b+
"_loading"),Ya||O.html("<span>?</span>").css({backgroundImage:"none"})):"loaded"==c&&(f.removeClass(b+"_loading "+b+"_error"),O.stop().fadeTo(Math.min(T,ta),0,function(){O.hide()}));Ja=c}function Q(){return{index:B,src:q[B],img:I[0],thumb:a().thumbs?aa[0]:null,caption:Za}}function $(c,d,b,n){var g=isNaN(d)?0:Math.round(d);clearTimeout(c.data("backAnimate"));n?(g=n,c.data({backAnimate:setTimeout(function(){$(c,d,Math.max(T,b/2))},b)})):a().onSlideStop&&setTimeout(function(){a().onSlideStop.call(f[0],
Q())},b);b&&(clearTimeout(yb),Ka=!0);ra?(c.css(sa(b)),setTimeout(function(){c.css(qa(g,a().vertical))},1)):c.stop().animate(qa(g,a().vertical),b,$a);yb=setTimeout(function(){Ka=!1;a().flexible&&c==F&&m()},b)}function U(c,d,b){if(J){if(!b||J<r)La=!1;var n=aa.position()[H],b=aa.data()[L];if(!b&&Ma)ba.hide(),Ma=!1;else{Ma||(ba.show(),Ma=!0);if(J>r){var g=n+b/2,e=r/2,f=K.index(aa),h=f-zb;void 0==R&&(R=l.position()[H]);if(ab&&d&&d>Math.max(36,2*a().thumbMargin)&&d<r-Math.max(36,2*a().thumbMargin)&&(0<
h&&d>0.75*e||0>h&&d<1.25*e)){var t;t=0<h?f+1:f-1;0>t?t=0:t>y-1&&(t=y-1);f!=t&&(g=K.eq(t),g=g.position()[H]+g.data()[L]/2,e=d)}d=-(J-r);g=Math.round(-(g-e)+a().thumbMargin);if(0<h&&g>R||0>h&&g<R)g=n+R<a().thumbMargin?-(n-a().thumbMargin):n+R+b>r?-(2*n-r+b+a().thumbMargin):R;g<=d?g=d:g>=a().thumbMargin&&(g=a().thumbMargin);l.data({minPos:d});u(g);ca||l.data({maxPos:a().thumbMargin})}else g=r/2-J/2,l.data({minPos:g}),ca||l.data({maxPos:g});!La&&!ca?($(l,g,c),Na&&(La=!0),R=g):Na=!0;var o=b-(Ab?0:2*a().thumbBorderWidth);
ra?(ba.css(sa(c)),setTimeout(function(){ba.css(qa(n,a().vertical)).css(L,o)},1)):a().vertical?ba.stop().animate({top:n,height:o},c,$a):ba.stop().animate({left:n,width:o},c,$a)}}}function u(c){a().shadows&&J>r&&(C.addClass(b+"__thumbs_shadow"),c<=l.data("minPos")?C.removeClass(b+"__thumbs_shadow_no-left").addClass(b+"__thumbs_shadow_no-right"):c>=a().thumbMargin?C.removeClass(b+"__thumbs_shadow_no-right").addClass(b+"__thumbs_shadow_no-left"):C.removeClass(b+"__thumbs_shadow_no-left "+b+"__thumbs_shadow_no-right"))}
function vb(a,d){if(!ja&&!ca&&!xa&&!Ka||d)s||u(),U(a?a:0,!1,!d)}function P(c,d,b){var n=c.data("img"),g=c.data("detached"),b=b?b:0;if(n&&!g){var e=c.data("srcKey"),g=q[e].imgWidth,f=q[e].imgHeight,h=q[e].imgRatio,t=e=0;a().touchStyle&&c.css(H,d*(r+a().margin));if(g!=k||f!=j||a().alwaysPadding||s){var o=0;if(0.99>h/D||1.01<h/D||a().alwaysPadding||s)o=2*a().minPadding;h>=D?a().cropToFit?(f=j,g=Math.round(f*h)):(g=Math.round(k-o)<g||a().zoomToFit||s&&q[d].imgRel?Math.round(k-o):g,f=Math.round(g/h),4>
j-f&&(f+=j-f)):a().cropToFit?(g=k,f=Math.round(g/h)):(f=Math.round(j-o)<f||a().zoomToFit||s&&q[d].imgRel?Math.round(j-o):f,g=Math.round(f*h),4>k-g&&(g+=k-g))}n.css({visibility:"visible"});g&&f&&(h={width:g,height:f},f!=j&&(e=Math.round((j-f)/2)),g!=k&&(t=Math.round((k-g)/2)),h.top=e,h.left=t,n.animate(h,b));b=c.data("img");n=c.data("srcKey");d=q[d].imgRel;if(b&&d&&d!=n&&!ya&&(g=b.data("full"),c=c.data("detached"),(s&&!g||!s&&g)&&!c))b[0].src=s?d:n,b.data({full:s})}else n&&g&&c.data({needToResize:!0})}
function da(c,d,f,n){function g(e){function o(){j.css({visibility:"hidden"});k.src=e;0==t&&(j.appendTo(d),"thumb"==n&&(J+=E+a().thumbMargin,l.css(L,J).data(L,J),d.css(L,E).data(L,E)))}function m(){ka[e]="loaded";j.unbind("error load").error(function(){j[0].src=e;q[c].imgRel=!1;P(z.eq(c),c);j.unbind("error")});d.trigger("load."+b).data({state:"loaded"});setTimeout(function(){q[e]||(q[e]=[],q[e].imgWidth=j.width(),q[e].imgHeight=j.height(),q[e].imgRatio=q[e].imgWidth/q[e].imgHeight);f(k,q[e].imgWidth,
q[e].imgHeight,q[e].imgRatio,e,c)},100);"thumb"==n&&(Oa++,Oa==y&&(ab=!0))}function r(a){ka[e]="error";j.unbind("error load");t<h.length&&a?(t++,g(h[t])):(d.trigger("error."+b).data({state:"error"}),"thumb"==n&&(Oa++,Oa==y&&(ab=!0)))}if(ka[e]){var p=function(){"error"==ka[e]?r(!1):"loaded"==ka[e]?m():setTimeout(p,100)};o();p()}else ka[e]="loading",j.unbind("error load").error(function(){r(!0)}).load(m),o()}z.eq(c);var k=new Image,j=e(k),h=[],t=0,o=q[c].imgHref,m=q[c].imgSrc,r=q[c].thumbSrc;"img"==
n?(o&&(h.push(o),h.push(o+"?"+la)),m&&(h.push(m),h.push(m+"?"+la)),r&&(h.push(r),h.push(r+"?"+la))):(r&&(h.push(r),h.push(r+"?"+la)),m&&(h.push(m),h.push(m+"?"+la)),o&&(h.push(o),h.push(o+"?"+la)));g(h[t])}function bb(c,d){if(c.data("wraped"))a().detachSiblings&&c.data("detached")&&(c.data({detached:!1}).appendTo(F),c.data("needToResize")&&(P(c,d),c.data({needToResize:!1})));else if(F.append(c.data({state:"loading"})),d!=B&&!a().touchStyle&&c.stop().fadeTo(0,0),c.data({wraped:!0,detached:!1}),da(d,
c,function(f,g,ta,m,h){f=e(f);f.addClass(b+"__img");c.data({img:f,srcKey:h});h=!1;if((!k||!j)&&!wb||!cb&&d==a().startImg)k=g,a().width=g,Z?(j=ta,a().height=ta):Y&&(k=Math.round(j*(g/ta)),a().width=k),h=!0,cb=d==a().startImg;c.css({visibility:"visible"});h||a().flexible?x(!0):P(c,d)},"img"),db&&M[d].html&&M[d].html.length||a().html&&a().html[d]&&a().html[d].length){var f=M[d].html||a().html[d];c.append(f)}}function Ob(c,d){var b=0,f=!1,g=[],j=[],m=s?1:a().preload;for(i=0;i<2*m+1;i++){var h=d-m+i;if(0<=
h&&h<y&&!a().loop||a().loop){0>h&&(h=y+h);h>y-1&&(h-=y);if(!z.eq(h).data("wraped")||z.eq(h).data("detached"))b++,g.push(h);j.push(h)}else f=!0}if(b>=m||f)e(g).each(function(a){setTimeout(function(){bb(z.eq(g[a]),g[a])},50*a)}),a().detachSiblings&&z.filter(function(a){for(var c=e(this),b=!1,g=0;g<j.length&&!b;g++)j[g]==a&&(b=!0);return"loading"!=c.data("state")&&!b&&d!=a}).data({detached:!0}).detach()}function X(c){c||(c=0);clearTimeout(Bb);Bb=setTimeout(function(){ma&&f.trigger("showimg",[B+1,!1,
!0])},Math.max(a().autoplay,2*c))}function V(c,d,j,n,g,k,q){function h(){a().caption&&((Za=M[l].caption?M[l].caption:M[l].title)?ea.html(Za).show():ea.html("").hide())}function t(){if(a().shadows||!a().touchStyle)o.removeClass(b+"__frame_active"),c.addClass(b+"__frame_active")}var o,p,u,l=z.index(c);z.each(function(){e(this).unbind("load."+b+" error."+b)});"number"!=typeof g&&(g=n?0:a().transitionDuration);!n&&d&&d.altKey&&(g*=10);d=c.data("state");"loading"==d||!d?(wa("loading",l,g),c.one("load."+
b,function(){wa("loaded",l,g);h()}),c.one("error."+b,function(){wa("error",l,g);h()})):"error"==d?wa("error",l,g):d!=Ja&&wa("loaded",l,0);h();I?(o=I,u=B,a().thumbs&&(p=aa)):(o=z.not(c),a().thumbs&&(p=K.not(K.eq(l))));a().thumbs&&(aa=K.eq(l),u&&(zb=u),p.removeClass(b+"__thumb_selected").data("disabled",!1),aa.addClass(b+"__thumb_selected").data("disabled",!0));a().thumbs&&a().thumbsPreview&&(u!=l||n)&&U(g,j);if(a().touchStyle)j=-l*(r+a().margin),t(),$(F,j,g,k);else{var w=function(d){if(u!=l||n){var b=
g,e=0;d&&(b=0,e=g);z.not(o.stop()).stop().fadeTo(0,0);setTimeout(function(){t();c.stop().fadeTo(b,1,function(){o.not(c).stop().fadeTo(e,0,function(){a().flexible&&m()})})},10)}};"loaded"==d?w():"error"==d?w(!0):(c.one("load."+b,function(){w()}),c.one("error."+b,function(){w(!0)}))}I=c;B=l;a().hash&&document.location.replace("#"+(B+1));ma&&!q&&a().stopAutoplayOnAction&&(ma=!1);X(g);var s=Q();f.data(s);a().arrows&&((0==B||2>y)&&!a().loop?za.addClass(b+"__arr_disabled").data("disabled",!0):za.removeClass(b+
"__arr_disabled").data("disabled",!1),(B==y-1||2>y)&&!a().loop?Aa.addClass(b+"__arr_disabled").data("disabled",!0):Aa.removeClass(b+"__arr_disabled").data("disabled",!1));var x=c.data("wraped");clearTimeout(Cb);Cb=setTimeout(function(){!x&&l!=a().startImg&&(bb(c,l),a().onShowImg&&a().onShowImg.call(f[0],s,q));Ob(c,l)},g+10);if(x||l==a().startImg)bb(c,l),a().onShowImg&&a().onShowImg.call(f[0],s,q)}function W(c,d){d.stopPropagation();d.preventDefault();var b=B+c;0>b&&(b=a().loop?y-1:0);b>y-1&&(b=a().loop?
0:y-1);V(z.eq(b),d)}function oa(){clearTimeout(Db);Db=setTimeout(function(){x()},50)}function pa(){Eb||(A.bind("resize",oa),v&&window.addEventListener("orientationchange",oa,!1),Eb=!0)}f.data({ini:!0,options:a});a=function(){return f.data("options")};a().backgroundColor&&!a().background&&(a().background=a().backgroundColor);a().thumbsBackgroundColor&&!a().navBackground&&(a().navBackground=a().thumbsBackgroundColor);a().thumbColor&&!a().dotColor&&(a().dotColor=a().thumbColor);null!==a().click&&(a().pseudoClick=
a().click);if(!0===a().nav||"true"==a().nav||"thumbs"==a().nav)a().thumbs=!0,a().thumbsPreview=!0;else if("dots"==a().nav)a().thumbs=!0,a().thumbsPreview=!1;else if(!1===a().nav||"false"==a().nav||"none"==a().nav)a().thumbs=!1;a().caption&&(!0===a().caption||"true"==a().caption||"simple"==a().caption?a().caption=!0:"overlay"!=a().caption&&(a().caption=!1));"top"==a().navPosition?(a().thumbsOnTop=!0,a().thumbsOnRight=!1):"right"==a().navPosition?(a().thumbsOnTop=!1,a().thumbsOnRight=!0):"bottom"==
a().navPosition?(a().thumbsOnTop=!1,a().thumbsOnRight=!1):"left"==a().navPosition&&(a().thumbsOnTop=!1,a().thumbsOnRight=!1);var Ja,la=(new Date).getTime();a().hash&&document.location.hash&&(a().startImg=parseInt(document.location.hash.replace("#",""))-1);var M,db=a().data&&("object"==typeof a().data||"string"==typeof a().data);M=db?e(a().data).filter(function(){return this.img||this.href||this.length}):f.children().filter(function(){var a=e(this);return(a.is("a")&&a.children("img").size()||a.is("img"))&&
(a.attr("href")||a.attr("src")||a.children().attr("src"))});var y=M.size();f.data({size:y});if(a().startImg>y-1||"number"!=typeof a().startImg)a().startImg=0;var q=[];M.each(function(c){if(db)q[c]={imgHref:this.img?this.img:this.href?this.href:this.length?""+this:null,thumbSrc:this.thumb,imgRel:this.full};else{var d=e(this);q[c]={imgHref:d.attr("href"),imgSrc:d.attr("src"),thumbSrc:d.children().attr("src"),imgRel:d.attr("rel")?d.attr("rel"):d.children().attr("rel")};a().caption&&(this.caption=d.attr("alt")||
d.children().attr("alt"))}});f.html("").addClass(b+" "+(a().vertical?b+"_vertical":b+"_horizontal"));if(eb||ya)var Ea=f.wrap('<div class="fotorama-outer"></div>').parent();a().arrows||(a().loop=!0);var ka=[],r,Ha,k,j,ga,va,Ua=1,Z=!0,Y=!0,ha,ua={no:/^[0-9.]+$/,px:/^[0-9.]+px/,"%":/^[0-9.]+%/},D,Ga,Fa,Da,sb,tb,wb,cb,rb,s,Eb,Ka,yb,Fb,Gb,Cb,ma,Bb;if(!0===a().autoplay||"true"==a().autoplay||0<a().autoplay)ma=!0;"number"!=typeof a().autoplay&&(a().autoplay=5E3);if(a().touchStyle)var Va=0,ub,Ba=!1,xa=!1,
Hb;if(a().thumbs&&a().thumbsPreview)var ca=!1,La=!1,Na=!1,ja=!1,Ib,ab=!1,Oa=0;var H,Ia,N,Pa,L,S;a().vertical?(H="top",Ia="left",N="pageY",Pa="pageX",L="height",S="width"):(H="left",Ia="top",N="pageX",Pa="pageY",L="width",S="height");var p=e('<div class="'+b+'__wrap"></div>').appendTo(f),F=e('<div class="'+b+'__shaft"></div>').appendTo(p);a().touchStyle||(qb(p),qb(F));var O=e('<div class="'+b+'__state"></div>').appendTo(F);"white"==a().preloader&&O.addClass(b+"__state_white");var xb;if(a().fullscreenIcon)var fa=
e('<div class="'+b+'__fsi"><i class="i1"><i class="i1"></i></i><i class="i2"><i class="i2"></i></i><i class="i3"><i class="i3"></i></i><i class="i4"><i class="i4"></i></i><i class="i0"></i></div>').appendTo(p);v&&f.addClass(b+"_touch");ya&&(a().shadows=!1);a().touchStyle?(p.addClass(b+"__wrap_style_touch"),a().shadows&&p.append('<i class="'+b+"__shadow "+b+'__shadow_prev"></i><i class="'+b+"__shadow "+b+'__shadow_next"></i>')):p.addClass(b+"__wrap_style_fade");a().shadows&&f.addClass(b+"_shadows");
ra&&f.addClass(b+"_csstransitions");if(a().arrows){var fb,gb;a().vertical?(fb=a().arrowPrev?a().arrowPrev:"&#9650;",gb=a().arrowNext?a().arrowNext:"&#9660;"):(fb=a().arrowPrev?a().arrowPrev:"&#9668;",gb=a().arrowNext?a().arrowNext:"&#9658;");var ia=e('<i class="'+b+"__arr "+b+'__arr_prev">'+fb+'</i><i class="'+b+"__arr "+b+'__arr_next">'+gb+"</i>").appendTo(p),za=ia.eq(0),Aa=ia.eq(1);if(!v){if(a().pseudoClick){var Jb,Kb,Ta=function(){clearTimeout(Kb);Kb=setTimeout(function(){var c=Jb>=r/2;Aa[!c?"removeClass":
"addClass"](b+"__arr_hover");za[c?"removeClass":"addClass"](b+"__arr_hover");a().touchStyle||F.css({cursor:c&&Aa.data("disabled")||!c&&za.data("disabled")?"default":"pointer"})},10)};p.mousemove(function(a){Jb=a[N]-p.offset()[H];Ta()})}var hb=!1,ib,Pb=function(){hb=!0;clearTimeout(ib);ia.css(sa(0));p.removeClass(b+"__wrap_mouseout");setTimeout(function(){ia.css(sa(a().transitionDuration));setTimeout(function(){p.addClass(b+"__wrap_mouseover")},1)},1)},Lb=function(){clearTimeout(ib);ib=setTimeout(function(){!Ba&&
!hb&&p.removeClass(b+"__wrap_mouseover").addClass(b+"__wrap_mouseout")},3*a().transitionDuration)};p.mouseenter(function(){Pb()});p.mouseleave(function(){hb=!1;Lb()})}}else!a().touchStyle&&a().pseudoClick&&F.css({cursor:"pointer"});var I,B,Za,z=e();M.each(function(){var a=e('<div class="'+b+'__frame" style="visibility: hidden;"></div>');z=z.add(a)});if(a().thumbs){var E=Number(a().thumbSize);if(isNaN(E)||!E)E=a().vertical?64:48;var aa,zb=0,C=e('<div class="'+b+'__thumbs" style="visibility: hidden;"></div>')[a().thumbsOnTop?
"prependTo":"appendTo"](f),G;a().thumbsPreview&&(G=E+2*a().thumbMargin,C.addClass(b+"__thumbs_previews").css(S,G));var l=e('<div class="'+b+'__thumbs-shaft"></div>').appendTo(C);if(a().thumbsPreview){var J=0,R=void 0;a().shadows&&e('<i class="'+b+"__shadow "+b+'__shadow_prev"></i><i class="'+b+"__shadow "+b+'__shadow_next"></i>').appendTo(C);var Qb=E-(Ab?0:2*a().thumbBorderWidth),Rb=a().thumbMargin,Qa={};Qa[S]=Qb;Qa[Ia]=Rb;Qa.borderWidth=a().thumbBorderWidth;var ba=e('<i class="'+b+'__thumb-border"></i>').css(Qa).appendTo(l),
Ma}M.each(function(){var c;if(a().thumbsPreview){c=e('<div class="'+b+'__thumb"></div>');var d={};d[S]=E;d.margin=a().thumbMargin;c.css(d)}else c=e('<i class="'+b+'__thumb"><i class="'+b+'__thumb__dot"></i></i>');c.appendTo(l)});var K=e("."+b+"__thumb",f);if(a().thumbsPreview)var Sb=function(c,d,f,n,g,j){d=e(c);n=a().vertical?Math.round(E/n):Math.round(E*n);Ra.canvas?(d.remove(),d=e('<canvas class="'+b+'__thumb__img"></canvas>'),d.appendTo(K.eq(j))):d.addClass(b+"__thumb__img");f={};f[L]=n;f[S]=E;
d.attr(f).css(f).css({visibility:"visible"});Ra.canvas&&(d[0].getContext("2d"),d[0].getContext("2d").drawImage(c,0,0,a().vertical?E:n,a().vertical?n:E));J+=n+a().thumbMargin-(E+a().thumbMargin);l.css(L,J);f[S]=null;K.eq(j).css(f).data(f);vb()},jb=function(a){!ja&&!ca&&!xa&&!Ka?(a||(a=0),da(a,K.eq(a),Sb,"thumb"),setTimeout(function(){a+1<y&&jb(a+1)},50)):setTimeout(function(){jb(a)},100)}}if(a().caption){var ea=e('<p class="'+b+'__caption"></p>');if("overlay"==a().caption)ea.appendTo(p).addClass(b+
"__caption_overlay");else{ea.appendTo(f);var Tb=ea.wrap('<div class="'+b+'__caption-outer"></div>').parent()}}ob(a().width,a().height,a().aspectRatio);var Xa=[];V(z.eq(a().startImg),!1,!1,!0,!1,!1,!0);k&&j&&(cb=!0,x());a().thumbs&&a().thumbsPreview&&jb(0);a().thumbs&&(a().dotColor&&!a().thumbsPreview&&K.children().css({backgroundColor:a().dotColor}),a().navBackground&&C.css({background:a().navBackground}),a().thumbsPreview&&a().thumbBorderColor&&ba.css({borderColor:a().thumbBorderColor}));a().background&&
p.add(z).css({background:a().background});a().arrowsColor&&a().arrows&&ia.css({color:a().arrowsColor});var Db=!1;pa();f.bind("dblclick",Nb);f.bind("showimg",function(c,d,b,f){"number"!=typeof d&&("next"==d?d=B+1:"prev"==d?d=B-1:"first"==d?d=0:"last"==d?d=y-1:(d=B,f=!0));d>y-1&&(d=0);(!a().touchStyle||!xa)&&V(z.eq(d),c,!1,!1,b,!1,f)});f.bind("play",function(c,d){ma=!0;d=Number(d);isNaN(d)||(a().autoplay=d);X(T)});f.bind("pause",function(){ma=!1});f.bind("rescale",function(a,d,b,f,g){ob(d,b,f);Fa=D=
k/j;rb=!ha;g=Number(g);isNaN(g)&&(g=0);x(!1,g)});f.bind("fullscreenopen",function(){Fb=A.scrollTop();Gb=A.scrollLeft();s=!0;fa&&fa.trigger("mouseleave",!0);A.scrollTop(0);kb.add(Sa).addClass("fullscreen");f.addClass(b+"_fullscreen");(eb||ya)&&f.appendTo(Sa).addClass(b+"_fullscreen_quirks");a().caption&&"overlay"!=!a().caption&&ea.appendTo(p);pa();I&&V(I,!1,!1,!0,0,!1,!0);x(!1,!1,!0)});f.bind("fullscreenclose",function(){s=!1;fa&&fa.trigger("mouseleave",!0);kb.add(Sa).removeClass("fullscreen");f.removeClass(b+
"_fullscreen");(eb||ya)&&f.appendTo(Ea).removeClass(b+"_fullscreen_quirks");a().caption&&"overlay"!=!a().caption&&ea.appendTo(Tb);A.scrollTop(Fb);A.scrollLeft(Gb);ha||(k=a().width,j=a().height);I&&V(I,!1,!1,!0,0,!1,!0);a().flexible?m():x(!1,!1,!0)});na.bind("keydown",function(a){s&&(27==a.keyCode?f.trigger("fullscreenclose"):39==a.keyCode||40==a.keyCode?f.trigger("showimg",B+1):(37==a.keyCode||38==a.keyCode)&&f.trigger("showimg",B-1))});if(a().thumbs){var lb=function(a){a.stopPropagation();if(!e(this).data("disabled")){var d=
K.index(e(this)),b=a[N]-C.offset()[H];V(z.eq(d),a,b)}};K.bind("click",lb)}a().arrows&&(za.bind("click",function(a){e(this).data("disabled")||W(-1,a)}),Aa.bind("click",function(a){e(this).data("disabled")||W(1,a)}));!a().touchStyle&&!v&&a().pseudoClick&&p.bind("click",function(c){var d=c[N]-p.offset()[H]>=r/2;if(a().onClick)var b=a().onClick.call(f[0],Q());!1!==b&&(!c.shiftKey&&d&&a().arrows||c.shiftKey&&!d&&a().arrows||!a().arrows&&!c.shiftKey?W(1,c):W(-1,c))});fa&&fa.bind("click",function(a){a.stopPropagation();
f.trigger(s?"fullscreenclose":"fullscreenopen")}).bind("mouseenter mouseleave",function(a,d){d&&a.stopPropagation();fa["mouseenter"==a.type?"addClass":"removeClass"](b+"__fsi_hover")});a().fullscreen&&f.trigger("fullscreenopen");if(a().touchStyle||v||a().thumbs&&a().thumbsPreview)var Mb=function(c,b,f,e){function g(f){if((v||2>f.which)&&I){var g=function(){q=(new Date).getTime();k=t;l=o;p=[[q,t]];clearTimeout(c.data("backAnimate"));ra?c.css(sa(0)):c.stop();h=c.position()[H];c.css(qa(h,a().vertical));
r=h;b()};if(v)if(v&&1==f.targetTouches.length)t=f.targetTouches[0][N],o=f.targetTouches[0][Pa],g(),c[0].addEventListener("touchmove",j,!1),c[0].addEventListener("touchend",m,!1);else{if(v&&1<f.targetTouches.length)return!1}else t=f[N],f.preventDefault(),g(),na.mousemove(j),na.mouseup(m)}}function j(b){function d(){b.preventDefault();u=(new Date).getTime();p.push([u,t]);var g=k-t;h=r-g;h>c.data("maxPos")?(h=Math.round(h+(c.data("maxPos")-h)/1.5),da="left"):h<c.data("minPos")?(h=Math.round(h+(c.data("minPos")-
h)/1.5),da="right"):da=!1;a().touchStyle&&c.css(qa(h,a().vertical));f(h,g,da)}v?v&&1==b.targetTouches.length&&(t=b.targetTouches[0][N],o=b.targetTouches[0][Pa],z?y&&d():(-5<=Math.abs(t-k)-Math.abs(o-l)&&(y=!0,b.preventDefault()),z=!0)):(t=b[N],d())}function m(a){if(!v||!a.targetTouches.length){z=y=!1;v?(c[0].removeEventListener("touchmove",j,!1),c[0].removeEventListener("touchend",m,!1)):(na.unbind("mouseup"),na.unbind("mousemove"));s=(new Date).getTime();var b=-h,d=s-Ca,f,g,k,l;for(i=0;i<p.length;i++)f=
Math.abs(d-p[i][0]),0==i&&(g=f,k=s-p[i][0],l=p[i][1]),f<=g&&(g=f,k=p[i][0],l=p[i][1]);d=l-t;f=0<=d;k=s-k;e(b,k,k<=Ca,s-x,f===w,d,a);x=s;w=f}}var h,t,o,k,l,r,q,p=[],u,w,s,x=0,y=!1,z=!1,da=!1;v?c[0].addEventListener("touchstart",g,!1):c.mousedown(g)};if(a().touchStyle||v){var mb=!1;Mb(F,function(){xa=!0},function(c,d,f){clearTimeout(Hb);Ba||(a().shadows&&p.addClass(b+"__wrap_shadow"),v||F.addClass(b+"__shaft_grabbing"),Ba=!0);a().shadows&&(f?(c="left"==f?"right":"left",p.addClass(b+"__wrap_shadow_no-"+
f).removeClass(b+"__wrap_shadow_no-"+c)):a().shadows&&p.removeClass(b+"__wrap_shadow_no-left "+b+"__wrap_shadow_no-right"));5<=Math.abs(d)&&!mb&&(mb=!0,e("a",p).bind("click",pb))},function(c,d,j,n,g,k,m){xa=!1;Hb=setTimeout(function(){!v&&a().arrows&&Lb();mb=!1;e("a",p).unbind("click",pb)},Ca);v||F.removeClass(b+"__shaft_grabbing");a().shadows&&p.removeClass(b+"__wrap_shadow");var g=n=!1,h,l;a().html&&(h=e(m.target),l=h.filter("a"),l.length||(l=h.parents("a")));if(a().touchStyle)if(Ba){j&&(-10>=k?
n=!0:10<=k&&(g=!0));j=T;l=Math.round(c/(r+a().margin));if(n||g){var d=-k/d,k=Math.round(-c+250*d),o;n?(l=Math.ceil(c/(r+a().margin))-1,c=-l*(r+a().margin),k>c&&(o=Math.abs(k-c),j=Math.abs(j/(250*d/(Math.abs(250*d)-0.97*o))),o=c+0.03*o)):g&&(l=Math.floor(c/(r+a().margin))+1,c=-l*(r+a().margin),k<c&&(o=Math.abs(k-c),j=Math.abs(j/(250*d/(Math.abs(250*d)-0.97*o))),o=c-0.03*o))}0>l&&(l=0,o=!1,j=T);l>y-1&&(l=y-1,o=!1,j=T);V(z.eq(l),m,!1,!1,j,o)}else{if(a().html&&l.length)return!1;if(a().onClick)var q=a().onClick.call(f[0],
Q());!1!==q&&a().pseudoClick&&!v&&d<Ca?(o=m[N]-p.offset()[H]>=r/2,!m.shiftKey&&o&&a().arrows||m.shiftKey&&!o&&a().arrows||!a().arrows&&!m.shiftKey?W(1,m):W(-1,m)):V(I,m,!1,!1,!1,!1,!0)}else{if(0==k&&a().html&&l.length)return!1;0<=k?W(1,m):0>k&&W(-1,m)}Ba=!1});if(a().touchStyle&&a().thumbs&&a().thumbsPreview){var nb=!1;Mb(l,function(){La=ca=!0},function(a,b){!ja&&5<=Math.abs(b)&&(K.unbind("click",lb),nb=!0,clearTimeout(Ib),ja=!0);u(a)},function(a,b,f,e,g,j,k){ja=ca=!1;Ib=setTimeout(function(){nb&&
(K.bind("click",lb),nb=!1)},Ca);var e=a=-a,h,g=2*T;Na&&ja&&(U(0,!1,!1),Na=!1);a>l.data("maxPos")?(e=l.data("maxPos"),g/=2):a<l.data("minPos")?(e=l.data("minPos"),g/=2):f&&(b=-j/b,e=Math.round(a+250*b),e>l.data("maxPos")?(h=Math.abs(e-l.data("maxPos")),g=Math.abs(g/(250*b/(Math.abs(250*b)-0.96*h))),e=l.data("maxPos"),h=e+0.04*h):e<l.data("minPos")&&(h=Math.abs(e-l.data("minPos")),g=Math.abs(g/(250*b/(Math.abs(250*b)-0.96*h))),e=l.data("minPos"),h=e-0.04*h));k.altKey&&(g*=10);R=e;e!=a&&($(l,e,g,h),
u(e))})}}}var Ra=function(b,a,e){function w(a,b){var f=a.charAt(0).toUpperCase()+a.substr(1),f=(a+" "+Q.join(f+" ")+f).split(" ");return x(f,b)}function x(a,b){for(var f in a)if(v[a[f]]!==e)return"pfx"==b?a[f]:!0;return!1}b={};a.head||a.getElementsByTagName("head");var m=a.createElement("modernizr"),v=m.style,Q=["Webkit","Moz","O","ms","Khtml"],m={},$=[],U,u={}.hasOwnProperty,A;typeof u!==e&&typeof u.call!==e?A=function(a,b){return u.call(a,b)}:A=function(a,b){return b in a&&typeof a.constructor.prototype[b]===
e};m.canvas=function(){var b=a.createElement("canvas");return!!b.getContext&&!!b.getContext("2d")};m.csstransforms=function(){return!!x(["transformProperty","WebkitTransform","MozTransform","OTransform","msTransform"])};m.csstransitions=function(){return w("transitionProperty")};for(var P in m)A(m,P)&&(U=P.toLowerCase(),b[U]=m[P](),$.push((b[U]?"":"no-")+U));v.cssText="";m=null;b._version="2.0.6";b._domPrefixes=Q;b.testProp=function(a){return x([a])};b.testAllProps=w;return b}(this,this.document);
e.extend({bez:function(b){var a="bez_"+e.makeArray(arguments).join("_").replace(".","p");if("function"!=typeof jQuery.easing[a]){var v=function(a,b){var f=[null,null],e=[null,null],v=[null,null],A=function(A,u){return v[u]=3*a[u],e[u]=3*(b[u]-a[u])-v[u],f[u]=1-v[u]-e[u],A*(v[u]+A*(e[u]+A*f[u]))};return function(a){for(var b=a,w=0,x;14>++w;){x=A(b,0)-a;if(0.001>Math.abs(x))break;b-=x/(v[0]+b*(2*e[0]+3*f[0]*b))}return A(b,1)}};jQuery.easing[a]=function(a,e,m,A,Q){return A*v([b[0],b[1]],[b[2],b[3]])(e/
Q)+m}}return a}});var v="ontouchstart"in document,ya=navigator.userAgent.toLowerCase().match(/(iphone|ipod|ipad|iemobile|windows ce|netfront|playstation|midp|up\.browser|symbian|nintendo|wii)/),ra=Ra.csstransforms&&Ra.csstransitions&&!e.browser.mozilla,Wa=e.browser.msie,eb=Wa&&"6.0"==e.browser.version,Ab="CSS1Compat"!=document.compatMode&&Wa,Ca=300,$a=e.bez([0.1,0,0.25,1]),T=333,b="fotorama",A,na,kb,Sa,X=[["width","string",null],["height","string",null],["aspectRatio","number",null],["touchStyle",
"boolean",!0],["click","boolean",null],["pseudoClick","boolean",!0],["loop","boolean",!1],["autoplay","boolean-number",!1],["stopAutoplayOnAction","boolean",!0],["transitionDuration","number",T],["background","string",null],["backgroundColor","string",null],["margin","number",5],["minPadding","number",10],["alwaysPadding","boolean",!1],["zoomToFit","boolean",!0],["cropToFit","boolean",!1],["flexible","boolean",!1],["fitToWindowHeight","boolean",!1],["fullscreen","boolean",!1],["fullscreenIcon","boolean",
!1],["vertical","boolean",!1],["arrows","boolean",!0],["arrowsColor","string",null],["arrowPrev","string",null],["arrowNext","string",null],["nav","string",null],["thumbs","boolean",!0],["navPosition","string",null],["thumbsOnTop","boolean",!1],["thumbsOnRight","boolean",!1],["navBackground","string",null],["thumbsBackgroundColor","string",null],["dotColor","string",null],["thumbColor","string",null],["thumbsPreview","boolean",!0],["thumbSize","number",null],["thumbMargin","number",5],["thumbBorderWidth",
"number",3],["thumbBorderColor","string",null],["caption","string",!1],["preload","number",3],["preloader","boolean","dark"],["shadows","boolean",!0],["data","array",null],["html","array",null],["hash","boolean",!1],["startImg","number",0],["onShowImg","function",null],["onClick","function",null],["onSlideStop","function",null],["detachSiblings","boolean",!0]];e.fn[b]=function(b){"undefined"==typeof fotoramaDefaults&&(fotoramaDefaults={});var a=e.extend(oa(),e.extend({},fotoramaDefaults,b));this.each(function(){var b=
e(this);b.data("ini")||Ta(b,a)});return this};e(function(){A=e(window);na=e(document);kb=e("html");Sa=e("body");e("."+b).each(function(){var f=e(this);f[b](oa(f))})});var Ea=["-webkit-","-moz-","-o-","-ms-",""],Da=new Image,Ya=!0;Da.onerror=function(){if(1!=this.width||1!=this.height)Ya=!1};Da.src="data:image/gif;base64,R0lGODlhAQABAIABAP///wAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="})(jQuery);