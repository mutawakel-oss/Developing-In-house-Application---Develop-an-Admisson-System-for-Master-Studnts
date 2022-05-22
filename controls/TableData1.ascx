<%@ Control Language="C#" ClassName="TableData1" %>
<%
  // TableData1.ascx
  // Implementation of the AJAX enabled TableData Control, fetching single rows per call.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 01.06.2005 created by Matthias Hertel
  // 06.11.2005 cols attribute added.
%>

<script runat="server">
  // define and pass parameters

  // list of all columns that should be displayed as a ; separated list of col[Caption]:length elements.
  // Sample: id:80;company[Company]:200;city:100
  public string cols = "id"; // 

  private static Regex ColDesc = new Regex(@"(\w+)(?:\[([^\]]+)\])?(?::(\d+))?");

  // list of the col descriptions
  private MatchCollection mc;
    
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
        + Page.ResolveUrl("~/controls/TableData1.js")
        + "'><" + "/script>\n"));
    } // if

    mc = ColDesc.Matches(cols);
    
  } // OnPreRender
</script>


  <div id="<%=this.ClientID %>" class="TableData" style="overflow-y: scroll; height: 420px">
  <table style="table-layout:fixed">
  <%
    Regex ColDesc = new Regex(@"(\w+)(?:\[([^\]]+)\])?(?::(\d+))?");
    MatchCollection mc = ColDesc.Matches(cols);

    foreach (Match m in mc) {
      if (m.Groups[3].Success)
        Response.Write("<col style='width:" + m.Groups[3].Value + "px'/>");
      else
        Response.Write("<col style='width:auto'/>");
    } // foreach
  %>
    <thead><tr>
  <%
    foreach (Match m in mc) {
      if (m.Groups[2].Success)
        Response.Write("<th>" + m.Groups[2].Value + "</th>");
      else
        Response.Write("<th>" + m.Groups[1].Value + "</th>");
    } // foreach
  %>
    </tr></thead>
    <tbody><tr>
  <%
    foreach (Match m in mc) {
      Response.Write("<td>" + m.Groups[1].Value + "</td>");
    } // foreach
  %>
    </tr></tbody>
    </table>
 </div>

    <script type="text/javascript">
jcl.LoadBehaviour("<%=this.ClientID %>", TableData1Behaviour);
    </script>
