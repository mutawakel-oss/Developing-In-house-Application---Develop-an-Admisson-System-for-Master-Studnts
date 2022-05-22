<%@ Control Language="C#" %>
<%
  // PopUpDialog.ascx
  // Implementation of the PopUpDialog AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 23.09.2006 created by Matthias Hertel
  // 30.09.2006 Firefox compatibility adjusted.
  // 07.10.2006 Info & Error Popups enabled.
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public bool nosubmit = true;
  public int width = 300;

  protected override void OnInit(EventArgs e) {
    base.OnInit(e);
    this.ID = "ClientID";
  } // OnInit

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
        + Page.ResolveUrl("~/controls/PopUpDialog.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<div id="VEPopUpDialog" class="VEPopUpDialog" style="display: none; width: <%=this.width %>px;">
  <div class="VEShadow" style="width: <%=this.width %>px;">
  </div>
  <div class="VETitle">
    <span></span>
    <img class='VEClose' alt="close" src="<%=Page.ResolveUrl("~/controls/images/winclose.gif")%>" />
  </div>
  <div class="VEContent">
  </div>
</div>
<script defer="defer" type="text/javascript">jcl.LoadBehaviour("VEPopUpDialog", PopUpDialogBehaviour);</script>
