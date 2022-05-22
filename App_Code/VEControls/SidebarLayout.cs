using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.Design;
using System.Web.UI.Design.WebControls;
using System.Web.UI.WebControls;

// App_Code/VEControls/SidebarLayout.cs
// A Layout container building a fixed width sidebar and a variable width main content area.
// A control designer for Visual Studio .NET 2005 is included.
// Copyright (c) by Matthias Hertel, http://www.mathertel.de
// This work is licensed under a BSD style license. See http://www.mathertel.de/License.aspx
// ----- 
// 08.12.2006 created by Matthias Hertel

namespace VEControls {
  [
      Designer(typeof(SidebarLayoutDesigner)),
      ToolboxData("<{0}:SidebarLayout runat=\"server\" ColWidth=\"200\"></{0}:SidebarLayout>")
  ]
  public class SidebarLayout : CompositeControl {

    #region properties of the SidebarLayout Control

    // Define the position of the sidebar column.
    private Boolean _right = true;

    public Boolean Right {
      get { return _right; }
      set { _right = value; }
    } // Right

    // Define the width of the fixed, left / right column
    private int _colWidth = 200;

    public int ColWidth {
      get { return _colWidth; }
      set { _colWidth = value; }
    } // ColWidth


    // Define the templates that represent the main and sidebar column
    private ITemplate _side;

    [PersistenceMode(PersistenceMode.InnerProperty), DefaultValue(null)]
    [TemplateInstance(TemplateInstance.Single)]
    public virtual ITemplate Side {
      get { return _side; }
      set { _side = value; }
    }

    private ITemplate _main;

    [PersistenceMode(PersistenceMode.InnerProperty), DefaultValue(null)]
    [TemplateInstance(TemplateInstance.Single)]
    public virtual ITemplate Main {
      get { return _main; }
      set { _main = value; }
    }

    #endregion

    // Create a simple table with a row of two clickable, 
    // readonly headers and a row with a single column, which 
    // is the 'container' to which we'll be adding controls.
    protected override void CreateChildControls() {
      // Always start with a clean form
      Controls.Clear();
      
      Unit outerWidth = Unit.Pixel(ColWidth+8);
      Unit innerWidth = Unit.Pixel(ColWidth+4);

      // write out the main column content
      WebControl mainWrapper = new WebControl(HtmlTextWriterTag.Div);
      mainWrapper.Style.Add("float", "left");
      mainWrapper.Style.Add(HtmlTextWriterStyle.Width, "100%");

      WebControl main = new WebControl(HtmlTextWriterTag.Div);
      main.CssClass = "MAIN";
      if (this._right)
        main.Style.Add(HtmlTextWriterStyle.MarginRight, outerWidth.ToString());
      else
        main.Style.Add(HtmlTextWriterStyle.MarginLeft, outerWidth.ToString());
 
      _main.InstantiateIn(main);
      mainWrapper.Controls.Add(main);
      Controls.Add(mainWrapper);

      // write out the left column content
      WebControl side = new WebControl(HtmlTextWriterTag.Div);
      side.CssClass = "SIDEBAR";
      side.Style.Add("float", "left");
      side.Style.Add(HtmlTextWriterStyle.Width, innerWidth.ToString());
      
      if (this._right)
        side.Style.Add(HtmlTextWriterStyle.MarginLeft, "-" + innerWidth.ToString());
      else
        side.Style.Add(HtmlTextWriterStyle.MarginLeft, "-100%");
      
      _side.InstantiateIn(side);
      Controls.Add(side);

      // an empty div with style="clear:both" so following content comes below.
      WebControl endClear = new WebControl(HtmlTextWriterTag.Div);
      endClear.Style.Add("clear", "both");
      Controls.Add(side);
    } // CreateChildControls

  } // class


  //---------------------------------------------------------
  // Region-based control designer for the above web control, 
  // derived from CompositeControlDesigner.
  public class SidebarLayoutDesigner : CompositeControlDesigner {
    private SidebarLayout myControl;

    public override void Initialize(IComponent component) {
      base.Initialize(component);
      myControl = (SidebarLayout)component;
    }

    // Make this control un-resizeable on the design surface
    public override bool AllowResize {
      get { return false; }
    } // AllowResize


    // Use the base to create child controls, then add region markers
    protected override void CreateChildControls() {
      WebControl p = null;
      base.CreateChildControls();

      // Main
      p = (WebControl)myControl.Controls[0].Controls[0];
      p.Attributes[DesignerRegion.DesignerRegionAttributeName] = "0";
      // Side
      p = (WebControl)myControl.Controls[1];
      p.Attributes[DesignerRegion.DesignerRegionAttributeName] = "1";
    }


    // Create the regions and design-time markup. Called by the designer host.
    public override String GetDesignTimeHtml(DesignerRegionCollection regions) {
      // Create 2 editable reions
      EditableDesignerRegion er = null;

      // Sidebar
      er = new EditableDesignerRegion(this, "Side", false);
      regions.Add(er);

      // Main content
      er = new EditableDesignerRegion(this, "Main", false);
      regions.Add(er);

      //// Set the highlight for the selected region
      //regions[1].Highlight = true;

      // Use the base class to render the markup
      return base.GetDesignTimeHtml();
    } // GetDesignTimeHtml


    // Get the content string for the selected region. Called by the designer host?
    public override String GetEditableDesignerRegionContent(EditableDesignerRegion region) {
      String ret = String.Empty;

      // Get a reference to the designer host
      IDesignerHost host = (IDesignerHost)Component.Site.GetService(typeof(IDesignerHost));
      if (host != null) {
        ITemplate template = null;

        if (region.Name == "Side") {
          template = myControl.Side;
        } else if (region.Name == "Main") {
          template = myControl.Main;
        }

        // Persist the template in the design host
        if (template != null)
          ret = ControlPersister.PersistTemplate(template, host);
      } // if

      return (ret);
    } // GetEditableDesignerRegionContent


    // Create a template from the content string and  
    // put it in the selected view.
    public override void SetEditableDesignerRegionContent(EditableDesignerRegion region, string content) {
      if (content == null)
        return;

      // Get a reference to the designer host
      IDesignerHost host = (IDesignerHost)Component.Site.GetService(typeof(IDesignerHost));
      if (host != null) {
        // Create a template from the content string
        ITemplate template = ControlParser.ParseTemplate(host, content);

        if (template != null) {
          // Determine which region should get the template
          // Either 'Content0' or 'Content1'
          if (region.Name == "Side") {
            myControl.Side = template;
          } else if (region.Name == "Main") {
            myControl.Main = template;
          } // if
        } // if
      } // if
    } // SetEditableDesignerRegionContent
  } // class

} // namespace

