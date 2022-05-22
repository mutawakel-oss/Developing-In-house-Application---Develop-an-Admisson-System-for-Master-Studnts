// UrlFrame.js
// Javascript Behaviour for the UrlFrame Control.
// This control implement an iframe element that connects to the page properties.
// The pageproperty "url" can be used
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 12.08.2005 created by Matthias Hertel
// 27.09.2005 PageProperty attribute added
// 28.09.2005 internal timer added
// 16.09.2006 context on event-methods is now set to the bound object.

var UrlFrameBehaviour = {

  // ----- Properties -----
  
  // name of a page property that specifies the url with patterns.
  pageproperty: "",

  // this is the url of the HTML iframe element containing placeholders for page properties.
  urlpattern: "about:blank",

  // this is the actual url of the HTML iframe (not normalized by HTML).
  _src: "",

  // this is the timer used to refresh the iframe.
  _timer: null,

  // ----- Methods -----

  // many page properties might be changed at ince so delay the url calculation a little bit.
  GetValue: function (prop, value) {
    if ((this.pageproperty.length > 0) && (prop == this.pageproperty)) {
      this.urlpattern = value;
    } // if
    if (this._timer != null)
      window.clearTimeout(this._timer)
    this._timer = window.setTimeout(this.RefreshUrl.bind(this), 50);
  }, // GetValue


  // re-calculate the url for the iframe element
  RefreshUrl: function () {
    this._timer = null;
    var url = this.urlpattern;
    url = url.replace(/\[\w+\]/gi, this._regreplace);
    if ((url.indexOf('[') < 0) && (this._src != url)) {
      this.contentWindow.location.replace(url); // do not push onto history !
      this._src = url;
    } // if
  }, // RefreshUrl
  

  // replace-method for regular expressions  
  _regreplace: function (p) {
    p = p.substr(1, p.length-2);
    var s = jcl.DataConnections.GetPropValue(p);
    if (s == null)
      s = "[" + p + "]"; // leave the placeholder unchanged.
    else
      s = s.match(/\w+/);
    return(s);
  }, // _regreplace


  // register to all page properties
  init: function () {
    jcl.DataConnections.RegisterConsumer(this, "*");
  }

} // UrlFrameBehaviour
