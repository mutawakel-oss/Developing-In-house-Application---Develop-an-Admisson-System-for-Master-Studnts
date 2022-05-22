// TableData.js
// Javascript Behaviour for the TableData Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 11.11.2005 created by Matthias Hertel
// 16.09.2006 context on event-methods is now set to the bound object.

var TableData1Behaviour = {
  
  // link back to the pager
  Pager: null,
  
  // private Properties
  _colCount: 0,
  _cols: [],
  _row: null,
  _scrollTimer: null,
    
  _rowsById: {},

  // Events
  
  onscroll: function(evt) {
    evt = evt || window.event;
    var tab = evt.srcElement.firstChild;
    var st = tab.offsetParent.scrollTop;
    
    tab.tHead.rows[0].style.top = st + "px";
    evt.srcElement.scrollstart(); // do not get the data immediately
  },

  
  // Methods
  
  init: function () {
    var tab = this.firstChild;
    var r = tab.tBodies[0].rows[0];
    this._colCount = r.cells.length;
    for (var n = 0; n < this._colCount; n++) {
      this._cols[n] = r.cells[n].innerHTML;
      r.cells[n].innerHTML = "";
    }
    this._row = r.cloneNode(true);
    r = null;
  },


  // start a timer when scrolling stared
  scrollstart: function () {
    if (this._scrollTimer != null) window.clearTimeout(this._scrollTimer);
    this._scrollTimer = window.setTimeout(this.scrollend.bind(this), 100);
  },
  
  
  // scroll-timer ended, now get all missing data
  scrollend: function () {
    this._scrollTimer = null;
    this._startLoading();
  },
    

  // clear the whole table
  Clear: function () {
    var tab = this.firstChild;
    tab.removeChild(tab.tBodies[0]);
    tab.appendChild(document.createElement("TBODY"))
    tab.offsetParent.scrollTop = 0;
    tab.tHead.rows[0].style.top = "0px";
  }, // Clear


  // add a new set to rows to the table
  AddRows: function(idList) {
    var tab = this.firstChild;
    var tb = tab.tBodies[0];

// some try & test versions

// 2300 msec
//    for (var n = 0; n < idList.length; n++) {
//      r = _row.cloneNode(true);
//      tb.appendChild(r);
//      r.setAttribute("rowid", idList[n]);
//      r.firstChild.appendChild(document.createTextNode(idList[n]));
//    } // for

// 1750 msec
//    for (var n = 0; n < idList.length; n++) {
//      var r = tb.appendChild(document.createElement("TR"));
//      r.setAttribute("rowid", idList[n]);
//      r.appendChild(document.createElement("TH")).appendChild(document.createTextNode(idList[n]));
//      for (var m = 1; m < this._colCount; m++)
//        r.appendChild(document.createElement("TD"));
//    } // for

    var frag = document.createDocumentFragment();
    for (var n = 0; n < idList.length; n++) {
      var r = document.createElement("TR");
      r.setAttribute("rowid", idList[n]);
      r.appendChild(document.createElement("td")).appendChild(document.createTextNode("\xA0")); //&nbsp;
      for (var m = 1; m < this._colCount; m++)
        r.appendChild(document.createElement("td"));
      frag.appendChild(r);
    } // for
    tb.appendChild(frag);

    this._startLoading();
  }, // AddRow


  // start loading all visible rows with data.
  _startLoading: function() { // 2016
    var tab = this.firstChild;
    var r = tab.tBodies[0].rows;
    var st = tab.offsetParent.scrollTop;
    var n = 0;
    ajax.CancelAll();
    while ((n < r.length) && (r[n].offsetTop - st < 0)) n++;

    while ((n < r.length) && (r.done == null) && (r[n].offsetTop - st < tab.offsetParent.offsetHeight)) {
      this._rowsById[r[n].rowid] = r[n];
      this.Pager.FetchRow(r[n]);
      n++;
    }
    this.Pager.FetchRowEnd();
  }, // _startLoading
  
  
  // fill one row of the table with.
  // ! This is the ajax callback method that is not called through this behaviour.
  // reference all objects by using the row object
  FillRow: function (data, anyRow) {
    var _this = anyRow.parentNode.parentNode.parentNode;
    var rowid = val = data.selectSingleNode("//id").text;
    var row = _this._rowsById[rowid];

    if (row == null) {
      alert("row error");
    } else if (data == null) {
      alert("data error");
    } else {
      var cols = _this._cols;

      for (var n = 0; n < row.cells.length; n++) {
        val = data.selectSingleNode("//" + cols[n]); // FF ???
        if ((val != null) && (val.text != null)) {
          var txt = val.text;
          if (row.cells[n].innerText != txt)
            row.cells[n].innerText = txt;
        } // if
      } // for
      row.done = true;
    } // if
  } // FillRow

} // TableData1Behaviour