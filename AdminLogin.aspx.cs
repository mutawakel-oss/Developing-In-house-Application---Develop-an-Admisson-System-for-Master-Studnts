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

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtAdminID.Text = "";
            txtAdminPassword.Text = "";
        }
        txtAdminID.Focus();

    }
    protected void Login(object sender, EventArgs e)
    {
        if (txtAdminID.Text.Trim().Equals("") || txtAdminPassword.Text.Trim().Equals(""))
        {
            return;
        }
        if (txtAdminID.Text.Trim().ToLower().Equals("admin") && txtAdminPassword.Text.Trim().ToLower().Equals("tracker"))
        {
            Session.Add("Admin", "Login");
            Response.Redirect("control_pnl.aspx");            
        }
        else
        {
            lblStatus.Text = "Login Failed";
            lblStatus.Visible = true;
            return;
        }
    }
}
