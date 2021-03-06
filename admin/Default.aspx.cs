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
using System.Data.Odbc;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
        string HTMLText="" ;
        OdbcDataReader reader = GeneralClass.Program.gRetrieveRecord("SELECT * FROM Registration_main WHERE academia_selection='H'");
        while (reader.Read())
        {
            HTMLText += "<table width='750px' dir='rtl' border='1'  cellspacing=0 cellpadding=0>";
            HTMLText += "<tr style='background-color:Gray'><td  colspan=4><b>Personal Details<b></td></tr>";
            HTMLText += "<tr><td style='font-size: 12pt; font-family: Simplified Arabic;width:120px'><b>Full Name</b></td><td style='font-size: 12pt; font-family: Simplified Arabic;'>" 
                + reader["first_name_a"].ToString() + ' ' + reader["father_name_a"].ToString() + ' '
                + reader["grand_father_a"].ToString() + ' ' + reader["last_name_a"].ToString() + "</td><td style='font-size: 12pt; font-family: Simplified Arabic;width:120px'>Full Name</td><td style='font-size: 12pt; font-family: Simplified Arabic;width:120px'>sdsdsdsds</td></tr>";
            HTMLText += "<tr><td><b>رقــم بطاقة الاحوال</b></td><td>"+ reader["local_id"].ToString() + "</td></tr>";
            HTMLText += "<tr><td><b>تاريـخ الميلاد</b></td><td>" + reader["dob"].ToString() + "</td></tr>";
            HTMLText += "<tr><td><b>مكان الميلاد</b></td><td>" + reader["birth_place"].ToString() + "</td></tr>";
            HTMLText += "<tr><td><b>البريد الإكتروني</b></td><td>" + reader["email_address_1"].ToString() + "," +reader["emailaddress_2"].ToString() +"</td></tr>";

            HTMLText += "<tr><td>Application Date</td><td>"+reader["created_date"].ToString()+"</td></tr>";

            HTMLText += "<tr><td>Selections</td><td>1-" + reader["cmb_selection_1"].ToString() + "<br>2-" + reader["cmb_selection_2"].ToString() + "<br>3-" + reader["cmb_selection_3"].ToString() + "</td></tr>";

            HTMLText += "<tr style='background-color:Gray'><td colspan=2><b>Permenant Address<b></td><td colspan='2'><b>Persent Address</b></td></tr>";

            HTMLText += "<tr><td>العنوان</td><td>" + reader["address_1_1"].ToString() + "</td><td>العنوان</td><td>" + reader["address_2_1"].ToString() + "</td></tr>";
            HTMLText += "<tr><td>صندوق البريد</td><td>" + reader["postal_code_1"].ToString() + "</td><td>صندوق البريد</td><td>" + reader["postal_code_2"].ToString() + "</td></tr>";
            HTMLText += "<tr><td>الرمز البريدي</td><td>" + reader["zip_code_1"].ToString() + "</td><td>الرمز البريدي</td><td>" + reader["zip_code_2"].ToString() + "</td></tr>";
            HTMLText += "<tr><td>المـديـنـة</td><td>" + reader["city_name_1"].ToString() + "</td><td>المـديـنـة</td><td>" + reader["city_name_2"].ToString() + "</td></tr>";

            HTMLText += "<tr style='background-color:Gray'><td colspan='2'><b>Contact Details</b></td><td colspan='2'><b>Contact Details</td></tr>";
            HTMLText += "<tr><td>متزوج</td><td>" + reader["mobile"].ToString() + "</td><td>متزوج 2</td><td>" + reader["mobile_2"].ToString() + "</td></tr>";

            HTMLText += "<tr><td>هاتف المنزل</td><td>" + reader["home_telephone"].ToString() + "</td><td>هاتف المنزل 2</td><td>" + reader["home_telephone_2"].ToString() + "</td></tr>";

            HTMLText += "<tr style='background-color:Gray'><td colspan=2><b>Academc Details<b></td></tr>";
            HTMLText += "<tr ><td ><b>School Name<b></td><td>" + reader["school_name"].ToString() + "</td></tr>";
            HTMLText += "<tr ><td ><b>School City<b></td><td>" + reader["school_city"].ToString() + "</td></tr>";

            HTMLText += "<tr ><td ><b>Graduation Date<b></td><td>" + reader["school_graduation_date"].ToString() + "</td></tr>";
            HTMLText += "<tr ><td ><b>الدرجة <b></td><td>" + reader["school_actual_gpa"].ToString() + "</td></tr>";
            HTMLText += "<tr ><td ><b>إختبار القدرات <b></td><td>" + reader["school_godarat"].ToString() + "</td></tr>";
            HTMLText += "<tr ><td ><b>الإختبار التحصيلي <b></td><td>" + reader["school_tahseeli"].ToString() + "</td></tr>";

            
            HTMLText += "</table><hr>";
        }
        reader.Close();
        Report.Text = HTMLText;
        
    }
}
