// DataOutput.js
// Javascript Behaviour for the DataOutput Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 10.08.2006 created by Matthias Hertel

var DataOutputBehaviour = {
  
  init: function () {
    if ((nls != null) && (this.datatype != "")) {
      this._toString = nls[this.datatype].toString;
    } // if
  }, // init

  // --- Methods: data binding ---
  setData: function(val) {
    var s = this._toString(val);
    if (this.innerText != s)
      this.innerText = s;
  }, // setData

  _toString: function (v) { return(v); }

} // DataOutputBehaviour

