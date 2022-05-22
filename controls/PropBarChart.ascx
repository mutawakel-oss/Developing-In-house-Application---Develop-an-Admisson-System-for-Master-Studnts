<%@ Control Language="C#" %>
<%
  // PropBarChart.ascx
  // Implementation of the PropBarChart AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 09/17/2005 14:05:26 created by Matthias
%>
<script runat="server">

  // the names of the to be displayed properties
  public string properties = null;

  // the max. value of any property
  public int maxvalue = 100;

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
        + Page.ResolveUrl("~/controls/PropBarChart.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<!-- Here comes the HTML code that builds the Control. -->
<table id="<%=this.ClientID %>" properties="<%=this.properties %>" maxvalue="<%=this.maxvalue %>" style="border: solid #203050 1px">
  <tr>
    <% foreach (string propName in this.properties.Split(';')) { %>
      <td style="vertical-align: bottom; height: 100px; padding: 0; width: 30px">
        <div id="<%=this.ClientID %>_<%=propName %>" style="background-color: Blue;height:0px;overflow:hidden"></div>
      </td>
    <% } // foreach %>
  </tr>
  <tr>      
    <% foreach (string propName in this.properties.Split(';')) { %>
      <td style="text-align: center"><%=propName %></td>
    <% } // foreach %>
  </tr>
</table>

<!-- Here comes the script code to bind the behaviour. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", PropBarChartBehaviour);
</script>
