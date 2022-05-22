// OverlayPanel.js
// Javascript Behaviour for the OverlayPanel Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 09.04.2006 created by Matthias Hertel


var OverlayPanelBehaviour = {

  selected: -1, // actually selected tab & panel
  tabs: null, // list of the tabs
  panels: null, // list of the panels

  // select another tab with a click
  onclick: function (evt) {
    evt = evt || window.event;
    var src = jcl.FindBehaviourElement(evt.srcElement, OverlayPanelBehaviour);
    if ((evt.srcElement.className == "VETab") || (evt.srcElement.className == "VETabHover")) {
      src.SelectPart(evt.srcElement);
    } // if
  },


  // init: find all the nested elements
  init: function () {
    var divs = this.getElementsByTagName("div");

    // find the tabs
    var obj = divs[1].firstChild;
    var n = 0;
    this.tabs = new Array();
    while (obj != null) {
      if (obj.nodeType == 3) {
        var nextObj = obj.nextSibling;
        obj.parentNode.removeChild(obj); // no #text nodes here
        obj = nextObj;
      } else {
        if (obj.className == "VETabSel")
          this.selected = n;
        if ((obj.className == "VETab") || (obj.className == "VETabSel"))
          this.tabs[n++] = obj;
        obj = obj.nextSibling;
      }
    } // while

    // find the panels
    obj = divs[2]; // the first panel
    n = 0;
    this.panels = new Array();
    while (obj != null) {
      this.panels[n] = obj;
      obj.style.display = ((n == this.selected) ? "" : "none");
      obj = obj.nextSibling;
      n++;
    } // while

  }, // init

  // release all references to HTML elements
  term: function() {
    this.tabs = null;
    this.panels = null;
  },

  // private methods
  
  SelectPart: function(tabObj) {
    var n = 0;
    while ((n < this.tabs.length) && (this.tabs[n] != tabObj))
      n++;

    // unselect
    if (this.selected != -1) {
      this.tabs[this.selected].className = "VETab";
      this.panels[this.selected].style.display = "none";
    }
      
    // select
    this.selected = n;
    if (this.selected != -1) {
      this.tabs[this.selected].className = "VETabSelHover";
      this.panels[this.selected].style.display = "";
    }
  }

} // OverlayPanelBehaviour