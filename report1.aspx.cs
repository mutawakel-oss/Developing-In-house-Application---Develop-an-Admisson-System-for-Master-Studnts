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

public partial class report1 : System.Web.UI.Page
{
    protected void loadGrird()        
    {        
        SQLTop500.SelectCommand = "SELECT TOP 500 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3,local_id,"+
            "first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted,school_calculated_gpa,"+
            "school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2  FROM registration_main,"+
            "highschool_records " +
            "WHERE highschool_records.applicant_id=registration_main.id AND  academia_selection='H' ORDER BY school_total_converted DESC";

        SQLTopMedcine_60.SelectCommand = "SELECT TOP 60 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3,local_id," +
            "first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted,school_calculated_gpa," +
            "school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2  FROM registration_main,highschool_records " +
            " WHERE highschool_records.applicant_id=registration_main.id AND current_status='Submitted' AND academia_selection='H' AND cmb_selection_1='كلية الطب' ORDER BY school_total_converted DESC";

        SQLTop_Respiratory.SelectCommand = "SELECT TOP 30 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3," +
            "local_id,first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted," +
            "school_calculated_gpa,school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2 " +
            "FROM registration_main,highschool_records WHERE highschool_records.applicant_id=registration_main.id AND cmb_selection_1 " +
            "NOT IN('كلية الطب') AND (cmb_selection_1 ='العلاج التنفسي' OR cmb_selection_2 ='العلاج التنفسي' " +
            "OR cmb_selection_3 ='العلاج التنفسي') AND current_status='Submitted' AND academia_selection='H' ORDER BY school_total_converted DESC";

        SQLTop_ER.SelectCommand = "SELECT TOP 30 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3,local_id," +
            "first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted,school_calculated_gpa," +
            "school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2 " +
            "FROM registration_main,highschool_records WHERE highschool_records.applicant_id=registration_main.id AND cmb_selection_1 NOT IN('كلية الطب') AND (cmb_selection_1 ='خدمات الإسعاف والطوارئ' OR " +
            "cmb_selection_2 ='خدمات الإسعاف والطوارئ' OR cmb_selection_3 ='خدمات الإسعاف والطوارئ') AND current_status='Submitted' " +
            "AND academia_selection='H' AND highschool_records.id NOT IN(SELECT id FROM highschool_records WHERE cmb_selection_1 NOT IN('كلية الطب') " +
            "AND (cmb_selection_1 ='العلاج التنفسي' OR cmb_selection_2 ='العلاج التنفسي' OR cmb_selection_3 ='العلاج التنفسي'))" +
            "ORDER BY school_total_converted DESC";

        SQLTop_Lab.SelectCommand = "SELECT TOP 30 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3,local_id," +
            "first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted,school_calculated_gpa," +
            "school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2 " +
            "FROM registration_main,highschool_records WHERE highschool_records.applicant_id=registration_main.id AND cmb_selection_1 NOT IN('كلية الطب') AND (cmb_selection_1 ='علوم المختبرات الطبية' " +
            "OR cmb_selection_2 ='علوم المختبرات الطبية' OR cmb_selection_3 ='علوم المختبرات الطبية') AND current_status='Submitted' " +
            "AND academia_selection='H' AND highschool_records.id NOT IN(SELECT highschool_records.id FROM registration_main WHERE cmb_selection_1 NOT IN('كلية الطب') AND " +
            "(cmb_selection_1 ='خدمات الإسعاف والطوارئ' OR cmb_selection_2 ='خدمات الإسعاف والطوارئ' OR " +
            "cmb_selection_3 ='خدمات الإسعاف والطوارئ')) ORDER BY school_total_converted DESC";

        //invitation source
        SQLMedicine_Invited.SelectCommand = "SELECT registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3," +
            "local_id,first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted," +
            "school_calculated_gpa,school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2,interview_marks " +
            "FROM registration_main,applicant_invitation,highschool_records WHERE highschool_records.applicant_id=registration_main.id AND " +
            "applicant_invitation.applicant_id=registration_main.id AND current_status IN ('Invited','Acknowledged','Interviewed') AND cmb_selection_1='كلية الطب' ORDER BY " +
            "school_total_converted DESC";

        SQLRespiratory_Invited.SelectCommand = "SELECT registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3," +
            "local_id,first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted," +
            "school_calculated_gpa,school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2,interview_marks " +
            "FROM registration_main,applicant_invitation,highschool_records WHERE highschool_records.applicant_id=registration_main.id AND applicant_invitation.applicant_id=highschool_records.applicant_id AND cmb_selection_1 " +
            "NOT IN('كلية الطب') AND (cmb_selection_1 ='العلاج التنفسي' OR cmb_selection_2 ='العلاج التنفسي' " +
            "OR cmb_selection_3 ='العلاج التنفسي') AND current_status IN ('Invited','Acknowledged','Interviewed') ORDER BY school_total_converted DESC";

        SQLER_Invited.SelectCommand = "SELECT TOP 30 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3,local_id,interview_marks," +
            "first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted,school_calculated_gpa, " +
            "school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2 " +
            "FROM registration_main,highschool_records,applicant_invitation WHERE highschool_records.applicant_id=registration_main.id AND registration_main.id=applicant_invitation.applicant_id "+
            "AND current_status IN ('Invited','Acknowledged','Interviewed') AND criteria ='E' " +
            "ORDER BY school_total_converted DESC ";

        SQLLAB_Invited.SelectCommand = "SELECT TOP 30 registration_main.id,cmb_selection_1,cmb_selection_2,cmb_selection_3,local_id,interview_marks," +
            "first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted,school_calculated_gpa, " +
            "school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2 " +
            "FROM registration_main,highschool_records,applicant_invitation WHERE highschool_records.applicant_id=registration_main.id AND registration_main.id=applicant_invitation.applicant_id " +
            "AND current_status IN ('Invited','Acknowledged','Interviewed') AND criteria ='L' " +
            "ORDER BY school_total_converted DESC ";

    }
    protected void Page_Load(object sender, EventArgs e)
    {

        mCheckLogin();

        if (!IsPostBack)
        {
            loadGrird();
        }
        
    }
    private void mCheckLogin()
    {
        if (Session.Count == 0 || Session["Admin"] == null)
        {
            Response.Redirect("index.aspx");
        }
        else if (Session["Admin"] != null)
        {
            if (!Session["Admin"].ToString().Equals("Login"))
            {
                Response.Redirect("index.aspx");
            }
        }       
    }

    protected void GoUp(object o, EventArgs e)
    {        
    //    if (lst_order.SelectedIndex == null) return;

    //    string strSelected = lst_order.SelectedItem.Text;

    //    int intCurrentIndex = lst_order.SelectedIndex;
    //    string strValue = lst_order.SelectedValue;
    //    if (intCurrentIndex == 0) return;

    //    lst_order.Items.RemoveAt(intCurrentIndex);        
    //    lst_order.Items.Insert(intCurrentIndex - 1, strSelected);

    //    lst_order.Items[intCurrentIndex - 1].Selected = true;
    //    lst_order.Items[intCurrentIndex - 1].Value = strValue;

    //    string strParam = ",";
    //    for (int i = 0; i <= lst_order.Items.Count - 1; i++)
    //    {
    //        strParam += lst_order.Items[i].Value + " DESC,";
    //    }

    //    strParam = strParam.Remove(strParam.Length - 1);
    //    Param1_source.SelectCommand = "SELECT id,local_id,first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted ,school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2  FROM registration_main WHERE current_status='Submitted' AND academia_selection='H' ORDER BY school_total_converted DESC " + strParam;            
    }

    protected void GoDown(object o, EventArgs e)
    {

        //if (lst_order.SelectedIndex == null) return;

        //string strSelected = lst_order.SelectedItem.Text;

        //int intCurrentIndex = lst_order.SelectedIndex;
        //string strValue = lst_order.SelectedValue;
        //if (intCurrentIndex == 2) return;

        //lst_order.Items.RemoveAt(intCurrentIndex);
        //lst_order.Items.Insert(intCurrentIndex +1, strSelected);

        //lst_order.Items[intCurrentIndex + 1].Selected = true;
        //lst_order.Items[intCurrentIndex + 1].Value = strValue;

        //string strParam = ",";
        //for (int i = 0; i <= lst_order.Items.Count - 1; i++)
        //{
        //    strParam += lst_order.Items[i].Value + " DESC,";
        //}

        //strParam = strParam.Remove(strParam.Length - 1);
        //Param1_source.SelectCommand = "SELECT id,local_id,first_name_a + ' ' + father_name_a + ' ' + grand_father_a + ' '+ last_name_a [Name],school_total_converted ,school_calculated_gpa,school_actual_godarat,school_actual_tahseeli,current_status,email_address_1,emailaddress_2  FROM registration_main WHERE current_status='Submitted' AND academia_selection='H' ORDER BY school_total_converted DESC " + strParam;            
    }

    protected void ToData(object o, EventArgs e)
    {
        //if (cmb_top.SelectedIndex == cmb_top.Items.Count - 1)
        //{
        //    txtsubmissionDateFrom.Enabled = true;
        //    txtsubmissionDateTo.Enabled = true;

        //    lblFrom.Enabled = true;
        //    lblTo.Enabled = true;
        //    btnOk.Enabled = true;
        //}
        //else
        //{
        //    txtsubmissionDateFrom.Enabled = false;
        //    txtsubmissionDateTo.Enabled = false;
        //    lblFrom.Enabled = false ;
        //    lblTo.Enabled = false;
        //    btnOk.Enabled = false;
        //}
    }

    protected void Custom_Click(object o, EventArgs e)
    {
        
    }
    protected void Invite_Clicked(object o, EventArgs e)
    {
        //try
        //{
        //    string HOST_NAME = "mail.med.ksuhs.edu.sa";
        //    int PORT = 25;

        //    string FROM = "hr@ksauhs-med.edu.sa";
        //    MailMessage MailMessage = new MailMessage();
        //    MailMessage.From = new MailAddress(FROM);

        //    foreach (DataGridItem dg in grd_order_1.Items)
        //    {
        //        CheckBox chk = (CheckBox)dg.FindControl("chkInviteForInterview");
        //        if (chk.Checked == true)
        //        {
        //            Label lblApplicantID = (Label)dg.FindControl("lblApplicantID");

        //            GeneralClass.Program.Add("current_status", "Invited", "S");
        //            int intRetID = GeneralClass.Program.UpdateRecordStatement("Registration_main", "id", lblApplicantID.Text);
        //            if (intRetID > 0)
        //            {
        //                GeneralClass.Program.Add("applicant_id", lblApplicantID.Text, "I");
        //                GeneralClass.Program.Add("stage", "1", "I");

        //                GeneralClass.Program.InsertRecordStatement("applicant_invitation");

        //            }
                   
        //                Label lblEmailAddress_1 = (Label)dg.FindControl("lblEmail_1");
        //                Label lblEmailAddress_2 = (Label)dg.FindControl("lblEmail_2");

        //                if (lblEmailAddress_1 != null && lblEmailAddress_1.Text != "")
        //                    MailMessage.To.Add(new MailAddress(lblEmailAddress_1.Text));
        //                if (lblEmailAddress_2 != null && lblEmailAddress_2.Text != "")
        //                    MailMessage.To.Add(new MailAddress(lblEmailAddress_2.Text));
        //        }
        //    }
        //    loadGrird();
        //    MailMessage.Subject = "regarding your application";
        //    MailMessage.Body = "This is the content";

        //    SmtpClient client = new SmtpClient();
        //    client.Host = HOST_NAME;
        //    client.Port = PORT;
        //    client.Send(MailMessage);
        //}
        //catch (SmtpException exp)
        //{
            
        //}
    }
    protected void Checkfn(object o, EventArgs e)
    {
       
    }
    protected void SelectAllMedicineApps(object o, EventArgs e)
    {
        foreach (DataGridItem dg in grd_top_60_medicine.Items)
        {
            CheckBox chk = (CheckBox)dg.FindControl("chk_top_medicine");
            if (chk != null)
            {
                if (btnSelectAllMedicineApp.Text == "Check all")
                    chk.Checked = true;
                else
                    chk.Checked = false;
            }
        }
        if (btnSelectAllMedicineApp.Text == "Check all")
            btnSelectAllMedicineApp.Text = "Un Check all";
        else
            btnSelectAllMedicineApp.Text = "Check all";
    }
    protected void SelectAllRespiratoryApps(object o, EventArgs e)
    {
        foreach (DataGridItem dg in grd_top_30_respiratory.Items)
        {
            CheckBox chk = (CheckBox)dg.FindControl("chk_top_respiratory");
            if (chk != null)
            {
                if (btnSelectRespiratory.Text == "Check all")
                    chk.Checked = true;
                else
                    chk.Checked = false;
            }
        }
        if (btnSelectRespiratory.Text == "Check all")
            btnSelectRespiratory.Text = "Un Check all";
        else
            btnSelectRespiratory.Text = "Check all";
    }

    protected void InviteRespiratoryApps(object o, EventArgs e)
    {
        foreach (DataGridItem dg in grd_top_30_respiratory.Items)
        {
            CheckBox chk = (CheckBox)dg.FindControl("chk_top_respiratory");
            if (chk != null)
            {
                if (chk.Checked == true)
                {
                    Label lblID = (Label)dg.FindControl("lblAuthNumber_3");
                    if (lblID != null)
                    {
                        //=========inserting the selected data into 
                        //=========the table and updating the status accordingly
                        GeneralClass.Program.Add("applicant_id", lblID.Text, "I");
                        GeneralClass.Program.Add("stage", "1", "I");
                        GeneralClass.Program.Add("criteria", "R", "S");

                        int SintRetID = GeneralClass.Program.InsertRecordStatement("applicant_invitation");
                        if (SintRetID > 0)
                        {
                            GeneralClass.Program.Add("current_status", "Invited", "S");
                            GeneralClass.Program.UpdateRecordStatement("registration_main", "id", lblID.Text);

                            Label lblEmailAddress_1 = (Label)dg.FindControl("lblEmail_Resp_1");
                            Label lblEmailAddress_2 = (Label)dg.FindControl("lblEmail_Resp_2");

                            if (lblEmailAddress_1.Text != null && lblEmailAddress_1.Text != "")
                                GeneralClass.Program.SendMail("hr@med.sa", lblEmailAddress_1.Text, "Interview Invitation", "Congradulations..");
                            if (lblEmailAddress_2.Text != null && lblEmailAddress_2.Text != "")
                                GeneralClass.Program.SendMail("hr@med.sa", lblEmailAddress_2.Text, "Interview Invitation", "Congradulations..");
                        }
                    }
                }
            }
        }
        try
        {
            loadGrird();            
        }
        catch (SmtpException exp)
        {
        }
    }
    protected void InviteMedicineApps(object o, EventArgs e)
    {
        //string HOST_NAME = "mail.med.ksuhs.edu.sa";
        //int PORT = 25;
        //string FROM = "hr@ksauhs-med.edu.sa";
        //MailMessage MailMessage = new MailMessage();
        //MailMessage.From = new MailAddress(FROM);

        foreach (DataGridItem dg in grd_top_60_medicine.Items)
        {
            CheckBox chk = (CheckBox)dg.FindControl("chk_top_medicine");
            if (chk != null)
            {
                if (chk.Checked == true)
                {                    
                    Label lblID = (Label)dg.FindControl("lblAuthNumber_2");
                    if (lblID != null)
                    {
                        //=========inserting the selected data into 
                        //=========the table and updating the status accordingly
                        GeneralClass.Program.Add("applicant_id",lblID.Text,"I");
                        GeneralClass.Program.Add("stage", "1", "I");
                        GeneralClass.Program.Add("criteria","M","S");

                        int SintRetID = GeneralClass.Program.InsertRecordStatement("applicant_invitation");
                        if (SintRetID > 0)
                        {
                            GeneralClass.Program.Add("current_status", "Invited", "S");
                            GeneralClass.Program.UpdateRecordStatement("registration_main", "id", lblID.Text);

                            Label lblEmailAddress_1 = (Label)dg.FindControl("lblEmail_1");
                            Label lblEmailAddress_2 = (Label)dg.FindControl("lblEmail_2");

                            if (lblEmailAddress_1 != null && lblEmailAddress_1.Text != "")
                                GeneralClass.Program.SendMail("Addmission@ngha.med.sa", lblEmailAddress_1.Text, "Interview Invitation", "Conguratulations... This email is to inform you that you have chosen for interview");
                            if (lblEmailAddress_2 != null && lblEmailAddress_2.Text != "")
                                GeneralClass.Program.SendMail("Addmission@ngha.med.sa", lblEmailAddress_2.Text, "Interview Invitation", "Conguratulations... This email is to inform you that you have chosen for interview");
                        }
                    }
                }
            }
        }
        try
        {
            loadGrird();
            //SmtpClient client = new SmtpClient();
            //client.Host = HOST_NAME;
            //client.Port = PORT;
            //client.Send(MailMessage);
        }
        catch (SmtpException exp)
        {
        }
    }
    protected void SaveRespiratoryInterviewMarks(object o, EventArgs e)
    {
        Button btn = (Button)o;
             //=======Looping through the datagrid control================
        foreach (DataGridItem dg in DataGrid2.Items)
        {
            //=======Text Box value to get the interview marks===========
            TextBox txtMarks = (TextBox)dg.FindControl("txtRespiratoryInterview");
            if (txtMarks != null && txtMarks.Text != "")
            {
                //applicant id from the database table
                Label lblID = (Label)dg.FindControl("lblInvited_Respiratory_id");
                if (lblID != null)
                {
                    //========searching for the interviewed attended check box=======
                    CheckBox chkInterview = (CheckBox)dg.FindControl("chk_respiratory_interview_attended");
                    if (chkInterview.Enabled == true)
                    {
                        if (chkInterview.Checked == true)
                        {
                            GeneralClass.Program.Add("interview_marks", txtMarks.Text, "I");
                            int intReturnID = GeneralClass.Program.UpdateRecordStatement("applicant_invitation", "applicant_id", lblID.Text);
                            if (intReturnID > 0)
                            {
                                GeneralClass.Program.Add("current_status", "Interviewed", "S");
                                Label lblStageStatus = (Label)dg.FindControl("lblStageStatus");
                                if (lblStageStatus != null)
                                {
                                    lblStageStatus.Text = "Interviewed";
                                }
                            }
                        }
                    }
                    chkInterview.Enabled = false;
                }
                txtMarks.Enabled = false;
                btn.Enabled = false;
            }
        }
        loadGrird();
    }
    protected void SaveInterviewMarks(object o, EventArgs e)
    {
        Button btnTemp = (Button)o;

            //=======Looping through the datagrid control================
        foreach (DataGridItem dg in grd_invited_medicine.Items)
        {
            //=======Text Box value to get the interview marks===========
            TextBox txtMarks = (TextBox)dg.FindControl("txtMedicineInterview");
            if (txtMarks != null && txtMarks.Text!="")
            {
                //applicant id from the database table
                Label lblID = (Label)dg.FindControl("lblInvited_medicine_id");
                if (lblID != null)
                {
                    //========searching for the interviewed attended check box=======
                     CheckBox chkInterview=(CheckBox)dg.FindControl("chk_medcine_interview_attended");
                     
                     if (chkInterview.Enabled == true)
                     {
                         if (chkInterview.Checked == true)
                         {
                             GeneralClass.Program.Add("interview_marks", txtMarks.Text, "I");
                             int intReturnID = GeneralClass.Program.UpdateRecordStatement("applicant_invitation", "applicant_id", lblID.Text);
                             if (intReturnID > 0)
                             {
                                 GeneralClass.Program.Add("current_status", "Interviewed", "S");
                                 GeneralClass.Program.UpdateRecordStatement("registration_main", "id", lblID.Text);
                             }
                             chkInterview.Enabled = false;
                             txtMarks.Enabled = false;
                         }
                     }
                     
                }
            }
        }
        loadGrird();
        btnTemp.Enabled = false;
       
    }
    protected void InviteERApps(object o, EventArgs e)
    {
        foreach (DataGridItem dg in grd_top_30_er.Items)
        {
            CheckBox chk = (CheckBox)dg.FindControl("chk_top_er");
            if (chk != null)
            {
                if (chk.Checked == true)
                {
                    Label lblID = (Label)dg.FindControl("lblAuto_ER_Number");
                    if (lblID != null)
                    {
                        //=========inserting the selected data into 
                        //=========the table and updating the status accordingly
                        GeneralClass.Program.Add("applicant_id", lblID.Text, "I");
                        GeneralClass.Program.Add("stage", "1", "I");
                        GeneralClass.Program.Add("criteria", "E", "S");

                        int SintRetID = GeneralClass.Program.InsertRecordStatement("applicant_invitation");
                        if (SintRetID > 0)
                        {
                            GeneralClass.Program.Add("current_status", "Invited", "S");
                            GeneralClass.Program.UpdateRecordStatement("registration_main", "id", lblID.Text);

                            Label lblEmailAddress_1 = (Label)dg.FindControl("lblEmail_1");
                            Label lblEmailAddress_2 = (Label)dg.FindControl("lblEmail_2");

                            if (lblEmailAddress_1 != null && lblEmailAddress_1.Text != "")
                                GeneralClass.Program.SendMail("Addmission@ngha.med.sa", lblEmailAddress_1.Text, "Interview Invitation", "Congralutions");
                            if (lblEmailAddress_2 != null && lblEmailAddress_2.Text != "")
                                GeneralClass.Program.SendMail("Addmission@ngha.med.sa", lblEmailAddress_2.Text, "Interview Invitation", "Congralutions");
                        }
                    }
                }
            }
        }
        try
        {
            loadGrird();
           
        }
        catch (SmtpException exp)
        {
        }
        
    }
    protected void SaveERInterviewMarks(object o, EventArgs e)
    {
        Button btnTemp = (Button)o;

        //=======Looping through the datagrid control================
        foreach (DataGridItem dg in grd_er_invite.Items)
        {
            //=======Text Box value to get the interview marks===========
            TextBox txtMarks = (TextBox)dg.FindControl("txtERInterview");
            if (txtMarks != null && txtMarks.Text != "")
            {
                //applicant id from the database table
                Label lblID = (Label)dg.FindControl("lblInvited_ER_id");
                if (lblID != null)
                {
                    //========searching for the interviewed attended check box=======
                    CheckBox chkInterview = (CheckBox)dg.FindControl("chk_er_interview_attended");

                    if (chkInterview.Enabled == true)
                    {
                        if (chkInterview.Checked == true)
                        {
                            GeneralClass.Program.Add("interview_marks", txtMarks.Text, "I");
                            int intReturnID = GeneralClass.Program.UpdateRecordStatement("applicant_invitation", "applicant_id", lblID.Text);
                            if (intReturnID > 0)
                            {
                                GeneralClass.Program.Add("current_status", "Interviewed", "S");
                                GeneralClass.Program.UpdateRecordStatement("registration_main", "id", lblID.Text);
                            }
                            chkInterview.Enabled = false;
                            txtMarks.Enabled = false;
                        }
                    }

                }
            }
        }
        loadGrird();
        btnTemp.Enabled = false;
    }
    protected void LogOut(object o, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("AdminLogin.aspx");
    }
}
