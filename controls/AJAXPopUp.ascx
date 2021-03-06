<%@ Control Language="C#" %>
<%
// controls/ajaxpopup.ascx
// Implementation of the PopUp (Pseudo-)Control using the AJAXEngine.
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// -----
// This control renders nothing inside the page but registers the common include file
// controls/jcl.js and controls/hover.js.
// -----
// 09.06.2006 created by Matthias Hertel
%>
<script runat="server">
  public string infomethod = String.Empty;
  
  protected override void OnPreRender(EventArgs e)
  {
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
        + Page.ResolveUrl("~/controls/ajaxpopup.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<%-- use a invisible html object for passing the parameters --%>
<div id="<%=this.ClientID %>" infomethod="<%=this.infomethod %>" style="display:none"></div>
<script defer="defer" type="text/javascript">jcl.LoadBehaviour("<%=this.ClientID %>", AJAXPopUpBehaviour);</script>