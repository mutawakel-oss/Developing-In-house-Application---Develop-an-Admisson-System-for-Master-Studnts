// controls/popup.js
// Javascript Behaviour for the popup control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 03.06.2005 created by Matthias Hertel

var AJAXPopUpBehaviour = {

  // ----- Properties -----
  _obj: null, // the current hovered object
  _popobj: null, // the current hovered object
  
  infomethod: null, // the specified attribute with the name of the webservice and method used for retrieving the information.

  // ----- Events -----
  

  // Setup the 
  init: function() {
    // setup the AJAX call & finish method
    if (this.infomethod != null)
      AJAXPopUpBehaviour.action.call = this.infomethod;

    // attach the event handlers to the document element to check all elements on the page
    jcl.AttachEvent(document, "onmouseover", AJAXPopUpBehaviour._onmouseover);
    jcl.AttachEvent(document, "onmouseout", AJAXPopUpBehaviour._onmouseout);
  },


  // unlink all HTML elements and event handlers to avoid memory leaks.
  term: function() {
    jcl.DetachEvent(document, "onmouseover", AJAXPopUpBehaviour._onmouseover);
    jcl.DetachEvent(document, "onmouseout", AJAXPopUpBehaviour._onmouseout);
    AJAXPopUpBehaviour._obj = null;
    AJAXPopUpBehaviour._popobj = null;
  },


  // set a timer to show the popUp information in a moment
  _onmouseover: function(evt) {
    var obj = evt.srcElement;
    if ((obj != null) && (obj.tagName == "A") && (obj.href != null) && (obj.href != "")) {
      ajax.Start(AJAXPopUpBehaviour.action, obj);
    } // if
  }, // onmouseover


  // now show the popUp information
  show: function(value, obj) {
    if (obj != null) {
      var pos = AJAXPopUpBehaviour._absolutePosition(obj);
      AJAXPopUpBehaviour._popobj = AJAXPopUpBehaviour._create(value, pos);
    } // if
  }, // show
  

  // terminate the timer and remove the popUp information
  _onmouseout: function(evt) {
    var obj = evt.srcElement;

    if (AJAXPopUpBehaviour._popobj != null) {
      AJAXPopUpBehaviour._popobj.style.display = "none";
    } // if
  }, // onmouseout
  
  // --- private methods ---
  
  action: {
    delay: 300,
    queueMultiple: false,
    prepare: function(obj) { return (obj.href); },
    call: "proxies.ServerInfo.GetDetails",
    finish: "AJAXPopUpBehaviour.show",
    onException: proxies.alertException
  },
  
  // create or reuse the popUp element
  _create: function(text, pos) {
    var oPop = document.getElementById("VEPopUp");
    var oPoint;
    
    if (oPop == null) {
      // create a popUp object for the first time
      oPop = document.createElement("div");
      oPop.id= "VEPopUp";
      oPop.style.position = "absolute";
      oPop.style.width = "240px";
      var htm = "<img src='../controls/images/point.gif' style='position:relative;display:block;top:1px;z-index:1'>";
      htm += "<div style='position:relative;'><div class='VEShadow'></div><div style='position:relative;border: solid #203050 1px; padding: 4px; background-image:url(../controls/images/buttonbackpushed.png);background-color:#eaeef7; background-position:top;background-repeat:repeat-x;'></div></div>";
      oPop.innerHTML = htm;
      document.body.appendChild(oPop);
    } // if

    // adjust tht position and choos the right point gif file
    oPoint = oPop.firstChild; // point gif file

    oPop.style.display="block";
    oPop.style.top = (pos.top + pos.height) + "px";
    var leftPos = pos.left + pos.width/2 - 40;

    if (leftPos < 8) {
      oPop.style.left = "8px";
      oPoint.src = String(oPoint.src).replace(/pointleft.gif/i, "point.gif");
      oPoint.style.marginLeft = "12px";
    } else if (leftPos + 240 < document.documentElement.clientWidth) {
      oPop.style.left = leftPos + "px";
      oPoint.src = String(oPoint.src).replace(/pointleft.gif/i, "point.gif");
      oPoint.style.marginLeft = "40px";
    } else {
      leftPos = pos.left + pos.width/2 - 200;
      if (leftPos + 250 > document.documentElement.clientWidth)
        leftPos = document.documentElement.clientWidth - 250;
      oPop.style.left = leftPos + "px";
      oPoint.src = String(oPoint.src).replace(/point.gif/i, "pointleft.gif");
      oPoint.style.marginLeft = "180px";
    } // if

    // adjust the shadow object
    var b = oPop.firstChild.nextSibling.firstChild; // shadow object
    b.nextSibling.innerHTML = text;
    b.style.height = b.nextSibling.offsetHeight + "px";
    return(oPop); 
  }, // _create


  // get the absolute position of a html object
  _absolutePosition: function(obj) {
    var pos = null;
    
    if (obj != null) {
      pos = new Object();
      pos.top = obj.offsetTop;
      pos.left = obj.offsetLeft;
      pos.width = obj.offsetWidth;
      pos.height= obj.offsetHeight;

      obj = obj.offsetParent;
      while (obj != null) {
        pos.top += obj.offsetTop;
        pos.left += obj.offsetLeft;
        obj = obj.offsetParent;
      } // while
    }
    return(pos);
  } // _absolutePosition
} // AJAXPopUpBehaviour

