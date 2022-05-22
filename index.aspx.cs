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
using System.Net;
using System.Net.Mail;

public partial class index : System.Web.UI.Page
{
    protected void ClosePassWindow(object o, EventArgs e)
    {
        ModalPopupExtender2.Hide();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblStatus.Text = "";
        //Session.Add("UploadErr", "");
        Session.Add("order", "Index");
    }
    protected void chk_agree_terms_CheckedChanged(object sender, EventArgs e)
    {
        if (chk_agree_terms.Checked == true)
            btnAgree.Enabled = true;
        else
            btnAgree.Enabled = false;
    }

    protected void fnCheckLogin(object o, EventArgs e)
    {
        GeneralClass.Program.DatabaseConnect();
        System.Data.Odbc.OdbcDataReader reader =
            GeneralClass.Program.gRetrieveRecord(
            "SELECT id,login,first_name_a + ' '+father_name_a +' '+ grand_father_a + ' '+last_name_a [Name] FROM registration_main " +
            "WHERE login='" + txtLoginname.Text.Trim() + "' AND password='" + txtPassword.Text.Trim() + "'");
        try
        {
            if (reader.HasRows)
            {
                lblLoginStatus.Visible = false;
                while (reader.Read())
                {
                    Session.Add("StudentName", reader["Name"].ToString());
                    Session.Add("StudentID", reader["ID"].ToString());
                    Session["order"] = "Intermediate1";
                }

                reader.Close();
                HttpContext.Current.Response.Redirect("register.aspx");
            }
            else
            {
                lblLoginStatus.Visible = true;
                lblLoginStatus.Text = "اسم المستخدم أو كلمة المرور غير صحيحة";
                reader.Close();
              
            }

        }
        catch (System.Data.Odbc.OdbcException exp)
        {
            if (reader != null)
                reader.Close();
        }
    }

    protected void gotoRegister(object o, EventArgs e)
    {
        HttpContext.Current.Response.Redirect("intermediate.aspx");
    }

    protected void retrieve_pwd(object o, EventArgs e)
    {        
        if (txtEmail.Text != "" && txtLocalID.Text != "")
        {
            lblStatus.Text = "بيانات غير صحيحة ، فضلا أدخل بريدك الإلكتروني أو رقم الأحوال المدنية";
            txtLocalID.Text = "";
            txtEmail.Text = "";
            txtDOB.Text = "";
            return;
        }
        string user_name = "";
        string pass_word = "";
        string strEmail = "";
        System.Data.Odbc.OdbcDataReader read=null;
        try
        {
            if (txtEmail.Text != "")
            {
                read = GeneralClass.Program.gRetrieveRecord("SELECT login,password,email_address_1 FROM registration_main WHERE email_address_1='" +
                    txtEmail.Text + "' OR emailaddress_2='" + txtEmail.Text + "'");
                if (read != null)
                {
                    while (read.Read())
                    {
                        user_name = read["login"].ToString();
                        pass_word = read["password"].ToString();
                        strEmail = read["email_address_1"].ToString();
                    }
                }
                read.Close();
            }
            else if (txtLocalID.Text != "")
            {
                read = GeneralClass.Program.gRetrieveRecord("SELECT login,password,email_address_1 FROM registration_main WHERE local_id='" +
                    txtLocalID.Text + "'");
                if (read != null)
                {
                    while (read.Read())
                    {
                        user_name = read["login"].ToString();
                        pass_word = read["password"].ToString();
                        strEmail = read["email_address_1"].ToString();
                    }
                    read.Close();
                }
            }
        }
        catch(System.Data.Odbc.OdbcException exp)
        {
            if (read != null)
                read.Close();
        }

        if (user_name != "")
        {
            string HTMLText = "ملاحظة مهمة: يصلك هذا البريد آليا بناء على طلبك ، فضلا لاتقم بالرد عليه ، و استخدم بيانات المرسلة للدخول إلى نظام التسجيل<br>";

            HTMLText += "للدخول إلى الموقع<br>";
            HTMLText += "اسم المستخدم: " + user_name + "<br>";
            HTMLText += "كلمة المرور: " + pass_word + "<br>";

            GeneralClass.Program.SendMail("noreply@ksau-hs.edu.sa", strEmail, "بيانات الدخول إلى نظام التسجيل الإلكتروني KSAUHS ", HTMLText);
            lblStatus.Text = "تم إرسال بيانات الدخول إلى بريدك الإلكتروني";
            txtLocalID.Text = "";
            txtEmail.Text = "";
            txtDOB.Text = "";

            //string HOST_NAME = "mail.med.ksuhs.edu.sa";
            //int PORT = 25;
            //string FROM = "soshekar@gmail.com";

            //MailMessage MailMessage = new MailMessage(FROM, txtEmail.Text, "Password Recovery", HTMLText);
            //SmtpClient SmtpClient = new SmtpClient(HOST_NAME, PORT);
            //SmtpClient.UseDefaultCredentials = true;
            //SmtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //SmtpClient.Send(MailMessage);
        }
        else
        {
            lblStatus.Text = "البيانات غير صحيحة";
            txtLocalID.Text = "";
            txtEmail.Text = "";
            txtDOB.Text = "";
        }        
    }
}
