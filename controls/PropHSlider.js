// PropHSlider.js
// Javascript Behaviour for the PropHSlider Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 17.09.2005 created by Matthias Hertel
// 05.08.2006 advanced layout, increment decrement buttons added.
// 05.08.2006 width, minvalue, maxvalue, unit attributes added.
// 22.09.2006 _associatedcontrol for direct linking to data fields.
// 21.10.2006 persisting properties removed. use the the PropPersist AJAX Control instead.

var PropHSliderBehaviour = {
    associatedcontrolid: "",
    name: "",
    knobObj: null, // reference to the movable obj,
    lastValue: -1,
    x: 0,
    maxright: 0,
    xOffset: 0, // x-offset of the region the knob is allowed to be moved.
    
    width:200,
    minvalue:0,
    maxvalue:100,
    _associatedcontrol: null,
    unit:1,
    
    // ----- Events -----
    onmousedown: function (evt) {
      evt = evt || window.event;
      var src = evt.srcElement;
      var left = this.lastValue;

      if (src.className == "knob") {
        var obj = jcl.FindBehaviourElement(src, PropHSliderBehaviour);
        obj.MoveStart(evt);

      } else if (src.className == "minus") {
        left = parseInt(left) - this.unit

      } else if (src.className == "plus") {
        left = parseInt(left) + this.unit
      } // if

      if (left != this.lastValue) {
        if (this._associatedcontrol != null)
          this._associatedcontrol.setData(left);
        jcl.DataConnections.Raise(this.name, left);
        this.GetValue(0, left);
        this.lastValue = left;
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


    // ----- Methods -----
    MoveStart: function (evt) {
      // calculate my offset
      this.xOffset = 0;
      var obj = this.knobObj.offsetParent;
      while (obj != null) {
        this.xOffset += obj.offsetLeft;
        obj = obj.offsetParent;
      } // while

      // calculate mousepointer-knob delta
      this.x = evt.clientX - (this.knobObj.offsetLeft + this.xOffset);

      jcl.currentMoving = this; // make it globally evailable when mouse is leaving this object.
      jcl.AttachEvent(document, "onmousemove", this._onmousemove);
      jcl.AttachEvent(document, "onmouseup", this._onmouseup);
      // cancel selecting anything
      evt.cancelBubble = true;
      evt.returnValue = false;
    }, // MoveStart
    

    MoveIt: function (evt) {
      var left = evt.clientX - this.x - this.xOffset;
      left = Math.min(this.maxright, Math.max(0, left));
      this.knobObj.style.left = left + "px";

      left = Math.round(left * (this.maxvalue - this.minvalue) / this.maxright + this.minvalue);
      left = Math.round(left / parseInt(this.unit)) * parseInt(this.unit);

      if (left != this.lastValue) {
        if ((this.name != null) && (this.name.length > 0)) {
          jcl.DataConnections.Raise(this.name, left);
        } // if

        if (this._associatedcontrol != null)
          this._associatedcontrol.setData(left);
      } // if

      this.lastValue = left;
      // cancel selecting anything
      evt.cancelBubble = true;
      evt.returnValue = false;
    }, // MoveIt
    

    // end of a moving gesture.
    MoveEnd: function () {
      if (this.knobObj != null) {
        jcl.DetachEvent(document, "onmousemove", this._onmousemove);
        jcl.DetachEvent(document, "onmouseup", this._onmouseup);
        jcl.currentMoving = null;
      } // if
    }, // MoveEnd
    

    // get a new value and adjust the position of the knob object. 
    GetValue: function (propName, propValue) {
      var knob = this.knobObj;
      if ((knob != null) && (this.lastValue != propValue)) {
        this.lastValue = propValue;
        propValue = propValue - this.minvalue;
        propValue = Math.round(propValue * this.maxright / (this.maxvalue - this.minvalue));
        propValue = Math.min(this.maxright, Math.max(0, propValue));
        knob.style.left = propValue + "px";
      }
    }, // GetValue
    

    init: function () {
      jcl.DataConnections.RegisterProvider(this, this.name);
      jcl.DataConnections.RegisterConsumer(this, this.name);
      // find the moveable knobObj
      this.knobObj = jcl.getElementsByClassName(this, "knob")[0];

      this.maxright = this.offsetWidth - 32 - this.knobObj.offsetWidth;

      this.minvalue = parseInt(this.minvalue);
      this.maxvalue = parseInt(this.maxvalue);
      this.unit = parseInt(this.unit);
      
      if ((this.associatedcontrolid != null) && (this.associatedcontrolid.length > 0))
        this._associatedcontrol = document.getElementById(this.associatedcontrolid);
    } // init
} // PropHSliderBehaviour

