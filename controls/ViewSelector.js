// ViewSelector.js
// Javascript Behaviour for the View Selector Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// -----
// 21.08.2005 created by Matthias Hertel.
// 21.05.2006 using visual effects - buttons.
// 16.09.2006 context on event-methods is now set to the bound object.
// 21.10.2006 persisting properties removed. use the the PropPersist AJAX Control instead.
// 18.11.2006 correct reload when using the browser back.

var ViewSelectorBehaviour = {

  // Properties
  lastRegion: null,
  
  currentView: "",
  
  // Events
  onclick: function (evt) {
    evt = evt || window.event;

    var src = evt.srcElement;
    var s;
    if ((src.tagName == "A") && (src.href.indexOf('#') > 0)) {
      src.parentNode.select(src.href.split('#')[1]);

      evt.cancelBubble = true;
      evt.returnValue = false;

    } else if ((! isIE) && (src.tagName == "SPAN") && (src.attributes["view"] != null)) {
      src.parentNode.select(src.attributes["view"].value);
      evt.cancelBubble = true;
      evt.returnValue = false;
    
    } else if ((src.tagName == "SPAN") && (src.view != null)) {
      src.parentNode.select(src.view);
      evt.cancelBubble = true;
      evt.returnValue = false;

    } // if
  }, // onclick


  // Methods
  select: function (viewName) {
    jcl.DataConnections.Raise(this.name, viewName);
  }, // select


  GetValue: function (prop, value) {
    if ((prop == this.name) && (value != this.currentView)) {
      this.currentView = value;
      var objs = this.getElementsByTagName("A");
      for (var n = 0; n < objs.length; n++)
        objs[n].className = ((objs[n].name == "selview_" + value) ? "activ" : "passiv");
    } // if
  }, // GetValue

  init: function () {
    jcl.DataConnections.RegisterProvider(this, this.name);
    jcl.DataConnections.RegisterConsumer(this, this.name);
    window.setTimeout(this.init2.bind(this), 2);
  }, // init


  init2: function () {
    if (this.currentView == "") {
      var v = jcl.DataConnections.GetPropValue(this.name);
      if ((v == null) || (v.length == 0)) {
        // default is the first available view.
        v = this.views.split(';')[0];
        v = v.split(':')[0];
      }
      jcl.DataConnections.Raise(this.name, v, true);
    } // if
  } // init2

} // ViewSelectorBehaviour

