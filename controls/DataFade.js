// DateFade.js
// Javascript Behaviour for the DataFade Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 08.08.2005 created by Matthias Hertel
// 16.09.2006 context on event-methods is now set to the bound object.
// 27.09.2006 datatypes support
// 27.09.2006 fade.* renamed to datafade.*
// 29.09.2006 precission support added

var DataFadeBehaviour = {
  count : 0,
  orgcolor: null,
  highcolor: "#FFFF00",
  datatype: "", prec: "",

  // initialize member variables
  init: function() {
    if ((nls != null) && (this.datatype != "")) {
      this._toString = nls[this.datatype].toString;
    } // if

    if (this.prec == "")
      this.prec = 0;
    else
      this.prec = parseInt(this.prec, 10);

    this.highcolor = this.getColor(this.highcolor);

    var c;
    if (this.currentStyle) {
      c = this.currentStyle.backgroundColor;
    } else if (window.getComputedStyle) {
      c = window.getComputedStyle(this, null).getPropertyValue("background-color");
    } else {
      c = "#FFFFFF";
    } // if
    this.orgcolor = this.getColor(c);
  }, // init


  // handle a mouse click
  onclick: function(evt) {
    evt = evt || window.event;
    this.start()
  }, // onclick
  

  // allow data binding
  setData: function(val) {
    var s = this._toString(val, this.prec);
    if (this.innerText != s) {
      this.innerText = s;
      this.start();
    } // if
  }, // setData


  // start the fade effect
  start: function() {
    this.count = 0;
    this.fade();
  }, // start
  
  
  // convert a color attribute #rrggbb or rgb(r, g, b) to a color object.
  getColor: function (c) {
    var ret = new Object();
    if (c.substr(0, 3) == "rgb") {
      c = c.match(/rgb\s*\(\s*(\d{1,3})\s*,\s*(\d{1,3})\s*,\s*(\d{1,3})\s*\)/);
    } else if (c.substr(0, 1) == "#") {
      c = c.toLowerCase().match(/#([0-9a-f]{2,2})([0-9a-f]{2,2})([0-9a-f]{2,2})/);
      c = new Array(0, parseInt(c[1], 16), parseInt(c[2], 16), parseInt(c[3], 16));
    } else {
      c = [0,255,255,255];
    } // if
    ret.r = c[1];
    ret.g = c[2];
    ret.b = c[3];
    return(ret);
  }, // getColor


  // fade over effect
  fade: function () {
    var f1 = this.count;
    var f2 = 16 - f1;

    var r = Math.round(((this.orgcolor.r * f1) + (this.highcolor.r * f2)) / 16)
    var g = Math.round(((this.orgcolor.g * f1) + (this.highcolor.g * f2)) / 16)
    var b = Math.round(((this.orgcolor.b * f1) + (this.highcolor.b * f2)) / 16)

    this.style.backgroundColor="rgb(" + r + "," + g + "," + b + ")";
    this.count += 1;

    if (this.count < 16) {
      window.setTimeout(this.fade.bind(this), 50)
    } else {
      this.style.backgroundColor= "rgb(" + this.orgcolor.r + "," + this.orgcolor.g + "," + this.orgcolor.b + ")";
    }
  }, // fade

  _toString: function (v) { return(v); }

} // DataFadeBehaviour

