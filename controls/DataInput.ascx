<%@ Control Language="C#" %>
<%
  // DataInput.ascx
  // Implementation of the DataInput AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 09/16/2005 17:46:07 created by Matthias
  // 27.09.2006 datatypes support
  // 27.09.2006 public fields instead of public properties to enable intellisense
%>
<script runat="server">
  private string _name = null; // the name of the data-field
  private string _propname = null; // the name of the page property
  private string _defaultvalue = String.Empty; // defaultvalue
  private string _datatype = String.Empty;
  private string _prec = String.Empty;
  private string _style = String.Empty;
  private bool _nosubmit = true;

  public string name {
    get { return _name; }
    set { _name = value; }
  } // name

  public string propname {
    get { return _propname; }
    set { _propname = value; }
  } // propname

  public string defaultvalue {
    get { return _defaultvalue; }
    set { _defaultvalue = value; }
  } // defaultvalue

  public bool nosubmit {
    get { return _nosubmit; }
    set { _nosubmit = value; }
  } // nosubmit

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
        + Page.ResolveUrl("~/controls/DataInput.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<input id="<%=this.ClientID %>" class="PropInput" name="<%=this._name %>" propname="<%=this._propname %>" datatype="<%=this._datatype %>" prec="<%=this._prec %>" nosubmit="<%=this._nosubmit %>"
  value="<%=this._defaultvalue %>" style="<%=this._style%>" />
<script defer="defer" type="text/javascript">jcl.LoadBehaviour("<%=this.ClientID %>", DataInputBehaviour);</script>
