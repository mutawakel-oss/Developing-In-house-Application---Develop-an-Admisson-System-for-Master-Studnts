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

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void chk_agree_terms_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_agree_terms.Checked == true)
            btnAgree.Enabled = true;
        else
            btnAgree.Enabled = false;
    }

    protected void ValidateLogin(object sender, EventArgs e)
    {
        System.Data.Odbc.OdbcDataReader reader =
            GeneralClass.Program.gRetrieveRecord(
            "SELECT id,login,first_name_a + ' '+father_name_a +' '+ grand_father_a + ' '+last_name_a [Name] FROM registration_main " +
            "WHERE login='" + txtLoginname.Text.Trim() + "' AND password='" + txtPass.Text.Trim() + "'");
        try
        {
            if (reader.HasRows)
            {
                lblLoginStatus.Visible = false;
                while (reader.Read())
                {
                    Session.Add("StudentName", reader["Name"].ToString());
                    Session.Add("StudentID", reader["ID"].ToString());
                }

                reader.Close();
                HttpContext.Current.Response.Redirect("register.aspx");
            }
            else
            {
                lblLoginStatus.Visible = true;
                lblLoginStatus.Text = "Invalid login name or password.";
                reader.Close();
            }

        }
        catch (System.Data.Odbc.OdbcException exp)
        {
            if (reader != null)
                reader.Close();
        }
    }
}
