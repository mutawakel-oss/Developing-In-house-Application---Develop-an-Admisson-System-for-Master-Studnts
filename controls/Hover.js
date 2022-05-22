// Hover.js
// Javascript Behaviour for the Hover Visual Effect
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 02.04.2006 created by Matthias Hertel

// The hover behaviour must be attached to the document level only once.
// To enable this effect it is necesary to just include this file.

var HoverBehaviour = {

  // ----- Properties -----
  _obj: null, // the current hovered object

  // ----- Events -----
  // add hover effect
  onmouseover: function(evt) {
    var obj = evt.srcElement;

    if ((! isIE) && (obj != null) && (obj.attributes["hover"] != null))
       obj.hover = true;
    if ((obj != null) && (obj.hover != null) && (obj != HoverBehaviour._obj)) {
      if (HoverBehaviour._obj != null)
        HoverBehaviour._obj.className = HoverBehaviour._class;
      HoverBehaviour._obj = obj;
      obj.className = obj.className + "Hover";
    } // if
  },

  // remove hover effect
  onmouseout: function(evt) {
    var obj = evt.srcElement;
    if ((obj != null) && (obj == HoverBehaviour._obj)) {
      var cn = HoverBehaviour._obj.className;
      obj.className = obj.className.replace(/(Pushed|Hover)$/, "");
      HoverBehaviour._obj = null;
      HoverBehaviour._class = null;
    } // if
  },

  // remove hover effect
  onmousedown: function(evt) {
    var obj = evt.srcElement;
    if (obj == HoverBehaviour._obj)
      obj.className = obj.className.replace(/(Pushed|Hover)$/, "") + "Pushed";
  },

  // remove hover effect
  onmouseup: function(evt) {
    var obj = evt.srcElement;
    if (obj == HoverBehaviour._obj)
      obj.className = obj.className.replace(/(Pushed|Hover)$/, "") + "Hover";
  }

} // HoverBehaviour

jcl.LoadBehaviour(document, HoverBehaviour);  
