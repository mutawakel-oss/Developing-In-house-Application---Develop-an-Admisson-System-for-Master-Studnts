<%@ Control Language="C#" %>
<%
  // DataFade.ascx
  // Implementation of the DataFade AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 17.09.2005 created by Matthias Hertel
  // 05.02.2006 multiple JavaScript Behaviours include bug fixed.
  // 05.08.2006 advanced layout, increment decrement buttons added.
  // 05.08.2006 width, minvalue, maxvalue, unit attributes added.
  // 27.09.2006 datatypes support
  // 27.09.2006 fade.* renamed to datafade.*
  // 27.09.2006 public fields instead of public properties to enable intellisense
  // 29.09.2006 precission support added
%>
<script runat="server">
  public string _name = null; // the name of the data-connection
  private string _defaultvalue = String.Empty; // defaultvalue
  public string _datatype = String.Empty;
  private string _prec = String.Empty;
  public string _style = String.Empty;

  public string name {
    get { return _name; }
    set { _name = value; }
  } // name

  public string defaultvalue {
    get { return _defaultvalue; }
    set { _defaultvalue = value; }
  } // defaultvalue

  public string datatype {
    get { return _datatype; }
    set { _datatype = value; }
  } // datatype

  public string prec {
    get { return _prec; }
    set { _prec = value; }
  } // prec

  public string style {
    get { return _style; }
    set { _style = value; }
  } // style

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this._name == null) this._name = this.ID;

    if ((this._name == null) || (this._name.Length == 0))
      throw new Exception("The AJAX DataFade control must have an id or name attribut specfied.");

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
        + Page.ResolveUrl("~/controls/DataFade.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<div class="DataFade" id="<%=this.ClientID %>" name="<%=this._name %>" style="float:left;<%=this._style%>" datatype="<%=this._datatype%>" prec="<%=this._prec%>"><%=this._defaultvalue%></div>
<script defer="defer" type="text/javascript">jcl.LoadBehaviour("<%=this.ClientID %>", DataFadeBehaviour);</script>
