<%@ Control Language="C#" %>
<%
  // ViewSelector.ascx
  // Implementation of the ViewSelector AJAX Control.
  // Copyright (c) by Matthias Hertel, http://www.mathertel.de
  // This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
  // -----
  // 21.08.2005 created by Matthias Hertel.
%>
<script runat="server">

  private string _views = String.Empty; // available views

  public string views {
    get { return (_views); }
    set { _views = value; }
  } // views

  public string name = "view"; // the name of the data-connection

  protected override void OnPreRender(EventArgs e) {
    base.OnPreRender(e);

    if ((this.name == null) || (this.name.Length == 0))
      this.name = this.ID;

    if ((this.name == null) || (this.name.Length == 0))
      throw new Exception("The AJAX View Selector must have an id or name attribut specfied.");

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
        + Page.ResolveUrl("~/controls/ViewSelector.js")
        + "'><" + "/script>\n"));
    } // if

  } // OnPreRender

  protected string GetExpandedViews() {
    string[] viewList = this._views.Split(';');
    for (int n = 0; n < viewList.Length; n++) {
      string s = viewList[n];
      if (s.IndexOf(':') > 0) {
        string[] s2 = s.Split(':');
        Control c = this.Page.FindControl(s2[0]);
        if (c != null)
          s2[0] = c.ClientID;
        viewList[n] = s2[0] + ":" + s2[1];
      } else {
        Control c = this.Page.FindControl(s);
        if (c != null)
          viewList[n] = this.Page.FindControl(s).ClientID + ":" + s;
      }
    }
    return (String.Join(";", viewList));
  } // GetExpandedViews
</script>
<%// UI for the control %>
<div id="<%=this.ClientID %>" name="<%=this.name %>" views="<%=this.GetExpandedViews() %>">
  <% foreach (string aView in this.views.Split(';')) {
       string caption, value;
       int nx = aView.IndexOf(':');
       if (nx > 0) {
         value = aView.Substring(0, nx);
         caption = aView.Substring(nx + 1);
       } else {
         value = aView;
         caption = aView;
       } // if
       
  %>
  <%-- using a hyperlink
   <a href="#<%=value%>" name="selview_<%=value%>" class="passiv"><%=caption%></a>
--%>
  <span class="VEButton" hover="true" view="<%=value%>">
    <%=caption%>
  </span>
  <% } // for %>
</div>
<%// setup then AJAX WebPart connections for the control %>
<script defer="defer" type="text/javascript">
  jcl.LoadBehaviour("<%=this.ClientID %>", ViewSelectorBehaviour);
</script>
