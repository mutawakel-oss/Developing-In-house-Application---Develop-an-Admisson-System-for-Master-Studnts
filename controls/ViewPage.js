// ViewPage.js
// Javascript Behaviour for the ViewPage Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// -----
// 24.08.2005 created by Matthias Hertel.

var ViewPageBehaviour = {
  view: "*",
  
  GetValue: function (prop, value) {
    this.style.display = ((value == this.view) || (value == "*") ? "" : "none");
  }, // GetValue

  init: function () {
    jcl.DataConnections.RegisterConsumer(this, "view");
  } // init
} // ViewPageBehaviour