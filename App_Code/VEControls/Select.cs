using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace AJAXControls {

  [ToolboxData("<{0}:Select runat='server'></{0}:Select>")]
  public class Select : HtmlSelect {

    public string PageProperty = String.Empty;

    protected override void OnPreRender(EventArgs e) {
      base.OnPreRender(e);

      if ((this.Name == null) || (this.Name.Length == 0))
        this.Name = this.ID;

      if ((this.Name == null) || (this.Name.Length == 0))
        throw new Exception("The AJAX Select must have an id or name attribut specfied.");

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
          + Page.ResolveUrl("~/controls/Select.js")
          + "'><" + "/script>\n"));
      } // if
    } // OnPreRender


    protected override void RenderAttributes(HtmlTextWriter writer) {
      base.RenderAttributes(writer);
      writer.WriteAttribute("pageproperty", this.PageProperty);
    }

    protected override void Render(HtmlTextWriter output) {
      base.Render(output);

      output.WriteLine(@"<script defer='defer' type='text/javascript'>jcl.LoadBehaviour('"
      + this.ClientID + @"', SelectBehaviour);</script>");
    }
  }
}
