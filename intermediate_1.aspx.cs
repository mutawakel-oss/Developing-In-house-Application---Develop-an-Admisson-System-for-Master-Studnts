using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class intermediate_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0 && Session["order"] != null && Session["order"].ToString() == "Intermediate")
        {
            Session["order"] = "Intermediate1";
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
}
