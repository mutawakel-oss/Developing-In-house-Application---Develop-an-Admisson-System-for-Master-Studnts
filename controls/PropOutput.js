// PropOutput.js
// Javascript Behaviour for the PropOutput Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 10.08.2006 created by Matthias Hertel

var PropOutputBehaviour = {

  // ----- Methods -----
  GetValue: function (propName, propValue) {
    this.innerText = propValue;
  }, // GetValue


  // allow data binding
  setData: function(val) {
    this.innerText = val;
  }, // setData


  init: function () {
    jcl.DataConnections.RegisterConsumer(this, this.name);
  } // init

} // PropOutputBehaviour

