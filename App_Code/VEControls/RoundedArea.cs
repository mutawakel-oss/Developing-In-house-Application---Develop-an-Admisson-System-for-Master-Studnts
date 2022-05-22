using System;
using System.Drawing;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

// RoundedArea.cs
// WebControl implementation for the RoundedArea Control
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 24.08.2005 created by Matthias Hertel.
// 05.02.2006 multiple JavaScript Behaviours include bug fixed.


namespace AJAXControls {

  [ToolboxData("<{0}:RoundedArea runat='server' BorderColor='Blue' BackColor='Yellow'></{0}:RoundedArea>")]
  public class RoundedArea : Panel {
    Color _borderColor;
    Color _backColor;

    public override Color BorderColor {
      get {
        return _borderColor;
      }
      set {
        _borderColor = value;
      }
    }

    public override Color BackColor {
      get {
        return _backColor;
      }
      set {
        _backColor = value;
      }
    }


    protected override void RenderChildren(HtmlTextWriter writer) {
      RenderRound(writer, 5, -1, 1);
      RenderRound(writer, 3, 2, 1);
      RenderRound(writer, 2, 1, 1);
      RenderRound(writer, 1, 1, 2);

      writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingRight, "5px");
      writer.AddStyleAttribute(HtmlTextWriterStyle.PaddingLeft, "5px");
      writer.AddStyleAttribute("border-left", " solid " + ColorTranslator.ToHtml(_borderColor) + " 1px");
      writer.AddStyleAttribute("border-right", " solid " + ColorTranslator.ToHtml(_borderColor) + " 1px");
      writer.AddStyleAttribute(HtmlTextWriterStyle.Margin, "0px");
      writer.AddStyleAttribute(HtmlTextWriterStyle.BackgroundColor, ColorTranslator.ToHtml(_backColor));
      writer.RenderBeginTag(HtmlTextWriterTag.Div);

      base.RenderChildren(writer);

      writer.RenderEndTag();

      RenderRound(writer, 1, 1, 2);
      RenderRound(writer, 2, 1, 1);
      RenderRound(writer, 3, 2, 1);
      RenderRound(writer, 5, 0, 1);
    } // RenderChildren


    // Helper function to render one of the top and bottom divs
    private void RenderRound(HtmlTextWriter writer, int marginWidth, int borderWidth, int height) {

      writer.AddAttribute(HtmlTextWriterAttribute.Class, "VERound");
      if (height != 1)
        writer.AddStyleAttribute(HtmlTextWriterStyle.Height, height.ToString() + "px");
      writer.AddStyleAttribute(HtmlTextWriterStyle.MarginLeft, marginWidth.ToString() + "px");
      if (borderWidth == -1) {
        // the top line
        writer.AddStyleAttribute("border-bottom", " solid " + ColorTranslator.ToHtml(_borderColor) + " 1px");
      } else if (borderWidth == 0) {
        // the bottom line
        writer.AddStyleAttribute("border-top", " solid " + ColorTranslator.ToHtml(_borderColor) + " 1px");
      } else {
        writer.AddStyleAttribute("border-left", " solid " + ColorTranslator.ToHtml(_borderColor) + " " + borderWidth.ToString() + "px");
        writer.AddStyleAttribute(HtmlTextWriterStyle.BackgroundColor, ColorTranslator.ToHtml(_backColor));
        writer.AddStyleAttribute("border-right", " solid " + ColorTranslator.ToHtml(_borderColor) + " " + borderWidth.ToString() + "px");
      }
      writer.AddStyleAttribute(HtmlTextWriterStyle.MarginRight, marginWidth.ToString() + "px");

      writer.RenderBeginTag(HtmlTextWriterTag.Div);
      writer.RenderEndTag();
    } // RenderRound

  } // class
} // namespace
