<%@ Control Language="C#" %>
<%
  // Search Control 
  // 14.08.2005 created
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public bool nosubmit = false;

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this.name == null) this.name = this.ID;

    if ((this.name == null) || (this.name.Length == 0))
      throw new Exception("The AJAX Search control must have an id or name attribut specfied.");

    if (Page.Header == null)
      throw new Exception("The <head> element of this page is not marked with runat='server'.");

    // register the JavaScripts includes without need for a Form.
    if (!Page.ClientScript.IsClientScriptBlockRegistered(Page.GetType(), "CommonBehaviour")) {
      Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "CommonBehaviour", String.Empty);
      ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
        + Page.ResolveUrl("~/controls/jcl.js")
        + "'><" + "/script>\n"));
    } // if
  } // OnPreRender
</script>
<%// UI for the control %>
<div>
  <label for="<%=this.ID %>_TEXT">Search:&nbsp;</label> <input id="<%=this.ID %>_TEXT"
    name="<%=this.name %>" nosubmit="<%=this.nosubmit %>" AutoComplete="off" value="<%=this.value %>" /><img
      class="INPUTFUNC" src="<%=Page.ResolveUrl("~/controls/images/go.png") %>" />
</div>
<script type="text/javascript">jcl.DataConnections.RegisterProvider("<%=this.ID %>", "<%=this.name %>");</script>
