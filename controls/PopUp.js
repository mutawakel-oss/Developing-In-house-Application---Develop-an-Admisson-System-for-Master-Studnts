// controls/popup.js
// Javascript Behaviour for the popup control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 03.06.2005 created by Matthias Hertel

var PopUpBehaviour = {

  // ----- Properties -----
  _obj: null, // the current hovered object
  _timer: null, // a timer that will trigger the creation of the popUp Information.
  _popobj: null, // the current hovered object

  // ----- Events -----

  // set a timer to show the popUp information in a moment
  onmouseover: function(evt) {
    evt = evt || window.event;
    var obj = evt.srcElement;
    if ((! isIE) && (obj != null) && (obj.attributes["poptext"] != null))
      obj.poptext = obj.attributes["poptext"].value;

    if ((obj != null) && (obj.poptext != null) && (obj != PopUpBehaviour._obj)) {
      PopUpBehaviour._obj = obj;
      PopUpBehaviour._timer = window.setTimeout(PopUpBehaviour.show, 300);
    } // if
  }, // onmouseover


  // terminate the timer and remove the popUp information
  onmouseout: function(evt) {
    evt = evt || window.event;
    var obj = evt.srcElement;

    if ((obj != null) && (obj == PopUpBehaviour._obj)) {
      if (PopUpBehaviour._timer != null)
        window.clearTimeout(PopUpBehaviour._timer);
      else
        PopUpBehaviour._popobj.style.display = "none";
      PopUpBehaviour._timer = null;
      PopUpBehaviour._obj = null;
    } // if
  }, // onmouseout
  

  // now show the popUp information
  show: function(evt) {
    var obj = PopUpBehaviour._obj;
    if (obj != null) {
      pos = PopUpBehaviour._absolutePosition(obj);
      var o = PopUpBehaviour._create(obj.poptext, pos);
      PopUpBehaviour._popobj = o;
    } // if
    PopUpBehaviour._timer = null;
  }, // show
  

  // --- private methods ---
  
  // create or reuse the popUp element
  _create: function(text, pos) {
    var oPop = document.getElementById("VEPopUp");
    var oPoint;
    
    if (oPop == null) {
      // create a popUp object for the first time
      oPop = document.createElement("div");
      oPop.id= "VEPopUp";
      oPop.style.position = "absolute";
      oPop.style.width = "280px";
      
      var htm = "<img src='controls/images/point.gif' style='position:relative;display:block;top:1px;z-index:1'>";
      htm += "<div style='position:relative;'><div class='VEShadow'></div><div style='position:relative;font-family:Simplified Arabic;font-size: 12pt;border: solid #203050 1px; padding: 4px; background-image:url(app_themes/red/images/background_browse.jpg);background-color:#eaeef7; background-position:top;background-repeat:repeat;'></div></div>";
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

} // PopUpBehaviour

jcl.LoadBehaviour(document, PopUpBehaviour);  
