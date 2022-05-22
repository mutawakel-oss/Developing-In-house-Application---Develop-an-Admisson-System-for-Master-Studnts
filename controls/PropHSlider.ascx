<%@ Control Language="C#" %>
<%
  // PropHSlider.ascx
  // Implementation of the PropHSlider AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 17.09.2005 created by Matthias Hertel
  // 05.02.2006 multiple JavaScript Behaviours include bug fixed.
  // 05.08.2006 advanced layout, increment decrement buttons added.
  // 05.08.2006 width, minvalue, maxvalue, unit attributes added.
%>
<script runat="server">
  public string _name = null; // the name of the data-connection
  public bool _nosubmit = true;
  private string _associatedcontrolid = String.Empty; // the name of the data-connection

  public int _width = 200;

  public int _minvalue = 0;
  public int _maxvalue = 100;
  public int _unit = 1;

  public string name {
    get { return _name; }
    set { _name = value; }
  } // name

  public int minvalue {
    get { return _minvalue; }
    set { _minvalue = value; }
  } // _minvalue

  public int maxvalue {
    get { return _maxvalue; }
    set { _maxvalue = value; }
  } // _maxvalue

  public int unit {
    get { return _unit; }
    set { _unit = value; }
  } // _unit

  public bool nosubmit {
    get { return _nosubmit; }
    set { _nosubmit = value; }
  } // nosubmit

  public string associatedcontrolid {
    get { return _associatedcontrolid; }
    set { _associatedcontrolid = value; }
  }

  public int width {
    get { return _width; }
    set { _width = value; }
  } // width

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (Page.Header == null)
      throw new Exception("The <head> element of this page is not marked with runat='server'.");

    // register the JavaScripts includes without need for a Form.
    if (!Page.ClientScript.IsClientScriptBlockRegistered(Page.GetType(), "CommonBehaviour")) {
      Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "CommonBehaviour", String.Empty);
      ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
        + Page.ResolveUrl("~/controls/jcl.js")
        + "'><" + "/script>\n"));
    } // if

    if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), "MyBehaviour")) {
      Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MyBehaviour", String.Empty);
      ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
        + Page.ResolveUrl("~/controls/PropHSlider.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<!-- Here comes the HTML code that builds the Control. -->
<div class="PropHSlider" id="<%=this.ClientID %>" style="float: left; height: 16px;
  padding-top: 3px;" name="<%=this.name %>" minvalue="<%=this._minvalue.ToString() %>"
  maxvalue="<%=this._maxvalue.ToString() %>" unit="<%=this._unit.ToString() %>" associatedcontrolid="<%=this._associatedcontrolid %>">
  <img alt="decrement" class="minus" src="../controls/images/sliderMinus.gif" /><span
    style="position: relative"><img alt="slider" class="slider" style="width: <%=this.width-32%>px;
      height: 16px" src="../controls/images/sliderBack.gif" />
    <img alt="move me" class="knob" src="../controls/images/sliderButton.gif" style="position: absolute;
        left: 0px" />
  </span>
  <img alt="increment" class="plus" src="../controls/images/sliderPlus.gif" /></div>
<!-- Here comes the script code to bind the behaviour. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", PropHSliderBehaviour);
</script>
