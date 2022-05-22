// $safeitemname$.js
// Javascript Behaviour for the $safeitemname$ Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// $time$ created by $username$

var $safeitemname$Behaviour = {

  // ----- Properties -----
  nosubmit: false,
  

  // ----- Events -----
  onchange: function (evt) {
    evt = evt || window.event;
    var src = evt.srcElement;
    src.RaiseValue();
  }, // onchange


  // ----- Methods -----
  GetValue: function (propName, propValue) {
    this.value = propValue;
  }, // GetValue


  RaiseValue: function () {
    jcl.DataConnections.Raise(this.name, this.value);
  }, // RaiseValue
    

  init: function () {
    jcl.DataConnections.RegisterProvider(this, this.name);
    jcl.DataConnections.RegisterConsumer(this, this.name);
  } // init

} // $safeitemname$Behaviour

