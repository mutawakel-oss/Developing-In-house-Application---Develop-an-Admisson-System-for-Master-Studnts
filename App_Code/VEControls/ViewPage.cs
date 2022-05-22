using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

// ViewPage.cs
// WebControl implementation for the ViewPage Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 24.08.2005 created by Matthias Hertel.
// 05.02.2006 multiple JavaScript Behaviours include bug fixed.


namespace AJAXControls {

  [ToolboxData("<{0}:ViewPage runat='server'></{0}:ViewPage>")]
  public class ViewPage : Panel {
    private string _name;

    public string Name {
      get { return _name; }
      set { _name = value; }
    }

    public ViewPage() {
      // this.CssClass = "box";
    } // ViewPage

    protected override void OnPreRender(EventArgs e) {
      base.OnPreRender(e);

      if ((this.Name == null) || (this.Name.Length == 0))
        this.Name = this.ID;

      if ((this.Name == null) || (this.Name.Length == 0))
        this.Name = this.ClientID;

      if ((this.Name == null) || (this.Name.Length == 0))
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
          + Page.ResolveUrl("~/controls/ViewPage.js")
          + "'><" + "/script>\n"));
      } // if

      this.Attributes.Add("view", this.Name);
    } // OnPreRender


    protected override void Render(HtmlTextWriter output) {
      base.Render(output);

      output.WriteLine(@"<script defer='defer' type='text/javascript'>jcl.LoadBehaviour('"
      + this.ClientID + @"', ViewPageBehaviour);</script>");
    }
  }
}
