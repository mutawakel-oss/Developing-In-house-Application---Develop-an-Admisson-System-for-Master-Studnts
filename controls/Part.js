// Part.js
// Javascript Behaviour for the Part Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 09.03.2006 created by Matthias Hertel
// 16.09.2006 context on event-methods is now set to the bound object.
// 23.09.2006 using images instead of text for the window frame buttons

var PartBehaviour = {

  onclick: function (evt) {
    evt = evt || window.event;
    if ((evt.srcElement.className == "VEFull") || (evt.srcElement.className == "VEMini"))
      this.ToggleContent();
    else if (evt.srcElement.className == "VEClose")
      this.parentNode.removeChild(this);
  },

  onresize: function (evt) {
    evt = evt || window.event;
    this.resize();
  },

  ToggleContent: function () {
    var objs;
    var obj;
    
    objs = jcl.getElementsByClassName(this, "VEContent");
    if ((objs != null) && (objs[0] != null)) {
      obj = objs[0];
      obj.style.display = (obj.style.display == "none" ? "" : "none");
    } // if

    objs = jcl.getElementsByClassName(this, "VEFull");
    if ((objs != null) && (objs[0] != null)) {
      obj = objs[0];
      obj.style.display = (obj.style.display == "none" ? "" : "none");
    } // if

    objs = jcl.getElementsByClassName(this, "VEMini");
    if ((objs != null) && (objs[0] != null)) {
      obj = objs[0];
      obj.style.display = (obj.style.display == "none" ? "" : "none");
    } // if
    this.resize();
  },
    
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

  // init: resize the shadow
  init: function () {
    var h = this._FindDivObject("VEMover");
    if (h != null) {
      var objs;
      var obj = this._FindDivObject("VEContent");
      obj.style.display = "";

      objs = jcl.getElementsByClassName(this, "VEFull");
      obj = objs[0];
      obj.style.display = "none";
      
      objs = jcl.getElementsByClassName(this, "VEMini");
      obj = objs[0];
      obj.style.display = "";
    }
    this.resize();
  }, // init


  // private methods
  
  _FindDivObject: function(cn) {
    var l = this.getElementsByTagName("div");
    for (n = 0; n < l.length; n++){
      if (l[n].className == cn) return(l[n]);
    }
    return(null);
  }
}

