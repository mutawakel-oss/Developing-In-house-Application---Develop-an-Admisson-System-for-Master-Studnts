using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

// LightBoxDialog.ascx
// WebControl implementation for the LightBoxDialog AJAX Control.
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 22.08.2006 created by Matthias Hertel


namespace VEControls {

  [ToolboxData("<{0}:Part runat='server'></{0}:Part>")]
  public class LightBoxDialog : Panel {
    private string _title;

    public string Title {
      get { return _title; }
      set { _title = value; }
    }

    public LightBoxDialog() {
      this.CssClass = "LIGHTBOXDIALOG";
      this._title = "Dialog";
    } // LightBoxDialog


    protected override void OnPreRender(EventArgs e) {
      base.OnPreRender(e);

      if ((this.ID == null) || (this.ID.Length == 0))
        this.ID = this.ClientID;

      if (Page.Header == null)
        throw new Exception("The <head> element of this page is not marked with runat='server'.");

      // register the JavaScripts includes without need for a Form.
      if (!Page.ClientScript.IsClientScriptBlockRegistered(Page.GetType(), "CommonBehaviour")) {
        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "CommonBehaviour", String.Empty);
        ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
          + Page.ResolveUrl("~/controls/jcl.js")
          + "'><" + "/script>\n"));
      } // if

      if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), "MyBehavior")) {
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MyBehavior", String.Empty);
        ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
          + Page.ResolveUrl("~/controls/LightBoxDialog.js")
          + "'><" + "/script>\n"));
      } // if
    } // OnPreRender

    
    //public override void RenderBeginTag(HtmlTextWriter writer) {
    //  // writer.AddStyleAttribute(HtmlTextWriterStyle.Position, "absolute");
    //  writer.AddStyleAttribute(HtmlTextWriterStyle.MarginBottom, "12px");
    //  writer.AddStyleAttribute(HtmlTextWriterStyle.MarginRight, "12px");
    //  if (! this.Height.IsEmpty) {
    //    _innerHeight = this.Height;
    //    this.Height = new Unit(_innerHeight.Value + 28, _innerHeight.Type);
    //  }
    //  base.RenderBeginTag(writer);
    //} // RenderBeginTag


    protected override void RenderChildren(HtmlTextWriter writer) {
      // add a Dialog Title
      writer.AddAttribute(HtmlTextWriterAttribute.Class, "DIALOGHEADER");
      writer.RenderBeginTag(HtmlTextWriterTag.Div);
      writer.Write(_title);
      writer.RenderEndTag();

      base.RenderChildren(writer);
    } // RenderChildren


    protected override void Render(HtmlTextWriter output) {
      base.Render(output);

      output.WriteLine(@"<script defer='defer' type='text/javascript'>jcl.LoadBehaviour('"
      + this.ClientID + @"', LightBoxDialogBehaviour);</script>");
    } // Render

  } // class
} // namespace
