/// Ajax = Asynchronous JavaScript + XML (+ HTML)
/// Ajax framework for Internet Explorer (6.0, ...) and Firefox (1.0, ...)
/// by Matthias Hertel
/// More information on: http://ajaxaspects.blogspot.com/ and http://ajaxaspekte.blogspot.com/
/// -----
/// ajaxforms.js: Methods for handling Form data
/// 07.07.2005 creation.
/// 14.08.2006 data binding functions for <span> elements.
/// 18.08.2006 data binding functions
/// getData(): to get normalized data as a value from the element.
/// getData(): to set normalized data to the element.
/// 19.08.2006 formatting functions
/// 30.09.2006 formatting decimal with precission

// ----- global variable for ajaxForms functionality. -----

/// <summary>The root object for the ajaxForms functionality.</summary>
var ajaxForms = new Object();

// ----- ajaxForms implementation -----

///<summary>Walk all html INPUT, TEXTAREA and SELECT elements contained by the passed object
///and return the current values.</summary>
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
///<returns>The data of inside the form as XML Document.</returns>
ajaxForms.getData = function (obj) {
  var n, aList, elem, val;
  var xData = ajaxForms._getXMLDOM("<data></data>");
  var xNode;

  obj = ajaxForms._getFormObj("ajaxForms.getData", obj);

  // get text & checked
  aList = obj.getElementsByTagName("INPUT");
  for (n = 0; n < aList.length; n++) {
    elem = aList[n];
    if ((elem.name != null) && (elem.name != "")) {
      if (elem.getData != null) {
        val = elem.getData();
      } else if (elem.type == "text") {
        val = elem.value;
      } else if (elem.type == "checkbox") {
        val = elem.checked;
      } else {
        val = "";
      }// if  
      xNode = xData.documentElement.appendChild(xData.createElement(elem.name));
      xNode.appendChild(xData.createTextNode(val));
    } // if
  } // for

  // get text
  aList = obj.getElementsByTagName("TEXTAREA");
  for (n = 0; n < aList.length; n++) {
    elem = aList[n];
    if ((elem.name != null) && (elem.name != "")) {
      if (elem.getData != null) {
        val = elem.getData();
      } else {
        val = elem.value;
      }// if  
      xNode = xData.documentElement.appendChild(xData.createElement(elem.name));
      xNode.appendChild(xData.createTextNode(val));
    } // if
  } // for

  // get value of selected option
  aList = obj.getElementsByTagName("SELECT");
  for (n = 0; n < aList.length; n++) {
    elem = aList[n];
    if ((elem.name != null) && (elem.name != "")) {
      if (elem.getData != null) {
        val = elem.getData();
      } else {
        val = elem.value;
      }// if  
      xNode = xData.documentElement.appendChild(xData.createElement(elem.name));
      xNode.appendChild(xData.createTextNode(val));
    } // if
  } // for

  return(xData);
} // ajaxForms.getFormData


///<summary>This method transfers the values of the data into the corresponding INPUT, TEXTAREA and SELECT elements.
///All HTML elements of these types that have a name but no value will be cleared.</summary>
///<param name="data">The data for the form. This can be a XML string or an XML document.</param>
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
ajaxForms.setData = function(data, obj) {
  var n, aList, dataElements;
  var xData, xElem, val;

  obj = ajaxForms._getFormObj("ajaxForms.setData", obj);

  if (data == null)
    throw new Error("ajaxForms.setData: Argument 'data' must be set.");
    
  if (typeof(data) == "string")
    xData = ajaxForms._getXMLDOM(data);
  else
    xData = data;

  // collect all possible data bound elements
  dataElements = new Array();
  aList = obj.getElementsByTagName("INPUT");
  for (n = 0; n < aList.length; n++)
    dataElements.push(aList[n]);
  aList = obj.getElementsByTagName("TEXTAREA");
  for (n = 0; n < aList.length; n++)
    dataElements.push(aList[n]);
  aList = obj.getElementsByTagName("SELECT");
  for (n = 0; n < aList.length; n++)
    dataElements.push(aList[n]);
  aList = obj.getElementsByTagName("SPAN");
  for (n = 0; n < aList.length; n++)
    dataElements.push(aList[n]);
  
  // set text & checked
  for (n = 0; n < dataElements.length; n++) {
    elem = dataElements[n];
    if ((elem.name != null) && (elem.name != "")) {
      xElem = xData.documentElement.getElementsByTagName(elem.name);
      if ((xElem.length == 0) || (xElem[0].firstChild == null)) {
        // no XML data found
      } else {
        val = xElem[0].firstChild.nodeValue;
        if (elem.setData != null) {
          elem.setData(val);
        } else if ((elem.tagName == "INPUT") && (elem.type == "text")) {
          if (elem.value != val) elem.value = val;
        } else if ((elem.tagName == "INPUT") && (elem.type == "checkbox")) {
          elem.checked = (val.toLowerCase() == "true");
        } else if ((elem.tagName != "SPAN") && (elem.value != val)) {
          elem.value = val;
        } // if
      } // if
    } // if
  } // for

  ajaxForms.clearErrors(obj);
} // ajaxForms.setData



///<summary>This method clears the values of the html elements of type INPUT, TEXTAREA and SELECT that have a name.</summary>
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
ajaxForms.clearData = function(obj) {
  var n, aList;
  
  obj = ajaxForms._getFormObj("ajaxForms.clearData", obj);

  // clear the text of fields and uncheck checkboxes.
  aList = obj.getElementsByTagName("INPUT");
  for (n = 0; n < aList.length; n++) {
    if ((aList[n].name != null) && (aList[n].name != "")) {
      if (aList[n].type == "text") {
        aList[n].value = "";
      } else if (aList[n].type == "checkbox") {
        aList[n].checked = false;
      } // if
    } // if
  } // for

  // clear the text of textareas
  aList = obj.getElementsByTagName("TEXTAREA");
  for (n = 0; n < aList.length; n++) {
    if ((aList[n].name != null) && (aList[n].name != "")) {
      aList[n].value = "";
    } // if
  } // for

  // because there is no real clear with select objects, the select is reset to the default-value
  aList = obj.getElementsByTagName("SELECT");
  for (n = 0; n < aList.length; n++) {
    if ((aList[n].name != null) && (aList[n].name != ""))
      for (o = 0; o < aList[n].options.length; o++) {
        if (aList[n].options[o].defaultSelected) {
          aList[n].selectedIndex = o;
          break;
        } // if
      } // for
  } // for

  ajaxForms.clearErrors(obj);
} // ajaxForms.clearData


///<summary>This method clears the values of the html elements of type INPUT, TEXTAREA and SELECT that have a name.</summary>
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
ajaxForms.resetData = function(obj) {
  var n, aList;
  
  obj = ajaxForms._getFormObj("ajaxForms.resetData", obj);

  // reset text & checked
  aList = obj.getElementsByTagName("INPUT");
  for (n = 0; n < aList.length; n++) {
    if ((aList[n].name != null) && (aList[n].name != "")) {
      if (aList[n].type == "text") {
        aList[n].value = aList[n].defaultValue;
      } else if (aList[n].type == "checkbox") {
        aList[n].checked = aList[n].defaultSelected;
      } // if
    } // if
  } // for

  // reset text
  aList = obj.getElementsByTagName("TEXTAREA");
  for (n = 0; n < aList.length; n++) {
    if ((aList[n].name != null) && (aList[n].name != "")) {
      aList[n].value = aList[n].defaultValue;
    } // if
  } // for

  // reset selected
  aList = obj.getElementsByTagName("SELECT");
  for (n = 0; n < aList.length; n++) {
    if ((aList[n].name != null) && (aList[n].name != ""))
      for (o = 0; o < aList[n].options.length; o++) {
        if (aList[n].options[o].defaultSelected) {
          aList[n].selectedIndex = o;
          break;
        } // if
      } // for
  } // for

  ajaxForms.clearErrors(obj);
} // ajaxForms.resetData


///<summary>Parse an exception for an ArgumentException and set the error annotations</summary>
///<param name="ex">An exception object.</param>
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
ajaxForms.processException = function(ex, obj) {
  var txt = ex.description;
  if ((ex.message == "soap:Server") && (txt != null) && (txt.indexOf("System.ArgumentException: ") > 0)) {
    obj = ajaxForms._getFormObj("ajaxForms.processException", obj);
  
    txt = txt.substr(txt.indexOf("System.ArgumentException: ") + 26).split('\n');
    var param = txt[1].substr(txt[1].indexOf(':')+2);
    
    var aList = document.getElementsByTagName("SPAN");
    for (var n = 0; n < aList.length; n++) {
      if ((aList[n].className == "AJAXFORMEXCEPTION") && (aList[n].getAttribute("name") == param)) {
        aList[n].style.display = "inline";
        aList[n].innerText = txt[0]; // IE
        aList[n].textContent = txt[0]; // FF
        break;
      } // if
    } // for
  } else {
    proxies.alertException(ex);
  } // if
}


///<summary>This method clears the error annotations of the html elements of type SPAN
///that have the className AJAXFORMEXCEPTION.</summary>
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
ajaxForms.clearErrors = function(obj) {
  var n;
  var aList = document.getElementsByTagName("SPAN");
  for (n = 0; n < aList.length; n++) {
    if (aList[n].className == "AJAXFORMEXCEPTION") {
      aList[n].style.display = "none";
      aList[n].innerText = ""; // IE
      aList[n].textContent = ""; // FF
    } // if
  } // for
} // clearErrors


///<summary>private method for getting the html object containing the ajax form UI.</summary>
// txt the name of the public method
///<param name="obj">A reference or an id of the html object containing the ajax form UI.</param>
ajaxForms._getFormObj = function(txt, obj) {
  if (obj == null)
    throw new Error(txt + ": Argument 'obj' must be set.");

  // maybe an id of an object was passed.
  if (obj.constructor == String)
    obj = document.getElementById(obj);
  if (obj == null)
    throw new Error(txt + ": Argument 'obj' is unknown.");
  return(obj);
} // _getFormObj


///<summary>Get a browser specific implementation of the XMLDOM object, containing a XML document.</summary>
///<param name="xmlText">the xml document as string.</param>
ajaxForms._getXMLDOM = function (xmlText) {
  var obj = null;

  if (typeof(DOMParser) != "undefined") {
    // Gecko / Mozilla / Firefox
    var parser = new DOMParser();
    obj = parser.parseFromString(xmlText, "text/xml");

  } else {    
    // IE
    try {
      obj = new ActiveXObject("MSXML2.DOMDocument");
    } catch (e) { }

    if (obj == null) {
      try {
        obj = new ActiveXObject("Microsoft.XMLDOM");
      } catch (e) { }
    } // if
  
    if (obj != null) {
      obj.async = false;
      obj.validateOnParse = false;
    } // if
    obj.loadXML(xmlText);
  } // if
  return(obj);
} // _getXMLDOM


// ----- formatting functions -----
// These functions are used for formatting values (number, dates...) to human readable strings
// with the typical national language specific notation.
// current: German: de

var nls = {
  string: {
    title: "Geben Sie einen Wert ein.",
    toString: function(v) { return(v); },
    toValue: function(s) { return(s); }
    }, // string
    

  int: {
    title: "Geben Sie einen ganzzahligen Wert ein.",
    keys: "-0123456789",
    toString: function(v) { return(v); },
    toValue: function(s) { return(s); }
    }, // int

  
  decimal: {
    title: "Geben Sie einen Wert mit optionalen Nachkommastellen in der Form '123.456,78' ein.",
    keys: ",-0123456789", mapkeys: ". ",
    toString: function(v, p) {
      var s = String(v);

      // adjust precission digits
      if (p == null) {
      } else if (p <= 0) {
        s = s.replace(/\..*$/g, ''); // remove precission digits
      } else { 
        if (s.indexOf('.') < 0)
          s = s + '.';
        s = s + '0000000000';
        s = s.substr(0, s.indexOf('.') + p + 1);
      } // if

      s = s.replace(/\./g, ','); // use decimal komma
      s = s.replace(/(\d{1,})(\d{3})(\d{3})(,|$)/, "$1.$2.$3$4"); // use decimal points
      s = s.replace(/(\d{1,})(\d{3})(,|$)/, "$1.$2$3"); // use decimal points
      return(s); 
    },
    
    toValue: function(s, p) { 
      s = String(s);
      s = s.replace(/\./g, ''); // use decimal komma
      s = s.replace(/\,/g, '.'); // use decimal points
      return(s);
    }
  }, // decimal


  date: {
    title: "Geben Sie ein Datum in der Form 'tt.mm.jjjj' ein.",
    keys: ".0123456789", mapkeys: ",",
    toString: function(v) {
      var s = "";
      if ((v != null) && (v.constructor == Date))
        s = nls.d2(v.getDate()) + "." + nls.d2(v.getMonth()+1) + "." + v.getFullYear();
      return(s);
      },

    toValue: function(s) {
      var d = null;
      if ((s == null) || (s == "")) {
        return(d);
      } else if (s == "*") {
        d = new Date();
      } else if (s.match(/^\d+\.\d+\.\d+^/)) {
        s = s.split('.');
        d = new Date(parseInt(s[2], 10), parseInt(s[1], 10)-1, parseInt(s[0], 10), 0, 0, 0);
      } else if (s.match(/^\d+\.\d+\.?$/)) {
        s = s.split('.');
        d = new Date((new Date().getFullYear()), parseInt(s[1], 10)-1, parseInt(s[0], 10), 0, 0, 0);
      } else if (s.match(/^\d{4}$/)) {
        d = new Date((new Date().getFullYear()), parseInt(s.substr(2, 2), 10)-1, parseInt(s.substr(0, 2), 10), 0, 0, 0);
      } else if (s.match(/^\d{6}$/)) {
        d = new Date(parseInt(s.substr(4, 2), 10), parseInt(s.substr(2, 2), 10)-1, parseInt(s.substr(0, 2), 10), 0, 0, 0);
      } else if (s.match(/^\d{8}$/)) {
        d = new Date(parseInt(s.substr(4, 4), 10), parseInt(s.substr(2, 2), 10)-1, parseInt(s.substr(0, 2), 10), 0, 0, 0);
      }
      return(d);
      },
    firstDayOfWeek: 1, // mo
    weekdayName: ["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"],
    monthName: ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"]
  }, // date

  
  // format a number using 2 characters min. with leading 0s
  d2: function(d) {
    d = String(d);
    if (d.length == 0)
      d = "00";
    else if (d.length == 1)
      d = "0" + d;
    return(d);
  } // d2
} // nls

// ----- End -----

