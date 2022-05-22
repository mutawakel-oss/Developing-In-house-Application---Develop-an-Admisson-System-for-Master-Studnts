<%@ Control Language="C#" %>
<%
  // LightBox.ascx
  // Implementation of the LightBox AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 18.08.2006 18:13:08 created by Matthias Hertel
%>
<script runat="server">

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

    if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), "MyBehavior")) {
      Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MyBehavior", String.Empty);
      ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
        + Page.ResolveUrl("~/controls/LightBox.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<!-- Here comes the HTML code that builds the Control. -->
<div id="<%=this.ClientID %>" style="display: none; position: absolute; top: 0px;
  left: 0px; z-index: 98; width: 100%; height: 100%; background-color: #eeeeee; filter: alpha(opacity=80);
  -moz-opacity: 0.8; opacity: 0.8;">
</div>
<!-- Here comes the script code to bind the behavior. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", LightBoxBehavior);
</script>
