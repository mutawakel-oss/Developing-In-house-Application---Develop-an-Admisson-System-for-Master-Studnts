// PropBarChart.js
// Javascript Behaviour for the PropBarChart Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 09/17/2005 14:05:26 created by Matthias Hertel

var PropBarChartBehaviour = {

  // ----- Properties -----
  properties: "",
  maxvalue: 100,

  // ----- Methods -----
  GetValue: function (propName, propValue) {
    if (this.properties.indexOf(";" +  propName.toLowerCase() + ";") >= 0) {
      propValue = propValue * 100 / this.maxvalue;
      propValue = Math.min(100, Math.max(0, Math.round(propValue)));
      var bar = document.getElementById("barchart_" + propName);
      bar.style.height = propValue + "px";
    } // if
  }, // GetValue

  init: function () {
    this.properties = ";" + this.properties.toLowerCase() + ";";
    jcl.DataConnections.RegisterConsumer(this, "*");
  } // init

} // PropBarChartBehaviour

