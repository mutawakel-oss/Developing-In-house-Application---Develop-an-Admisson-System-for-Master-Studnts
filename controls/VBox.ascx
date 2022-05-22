<%@ Control Language="C#" %>
<%
  // VBox.ascx
  // Implementation of the VBox AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // 17.09.2005 created by Matthias Hertel
  // 05.02.2006 multiple JavaScript Behaviours include bug fixed.
  // 05.08.2006 advanced layout, increment decrement buttons added.
  // 05.08.2006 width, minvalue, maxvalue, unit attributes added.
%>
<script runat="server">
  public string value = String.Empty; // default-value
  public string name = null; // the name of the data-connection
  public bool nosubmit = true;

  public int width = 200;

  public int minvalue = 0;
  public int maxvalue = 100;
  public int unit = 1;

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if (this.name == null) this.name = this.ID;

    if ((this.name == null) || (this.name.Length == 0))
      throw new Exception("The AJAX VBox control must have an id or name attribut specfied.");

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
        + Page.ResolveUrl("~/controls/VBox.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender
</script>
<!-- Here comes the HTML code that builds the Control. -->
<div class="VBox" id="<%=this.ClientID %>" style="height: 16px" name="<%=this.name %>"
  minvalue="<%=this.minvalue %>" maxvalue="<%=this.maxvalue %>" unit="<%=this.unit %>">
  <img alt="decrement" class="minus" src="../controls/images/sliderMinus.gif" /><span
    style="position: relative"><img alt="slider" class="slider" style="width: <%=this.width-32%>px;
      height: 16px" src="../controls/images/sliderBack.gif" />
    <img alt="move me" class="knob" src="../controls/images/sliderButton.gif" style="position: absolute;
        left: 0px" />
  </span>
  <img alt="increment" class="plus" src="../controls/images/sliderPlus.gif" /></div>
<!-- Here comes the script code to bind the behaviour. -->
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", VBoxBehaviour);
</script>
