// DataInput.js
// Javascript Behaviour for the DataInput Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 16.09.2005 created by Matthias Hertel
// 30.09.2005 precission (prec) attribute added
// 21.10.2006 persisting properties removed. use the the PropPersist AJAX Control instead.

var DataInputBehaviour = {
  // ----- Properties -----
  nosubmit: false,
  type: "", prec: "",
  datatype: "",
  propname: "",
  
  init: function () {
    if (this.propname != "") {
      jcl.DataConnections.RegisterProvider(this, this.propname);
      jcl.DataConnections.RegisterConsumer(this, this.propname);
    }
    if ((typeof(nls) != "undefined") && (this.datatype != "")) {
      this._toString = nls[this.datatype].toString;
      this._toValue = nls[this.datatype].toValue;
      this._keys = nls[this.datatype].keys;
      this._mapkeys = nls[this.datatype].mapkeys;
      this.title = nls[this.datatype].title;
    } // if
    if (this.prec == "")
      this.prec = 0;
    else
      this.prec = parseInt(this.prec, 10);
  }, // init


  // ----- Events -----
  onkeypress: function(evt) {
    evt = evt || window.event;
    var fieldValue = this.value;
    var k;
    var r = true;

    if (evt.keyCode == 13)
      this.validate();

    if (isIE) {
      k = String.fromCharCode(evt.keyCode);
    } else {
      if (evt.charCode == 0)
        return(true);
      k = String.fromCharCode(evt.charCode);
    }
    
    if ((this._keys == null) || (this._keys.indexOf(k) >= 0)) {
      r = true;
    } else if ((this._mapkeys != null) && (this._mapkeys.indexOf(k) >= 0)) {
      if (isIE)
        evt.keyCode = this._keys.charCodeAt(0);
    } else {
      r = false;
    } // if
    evt.returnValue = r;
    return (r);
  }, // handleKeyPress
  
  
  onchange: function (evt) {
    var v = this._toValue(this.value, this.prec);
    this.value = this._toString(v, this.prec);
    if (this.propname != "") {
      jcl.DataConnections.Raise(this.propname, v);
    }
  }, // onchange
  

  // --- page property binding ---
  GetValue: function (propName, propValue) {
    this.value = this._toString(propValue, this.prec);
  }, // GetValue


   // --- data binding ---
  setData: function(v) {
    this.value = this._toString(v, this.prec);
  }, // setData


  getData: function() {
    return(this._toValue(this.value, this.prec));
  }, // getData


  // validate and reformat the current value
  validate: function () {
    var v = this._toValue(this.value, this.prec);
    this.value = this._toString(this.value, this.prec);
    if (this.propname != "") {
      jcl.DataConnections.Raise(this.propname, v);
    }
  },
  
  // --- nls support ---
  _keys: null, _mapkeys: null,
  _toString: function (v) { return(v); },
  _toValue: function (v) { return(v); }

} // DataInputBehaviour

