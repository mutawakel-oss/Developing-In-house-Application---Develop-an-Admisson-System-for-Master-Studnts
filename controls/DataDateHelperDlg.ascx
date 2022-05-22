<%@ Control Language="C#" %>
<%
  // DataDateHelperDlg.ascx
  // Implementation of the DataDateHelperDlg AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 10/3/2006 7:12:04 PM created by Administrator
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public bool nosubmit = true;

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
        + Page.ResolveUrl("~/controls/DataDateHelperDlg.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<div id="DataDateHelperDlg" unselectable="on" style="display:none;moz-user-select: none; border: solid 2px #203050;
  padding: 2px; width: 160px; text-align: center">
  <table class='VECalendar'>
    <tr>
      <td class='f'>&lt;&lt;</td>
      <td class='f'>&lt;</td>
      <td id="VECalendarMonth" class='h' colspan='3'></td>
      <td class='f'>&gt;</td>
      <td class='f'>&gt;&gt;</td>
    </tr>
  </table>
  <div id="DataDateHelperDlgBody">
  </div>
  <div class="DIALOGFUNCTIONBAR">
    <span class="DIALOGFUNCTION" name="cancel">Abbrechen</span><span class="DIALOGFUNCTION"
      name="ok">&nbsp;OK&nbsp;</span>
  </div>
</div>
<!-- Here comes the script code to bind the behaviour. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("DataDateHelperDlg", DataDateHelperDlgBehaviour);
</script>
