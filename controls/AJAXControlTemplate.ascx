<%@ Control Language="C#" %>
<%
  // $safeitemname$.ascx
  // Implementation of the $safeitemname$ AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // $time$ created by $username$
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public bool nosubmit = true;

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this.name == null) this.name = this.ID;

    if ((this.name == null) || (this.name.Length == 0))
      throw new Exception("The AJAX $safeitemname$ control must have an id or name attribut specfied.");

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
        + Page.ResolveUrl("~/controls/$safeitemname$.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<!-- Here comes the HTML code that builds the Control. -->
<input id="<%=this.ClientID %>" name="<%=this.name %>" nosubmit="<%=this.nosubmit %>" value="<%=this.value %>" />
<!-- Here comes the script code to bind the behaviour. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", $safeitemname$Behaviour);
</script>
