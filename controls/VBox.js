// VBox.js
// Javascript Behaviour for the VBox Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 08.08.2005 created by Matthias Hertel
var VBoxBehaviour = {

    startMouseX: 0, // x-offset where th mouse started moving
    startWidth: 0, // x-offset where th mouse started moving
    
    width:200,
    moverwidth:0,
    maxvalue:100,
    unit:1,
    
    // ----- Events -----

    onmousedown: function (evt) {
      evt = evt || window.event;
      var src = evt.srcElement;
      var obj = jcl.FindBehaviourElement(src, VBoxBehaviour);

      if ((obj != null) && (src == obj.mover)) {
        obj.MoveStart(evt);
      } // if
    }, // onmousedown


    // track mouse moves. This handler will be attached to the document level !
    _onmousemove: function (evt) {
      evt = evt || window.event;
      jcl.currentMoving.MoveIt(evt);
    }, // onmousemove


    // track mouse button up. This handler will be attached to the document level !
    _onmouseup: function (evt) {
      evt = evt || window.event;
      jcl.currentMoving.MoveEnd(evt);
    }, // onmouseup


    init: function () {
      var objs
      var obj = this.firstChild;
      
      // remove all first level #text nodes
      while (obj != null) {
        if (obj.nodeType == 3) {
          var nextObj = obj.nextSibling;
          obj.parentNode.removeChild(obj); // no #text nodes here
          obj = nextObj;
        } else {
          obj = obj.nextSibling;
        } // if
      } // while

      var nodes = this.childNodes;
      this.leftBox = nodes[0];
      this.mover = nodes[1];
      this.rightBox = nodes[2];
      
      this.moverwidth = parseInt(this.mover.style.width) + parseInt(this.mover.style.marginLeft) + parseInt(this.mover.style.marginRight);

      this.width = parseInt(this.style.width);
      if (this.width < 200 + this.moverwidth)
        this.width = 200 + this.moverwidth;

      this.resize(this.leftBox.offsetWidth);
    }, // init

 
     // ----- Methods -----

    MoveStart: function (evt) {
      // calculate the offset
      this.startMouseX = evt.clientX;
      this.startWidth = this.leftBox.offsetWidth;

      jcl.currentMoving = this; // make it globally evailable when mouse is leaving this object.
      jcl.AttachEvent(document, "onmousemove", this._onmousemove);
      jcl.AttachEvent(document, "onmouseup", this._onmouseup);
      // cancel selecting anything
      evt.cancelBubble = true;
      evt.returnValue = false;
    }, // MoveStart
    

    MoveIt: function (evt) {
      var w = this.startWidth + (evt.clientX - this.startMouseX);
      this.resize(w);
      
      // cancel selecting anything
      evt.cancelBubble = true;
      evt.returnValue = false;
    }, // MoveIt
    

    MoveEnd: function () {
      jcl.DetachEvent(document, "onmousemove", this._onmousemove);
      jcl.DetachEvent(document, "onmouseup", this._onmouseup);
      jcl.currentMoving = null;
    }, // MoveEnd


    resize: function (w) {
      w = Math.max(w, 100);
      w = Math.min(w, this.width - 100 - this.moverwidth);
      
      this.leftBox.style.width = w + "px";
      this.rightBox.style.width = (this.width - w - this.moverwidth) + "px";
      
      var h = Math.max(this.leftBox.offsetHeight, this.rightBox.offsetHeight);
      this.mover.style.height = h + "px";

      this.style.height = h + "px";
    } // resize

} // VBoxBehaviour

