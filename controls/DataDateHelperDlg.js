// DataDateHelperDlg.js
// Javascript Behaviour for the DataDateHelperDlg Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 10/3/2006 7:12:04 PM created by Administrator

var DataDateHelperDlgBehaviour = {
  selDate: null,
  dataObj: null,
  
  term: function() {
    dataObj = null;
  },
  
  onclick: function(evt) {
    evt = evt || window.event;
    this.handleclick(evt.srcElement);
    return(true);
  }, // onclick
  
  
  ondblclick: function(evt) {
    evt = evt || window.event;
    this.handleclick(evt.srcElement);
    var cn = evt.srcElement.className;
    if ((cn == "sel") || (cn == "p") || (cn == "m")) {
      this.returnValue();
      this.close();
    } // if
  },

  onselectstart: function() {
    return false;
  }, 


  // open the Helper Dialog
  open: function(obj) {
    if ((obj != null) && (obj.constructor == String))
      obj = document.getElementById(obj);
    this.dataObj = obj;
    var d = obj.getData();
    if ((d == null) || (isNaN(d)) || (d == ""))
      d = new Date(); 
    this.build(d);
    this.style.display = "block";
  }, // open


  close: function() {
    this.style.display = "none";
    DataDateHelperDlgBody.innerHTML = "";
    dataObj = null;
  }, // close


  build: function(selDay) {
    if (selDay == null) selDay = this.selDate;
    this.selDate = selDay;
    var m = selDay.getMonth();
    var y = selDay.getFullYear();
    var n;
    var s = "<table class='VECalendar'>";
    var c = "";
    var firstDay = nls.date.firstDayOfWeek;

    VECalendarMonth.innerText = nls.date.monthName[m] + " " + y;
    
    n = firstDay;
    s += "<tr>"
    for (var i = 0; i < 7; i++) {
      s += "<td class='w'>" + nls.date.weekdayName[n] + "</td>";
      n = (n + 1) % 7;
    }
    s += "</tr>";
    
    n = new Date(y, m, 1);
    while (n.getDay() != firstDay)
      n.setDate(n.getDate()-1);

    while ((n.getDay() != firstDay) || (n.getFullYear() < y) || ((n.getMonth() <= m) && (n.getFullYear() == y))) {
      if (n.getDay() == firstDay)
        s += "<tr>";
      if (n.getMonth() == m) {
        if (n.getDate() == selDay.getDate())
          c = "sel";
        else
          c = "m"
      } else {
        c = "p";
      } // if
      s += "<td class='" + c + "'>" + n.getDate() + "</td>";
      n.setDate(n.getDate()+1);
      if (n.getDay() == firstDay)
        s += "</tr>\n";
    } // while
    s += "</table>";
    DataDateHelperDlgBody.innerHTML = s;
  }, // build


  handleclick: function(obj) {
    var c = obj.innerText;
    if (c == "<<") {
      this.selDate.setFullYear(this.selDate.getFullYear()-1);
    } else if (c == "<") {
      this.selDate.setMonth(this.selDate.getMonth()-1);
    } else if (c == ">>") {
      this.selDate.setFullYear(this.selDate.getFullYear()+1);
    } else if (c == ">") {
      this.selDate.setMonth(this.selDate.getMonth()+1);

    } else if (c.match(/\d+/)) {
      c = parseInt(c, 10);
      if (obj.className == "p") {
        if (c < 10) this.selDate.setMonth(this.selDate.getMonth()+1);
        if (c > 20) this.selDate.setMonth(this.selDate.getMonth()-1);
      } else if (c == this.selDate.getDate()) {
        return;
      } // if
      this.selDate.setDate(c);
      window.setTimeout(this.build.bind(this), 250);
      return;
      
    } else if (obj.name == "cancel") {
      this.close();
    } else if (obj.name == "ok") {
      this.returnValue();
      this.close();
    } // if
    this.build(this.selDate);
  }, // handleclick
  
  
  returnValue: function() {
    // alert(this.selDate);
    this.dataObj.setData(this.selDate);
  }
  
} // DataDateHelperDlgBehaviour

