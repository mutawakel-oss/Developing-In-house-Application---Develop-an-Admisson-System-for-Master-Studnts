using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

// Part.cs
// WebControl implementation for the Part Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 09.03.2006 created by Matthias Hertel
// 23.09.2006 using images instead of text for the window frame buttons


namespace AJAXControls {

  [ToolboxData("<{0}:Mover runat='server'></{0}:Mover>")]
  public class Mover : System.Web.UI.WebControls.WebControl {
    public string _title;

    public Mover() : base(HtmlTextWriterTag.Div) {
      this._title = "Title";
      this.CssClass = "VEMover";
    } // Mover

    public Mover(string Title) : base(HtmlTextWriterTag.Div) {
      this._title = Title;
      this.CssClass = "VEMover";
    } // Mover

    public string Title {
      get { return _title; }
      set { _title = value; }
    }

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

      if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), "MyBehaviour")) {
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "MyBehaviour", String.Empty);
        ((HtmlHead)Page.Header).Controls.Add(new LiteralControl("<script type='text/javascript' src='"
          + Page.ResolveUrl("~/controls/Mover.js")
          + "'><" + "/script>\n"));
      } // if
    } // OnPreRender

    protected override void RenderChildren(HtmlTextWriter writer) {
      // there are no children!
      writer.WriteLine("::: " + this._title);

      writer.AddAttribute(HtmlTextWriterAttribute.Class, "VEFull");
      writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/controls/images/winfull.gif"));
      writer.AddAttribute(HtmlTextWriterAttribute.Alt, "close");
      writer.RenderBeginTag(HtmlTextWriterTag.Img);
      writer.RenderEndTag();

      writer.AddAttribute(HtmlTextWriterAttribute.Class, "VEMini");
      writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/controls/images/winmini.gif"));
      writer.AddAttribute(HtmlTextWriterAttribute.Alt, "close");
      writer.RenderBeginTag(HtmlTextWriterTag.Img);
      writer.RenderEndTag();

      writer.AddAttribute(HtmlTextWriterAttribute.Class, "VEClose");
      writer.AddAttribute(HtmlTextWriterAttribute.Src, Page.ResolveUrl("~/controls/images/winclose.gif"));
      writer.AddAttribute(HtmlTextWriterAttribute.Alt, "close");
      writer.RenderBeginTag(HtmlTextWriterTag.Img);
      writer.RenderEndTag();

      // base.RenderChildren(writer);
    }


    protected override void Render(HtmlTextWriter output) {
      base.Render(output);

      output.WriteLine(@"<script defer='defer' type='text/javascript'>jcl.LoadBehaviour('"
      + this.ClientID + @"', MoverBehaviour);</script>");
    }
  }
}
