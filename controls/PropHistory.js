// PropHistory.js
// Javascript Behaviour for the PropHistory Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// To enable the PropHistory just include this file in the page or use the
// PropHistory control.
// ----- 
// 05/12/2006 21:25:24 created by Matthias Hertel
// 28.05.2006 declaration of stateList and propList via attributes enabled.
// 18.06.2006 removed an IE memory leak by freeing the iframe reference correctly.
// 12.08.2006 "bad request" on ASP.NET Development Server removed.
// 16.09.2006 context on event-methods is now set to the bound object.

var PropHistory = {

  // ----- Properties -----
  _timer:null,
  _newState: false,
  _first:true,
 
  hiddenFrame: null,
  saveHash: "",
  
  propList: {},
  stateList: {},
  
  init: function () {
    jcl.DataConnections.RegisterConsumer(PropHistory, "*");
    PropHistory.hiddenFrame = document.getElementById("PropHistoryFrame");
    PropHistory.check();
    jcl.DataConnections.RaiseAll();
  }, // init

   
  // remove all links to html objects
  term: function() {
    PropHistory.hiddenFrame = null;
  }, // term


  // ----- Methods -----
  GetValue: function(prop, value) {
    if ((this.propList[prop] != null) && (this.propList[prop] != value)) {
      if (this.stateList[prop] != null)
        this._newState = true;

      if (PropHistory._timer != null)
        window.clearTimeout(PropHistory._timer);
        
      this.propList[prop] = value;

      PropHistory.nextHash = PropHistory.getNewHash();

      if ((! this._first) && (this._newState)) {
        PropHistory._timer = window.setTimeout("PropHistory.setState();PropHistory._newState=false;", 400);
      } else {
        PropHistory._timer = window.setTimeout("PropHistory.setUrl();PropHistory._newState=false;PropHistory._first=false", 400);
      }
    }
  }, // GetValue
  

  // just change the current url, but do not record it in the history.
  setUrl: function() {
    PropHistory._timer = null;
    var newHash = PropHistory.getNewHash();

    if (newHash != PropHistory.saveHash) {
      PropHistory.saveHash = newHash;
      // window.location.replace() does this job in IE and Mozilla/FireFox.
      window.location.replace(newHash);
    } // if

    if (PropHistory.hiddenFrame != null) {
      var d = PropHistory.hiddenFrame.contentDocument || PropHistory.hiddenFrame.contentWindow.document;
      // save the current state
      d.getElementsByName("h")[0].value=newHash;
    }
    
    PropHistory._timer = window.setTimeout(PropHistory.check, 400);
  }, // setUrl


  // change the current url, and record it in the history.
  setState: function() {
    PropHistory._timer = null;
    var newHash = PropHistory.getNewHash();

    if (PropHistory.hiddenFrame != null) {
      var d = PropHistory.hiddenFrame.contentDocument || PropHistory.hiddenFrame.contentWindow.document;
      // save the current state
      d.getElementsByName("h")[0].value=window.location.hash;
    }

    // window.location.hash = ... does this job ...
    window.location.hash = newHash;
    if (newHash != PropHistory.saveHash) {
      // ... workaround for IE: save the current hash
      if (isIE) {
        window.setTimeout(PropHistory.pushHistory.bind(PropHistory), 100);
        window.location.hash = newHash;
      }

      PropHistory.saveHash = newHash;
    } // if

    PropHistory._timer = window.setTimeout(PropHistory.check, 400);
  }, // setState


  getNewHash: function () {
    var newHash = "#";
    for (p in PropHistory.propList) {
      if (newHash.length > 1)
        newHash += "&";
      newHash += p + "=" + this.ParamEncode(String(this.propList[p]));
    }
    return(newHash);
  },


  pushHistory: function () {
    if (PropHistory.hiddenFrame != null) {
      var d = PropHistory.hiddenFrame.contentDocument || PropHistory.hiddenFrame.contentWindow.document;
      PropHistory.hiddenFrame.src = jcl.GetControlsPath() + "jclHelper.htm?" + (new Date()).valueOf();
    } // if
  },


  // detect any changes of the current url
  check: function() {
    if (window.location.hash == PropHistory.saveHash) {
      PropHistory._timer = window.setTimeout(PropHistory.check, 400);
    
    } else {
      if (PropHistory.hiddenFrame != null) {
        var d = PropHistory.hiddenFrame.contentDocument || PropHistory.hiddenFrame.contentWindow.document;
        // save the current state
        if ((d.getElementsByName("h").length == 1) && (d.getElementsByName("h")[0].value != window.location.hash)) {
          // this was a hyperlink's action -> record last state
          window.setTimeout(PropHistory.pushHistory.bind(PropHistory), 100);
          PropHistory._timer = window.setTimeout(PropHistory.check, 400);
          return;
        }
      } // if

      var h = window.location.hash;
      PropHistory.saveHash = h;
      if (h.length > 1) {
        var hashMap = h.substr(1).split('&');
        for (n = 0; n < hashMap.length; n++) {
          p = hashMap[n].split('=');  
          PropHistory.propList[p[0]] = unescape(p[1]);
        }
        for (n = 0; n < hashMap.length; n++) {
          p = hashMap[n].split('=');  
          // broadcast the change notification of a property
          jcl.DataConnections.Raise(p[0], unescape(p[1]));
        }
        
      }
      PropHistory._timer = window.setTimeout(PropHistory.setState, 400);
    } // if
  }, // check    

  ParamEncode: function(txt) {    
    txt = txt.replace(/%/g, "%25").replace(/#/g, "%23").replace(/&/g, "%26");
    txt = txt.replace(/\+/g, "%2B").replace(/\//g, "%2F").replace(/\?/g, "%3F");
    txt = txt.replace(/\=/g, "%3D").replace(/ /g, "+");
    return(txt);
  } // ParamEncode

} // PropHistory

if (isIE) {
  document.write("<iframe id='PropHistoryFrame' src='" + jcl.GetControlsPath() + "jclHelper.htm' style='display:none'></iframe>");
} // if

