// LookUp.js
// Javascript Behaviour for the LookUp Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 12.08.2005 created by Matthias Hertel
// 21.09.2005 more robust whan fast typing.
//            clicking into the dropdown list enabled.
// 29.08.2006 memory leak removed
// 16.09.2006 context on event-methods is now set to the bound object.

var LookUpBehaviour = {
  
  lookupservice: null, // must be set on the control !

  pageproperty: "",
  savevalue: null,
  dd: null, // drop down object
  
  // declare an AJAX action to the lookup service
  _fillAction: {
    delay: 100,
    prepare: function(fld) { fld.savevalue = fld.value; return (fld.value); },
    call: null, // is assigned later
    finish: function (val, fld) {
      if (fld.savevalue != fld.value) {
        ajax.Start(fld._fillAction, fld); // again

      } else if ((val != null) && (val.indexOf(';') < 0)) {
        if (fld.dd != null) {
          fld.SetUntypedText(val);
          fld.RemoveDropdown();
        }
        
      } else {
        var dd = fld.CreateDropdown(fld);
        fld.FillDropdown(dd, val);
//      if (isIE)
//        fld.NextDropdownEntry(fld);
      } // if
    }, // finish
    onException: proxies.alertException
  }, // _fillAction


  init: function () {
    // late binding to the WebService. Only the alias is known for now
    if ((this.lookupservice == null) || (this.lookupservice == "")) {
      alert("Error: no lookupservice specified for LookUpControl " + this.id + "!");
    } else {
      this._fillAction = jcl.CloneObject(this._fillAction);
      this._fillAction.call = proxies[this.lookupservice].GetPrefixedEntries;
    } // if
    if ((this.pageproperty != null) && (this.pageproperty.length > 0))
      jcl.DataConnections.RegisterProvider(this, this.pageproperty);
  },


  term: function() {
    this.RemoveDropdown();
    this.savevalue = null;
  }, 
  
  // attach to the keyDown event
  // extend the current selection if backspace (8) is pressed.
  onkeydown : function (evt) {
    evt = evt || window.event;
    
    if (isIE) {
      var r = document.selection.createRange();

      if (evt.keyCode == 8) {
        r.moveStart("character", -1);
        r.select();
      } // if
    } else {
      // Firefox 
      
    } // if
  }, // onkeydown


  // attach to the keyUp event
  // handle all keyboard events for the dropdown list
  onkeyup : function (evt) {
    evt = evt || window.event;
    var fld = evt.srcElement;

    if (evt.keyCode == 40) {
      // down arrow
      if (fld.dd == null)
        ajax.Start(fld._fillAction, fld);
      else
        fld.NextDropdownEntry(fld);
        
    } else if (evt.keyCode == 38) {
      // up arrow
      if (fld.dd == null) {
        // is already closed
      } else if (fld.dd.selected == fld.dd.firstChild) {
        fld.RemoveDropdown();
      } else {
        fld.PreviousDropdownEntry(fld);
      } // if

    } else if ((evt.keyCode == 27) || (evt.keyCode == 13)) {
      // escape or return
      if (fld.dd != null)
        fld.RemoveDropdown();

    } else if ((evt.keyCode == 8) || (evt.keyCode >= 32)) {
      if ((fld.typedText == null) || (fld.typedText != fld.value))  {
        fld.TypeText(fld.value);
      } // if
    } // if
  }, // onkeyup


  // close the dropdown list when leaving the field
  onblur : function (evt) {
    evt = evt || window.event;
    var fld = evt.srcElement;
    // window.setTimeout(fld.RemoveDropdown.bind(fld), 1000);
    fld.RemoveDropdown();
  }, // handleBlur


  // click into the dropdown rectange.
  // the event handler is attached dynamically
  _onMouseDown : function (evt) {
    evt = evt || window.event;
    var src = evt.srcElement;
    var fld = src.parentNode.fld;
    fld.TypeText(src.innerText);
    // cancel selecting anything
    evt.cancelBubble = true;
    evt.returnValue = false;
  }, // _onMouseDown

 
  // ----- methods -----

  // Open or close the dropdown 
  ToggleDropdown: function () {
    if (this.dd == null)
      ajax.Start(this._fillAction, this);
    else
      this.RemoveDropdown();
  }, // ToggleDropdown


  // Create a absolute positioned <div> element for the drop-down content
  // using a fields dimensions.
  // The created object is returned and is also attachet to the input field using the dd property.
  CreateDropdown: function (fld) {
    var dd = fld.dd;
    var top,left;
    
    var ddImg = fld.nextSibling;
    if (ddImg.nodeType != 1)
      ddImg = ddImg.nextSibling;
    
    if (dd == null) {
      // create dropdown    
      dd = window.document.createElement("div");

      fld.parentNode.insertBefore(dd, fld);
      fld.dd = dd;
      dd.fld = fld;

      dd.style.position="absolute";
      top = (fld.offsetTop + fld.offsetHeight);
      left = fld.offsetLeft;

      op = fld.offsetParent;
      while (op != null) {
        top += op.offsetTop;
        left += op.offsetLeft;
        op = op.offsetParent;
      } // while
      dd.style.top = top + "px";
      dd.style.left = left + "px";
      dd.style.width = (fld.clientWidth + ddImg.clientWidth) + "px";
      dd.style.height= "200px";
      dd.style.border= "solid 1px black";
      dd.style.borderTop= "0px";
      dd.style.backgroundColor= "#DDDDEE";
      dd.style.overflowY = "scroll";

      dd.style.display="block";
      
      jcl.AttachEvent(dd, "onmousedown", this._onMouseDown);
      
    } // if
    return(dd);
  }, // CreateDropdown


  // Fill the dropdown list with new values.
  FillDropdown : function (dd, options) {
    if (typeof(options) == "string")
      options = options.split(";");
    
    // clear existing options
    while (dd.firstChild != null)
      dd.removeChild(dd.firstChild);
    if (options != null) {
      for (var n = 0; n < options.length; n++) {
        o = document.createElement("div");
        o.innerText = options[n];
        dd.appendChild(o);
      } // for
    } // if
    dd.selected = null;
  }, // FillDropdown


  // Remove the dropdown list
  RemoveDropdown: function () {
    var dd = this.dd;
    if (dd != null) {
      jcl.DetachEvent(dd, "onmousedown", this._onMouseDown);
      dd.fld = null;
      dd.parentNode.removeChild(dd);
      this.dd = null;
    } // if
  }, // RemoveDropdown


  // Select the next entry in the dropdown list.
  NextDropdownEntry: function () {      
    var dd = this.dd;
    
    if (dd.selected == null) {
      dd.selected = dd.firstChild;
    } else if (dd.selected.nextSibling != null) {
      dd.selected.style.backgroundColor = "transparent";
      dd.selected.style.color = "black";
      dd.selected = dd.selected.nextSibling;
    } // if
    if (dd.selected != null) {
      dd.selected.style.backgroundColor = "black";
      dd.selected.style.color = "white";
      dd.selected.scrollIntoView(false);
      this.SetUntypedText(dd.selected.innerText);
    } // if
  }, // NextDropdownEntry


  // Select the previous entry in the dropdown list.
  PreviousDropdownEntry: function () {      
    var dd = this.dd;

    if (dd.selected.previousSibling != null) {
      dd.selected.style.backgroundColor = "transparent";
      dd.selected.style.color = "black";
      dd.selected = dd.selected.previousSibling;
      dd.selected.style.backgroundColor = "black";
      dd.selected.style.color = "white";
      dd.selected.scrollIntoView(true);
      this.SetUntypedText(dd.selected.innerText);
    } // if
  }, // PreviousDropdownEntry


  // set the text of field and start a new LookUp
  TypeText: function (aText) {
    this.value = aText;
    this.typedText = aText
    ajax.Start(this._fillAction, this);
  }, // TypeText


  // Extend the text in the input field by some characters.
  // keep the typed text part unselected so typing is overriding the additional text.
  SetUntypedText: function (aText) {
    var tmp = this.typedText;

    this.value = aText;
    if (isIE) {
      var r = this.createTextRange();
      if (tmp == null) {
        // select all
      } else if (tmp.toLowerCase() == aText.substr(0, tmp.length).toLowerCase()) {
        r.moveStart('character', tmp.length);
      } // if
      r.select();
    
    } else {
      // Firefox
      if (tmp == null) {
        this.setSelectionRange(0, aText.length);
      } else {
        this.setSelectionRange(tmp.length, aText.length);
      }

    } // if
  } // SetUntypedText

} // LookUpBehaviour
