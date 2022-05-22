<%@ Control Language="C#" %>
<%
  // DataOutput.ascx
  // Implementation of the DataOutput AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 16.09.2005 17:46:07 created by Matthias Hertel
  // 27.09.2006 datatypes support
  // 27.09.2006 public fields instead of public properties to enable intellisense
%>
<script runat="server">
  public string _name = null; // the name of the data-connection
  public string _defaultvalue = String.Empty; // default-value
  public string _datatype = String.Empty;
  public string style = String.Empty;

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

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this._name == null) this._name = this.ID;

    if ((this._name == null) || (this._name.Length == 0))
      throw new Exception("The AJAX DataOutput control must have an id or name attribut specfied.");

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
        + Page.ResolveUrl("~/controls/DataOutput.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<span id="<%=this.ClientID %>" name="<%=this._name %>" class="PropOutput" style="<%=this.style%>"
  datatype="<%=this._datatype %>">
  <%=this._defaultvalue %>
</span>
<script defer="defer" type="text/javascript">jcl.LoadBehaviour("<%=this.ClientID %>", DataOutputBehaviour);</script>
