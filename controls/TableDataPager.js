// TableDataPager.js
// Javascript Behaviour for the TableDataPager Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 11.11.2005 created by Matthias Hertel
// 12.11.2005 FireFox compatibility and scrolling fixed
// 13.11.2005 service attribute added, fetching all visible rows at a time.
// 07.02.2006 avoid empty fetches
// 02.04.2004 using the term method to release bound html objects.
// 26.04.2006 avoid error when positioning before searching.

var TableDataPagerBehaviour = {
  
  // Properties
  service: "", // Name of the dataservice, that shoud be used

  pagesize: 16, // The size of one page

  tabledatapart: "TableDataPart",

  _dataSet: null, // Array with all keys in sorted order.
  _tabledatapart: null,
  _currentpage: 0, // the current displayed page
  _lastpage: 0, // the last page.
  
  _unfetchedIDs: null,
  
  // Events

  // Display the previous page in the table
  onclick: function(evt) {
    evt = evt || window.event;
    
    var src = evt.srcElement;        
    var tds = src.parentNode;

    if ((src.href != null) && (src.href.substr(0, 4) == "nav:")) {
      evt.cancelBubble = true;
      evt.returnValue = false;

      if (tds._dataSet == null)
        tds.Select(null, null);  // retrieve some data
        
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
    if ((this.service == null) || (this.service.length == 0)) {
      alert("No service specified (TableDataPager " + this.id + ")");
    } else if (proxies[this.service] == null) { 
      alert("The specified service (TableDataPager Control " + this.id + ")");
    
    } else {
      // proxies.EnableCache(proxies[this.service].Fetch);
      this._tabledatapart = document.getElementById(this.tabledatapart);
      this.UpdatePageNavigator();
      
      
      // assign dynamic WebService and method references
      // this.FetchAction.finish = this._tabledatapart.FillRow; // this.FetchAction is shared !
      this.FetchAction.call = proxies[this.service].Fetch;

      // establish a back reference for TableDataPart
      this._tabledatapart.Pager = this;

      // alloc the complex objects      
      this._unfetchedIDs = new Array();

    } // if
  }, // init


  
  // remove all links to html objects
  term: function() {
    if (this._tabledatapart != null)
      this._tabledatapart.Pager = null;
    this._tabledatapart = null;
  }, // term


  // select a new dataset with filter and sort
  Select: function(filter, sort) { 
    var data = null;
    data = proxies[this.service].Select(filter, sort);
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
    this._unfetchedIDs.push(row.getAttribute("rowid"));
  }, // 
  
  
  FetchRowEnd: function() {
    if (this._unfetchedIDs.length > 0) // 
      ajax.Start(this.FetchAction, this); // get the row's data from the server now.
  },
  
  // AJAX action for retrieving the data of a single row.
  FetchAction: {
    delay: 0,
    queueMultiple: true,
    prepare: function(tdb) { 
      var idList = tdb._unfetchedIDs.join(';');
      tdb._unfetchedIDs = new Array();
      return (idList);
    },
    call: null, // assigned dynamically later

    finish: function(data, tbd) {
      for (var n = 0; n < data.documentElement.childNodes.length; n++)
        tbd._tabledatapart.FillRow(data.documentElement.childNodes[n]);
    },
    
    onException: proxies.alertException
  } // FetchAction

} // TableDataPagerBehaviour