<%@ Control Language="C#" AutoEventWireup="false" ClassName="UrlFrame" %>
<%
  // UrlFrame.ascx
  // UrlFrame Control.
  // This control implement an iframe element that connects to the page properties.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 12.08.2005 created by Matthias Hertel
  // 27.09.2005 PageProperty attribute added
%>
<script runat="server">
  // define and pass parameters
  public string width = null;
  public string height = null;

  // the default url pattern for the iframe element
  public string urlpattern = String.Empty;

  // a pageproperty that is subscribed for changing the urlpattern.
  public string PageProperty = String.Empty;

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (Page.Header == null)
      throw new Exception("The <head> element of this page is not marked with runat='server'.");

    // register the JavaScripts includes without need for a HTML form.
    if (!Page.ClientScript.IsClientScriptBlockRegistered(Page.GetType(), "CommonBehaviour")) {
      Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "CommonBehaviour", String.Empty);
      ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
        + Page.ResolveUrl("~/controls/jcl.js")
        + "'><" + "/script>\n"));
    } // if

    if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), "MyBehaviour")) {
      Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MyBehaviour", String.Empty);
      ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
        + Page.ResolveUrl("~/controls/UrlFrame.js")
        + "'><" + "/script>\n"));
    } // if
  } // OnPreRender

</script>
<iframe id="<%=this.ClientID %>" class="UrlFrame" pageproperty="<%=this.PageProperty %>"
  urlpattern="<%=this.urlpattern %>" scrolling="yes" urlpattern="<%=this.urlpattern %>"
  style="<%= ((width != null) && (width.Length > 0)) ? "width:"+width + ";": String.Empty %>
<%= ((height != null) && (height.Length > 0)) ? "height:"+height + ";" : String.Empty %>">
</iframe>
<%// setup then AJAX WebPart connections for the control %>
<script type="text/javascript">
jcl.LoadBehaviour("<%=this.ClientID %>", UrlFrameBehaviour);
</script>
