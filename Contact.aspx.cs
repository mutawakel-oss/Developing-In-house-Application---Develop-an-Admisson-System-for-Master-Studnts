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

public partial class Contact : System.Web.UI.Page
{
    string strEmail = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            mClearCtrl();
        }
        
    }
    private void mClearCtrl()
    {
        txtName.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
        ddlProblem.SelectedIndex = -1;
        txtDetail.Text = "";
        txtName.Focus();
        lblStatus.Text = "";
        lblStatus.Visible = false;
        lnkHome.Visible = false;
    }
    protected void Save(object sender, EventArgs e)
    {
        try
        {
            if (ValidateData())
            {
                strEmail = "<B>الاسم :" + txtName.Text.Trim() + "<br>";
                strEmail += "رقم الهاتف :" + txtPhone.Text.Trim() + "<br>";
                strEmail += "البريد الالكتروني :" + txtEmail.Text.Trim() + "<br>";
                strEmail += "المشكلة :" + ddlProblem.Text.Trim() + "<br><br>";
                strEmail += "تفاصيل المشكلة :" + txtDetail.Text.Trim() + "<br></B>";
                GeneralClass.Program.SendMail( txtEmail.Text.Trim(),"regist-me@ksau-hs.edu.sa", "Problem From " + txtName.Text.Trim(), strEmail);
                GeneralClass.Program.Add("name", txtName.Text.Trim(), "S");
                GeneralClass.Program.Add("phone", txtPhone.Text.Trim(), "S");
                GeneralClass.Program.Add("email", txtEmail.Text.Trim(), "S");
                GeneralClass.Program.Add("problem", ddlProblem.Text.Trim(), "S");
                GeneralClass.Program.Add("details", txtDetail.Text.Trim(), "S");
                GeneralClass.Program.InsertRecordStatement("t_contact");
                mClearCtrl();               
                lblStatus.Visible = true;
                lblStatus.Text = "Your Request has been submitted";
                lnkHome.Visible = true;
                Response.Redirect("index.aspx");
            }
        }
        catch (Exception exp)
        { 
            
        }
    }
    protected void Home(object sender, EventArgs e)
    {
        Response.Redirect("Index.aspx");
    }
    private bool ValidateData()
    {
        if (txtName.Text.Trim().Equals(""))
        {
            lblStatus.Text = "الرجاء ادخال الاسم";
            lblStatus.Visible = true;
            return false;
        }
        else
        {
            lblStatus.Visible = false;
        }

        if (txtPhone.Text.Trim().Equals(""))
        {
            lblStatus.Text = "الرجاء ادخال رقم الهاتف";
            lblStatus.Visible = true;
            return false;
        }
        else
        {
            lblStatus.Visible = false;
        }

        if (!mValidateEmail(txtEmail.Text.Trim()))
        {
            lblStatus.Text = "الرجاء ادخال بريد الكتروني صحيح";
            lblStatus.Visible = true;
            return false;
        }
        else
        {
            lblStatus.Visible = false;
        }        
        
        if (txtDetail.Text.Trim().Equals(""))
        {
            lblStatus.Text = "يجب ادخال تفاصيل المشكلة";
            lblStatus.Visible = true;
            return false;
        }
        else
        {
            lblStatus.Visible = false;
        }


        return true;

    }
    private bool mValidateEmail(string strEmail)
    {
        if (strEmail.Trim().Equals(""))
        {
            return false;
        }
        else if (strEmail.IndexOf('@').Equals(-1))
        {
            return false;
        }
        else if (strEmail.IndexOf('.').Equals(-1))
        {
            return false;
        }
        return true;
    }
}
