<%@ Control Language="C#" EnableViewState="true" AutoEventWireup="false" ClassName="LookUp"
  Description="Implementation of an INPUT field with a LookUp helper" %>
<%@ Implements Interface="System.Web.UI.IPostBackDataHandler" %>
<%
  // Lookup.ascx
  // Implementation of the LookUp AJAX Control
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ---
  // 12.08.2005 created
%>
<script runat="server">
  // [ValidationProperty("Value")]

  public string name = null;
  public string pageproperty = String.Empty;

  public string lookupservice = null;
  public bool nosubmit = false;
  public string Value = null;


  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this.name == null) this.name = this.ID;

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
        + Page.ResolveUrl("~/controls/LookUp.js")
        + "'><" + "/script>\n"));
    } // if
  } // OnPreRender


  // ----- implement IPostBackDataHandler Members to enable embedding into ASP.NET Forms -----

  public bool LoadPostData(string postDataKey, System.Collections.Specialized.NameValueCollection postCollection) {
    String postedValue = postCollection[postDataKey];

    if ((Value == null) || (Value != postedValue)) {
      Value = postedValue;
      return true;
    }
    return false;
  } // LoadPostData


  public void RaisePostDataChangedEvent() {
    // no PostDataChangedEvent will be raised.
  }
  

</script>
<%// UI for the control %>
<input id="<%=this.ClientID %>" autocomplete="off" pageproperty="<%=this.pageproperty %>"
  lookupservice="<%=this.lookupservice %>" name="<%=this.name %>" value="<%=this.Value %>"
  nosubmit="<%=this.nosubmit %>" onblur="jcl.DataConnections.Raise(this.pageproperty, this.value)"
  onchange="jcl.DataConnections.Raise(this.name, this.value)" style="width: 200px" /><img
    class="INPUTFUNC" src="<%=Page.ResolveUrl("~/controls/images/drop.gif") %>" alt="open the LookUp list"
    onclick="document.getElementById('<%=this.ClientID %>').ToggleDropdown()" unselectable="on" />
<script defer="defer" type="text/javascript">jcl.LoadBehaviour("<%=this.ClientID %>", LookUpBehaviour);</script>
