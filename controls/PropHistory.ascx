<%@ Control Language="C#" %>
<%
  // PropHistory.ascx
  // Implementation of the PropHistory AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // This control is used to load the behaviour that controls and reflects the page properties
  // and the browser history.
  // ----- 
  // 05/12/2006 21:25:24 created by Matthias Hertel
  // 28.05.2006 declaration of stateList and propList via attributes enabled.
%>
<script runat="server">
  public string propList = null; // all page properties that correspond to a part of the url-hash
  public string stateList = null; // all page properties that will trigger a new history entry.

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
        + Page.ResolveUrl("~/controls/PropHistory.js")
        + "'><" + "/script>\n"));
    } // if

    // all properties of the stateList must be part of propList too.
    StringDictionary sd = new StringDictionary();

    if (stateList == null) {
      stateList = String.Empty;
    } else {
      foreach (string s in stateList.Split(',', ';'))
        sd.Add(s, String.Empty);

      stateList = String.Empty;
      foreach (string s in sd.Keys) {
        if (stateList.Length > 0) stateList += ",";
        stateList += "\"" + s + "\":\"\"";
      }
    } // if

    if (propList == null) {
      propList = stateList;
    } else {
      foreach (string s in propList.Split(',', ';'))
        sd.Add(s, String.Empty);

      propList = String.Empty;
      foreach (string s in sd.Keys) {
        if (propList.Length > 0) propList += ",";
        propList += "\"" + s + "\":\"\"";
      }
    } // if
  } // OnPreRender
</script>
<!-- Here comes an invisible HTML element that gets the behaviour attached. -->
<span id="<%=this.ClientID %>"></span>
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", PropHistory);
  // setup the porperties history feature
<% if (this.propList.Length > 0) { %>
  PropHistory.propList = {<%=this.propList%>};
<% } // if %>
<% if (this.stateList.Length > 0) { %>
  PropHistory.stateList = {<%=this.stateList%>};
<% } // if %>
</script>
