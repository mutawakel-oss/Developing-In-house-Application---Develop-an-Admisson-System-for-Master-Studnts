<%@ Control Language="C#" %>
<%
  // PropPersist.ascx
  // Implementation of the PropPersist AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // ----- 
  // This control is used to load the behaviour that controls and reflects the page properties
  // and the browser history.
  // ----- 
  // 21.10.2006 created by Matthias Hertel
%>
<script runat="server">
  public string propList = null; // all page properties that should be persisted into a cookie.

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
        + Page.ResolveUrl("~/controls/PropPersist.js")
        + "'><" + "/script>\n"));
    } // if

    // all properties of the stateList must be part of propList too.
    StringDictionary sd = new StringDictionary();
    
    if (propList == null) {
      propList = String.Empty;
    } else {
      foreach (string s in propList.Split(',', ';'))
        sd.Add(s, String.Empty);
      
      propList = String.Empty;
      foreach (string s in sd.Keys) {
        if (propList.Length > 0) propList += ",";
        propList += "\"" + s + "\":true";
      }
    } // if
  } // OnPreRender
</script>
<!-- Here comes an invisible HTML element that gets the behaviour attached. -->
<span id="<%=this.ClientID %>"></span>

<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", PropPersist);
  // setup the porperties history feature
<% if (this.propList.Length > 0) { %>
  PropPersist.propList = {<%=this.propList%>};
<% } // if %>
</script>

