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
using AjaxControlToolkit;
using System.Drawing.Printing;
using System.Text;
using System.Drawing;
using System.IO;
 

public partial class Default2 : System.Web.UI.Page
{
    System.Data.Odbc.OdbcDataReader reader;
    PrintDocument objPrint = new PrintDocument();
    string HTMLText = "";
    protected Font printFont;
    protected StringReader stringToPrint;    

    protected void Page_Load(object sender, EventArgs e)
    {
        string email1 = "";
        string email2 = "";

        //This code will check the order of navigation through website
        if (Session.Count > 0 && Session["order"] != null && Session["order"].ToString() == "register")
        {
            Session["order"] = "register";
        }
        else
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }

        if (!IsPostBack)
        {
            if (Request.QueryString["applicant_id"] != null)
           {
               HIDD_ID.Value = Request.QueryString["applicant_id"].ToString();// Request.QueryString["applicant_id"].ToString();
               if (Session["StudentID"]!=null && Session["StudentID"].ToString()!= HIDD_ID.ToString())
               {
                   HIDD_ID.Value = Session["StudentID"].ToString();
               }
    
               reader = GeneralClass.Program.gRetrieveRecord("SELECT email_address_1,emailaddress_2,local_id,address_1_1,dob,birth_place,current_status,mobile,home_telephone,created_date,first_name_a,father_name_a,grand_father_a,last_name_a FROM registration_main WHERE registration_main.id=" + HIDD_ID.Value.ToString());

                HTMLText = "<b><DIV align='center'>لقد تم حفظ بياناتك</b><hr></DIV>";
                HTMLText += "<b><DIV align='center'>تقرير حالة التسجيل الأولية</div></b><hr><div align='center'>Date:" + DateTime.Today.Date.ToString("dd/MM/yyyy") + "</div><br>";
                
                    while(reader.Read())
                {

                    HTMLText += "<table align='center'  width='40%' border='1' cellpadding='0' cellspacing='1' contenteditable='false'>";

                    HTMLText += "<tr><td width='150px'>الاسم كاملاً</td><td>" + reader["first_name_a"].ToString() + " " + reader["father_name_a"].ToString() + " " +
                        reader["grand_father_a"].ToString() + " " +
                        reader["last_name_a"].ToString() + "</td></tr>";

                    HTMLText += "<tr><td width='200px'>رقم بطاقة الاحوال</td><td>" + reader["local_id"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>تاريـخ الميلاد</td><td>" + reader["dob"].ToString() + "</td></tr>"; ;
                    HTMLText += "<tr><td width='200px'>مكان الميلاد</td><td>" + reader["birth_place"].ToString() + "</td></tr>"; ;
                    HTMLText += "<tr><td width='200px'>العمر</td><td>" + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>وضعية طلبك الحالية</td><td>" + reader["current_status"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>تاريخ التسجيل</td><td>" + reader["created_date"].ToString() + "</td></tr>";

                    HTMLText += "<tr><td width='200px'>الجــوال</td><td>" +  "05" + reader["mobile"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>هاتف المنزل</td><td>" + reader["home_telephone"].ToString() + "</td></tr>";

                    HTMLText += "</table>";

                    email1 = reader["email_address_1"].ToString();
                    email2 = reader["emailaddress_2"].ToString();
                    
                }
                
                reader.Close();

                reader = GeneralClass.Program.gRetrieveRecord("SELECT * FROM highschool_records WHERE applicant_id=" + HIDD_ID.Value.ToString());
                while (reader.Read())
                {
                    HTMLText += "<table align='center'   width='40%' border='1' cellpadding='1' cellspacing='1'>";
                    HTMLText += "<tr><td width='200px'>اســـم المدرســة:</b></td><td>  " + reader["school_name"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>المـديـنـة:</td><td>  " + reader["school_city"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>الــدولـة:</td><td>  " + reader["school_country"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>النسبة العامة:</td><td>  " + reader["school_actual_gpa"].ToString() + "(35%)=" +
                         reader["school_calculated_gpa"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>إختبار القدرات:</td><td>  " + reader["school_actual_godarat"].ToString() + "(30%)=" +
                        reader["school_calculated_godarat"].ToString()+"</td></tr>";

                    HTMLText += "<tr><td width='200px'>الإختبار التحصيلي:</td><td>  " + reader["school_actual_tahseeli"].ToString() + "(35%)=" +
                        reader["school_calculated_tahseel"].ToString() + "</td></tr>";

                    HTMLText += "<tr><td width='200px'>الدرجة المكافئة الكلية:</td><td>  " + reader["school_total_converted"].ToString() + "</td></tr>";

                    HTMLText += "<tr><td width='200px'>الإختيار الأول </td><td>  " + reader["cmb_selection_1"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>الإختيار الثاني</td><td>  " + reader["cmb_selection_2"].ToString() + "</td></tr>";
                    HTMLText += "<tr><td width='200px'>الإختيار الثالث</td><td>  " + reader["cmb_selection_3"].ToString() + "</td></tr>";

                    HTMLText += "</table><br>";
                }

               
                
                if (email1 != "")
                {
                    GeneralClass.Program.SendMail("FROM", email1, "Regarding Your Application", HTMLText);
                }
                if (email2 != "")
                {
                    GeneralClass.Program.SendMail("FROM", email2, "Regarding Your Application", HTMLText);
                }
                reader.Close();

                //FCKeditor1.Value = HTMLText;
                //FCKeditor1.Visible = false;                
                lblInfo.Text = HTMLText;
                //lblInfo.Visible = false;
            }
                        
        }
    }
    
 }