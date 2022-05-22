// InlineEdit.js
// Javascript Behaviour for the InlineEdit Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 04.04.2006 created by Matthias Hertel

var HtmlEditBehaviour = {

  staticCont: null,  // ... container
  staticObj: null,   // ... iframe
  staticDoc: null,   // ... document of the iframe
  staticTimer: null,

  // ----- Events -----
  
  // add highlight effect
  onmouseover: function(evt) {
    var src = jcl.FindBehaviourElement(evt.srcElement, HtmlEditBehaviour);
    if (src.className == "editable")
      src.className = "edithover"
  },


  // remove highlight effect
  onmouseout: function(evt) {
    var src = jcl.FindBehaviourElement(evt.srcElement, HtmlEditBehaviour);
    if (src.className == "edithover")
      src.className = "editable"
  },

  
  // Start Editing
  onclick: function(evt) {
    var src = jcl.FindBehaviourElement(evt.srcElement, HtmlEditBehaviour);
    src.StartEditing();
  }, // onclick


    
  // ----- Methods -----

  // add an editable iframe to the container
  StartEditing: function() {  
    this.EndEditing();
    HtmlEditBehaviour.staticCont = this;
    var htmltext = this.innerHTML;
    
    var obj = document.createElement("iframe");
    HtmlEditBehaviour.staticObj = obj;

    obj.scrolling="no";
    obj.style.height = this.scrollHeight + "px";
    obj.style.width  = this.scrollWidth + "px";
    this.innerHTML = "";    
    this.className = "editmode";

    this.appendChild(obj);
    obj.className="editframe";

    var edDoc;
    if (obj.contentDocument)
      edDoc = obj.contentDocument;
    else
      edDoc = obj.contentWindow.document;
    HtmlEditBehaviour.staticDoc = edDoc;
      
    edDoc.designMode="On";
    
    edDoc.write("<html><head><base href='" + window.location + "'>");
    edDoc.write("<style type='text/css'>body,html{border:none;padding:0px;margin: 0px;font-family:Tahoma,Helvetica,Arial; font-size:10pt;color:black; background:white;}</style>");
    edDoc.write("</head><body>" + htmltext + "</body></html>");
    edDoc.close();

    // set the focus at the end of the inner Text
    if (edDoc.createRange) {
      var r = edDoc.createRange();
      r.selectNode(edDoc.body.lastChild);
  	  r.collapse(false);
      var sel = window.getSelection();
      sel.removeAllRanges();
      sel.addRange(r);

    } else {
      var r = edDoc.body.createTextRange();
      r.collapse(false);
      r.select();
    } // if
    edDoc.onkeyup = HtmlEditBehaviour.AdjustHeight;
    window.setTimeout(HtmlEditBehaviour.AdjustHeight, 100);
  }, // onclick


  // remove the editable iframe from the container
  EndEditing: function() {
    if (HtmlEditBehaviour.staticDoc != null) {
      var htmltext = HtmlEditBehaviour.staticDoc.body.innerHTML;

      var c = HtmlEditBehaviour.staticCont;
      c.removeChild(HtmlEditBehaviour.staticObj);
      c.innerHTML = htmltext;
      c.className = "editable";
    } // if
    // cut the references
    HtmlEditBehaviour.staticCont = null;
    HtmlEditBehaviour.staticObj = null;
    HtmlEditBehaviour.staticDoc = null;
  },


  Command: function(cmd, p) {
    if (HtmlEditBehaviour.staticDoc != null) {
      HtmlEditBehaviour.staticDoc.execCommand(cmd, false, p);
    }
  },
  
  
  // check the height of the editable iframe's content and resize
  AdjustHeight: function () {
    var doc = HtmlEditBehaviour.staticDoc;
    if (doc != null) {
      var sh = doc.body.scrollHeight + "px";
      var obj = HtmlEditBehaviour.staticObj;
      if (obj.style.height != sh) {
        obj.style.height = sh;
        HtmlEditBehaviour.staticCont.style.height = sh;
      } // if
      window.setTimeout(HtmlEditBehaviour.AdjustHeight, 100);
    } // if
  } // AdjustHeight


} // HtmlEditBehaviour

// End