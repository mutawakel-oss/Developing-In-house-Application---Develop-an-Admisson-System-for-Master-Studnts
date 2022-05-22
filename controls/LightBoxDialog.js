// LightBoxDialog.js
// Javascript Behaviour for the LightBoxDialog Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 22.08.2006 22:06:25 created by Matthias Hertel
// 16.09.2006 context on event-methods is now set to the bound object.

var LightBoxDialogBehaviour = {
  onkeydown: function(evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27) {
      LightBoxBehavior.hide();
    } // if
  } // onkeypress
} // LightBoxDialogBehaviour

