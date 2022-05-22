// PopUpDialog.js
// Javascript Behaviour for the PopUpDialog Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 23.09.2006 created by Matthias Hertel
// 07.10.2006 Info & Error Popups enabled.
// 21.10.2006 dont close the dialog when show() is called while open.

var PopUpDialogBehaviour = {
  // ----- Properties -----
  _obj: null, // the current hovered object
  _text: null, // the current shown text
  _popobj: null, // the current hovered object

  // ----- Events -----

  // hide the popUp information
  onclick: function(evt) {
    evt = evt || window.event;
    var src = evt.srcElement;
    if ((src != null) && (src.className == "VEClose")) {
      this.close();
    } // if
  }, // onclick


  // now show the popUp information
  show: function(buttonObj, title, txt) {
    var o;
    var pos = this._absolutePosition(buttonObj);

    if ((this._obj == buttonObj) && (this._text == txt)) {
      this.close();
      this._obj = null;
      this._text = "";
    } else {
      o = this._FindDivObject("VETitle");
      if (o != null) o.firstChild.innerHTML = title;
      o = this._FindDivObject("VEContent");
      if (o != null) o.innerHTML = txt;
      
      this.style.display = "block";
      this.resize();
      if (buttonObj == null) {
        this.style.top = "";
        this.style.left= "";
      } else {
        if (pos.top > 300) {
          this.style.top = (pos.top - o.offsetHeight - 12) + "px";
        } else {
          this.style.top = (pos.top + pos.height + 1) + "px";
        }
        this.style.left= (pos.left + pos.width - this.offsetWidth) + "px";
      } // if
      this._obj = buttonObj;
      this._text = txt;
    }
  }, // show
  
  close: function() {
    this.style.display = "none";
    this._obj = null;
  },

  init: function() {
    this.resize();
  },

  // --- private methods ---
  
    // resize the shadow and the part
  resize: function () {
    var o;
    var h = 0;
    var w = 0;
    o = this._FindDivObject("VEMover");
    if (o != null) { h += o.offsetHeight; w = Math.max(w, o.offsetWidth); }
    o = this._FindDivObject("VETitle");
    if (o != null) { h += o.offsetHeight; w = Math.max(w, o.offsetWidth); }
    o = this._FindDivObject("VEContent");
    if (o != null) { h += o.offsetHeight; w = Math.max(w, o.offsetWidth); }
    o = this._FindDivObject("VEShadow");
    if (o != null) {
      this.style.height = o.style.height = h + "px";
      o.style.width = w + "px";
    }
  }, // resize
  
  _FindDivObject: function(cn) {
    var l = this.getElementsByTagName("div");
    for (n = 0; n < l.length; n++){
      if (l[n].className == cn) return(l[n]);
    }
    return(null);
  },

  // get the absolute position of a html object
  _absolutePosition: function(obj) {
    var pos = null;
    
    if (obj != null) {
      pos = new Object();
      pos.top = obj.offsetTop;
      pos.left = obj.offsetLeft;
      pos.width = obj.offsetWidth;
      pos.height= obj.offsetHeight;

      obj = obj.offsetParent;
      while (obj != null) {
        pos.top += obj.offsetTop;
        pos.left += obj.offsetLeft;
        obj = obj.offsetParent;
      } // while
    }
    return(pos);
  } // _absolutePosition

} // PopUpDialogBehaviour
