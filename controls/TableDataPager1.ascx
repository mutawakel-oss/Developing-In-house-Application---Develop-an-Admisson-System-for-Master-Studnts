<%@ Control Language="C#" ClassName="TableDataPager1" %>
<%
  // TableDataPager.ascx
  // Implementation of the TableDataPager Control, fetching single rows per call.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 01.06.2005 created by Matthias Hertel
  // 06.11.2005 cols attribute added.
%>

<script runat="server">
  // define and pass parameters
  public string pagesize = "16";
  public string tabledatapart = null;
  public bool showall = false;
  
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
        + Page.ResolveUrl("~/controls/tabledatapager1.js")
        + "'><" + "/script>\n"));
    } // if
  } // OnPreRender
</script>


<div id="<%=this.ClientID %>" class="TableDataPager" pagesize="<%=this.pagesize %>" tabledatapart="<%=this.tabledatapart%>">
  <a href="nav:first">|&lt;</a>
  <a href="nav:prev">&lt;&lt;</a>
  <a>1</a> <a>2</a> <a>3</a> <a>4</a> <a>5</a>
  <a href="nav:next">&gt;&gt;</a>
  <a href="nav:last">&gt;|</a>
  <% if (showall) { %>
  <a style="padding-left: 20px" href="nav:all">(all)</a>
  <% } %>
</div>


<script type="text/javascript">
jcl.LoadBehaviour("<%=this.ClientID %>", TableDataPager1Behaviour);
</script>
