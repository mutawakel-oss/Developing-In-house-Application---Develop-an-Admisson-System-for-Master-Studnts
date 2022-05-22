// PropPersist.js
// Javascript Behaviour for the PropPersist Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// To enable the PropPersist just include this file in the page or use the
// PropPersist control.
// ----- 
// 21.10.2006 created by Matthias Hertel

var PropPersist = {
  // ----- Properties -----
  propList: {},
  
  init: function () {
    jcl.DataConnections.RegisterConsumer(PropPersist, "*");
  }, // init
   
  // ----- Methods -----
  GetValue: function(prop, value) {
    if (this.propList[prop] != null)
      jcl.DataConnections.PersistPropValue(prop);
  } // GetValue
} // PropPersist
