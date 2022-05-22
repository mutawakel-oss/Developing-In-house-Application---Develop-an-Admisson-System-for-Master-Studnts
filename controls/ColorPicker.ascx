<%@ Control Language="C#" %>
<%
  // Color Picker Control 
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // 05.04.2006 created by Matthias Hertel
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public bool nosubmit = false;

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
  } // OnPreRender
</script>
<%// UI for the control %>
<div id="<%=this.ClientID %>" class="VEColorPicker" style="xdisplay: none">
  <table cellspacing="1" cellpadding="0" border="1" unselectable="on" style="moz-user-select: none">
    <tbody>
      <tr>
        <td unselectable="on" style="background-color: #ffffff; moz-user-select: none">&nbsp;</td>
        <td style="background-color: #ffcccc">&nbsp;</td>
        <td style="background-color: #ffcc99">&nbsp;</td>
        <td style="background-color: #ffff99">&nbsp;</td>
        <td style="background-color: #ffffcc">&nbsp;</td>
        <td style="background-color: #99ff99">&nbsp;</td>
        <td style="background-color: #99ffff">&nbsp;</td>
        <td style="background-color: #ccffff">&nbsp;</td>
        <td style="background-color: #ccccff">&nbsp;</td>
        <td style="background-color: #ffccff">&nbsp;</td>
      </tr>
      <tr>
        <td style="background-color: #cccccc">&nbsp;</td>
        <td style="background-color: #ff6666">&nbsp;</td>
        <td style="background-color: #ff9966">&nbsp;</td>
        <td style="background-color: #ffff66">&nbsp;</td>
        <td style="background-color: #ffff33">&nbsp;</td>
        <td style="background-color: #66ff99">&nbsp;</td>
        <td style="background-color: #33ffff">&nbsp;</td>
        <td style="background-color: #66ffff">&nbsp;</td>
        <td style="background-color: #9999ff">&nbsp;</td>
        <td style="background-color: #ff99ff">&nbsp;</td>
      </tr>
      <tr>
        <td style="background-color: #c0c0c0">&nbsp;</td>
        <td style="background-color: #ff0000">&nbsp;</td>
        <td style="background-color: #ff9900">&nbsp;</td>
        <td style="background-color: #ffcc66">&nbsp;</td>
        <td style="background-color: #ffff00">&nbsp;</td>
        <td style="background-color: #33ff33">&nbsp;</td>
        <td style="background-color: #66cccc">&nbsp;</td>
        <td style="background-color: #33ccff">&nbsp;</td>
        <td style="background-color: #6666cc">&nbsp;</td>
        <td style="background-color: #cc66cc">&nbsp;</td>
      </tr>
      <tr>
        <td style="background-color: #999999">&nbsp;</td>
        <td style="background-color: #cc0000">&nbsp;</td>
        <td style="background-color: #ff6600">&nbsp;</td>
        <td style="background-color: #ffcc33">&nbsp;</td>
        <td style="background-color: #ffcc00">&nbsp;</td>
        <td style="background-color: #33cc00">&nbsp;</td>
        <td style="background-color: #00cccc">&nbsp;</td>
        <td style="background-color: #3366ff">&nbsp;</td>
        <td style="background-color: #6633ff">&nbsp;</td>
        <td style="background-color: #cc33cc">&nbsp;</td>
      </tr>
      <tr>
        <td style="background-color: #666666">&nbsp;</td>
        <td style="background-color: #990000">&nbsp;</td>
        <td style="background-color: #cc6600">&nbsp;</td>
        <td style="background-color: #cc9933">&nbsp;</td>
        <td style="background-color: #999900">&nbsp;</td>
        <td style="background-color: #009900">&nbsp;</td>
        <td style="background-color: #339999">&nbsp;</td>
        <td style="background-color: #3333ff">&nbsp;</td>
        <td style="background-color: #6600cc">&nbsp;</td>
        <td style="background-color: #993399">&nbsp;</td>
      </tr>
      <tr>
        <td style="background-color: #333333">&nbsp;</td>
        <td style="background-color: #660000">&nbsp;</td>
        <td style="background-color: #993300">&nbsp;</td>
        <td style="background-color: #996633">&nbsp;</td>
        <td style="background-color: #666600">&nbsp;</td>
        <td style="background-color: #006600">&nbsp;</td>
        <td style="background-color: #336666">&nbsp;</td>
        <td style="background-color: #000099">&nbsp;</td>
        <td style="background-color: #333399">&nbsp;</td>
        <td style="background-color: #663366">&nbsp;</td>
      </tr>
      <tr>
        <td style="background-color: #000000">&nbsp;</td>
        <td style="background-color: #330000">&nbsp;</td>
        <td style="background-color: #663300">&nbsp;</td>
        <td style="background-color: #663333">&nbsp;</td>
        <td style="background-color: #333300">&nbsp;</td>
        <td style="background-color: #003300">&nbsp;</td>
        <td style="background-color: #003333">&nbsp;</td>
        <td style="background-color: #000066">&nbsp;</td>
        <td style="background-color: #330099">&nbsp;</td>
        <td style="background-color: #330033">&nbsp;</td>
      </tr>
    </tbody>
  </table>
</div>
