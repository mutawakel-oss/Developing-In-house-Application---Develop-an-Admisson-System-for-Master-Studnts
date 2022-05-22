// TableDataPager1.js
// Javascript Behaviour for the TableDataPager Control, fetching single rows per call.
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 11.11.2005 created by Matthias Hertel

var TableDataPager1Behaviour = {
  
  // Properties
  
  pagesize: 16, // The size of one page
  tabledatapart: "TableDataPart",

  _dataSet: null, // Array with all keys in sorted order.
  _tabledatapart: null,
  _currentpage: 0, // the current displayed page
  _lastpage: 0, // the last page.
  
  // Events

  // Display the previous page in the table
  onclick: function(evt) {
    evt = evt || window.event;
    
    var src = evt.srcElement;        
    var tds = src.parentElement;

    if ((src.href != null) && (src.href.substr(0, 4) == "nav:")) {
      evt.cancelBubble = true;
      evt.returnValue = false;

      if (src.href == "nav:first") {
        tds.DisplayTablePage(0);

      } else if (src.href == "nav:prev") {
        if (tds._currentpage > 0)
          tds.DisplayTablePage(tds._currentpage-1);

      } else if (src.href == "nav:next") {
        if (tds._currentpage < tds._lastpage-1)
          tds.DisplayTablePage(tds._currentpage+1);

      } else if (src.href == "nav:last") {
        tds.DisplayTablePage(tds._lastpage-1);

      } else if (src.href == "nav:all") {
        var ps = tds.pagesize;
        tds.pagesize = tds._dataSet.length;
        tds._lastpage = 1;
        tds.DisplayTablePage(0);
        tds.pagesize = ps;
        tds._lastpage = Math.ceil(tds._dataSet.length / tds.pagesize);

      } else {
        tds.DisplayTablePage(parseInt(src.href.substr(4)));
      } // if
    } // if
  }, // onclick
      

  // Methods    
  
  // setup the dataset 
  init: function() {
    proxies.EnableCache(proxies.TableData.Fetch);
    this._tabledatapart = document.getElementById(this.tabledatapart);
    this.UpdatePageNavigator();
    
    // this.FetchAction is shared !
    this.FetchAction.finish = this._tabledatapart.FillRow;
    this._tabledatapart.Pager = this;
  }, // init


  // select a new dataset with filter and sort
  Select: function(filter, sort) { 
    var data = null;
    data = proxies.TableData.Select(filter, sort);
    this._dataSet = data.split(';');
    
    this._currentpage = -1;
    this._lastpage = Math.ceil(this._dataSet.length / this.pagesize);
    this.DisplayTablePage(0);
  }, // Select


  // clear current dataset
  Clear: function() { 
    this._dataSet = null;
    this._currentpage = 0;
    this._lastpage = 0;
    this.UpdatePageNavigator();
    this._tabledatapart.Clear();
  }, // Clear


  // Display the specified page in the table
  DisplayTablePage: function(page) {
    this._currentpage = page;
    this.UpdatePageNavigator();

    // display data in the table
    var data = this._dataSet;
    if (data != null) {
      this._tabledatapart.Clear();

      var n = page * this.pagesize;
      var m = (page+1) * this.pagesize;
      this._tabledatapart.AddRows(data.slice(n, m));
    } // if
  }, // DisplayTablePage


  // Update the details of the Page Navigator
  UpdatePageNavigator: function() {
    var r, n, m;
    var links = this.getElementsByTagName("A") ;

    links[0].disabled = (this._currentpage <= 0);
    links[1].disabled = (this._currentpage <= 0);

    n = Math.max(0, this._currentpage - 2);
    m = Math.min(this._lastpage, n + 5);
    n = Math.max(0, m - 5);
    
    for (r = 0; r < 5; r++) {
      if (n+r == this._currentpage) {
        links[r+2].innerHTML = n + r + 1;
        links[r+2].className = "activ";
        links[r+2].removeAttribute("href", 0);
      } else if (n+r >= this._lastpage) {
        links[r+2].innerHTML = "";
        links[r+2].className = "disabled";
        links[r+2].removeAttribute("href", 0);
      } else {
        links[r+2].innerHTML = n + r + 1;
        links[r+2].className = "";
        links[r+2].href = "nav:" + (n+r);
        links[r+2].disabled = false;
      } // if
    } // while

    links[7].className = (this._currentpage >= this._lastpage-1) ? "disabled" : "";
    links[8].className = links[7].className;
  }, // UpdatePageNavigator
  
  
  FetchRow: function(row) {
    ajax.Add(this.FetchAction, row); // get a row's data from the server now.
  }, // 
  
  
  FetchRowEnd: function() {
    ajax._next(false);
  },
  
  // AJAX action for retrieving the data of a single row.
  FetchAction: {
    delay: 0,
    queueMultiple: true,
    prepare: function(row) { return (row.rowid); },
    call: proxies.TableData.Fetch,
    finish: null, // assigned later
    onException: proxies.alertException
  } // FetchAction

} // TableDataPager1Behaviour