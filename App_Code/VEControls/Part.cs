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


namespace AJAXControls {

  [ToolboxData("<{0}:Part runat='server'></{0}:Part>")]
  public class Part : Panel {
    private string _name;
    private string _title;
    private Unit _innerHeight;

    private bool _moveable;
    private Mover _mover = null;

    public string Name {
      get { return _name; }
      set { _name = value; }
    }

    public string Title {
      get { return _title; }
      set { _title = value; }
    }

    public bool Moveable {
      get { return _moveable; }
      set { _moveable = value; }
    }

    public Part() {
      this.CssClass = "VEPart";
      this._title = null;
      this._moveable = false;
    } // Part


    protected override void  EnsureChildControls()
    {
      if (_moveable) {
        _mover = new Mover(this._title);
        this.Controls.Add(_mover);
      } // if
      base.EnsureChildControls();
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
          + Page.ResolveUrl("~/controls/Part.js")
          + "'><" + "/script>\n"));
      } // if
    } // OnPreRender

    
    public override void RenderBeginTag(HtmlTextWriter writer) {
      // writer.AddStyleAttribute(HtmlTextWriterStyle.Position, "absolute");
      writer.AddStyleAttribute(HtmlTextWriterStyle.MarginBottom, "12px");
      writer.AddStyleAttribute(HtmlTextWriterStyle.MarginRight, "12px");
      if (! this.Height.IsEmpty) {
        _innerHeight = this.Height;
        this.Height = new Unit(_innerHeight.Value + 28, _innerHeight.Type);
      }
      base.RenderBeginTag(writer);
    } // RenderBeginTag


    protected override void RenderChildren(HtmlTextWriter writer) {

      // add a shadow
      writer.AddAttribute(HtmlTextWriterAttribute.Class, "VEShadow");
      if (! this.Height.IsEmpty)
        writer.AddStyleAttribute(HtmlTextWriterStyle.Height, this.Height.ToString());
      writer.RenderBeginTag(HtmlTextWriterTag.Div);
      writer.RenderEndTag();

      // render mover object here, not in children.
      if (_mover != null) {
        _mover.RenderControl(writer);
        this.Controls.Remove(_mover);
      } else if (_title != null) {
        writer.AddAttribute(HtmlTextWriterAttribute.Class, "VETitle");
        writer.RenderBeginTag(HtmlTextWriterTag.Div);
        writer.Write(this._title);
        writer.RenderEndTag();
      }// if

      writer.AddAttribute(HtmlTextWriterAttribute.Class, "VEContent");
      if (! this.Height.IsEmpty)
        writer.AddStyleAttribute(HtmlTextWriterStyle.Height, _innerHeight.ToString());
      writer.RenderBeginTag(HtmlTextWriterTag.Div);

      base.RenderChildren(writer);

      writer.RenderEndTag();
    } // RenderChildren


    protected override void Render(HtmlTextWriter output) {
      base.Render(output);

      output.WriteLine(@"<script defer='defer' type='text/javascript'>jcl.LoadBehaviour('"
      + this.ClientID + @"', PartBehaviour);</script>");
    } // Render

  } // class
} // namespace
