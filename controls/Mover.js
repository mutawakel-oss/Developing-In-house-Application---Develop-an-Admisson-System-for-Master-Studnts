// Mover.js
// Javascript Behaviour for the Mover Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 09.03.2006 created by Matthias Hertel
// 16.09.2006 context on event-methods is now set to the bound object.

// the mover behavior is processing global events like onmousemove
// While a html object is beeing moved the following global things are used:
// MoverBehaviour.mo is used to store the current Moving html Object.
// MoverBehaviour._onmousemove handles any mouse movements
// MoverBehaviour._onmousemove handles the mouse up event

var MoverBehaviour = {
    mo: null, // reference to the movable obj,
    x: 0, y: 0,
    
    // ----- Events -----
    onmousedown: function (evt) {
      evt = evt || window.event;
      this.MoveStart(evt);
    }, // onmousedown


    // track mouse moves. This handler will be attached to the document level !
    _onmousemove: function (evt) {
      evt = evt || window.event;
      MoverBehaviour.MoveIt(evt);
    }, // onmousemove


    // track mouse button up. This handler will be attached to the document level !
    _onmouseup: function (evt) {
      evt = evt || window.event;
      MoverBehaviour.MoveEnd(evt);
    }, // onmouseup


    // ----- Methods -----
    MoveStart: function (evt) {
      // find the moving part (position:absolute or class="VEPart")
      var mo = this;
      while ((mo != null) && (mo.className != "VEPart"))
        mo = mo.parentNode;

      if (mo == null)
        return; // don't move
      MoverBehaviour.mo = mo;
        
      // calculate mousepointer-object distance
      mo.x = mo.y = 0;
      obj = mo;
      while (obj != null) {
        mo.x += obj.offsetLeft;
        mo.y += obj.offsetTop;
        obj = obj.offsetParent;
      } // while
      mo.x = evt.clientX - mo.x;
      mo.y = evt.clientY - mo.y;

      // make the moving object globally evailable when mouse is leaving this object.
      jcl.AttachEvent(document, "onmousemove", this._onmousemove);
      jcl.AttachEvent(document, "onmouseup", this._onmouseup);
    }, // MoveStart
    

    MoveIt: function (evt) {
      var mo = MoverBehaviour.mo;
      if (mo != null) {
        var p = (evt.clientX - mo.x) + "px";
        if (p != mo.style.left) mo.style.left = p;
        p = (evt.clientY - mo.y) + "px";
        if (p != mo.style.top) mo.style.top = p;
      } // if
      // cancel selecting anything
      evt.cancelBubble = true;
      evt.returnValue = false;
    }, // MoveIt
    

    MoveEnd: function () {
      var mo = MoverBehaviour.mo;
      if (mo != null) {
        MoverBehaviour.mo = null;
        jcl.DetachEvent(document, "onmousemove", this._onmousemove);
        jcl.DetachEvent(document, "onmouseup", this._onmouseup);
      } // if
    } // MoveEnd
    
} // MoverBehaviour
