<%@ Control Language="C#" %>
<%
  // PropOutput.ascx
  // Implementation of the PropOutput AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 09/16/2005 17:46:07 created by Matthias
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public string style = String.Empty;

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this.name == null) this.name = this.ID;

    if ((this.name == null) || (this.name.Length == 0))
      throw new Exception("The AJAX PropOutput control must have an id or name attribut specfied.");

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
        + Page.ResolveUrl("~/controls/PropOutput.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<!-- Here comes the HTML code that builds the Control. -->
<span id="<%=this.ClientID %>" name="<%=this.name %>" class="PropOutput" style="<%=this.style%>">
  <%=this.value %>
</span>
<!-- Here comes the script code to bind the behaviour. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", PropOutputBehaviour);
</script>
