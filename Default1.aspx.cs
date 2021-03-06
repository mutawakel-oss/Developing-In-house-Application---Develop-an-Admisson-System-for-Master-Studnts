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
using CalendarExt;
using System.Data.Odbc;
using System.IO;
using System.Drawing;
using System.Resources;
using System.Globalization;
using System.Threading;
public partial class _Default : System.Web.UI.Page
{
    //Tab_4=High School
    //Tab_5=Graduation
    //Tab_6=High School Selection
    ResourceManager rm;

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {           
         
            GeneralClass.Program.AddComboItems("t_country_master", "country_name", "id", cmbSchoolCountry);
            if (Session["StudentID"] != null)
                fetchStudentData();
        }
        CultureInfo ci;
        Thread.CurrentThread.CurrentCulture = new CultureInfo("ar-SA");
        //rm = new ResourceManager("Resources.Strings", System.Reflection.Assembly.Load("App_GlobalResources"));
        //ci = Thread.CurrentThread.CurrentCulture;
        //asp_txtFirstName_A.ErrorMessage = "الرجاء إدخالها نظراً لأهميتها" +
        //                                "<br><B>الإسم الأول</B>";
    }
    private void LoadStrings(CultureInfo ci)
    {
       
    }
    protected void OkClicked(object o, EventArgs e)
    {
        btnFetchData.Visible = true;
        btn_save.Enabled = true;
        btn_next_stage.Enabled = true;
        Button rad = (Button)o;
        if (rad.ID.ToString() == "btnOK1")
        {
            radHighSchool.Checked = true;
            btn_stage_3.Visible = true;
            img_tab_3.Visible = true;
            btn_stage_5.Visible = true;
            img_tab_5.Visible = true;
            btn_stage_4.Visible = false;
            img_tab_4.Visible = false;

            TabPanel tp_3 = (TabPanel)MainTab.FindControl("Tab_3");
            if (tp_3 != null)
            {
                tp_3.Enabled = true;
            }

            TabPanel tp_5 = (TabPanel)MainTab.FindControl("Tab_5");
            if (tp_5 != null)
            {
                tp_5.Enabled = true;
            }

        }
        

        lnkGraduation.Enabled = false;
        lnkHighSchool.Enabled = false;

        TabPanel tp = (TabPanel)MainTab.FindControl("Tab_1");
        MainTab.ActiveTab = tp;
        btn_next_stage.ValidationGroup = "Tab_2";
        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_0");
        if (img != null)
            img.ImageUrl = "Images/moduleEnabled.gif";
        return;
    }
    protected void lblValidateID_Click(object o, EventArgs e)
    {
       
        if (txtLocalID.Text != "")
        {
            System.Data.Odbc.OdbcDataReader reader = GeneralClass.Program.gRetrieveHistory(this.txtLocalID.Text.Trim(), "14271426");
            try
            {
                if (!reader.HasRows)
                {
                    ModalPopupExtender1.Show();
                    reader.Close();
                    return;
                }
                while (reader.Read())
                {
                    CalendarLibrary cl = new CalendarLibrary();
                    cl.Dates();

                    txtDOB.Text = cl.HijriToGreg(reader["birth_date"].ToString());
                    txtHijriDOB.Text = reader["birth_date"].ToString();
                    txtPOB.Text = reader["birth_place"].ToString();

                    int intFName = reader["st_name"].ToString().IndexOf(" ");
                    int intLName = reader["st_name"].ToString().LastIndexOf(" ");
                    txtFirstName_A.Text = reader["st_name"].ToString().Substring(0, intFName);
                    txtLastName_A.Text = reader["st_name"].ToString().Substring(intLName);
                    txtGrandFatherName_A.Text = reader["st_name"].ToString().Substring(intFName, intLName);
                    txtIDIssuedDate.Text = cl.HijriToGreg(reader["card_issued_date"].ToString());
                    txtidissuedplace.Text = reader["card_issued_place"].ToString();
                    txtGeneralPercentage.Text = reader["GPA"].ToString();
                    double dml1 = double.Parse(txtGeneralPercentage.Text);
                    double dml2 = (dml1 * 35) / 100;

                    txtGPAComputed.Text =dml2.ToString();
                    cmbSchoolName.Text = reader["schoolname"].ToString();                    
                }

                reader.Close();

               
                decimal aptitudeexam = 0;
                decimal knowledgeexam=0;
               

                reader = GeneralClass.Program.gRetrieveRecord("SELECT aptitudemarks,knowledge_exam FROM new_aptitude_exam WHERE [local id]='" + txtLocalID.Text.Trim() + "'");
                while (reader.Read())
                {
                    aptitudeexam = decimal.Parse(reader["aptitudemarks"].ToString());
                    txtGodarat.Text = aptitudeexam.ToString();

                    double dblGod = double.Parse(txtGodarat.Text);
                    double dblGod2 = dblGod *0.30;

                    txtGodaratFinal.Text = dblGod2.ToString();

                    knowledgeexam = decimal.Parse(reader["knowledge_exam"].ToString());
                    txtKnowExam.Text = knowledgeexam.ToString();

                    double dblKnow = double.Parse(txtKnowExam.Text);
                    double dblKnow2 = dblKnow * 0.35;

                    txtFinalKnowledgeExam.Text = dblKnow2.ToString();
                }
                reader.Close();
                //if(txtGPAComputed.Text!="" && txtScintificMarksConverted.Text!="" && txtGodaratFinal.Text!="" && txtFinalKnowledgeExam.Text!="")
                //{
                double dblTotal = Convert.ToDouble(txtGPAComputed.Text) +
                    Convert.ToDouble(txtGodaratFinal.Text) +
                    Convert.ToDouble(txtFinalKnowledgeExam.Text);
                txtTotalConvertedMarks.Text = dblTotal.ToString();
                //}
                
            }
            
            catch (System.Data.Odbc.OdbcException exp)
            {
                if (reader != null)
                    reader.Close();
            }        
        }
        
    }

    protected void Selected(object o, EventArgs e)
    {
        //Wizard1.ActiveStepIndex = 1;
        DropDownList dpl = (DropDownList)o;

        if (dpl.ID == "cmb1")
        {
            btnClear.Enabled = true;
            cmb1.Enabled = false;
            cmb2.Enabled = true;
            cmb2.Items.Clear();
            cmb2.Items.Add("الإختيار الثاني");
            cmb2.Items.Add("كلية الطب");
            cmb2.Items.Add("علوم المختبرات الطبية");
            cmb2.Items.Add("العلاج التنفسي");
            cmb2.Items.Add("خدمات الإسعاف والطوارئ");
            cmb2.Items[dpl.SelectedIndex].Enabled = false;
        }

        if (dpl.ID == "cmb2")
        {
            cmb2.Enabled = false;
            cmb3.Enabled = true;
            cmb3.Items[cmb1.SelectedIndex].Enabled = false;
            cmb3.Items[cmb2.SelectedIndex].Enabled = false;
        }
    }
    protected void ResetValues(object o, EventArgs e)
    {
        cmb1.Items.Clear();
        cmb1.Items.Add("الإختيار الأول");
        cmb1.Items.Add("كلية الطب");
        cmb1.Items.Add("علوم المختبرات الطبية");
        cmb1.Items.Add("العلاج التنفسي");
        cmb1.Items.Add("خدمات الإسعاف والطوارئ");

        cmb2.Items.Clear();
        cmb2.Items.Add("الإختيار الثاني");
        cmb2.Items.Add("كلية الطب");
        cmb2.Items.Add("علوم المختبرات الطبية");
        cmb2.Items.Add("العلاج التنفسي)");
        cmb2.Items.Add("خدمات الإسعاف والطوارئ");

        cmb3.Items.Clear();
        cmb3.Items.Add("الإختيار الثالث");
        cmb3.Items.Add("كلية الطب");
        cmb3.Items.Add("علوم المختبرات الطبية");
        cmb3.Items.Add("العلاج التنفسي");
        cmb3.Items.Add("خدمات الإسعاف والطوارئ");

        cmb1.Enabled = true;
        cmb2.Enabled = false;
        cmb3.Enabled = false;
    }

    protected void radHighSchool_CheckedChanged(object o, EventArgs e)
    {
        btn_save.Enabled = true;
        btn_next_stage.Enabled = true;
        RadioButton rad = (RadioButton)o;
        if (rad.ID.ToString() == "radHighSchool")
        {
            btn_stage_3.Visible=true;
	        img_tab_3.Visible=true;
	        btn_stage_5.Visible=true;
            img_tab_5.Visible = true;
            btn_stage_4.Visible =false;
            img_tab_4.Visible = false;

            TabPanel tp_3 = (TabPanel)MainTab.FindControl("Tab_3");
            if (tp_3 != null)
            {
                tp_3.Enabled = true;
            }

            TabPanel tp_5 = (TabPanel)MainTab.FindControl("Tab_5");
            if (tp_5 != null)
            {
                tp_5.Enabled = true;
            }
                
        }
        else
        {
            btn_stage_3.Visible = false;
            img_tab_3.Visible = false;
            btn_stage_5.Visible = false;
            img_tab_5.Visible = false;
            btn_stage_4.Visible = true;
            img_tab_4.Visible = true;


            TabPanel tp_4 = (TabPanel)MainTab.FindControl("Tab_4");
            if (tp_4 != null)
            {
                tp_4.Enabled = true;
            }
        }

        radGraduate.Enabled = false;
        radHighSchool.Enabled = false;
        
        TabPanel tp = (TabPanel)MainTab.FindControl("Tab_1");
        MainTab.ActiveTab = tp;
        btn_next_stage.ValidationGroup = "Tab_2";
        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_0");
        if (img != null)
            img.ImageUrl = "Images/moduleEnabled.gif";
        return;
    }
    protected void Actioned(object o, EventArgs e)
    {
        ImageButton btnSelected = (ImageButton)o;
        #region
        if (btnSelected.ID.ToString() == "btn_next_stage")
        {
            if (radGraduate.Checked == false && radHighSchool.Checked == false)
            {
                TabPanel tp_0 = (TabPanel)MainTab.FindControl("Tab_0");
                if (tp_0 != null)
                {
                    MainTab.ActiveTab = tp_0;                    
                    return;
                }
            }
            if (radHighSchool.Checked == true)
            {
                TabPanel tp_4 = (TabPanel)MainTab.FindControl("Tab_4");
                if (tp_4 != null)
                {
                    tp_4.Enabled = false;
                }
            }
            else if (radGraduate.Checked == true)
            {
                TabPanel tp_5 = (TabPanel)MainTab.FindControl("tp_5");
                if (tp_5 != null)
                {
                    tp_5.Enabled = false;
                }
 
            }

            if (this.MainTab.ActiveTabIndex == 1)
            {
                if (txtLocalID.Text.Trim() == "")
                {
                    lblLocalID.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblLocalID.ForeColor = System.Drawing.Color.Black;
                //==========================================
                if (txtFirstName_A.Text.Trim() == "")
                {
                    lblFirstName_Arabic.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }else
                    lblFirstName_Arabic.ForeColor = System.Drawing.Color.Black;

                //==========================================

                if (txtFirstName_E.Text.Trim() == "")
                {
                    lblFirstName_Eng.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }else
                    lblFirstName_Eng.ForeColor = System.Drawing.Color.Black;
                //==========================================

                if (txtFatherName_A.Text.Trim() == "")
                {
                    lblFatherName_A.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblFatherName_A.ForeColor = System.Drawing.Color.Black;

                //===========================================

                if (txtFatherName_E.Text.Trim() == "")
                {
                    lblFatherName_Eng.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblFatherName_Eng.ForeColor = System.Drawing.Color.Black;

                //===========================================

                if (txtGrandFatherName_A.Text == "")
                {
                    lblGrandfatherName_A.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }else
                    lblGrandfatherName_A.ForeColor = System.Drawing.Color.Black;
                //============================================

                if (txtGrandFatherName_E.Text == "")
                {
                    lblGrandFatherName_Eng.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblGrandFatherName_Eng.ForeColor = System.Drawing.Color.Black;
                //===========================================
                if (txtLastName_E.Text == "")
                {
                    lblLastName_Eng.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;                    
                }
                else
                    lblLastName_Eng.ForeColor = System.Drawing.Color.Black;
                //===========================================
                if (txtDOB.Text == "")
                {
                    lblDOB.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;                    
                }else
                    lblDOB.ForeColor = System.Drawing.Color.Black;
                //===========================================

                if (txtPOB.Text == "")
                {
                    lblPOB.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblPOB.ForeColor = System.Drawing.Color.Black;
                //===========================================
                if (txtIDIssuedDate.Text == "")
                {
                    lblIssuedDate.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblIssuedDate.ForeColor = System.Drawing.Color.Black;
                //===========================================
                if (txtIDExpDate.Text == "")
                {
                    lblExpdate.ForeColor = System.Drawing.Color.Red;
                    ModalPopupExtender3.Show();
                    return;
                }
                else
                    lblExpdate.ForeColor = System.Drawing.Color.Black;
                //===========================================
                TabPanel tp_2 = (TabPanel)MainTab.FindControl("Tab_2");
                if (tp_2 != null)
                {
                    MainTab.ActiveTab = tp_2;                    
                    System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_1");
                    {
                        if (img != null)
                        {
                            img.ImageUrl = "Images/moduleEnabled.gif";
                            img.Visible = true;
                            btn_stage_1.Visible = true;
                        }
                    }
                    return;
                }
            }
            if (this.MainTab.ActiveTabIndex == 2)
            {
                TabPanel tp_3 = (TabPanel)MainTab.FindControl("Tab_3");
                if (tp_3 != null)
                {
                    MainTab.ActiveTab = tp_3;
                    System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_2");
                    if (img != null)
                    {
                        img.ImageUrl = "Images/moduleEnabled.gif";
                        img.Visible = true;
                        btn_stage_2.Visible = true;
                    }
                    if (txtEMailAddress.Text.Trim() != "")
                        txtEMailII.Text = txtEMailAddress.Text;
                    return;
                    
                }
            }

            if (radGraduate.Checked == true)
            {
                if (this.MainTab.ActiveTabIndex == 3)
                {
                    TabPanel tp_4 = (TabPanel)MainTab.FindControl("Tab_4");
                    if (tp_4 != null)
                    {
                        MainTab.ActiveTab = tp_4;

                        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("Image34");
                        if (img != null)
                            img.ImageUrl = "Images/moduleEnabled.gif";
                        return;

                    }
                }

                if (this.MainTab.ActiveTabIndex == 4)
                {
                    TabPanel tp_6 = (TabPanel)MainTab.FindControl("Tab_6");
                    if (tp_6 != null)
                    {
                        MainTab.ActiveTab = tp_6;
                        return;
                    }
                }
            }
            else if(radHighSchool.Checked==true)
            {
                if (this.MainTab.ActiveTabIndex == 3)
                {
                    TabPanel tp_5 = (TabPanel)MainTab.FindControl("Tab_5");
                    if (tp_5 != null)
                    {
                        MainTab.ActiveTab = tp_5;
                        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_3");
                        if (img != null)
                        {
                            img.Visible = true;
                            btn_stage_3.Visible = true;
                            img.ImageUrl = "Images/moduleEnabled.gif";
                        }
                        return;
                    }
                }

                if (this.MainTab.ActiveTabIndex == 5)
                {
                    TabPanel tp_6 = (TabPanel)MainTab.FindControl("Tab_6");
                    if (tp_6 != null)
                    {
                        MainTab.ActiveTab = tp_6;
                        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_5");
                        if (img != null)
                        {
                            img.ImageUrl = "Images/moduleEnabled.gif";
                            img.Visible = true;
                            btn_stage_5.Visible = true;
                        }
                        return;
                    }
                }

                if (this.MainTab.ActiveTabIndex == 6)
                {
                    
                    //uploading images is NOT mandatory. In this case, the status image would be "X" marks
                    if (htmlIFImage.PostedFile == null || htmlIFImage1.PostedFile == null
                            || htmlIFImage2.PostedFile == null || htmlIFImage3.PostedFile == null)
                    {
                        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_6");
                        if (img != null)
                        {
                            img.ImageUrl = "Images/moduleEnabled.gif";
                            img.Visible = true;
                            btn_stage_6.Visible = true;
                        }
                        //return;
                    }

                    TabPanel tp_7 = (TabPanel)MainTab.FindControl("Tab_Login");
                    if (tp_7 != null)
                    {
                        MainTab.ActiveTab = tp_7;
                        
                        return;
                    }
                }

            }
        }
        else if (btnSelected.ID.ToString() == "btn_previous_stage")
        {
            if (this.MainTab.ActiveTabIndex == 6)
            {
               
                TabPanel tp_5 = (TabPanel)MainTab.FindControl("Tab_5");
                if (tp_5 != null)
                {
                    MainTab.ActiveTab = tp_5;
                }
                return;
            }
            if (this.MainTab.ActiveTabIndex == 5)
            {
                TabPanel tp_4 = (TabPanel)MainTab.FindControl("Tab_4");
                if (tp_4 != null)
                {
                    MainTab.ActiveTab = tp_4;
                }
                return;
            }
            if (this.MainTab.ActiveTabIndex == 4)
            {
                TabPanel tp_3 = (TabPanel)MainTab.FindControl("Tab_3");
                if (tp_3 != null)
                {
                    MainTab.ActiveTab = tp_3;
                }
                return;
            }
            if (this.MainTab.ActiveTabIndex == 3)
            {
                TabPanel tp_2 = (TabPanel)MainTab.FindControl("Tab_2");
                if (tp_2 != null)
                {
                    MainTab.ActiveTab = tp_2;
                }
                return;
            }
            if (this.MainTab.ActiveTabIndex == 2)
            {
                TabPanel tp_1 = (TabPanel)MainTab.FindControl("Tab_1");
                if (tp_1 != null)
                {
                    MainTab.ActiveTab = tp_1;
                }
                return;
            }
            if (this.MainTab.ActiveTabIndex == 1)
            {
                TabPanel tp_0 = (TabPanel)MainTab.FindControl("Tab_0");
                if (tp_0 != null)
                {
                    MainTab.ActiveTab = tp_0;
                }
                return;
            }
        }
        else if (btnSelected.ID.ToString() == "btn_save")
        {
            int intReturnID=SaveRecords();
            if (intReturnID == 0)
            {
                return;
            }
            #region First Image
            bool errorOccured = false;
            System.Drawing.Image image;
            
            if (htmlIFImage.PostedFile != null)
            {   
                if (htmlIFImage.PostedFile.FileName != "" && htmlIFImage.PostedFile.InputStream.Length != 0)
                {
                    try
                    {
                        image = System.Drawing.Image.FromStream(htmlIFImage.PostedFile.InputStream);
                    }
                    catch (Exception)
                    {
                        errorOccured = true;
                        return;
                    }
                    errorOccured = SaveImageToDb(image, Path.GetFileName(htmlIFImage.PostedFile.FileName), "الصورة الشخصية", intReturnID);
                    if (!errorOccured)
                    {
                        return;
                    }
                }
            }
            #endregion

            #region Second Image
            if (htmlIFImage1.PostedFile != null)
            {
                if (htmlIFImage1.PostedFile.FileName != "" && htmlIFImage1.PostedFile.InputStream.Length != 0)
                {
                    try
                    {
                        image = System.Drawing.Image.FromStream(htmlIFImage1.PostedFile.InputStream);
                    }
                    catch (Exception)
                    {
                        errorOccured = true;
                        return;
                    }
                    errorOccured = SaveImageToDb(image, Path.GetFileName(htmlIFImage1.PostedFile.FileName), "الصورة الشخصية", intReturnID);
                    if (!errorOccured)
                    {
                        return;
                    }
                }
            }
            #endregion

            TabPanel tp_7 = (TabPanel)MainTab.FindControl("Tab_7");
            if (tp_7 != null)
            {
                tp_7.Enabled = true;
                this.MainTab.ActiveTab = tp_7;
                //enable last image
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_7");
                if (img != null)
                {
                    img.ImageUrl = "Images/moduleEnabled.gif";
                    img.Visible = true;
                    btn_stage_7.Visible = true;
                }

                string HTMLText = "<IMG  src=images/logo.png><hr>";
                HTMLText +=" <table border=1 dir=rtl runat=server>";
                HTMLText += "<tr><td>"+"Student Name     :";
                HTMLText += "</td><td><b>" + txtFirstName_A.Text + ' ' + txtFatherName_A.Text +' '+ txtGrandFatherName_A.Text + ' ' + txtLastName_A.Text + "</b></td></tr>";
                HTMLText += "<tr><td>رقــم بطاقة الاحوال  :</td><td>" + txtLocalID.Text + "</td></tr>";
                HTMLText += "<tr><td>تاريـخ الميلاد" + ":</td><td>" + txtDOB.Text + "</td></tr>";
                if (radGraduate.Checked == true)
                {
                    
                    HTMLText += "<tr><td>Option selected:</td><td>مسار حملة الشهادة الثانوية</td></tr>";
                    HTMLText += "<tr><td>School Name</td><td>" + cmbSchoolName.Text+"</td></tr>";
                    HTMLText += "<tr><td>School City</td><td>"+txtSchoolCountryCity.Text +"</td></tr>";
                    HTMLText += "<tr><td>Graduation Date</td><td>"+txtSchoolGraduationDt.Text+"</td></tr>";
                    HTMLText += "<tr><td>Mobile</td><td>"+txtStudentMobile.Text+"</td></tr>";
                    HTMLText += "<tr><td>Telephone</td>"+txtHomePhone.Text+"</td></tr>";
                    HTMLText += "</table><br>";

                    HTMLText += "<table border=1 runat=server> <tr><td >&nbsp;</td><td  style=text-align:center>الدرجة الفعلية</td>" +
                        "<td align=Center>النقاط</td><td align=Center>الدرجة المكافئة</td></tr>";
                    HTMLText += "<tr><td align=right dir=ltr>النسبة العامة" + "</td><td>" + txtGeneralPercentage.Text + "</td><td>";
                    HTMLText += gpapoint.Text + "</td><td>" + txtGPAComputed.Text + "</td></tr>";

                    HTMLText += "<tr><td colspan=4 align=right dir=ltr>النسبة العلمية</td></tr><tr><td align=right dir=ltr>الكيمياء</td>";
                    HTMLText += "<td >" + txtChemistry_33.Text + " </td><td rowspan=3>" + txtScientificPoint.Text +
                        "<td rowspan=3>" + txtScintificMarksConverted.Text;
                    HTMLText += " </td></tr><tr><td align=right dir=ltr>الأحياء</td><td>" + txtBiology_32.Text + "</td></tr><tr>";
                    HTMLText += "<td align=right dir=ltr>الرياضيات</td><td>" + txtMaths_60.Text + "</td></tr><tr><td>الفيزياء</td><td>" + txtPhy.Text;
                    HTMLText += "</td><td>&nbsp</td><td>&nbsp</td></tr><tr ><td align=right dir=ltr>اللغة الإنجليزية</td><td >" + txtEnglish_80.Text;
                    HTMLText += "</td> <td>&nbsp;</td> <td>&nbsp;</td></tr><tr><td>إختبار القدرات</td><td>" + txtGodarat.Text + "<td>";
                    HTMLText += txtGodaratPoint.Text + "</td><td>" + txtGodaratFinal.Text + "</td></tr><tr><td>الإختبار التحصيلي</td>";
                    HTMLText += "<td>" + txtKnowExam.Text + "</td><td>" + txtKnowPoint.Text + "</td> <td>" + txtFinalKnowledgeExam.Text;
                    HTMLText += "</td></tr><tr><td ><b>الدرجة المكافئة الكلية</td><td>&nbsp;</td><td>&nbsp;</td><td>" + txtTotalConvertedMarks.Text;
                    HTMLText += "</td></tr></table>";

                }
                else
                {
                }

                txtSummary.Text = HTMLText;

                btn_save.Enabled = false;
            }
        }
        #endregion
    }
    private byte[] GetByteArray(System.Drawing.Image image)
    {        
        MemoryStream ms = new MemoryStream();
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        return ms.ToArray();
    }
    private bool SaveImageToDb(System.Drawing.Image image, string FileName, string type, int intRegistrationID)
    {
        OdbcCommand p_Command = new OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
        p_Command.CommandType = CommandType.StoredProcedure;
        //inserting the image
        OdbcParameter prm = p_Command.Parameters.Add("@certificate_image", OdbcType.Image);
        prm.Direction = ParameterDirection.Input;
        prm.Value = GetByteArray(image);

        OdbcParameter prm3 = p_Command.Parameters.Add("@id", OdbcType.Int);
        prm3.Direction = ParameterDirection.Input;
        prm3.Value = intRegistrationID;

        OdbcParameter prm2 = p_Command.Parameters.Add("@filename", OdbcType.VarChar);
        prm2.Direction = ParameterDirection.Input;
        prm2.Value = FileName;

        OdbcParameter prm4 = p_Command.Parameters.Add("@type", OdbcType.VarChar);
        prm4.Direction = ParameterDirection.Input;
        prm4.Value = type;

        p_Command.ExecuteNonQuery();

        return true;
    }
    protected void CopyAddress(object o, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        if (txtAddress_1_1.Text.Trim() != "")
        {
            txtAddress_2_1.Text = txtAddress_1_1.Text;
        }
        if (txtAddress_1_2.Text.Trim() != null)
        {
            txtAddress_2_2.Text = txtAddress_1_2.Text;
        }
        if (txtZip_1.Text.Trim() != null)
        {
            txtZip_2.Text = txtZip_1.Text;
        }
        if (txtPostal_1.Text.Trim() != "")
        {
            txtPostal_2.Text = txtPostal_1.Text;
        }
        if (txtCity_1.Text.Trim() != "")
        {
            txtCity_2.Text = txtCity_1.Text;
        }
        cmbCountry_2.Text = cmbCountry_1.Text;
        
        if(txtEmailAddress_2.Text!="")
            txtEMailAddress.Text = txtEmailAddress_2.Text;
        if(txtStudentMobile.Text!="")
            txtStudentMobile_2.Text=txtStudentMobile.Text;
        if(txtHomePhone.Text!="")
            txtHomeTelephone_2.Text = txtHomePhone.Text;
    }

    protected void CheckLogin(object o,EventArgs e)
    {
        if (txtEMailII.Text.Trim() == "")
        {
            lblLoginAvalStatus.Text = "الرجاء تعبئة جميع الحقول";
            return ;
        }
        else
        {
            System.Data.Odbc.OdbcDataReader reader = GeneralClass.Program.gRetrieveRecord("SELECT login FROM t_registration WHERE login='" + txtEMailII.Text.Trim() + "'");
            try
            {
                if (!reader.HasRows)
                {
                    lblLoginAvalStatus.Text = "يمكنك إستخدام هذا الإسم";
                    reader.Close();
                    return ;
                }
                else
                {
                    lblLoginAvalStatus.Text = "لقد تم حجز هذا الإسم من قبل شخص آخر. الرجاء إعادة المحاولة مرة ً أخرى";
                    //Session.Add("Login", "LOGIN_FAILED");
                    reader.Close();
                    return ;
                }

            }
            catch (System.Data.Odbc.OdbcException exp)
            {
                if (reader != null)
                    reader.Close();

                //Session.Add("Login", "LOGIN_FAILED");
                return ;
            }

        }
        return ;
    }

    protected void CalculateGrade(object o, EventArgs e)
    {
        for (int i = 1; i < grade.Rows.Count; i++)
        {
            this.grade.Rows[i].BackColor = System.Drawing.Color.Transparent;
        }
        if (txtGraduateGPA_1.Text.Trim() != "")
        {
            double dbtScore = Convert.ToDouble(txtGraduateGPA_1.Text);
            if (dbtScore >= 95)
            {
                this.grade.Rows[1].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 90)
            {
                this.grade.Rows[2].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 85)
            {
                this.grade.Rows[3].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 80)
            {
                this.grade.Rows[4].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 75)
            {
                this.grade.Rows[5].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 70)
            {
                this.grade.Rows[6].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 65)
            {
                this.grade.Rows[7].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 60)
            {
                this.grade.Rows[8].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore < 60)
            {
                this.grade.Rows[9].BackColor = System.Drawing.Color.CadetBlue;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int x = 1;
        if (x == 2)
        {
            ModalPopupExtender1.Show();
            this.Title = "Clicked";
            
        }
        lblValidateID_Click(sender, e);
    }

    private int SaveRecords()
    {
        if (txtLocalID.Text == "" || txtFirstName_A.Text == "" || txtFatherName_A.Text == "" || txtGrandFatherName_A.Text == "" || txtLastName_A.Text == ""
            || txtDOB.Text == "" || txtPOB.Text == "" || txtidissuedplace.Text == "" || txtIDIssuedDate.Text == "" || txtIDExpDate.Text == ""
           )
        {
            TabPanel tp_1 = (TabPanel)MainTab.FindControl("Tab_1");
            if (tp_1 != null)
            {
                MainTab.ActiveTab = tp_1;
                return 0;
            }
        }
        else
        {
            System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_1");
            {
                if (img != null)
                {
                    img.ImageUrl = "Images/moduleEnabled.gif";
                    img.Visible = true;
                    btn_stage_1.Visible = true;
                }
            }
        }

            if (txtAddress_1_1.Text == "" || txtPostal_1.Text == "" || txtZip_1.Text == "" || txtCity_1.Text == "" || txtStudentMobile.Text == "")
            {
                TabPanel tp_2 = (TabPanel)MainTab.FindControl("Tab_2");
                if (tp_2 != null)
                {
                    MainTab.ActiveTab = tp_2;
                    return 0;
                }
            }
            if (radHighSchool.Checked == true)
            {
                if (cmb1.SelectedIndex == 0 || cmb2.SelectedIndex == 0 || cmb3.SelectedIndex == 0)
                {
                    TabPanel tp_5 = (TabPanel)MainTab.FindControl("Tab_5");
                    if (tp_5 != null)
                    {
                        MainTab.ActiveTab = tp_5;
                        return 0;
                    }                    
                }
            }
            if (txtPassword.Text == "" || txtEMailII.Text == "" || txtRetypePWD.Text == "")
            {
                TabPanel tp_login = (TabPanel)MainTab.FindControl("Tab_Login");
                if (tp_login != null)
                {
                    MainTab.ActiveTab = tp_login;
                    return 0;
                }
            }
            else
            {
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_7");
                {
                    if (img != null)
                    {
                        img.ImageUrl = "Images/moduleEnabled.gif";
                        img.Visible = true;
                        btn_stage_7.Visible = true;
                    }
                }
            }

        //=============================================================
        if(radHighSchool.Checked==true)
        {
            GeneralClass.Program.Add("academia_selection", "H", "S");
        }
        else
            GeneralClass.Program.Add("academia_selection", "U", "S");

        GeneralClass.Program.Add("local_id", txtLocalID.Text, "I");
        GeneralClass.Program.Add("place_of_issue", txtidissuedplace.Text, "S");
        GeneralClass.Program.Add("date_of_issue", txtIDIssuedDate.Text, "S");
        GeneralClass.Program.Add("exp_date", txtIDExpDate.Text, "S");
        GeneralClass.Program.Add("login", txtEMailII.Text, "S");
        GeneralClass.Program.Add("password", txtPassword.Text, "S");

        GeneralClass.Program.Add("first_name_e", txtFirstName_E.Text, "S");
        GeneralClass.Program.Add("father_name_e", txtFatherName_E.Text, "S");
        GeneralClass.Program.Add("grand_father_e", txtGrandFatherName_E.Text, "S");
        GeneralClass.Program.Add("last_name_e", txtLastName_E.Text, "S");
        GeneralClass.Program.Add("first_name_a", txtFirstName_A.Text, "S");
        GeneralClass.Program.Add("father_name_a", txtFatherName_A.Text, "S");
        GeneralClass.Program.Add("grand_father_a", txtGrandFatherName_A.Text, "S");
        GeneralClass.Program.Add("last_name_a", txtLastName_A.Text, "S");

        GeneralClass.Program.Add("dob", txtDOB.Text, "S");
        GeneralClass.Program.Add("birth_place", txtPOB.Text, "S");
        GeneralClass.Program.Add("address_1_1", txtAddress_1_1.Text, "S");
        GeneralClass.Program.Add("address_1_2", txtAddress_1_2.Text, "S");
        GeneralClass.Program.Add("postal_code_1", txtPostal_1.Text, "S");
        GeneralClass.Program.Add("zip_code_1", txtZip_1.Text, "S");
        GeneralClass.Program.Add("city_name_1", txtCity_1.Text, "S");
        GeneralClass.Program.Add("country_id_1", cmbCountry_1.Text.ToString(), "S");


        GeneralClass.Program.Add("address_2_1", txtAddress_2_1.Text, "S");
        GeneralClass.Program.Add("address_2_2", txtAddress_2_2.Text, "S");
        GeneralClass.Program.Add("postal_code_2", txtPostal_2.Text, "S");
        GeneralClass.Program.Add("zip_code_2", txtZip_2.Text, "S");
        GeneralClass.Program.Add("city_name_2", txtCity_2.Text, "S");
        GeneralClass.Program.Add("country_id_2", cmbCountry_2.Text, "S");
        //Contacts
        GeneralClass.Program.Add("mobile", txtStudentMobile.Text, "S");
        GeneralClass.Program.Add("mobile_2", txtStudentMobile_2.Text, "S");

        GeneralClass.Program.Add("home_telephone", txtHomePhone.Text, "S");
        GeneralClass.Program.Add("home_telephone_2", txtHomeTelephone_2.Text, "S");
        
        GeneralClass.Program.Add("email_address_1", txtEMailAddress.Text, "S");
        GeneralClass.Program.Add("emailaddress_2", txtEmailAddress_2.Text, "S");


        //relatives
        GeneralClass.Program.Add("relative_name", txtRelativeName.Text, "S");
        GeneralClass.Program.Add("relation_ship", txtRelationship.Text, "S");
        GeneralClass.Program.Add("relative_mobile", txtRelativeMobile.Text, "S");
        GeneralClass.Program.Add("relative_phone_1", txtRelativePhone.Text, "S");

        GeneralClass.Program.Add("relative_name_2", txtRelativeName_2.Text, "S");
        GeneralClass.Program.Add("relation_ship_2", cmbRelationShip_2.Text, "S");
        GeneralClass.Program.Add("relative_mobile_2", txtRelativeMobile_2.Text, "S");
        GeneralClass.Program.Add("relative_phone_2", txtRelativePhone_2.Text, "S");


        //Academia records from here for school
        if (radHighSchool.Checked == true)
        {
            GeneralClass.Program.Add("school_name", cmbSchoolName.Text, "S");
            GeneralClass.Program.Add("school_city", txtSchoolCountryCity.Text, "S");
            GeneralClass.Program.Add("school_country", cmbSchoolCountry.Text, "S");
            GeneralClass.Program.Add("school_graduation_date", txtSchoolGraduationDt.Text, "S");

            GeneralClass.Program.Add("school_actual_gpa", txtGeneralPercentage.Text, "I");
            GeneralClass.Program.Add("school_calculated_gpa", txtGPAComputed.Text, "I");
            GeneralClass.Program.Add("school_godarat", txtGodaratFinal.Text, "I");
            GeneralClass.Program.Add("school_tahseeli", txtFinalKnowledgeExam.Text, "I");

            //Total
            GeneralClass.Program.Add("school_total_converted", txtTotalConvertedMarks.Text, "I");            
            
            GeneralClass.Program.Add("cmb_selection_1", cmb1.Text, "S");
            GeneralClass.Program.Add("cmb_selection_2", cmb2.Text, "S");
            GeneralClass.Program.Add("cmb_selection_3", cmb3.Text, "S");
        }
        else if (radGraduate.Checked == true)
        {
            GeneralClass.Program.Add("university_name", cmdUniversityName.Text, "S");
            GeneralClass.Program.Add("university_speciality", cmbUniversitySpecility.Text, "S");
            GeneralClass.Program.Add("college_name", txtUniCollegeName.Text, "S");
            GeneralClass.Program.Add("college_city", txtUniCountryCityName.Text, "S");
            GeneralClass.Program.Add("graduation_year_from", txtGraduationYearFrom.Text, "S");
            GeneralClass.Program.Add("graduation_year_to", txtGraduationYearTo.Text, "S");
            

            if (rad_university_grad_outof.Checked == true)
            {
                GeneralClass.Program.Add("marks_format", "O", "S");
                GeneralClass.Program.Add("out_of_param", cmdOutOf.Text, "I");
                GeneralClass.Program.Add("out_of_value", txtOutOfMarks.Text, "I");
            }
            else
            {
                GeneralClass.Program.Add("marks_format", "P", "S");
                GeneralClass.Program.Add("percentage_value", txtGraduateGPA_1.Text, "I");
            }
        }
        if (Session["StudentID"] == null)
            return GeneralClass.Program.InsertRecordStatement("registration_main");
        else
            return GeneralClass.Program.UpdateRecordStatement("registration_main", "id", Session["id"].ToString());
        
    }

    private void fetchStudentData()
    {
        if (Session["StudentID"] != null)
        {
            btnFetchData.Enabled = false;
            System.Data.Odbc.OdbcDataReader reader =GeneralClass.Program.gRetrieveRecord("SELECT * FROM registration_main WHERE id=" + Session["StudentID"].ToString());
            while (reader.Read())
            {
                if (reader["current_status"].ToString().Trim() == "Invited")
                {
                    MainTab.Tabs.Clear();

                    reader.Close();
                    Accordion1.Visible = false;
                    Accordion2.Visible = false;
                    MyAccordion.Visible = false;
                    Accordion3.Visible = false;
                    btn_save.Visible = false;
                    btn_next_stage.Visible = false;
                    btn_previous_stage.Visible = false;
                    btn_cancel_stage.Visible = false;

                    TabPanel tp_status = new TabPanel();
                    tp_status.HeaderText = "Status";
                    MainTab.Controls.Add(tp_status);

                    Table table_status = new Table();
                    
                    TableRow tr_1 = new TableRow();
                    TableCell tc_1 = new TableCell();

                    tc_1.Text = "Congradulations... <br>You are invited to attend the interview on [dd/mm/yyyy].Please click on the link bellow to acknoledge";

                    tr_1.Controls.Add(tc_1);
                    table_status.Controls.Add(tr_1);
                    

                    LinkButton lnkAck = new LinkButton();
                    lnkAck.Text = "Acknoledge";
                    
                    TableRow tr_2 = new TableRow();
                    TableCell tc_2 = new TableCell();
                    tr_2.Controls.Add(tc_2);
                    tc_2.Controls.Add(lnkAck);

                    tab_status.Controls.Add(tr_2);
                    tp_status.Controls.Add(table_status);

                    return;
                    
                }

                radHighSchool.Checked = true;
                radHighSchool.Enabled = false;
                radGraduate.Enabled = false;

                if (reader["academia_selection"].ToString() == "H")
                {                  
                    TabPanel tp_3 = (TabPanel)MainTab.FindControl("Tab_3");
                    if (tp_3 != null)
                    {
                        tp_3.Enabled = true;
                    }

                    TabPanel tp_5 = (TabPanel)MainTab.FindControl("Tab_5");
                    if (tp_5 != null)
                    {
                        tp_5.Enabled = true;
                    }

                }
                else
                {
                    TabPanel tp_4 = (TabPanel)MainTab.FindControl("Tab_4");
                    if (tp_4 != null)
                    {
                        tp_4.Enabled = true;
                    }
                }
                txtLocalID.Text = reader["local_id"].ToString();
                txtidissuedplace.Text = reader["place_of_issue"].ToString();
                txtIDIssuedDate.Text = reader["place_of_issue"].ToString();
                txtIDExpDate.Text = reader["exp_date"].ToString();

                txtFirstName_A.Text = reader["first_name_a"].ToString();
                txtFatherName_A.Text = reader["father_name_a"].ToString();
                txtGrandFatherName_A.Text = reader["grand_father_a"].ToString();
                txtLastName_A.Text = reader["last_name_a"].ToString();

                txtFirstName_E.Text = reader["first_name_e"].ToString();
                txtFatherName_E.Text = reader["father_name_e"].ToString();
                txtGrandFatherName_E.Text = reader["grand_father_e"].ToString();
                txtLastName_E.Text = reader["last_name_e"].ToString();

                txtDOB.Text = reader["dob"].ToString();
                txtPOB.Text = reader["birth_place"].ToString();
                txtEMailII.Text = reader["login"].ToString();
                txtPassword.Text = reader["password"].ToString();
                txtRetypePWD.Text = reader["password"].ToString();

                txtAddress_1_1.Text = reader["address_1_1"].ToString();
                txtAddress_1_2.Text = reader["address_1_2"].ToString();
                txtZip_1.Text = reader["zip_code_1"].ToString();
                txtPostal_1.Text = reader["postal_code_1"].ToString();
                txtCity_1.Text = reader["city_name_1"].ToString();

                txtAddress_2_1.Text = reader["address_2_1"].ToString();
                txtAddress_2_2.Text = reader["address_2_2"].ToString();
                txtPostal_2.Text = reader["postal_code_2"].ToString();
                txtCity_2.Text = reader["city_name_2"].ToString();
                
                txtStudentMobile.Text = reader["mobile"].ToString();

                //academia
              

                
            }
            reader.Close();
        }
    }

    protected void EnableSchoolParam(object o, EventArgs e)
    {
        txtGeneralPercentage.Enabled = true;
        //txtChemistry_33.Enabled = true;
        //txtBiology_32.Enabled = true;
        //txtMaths_60.Enabled = true;
        //txtPhy.Enabled = true;
        //txtEnglish_80.Enabled = true;
        txtGodarat.Enabled = true;
        txtKnowExam.Enabled = true;
    }
    protected void CalculateSchoolParam(object o, EventArgs e)
    {
        double dml1 = double.Parse(txtGeneralPercentage.Text);
        double dml2 = (dml1 * 35)/100;
        txtGPAComputed.Text = dml2.ToString();

        double dblGod = double.Parse(txtGodarat.Text);
        double dblGod2 = dblGod * 0.30;
        txtGodaratFinal.Text = dblGod2.ToString();

        double dblKnow = double.Parse(txtKnowExam.Text);
        double dblKnow2 = dblKnow * 0.35;
        txtFinalKnowledgeExam.Text = dblKnow2.ToString();

        double dblTotal = Convert.ToDouble(txtGPAComputed.Text) +
                   Convert.ToDouble(txtGodaratFinal.Text) +
                   Convert.ToDouble(txtFinalKnowledgeExam.Text);
        txtTotalConvertedMarks.Text = dblTotal.ToString();

        txtGeneralPercentage.Enabled = false;
        txtChemistry_33.Enabled = false;
        txtBiology_32.Enabled = false;
        txtMaths_60.Enabled = false;
        txtPhy.Enabled = false;
        txtEnglish_80.Enabled = false;
        txtGodarat.Enabled = false;
        txtKnowExam.Enabled = false;
    }

    protected void EnableGradeParam(object o, EventArgs e)
    {
        RadioButton rad = (RadioButton)o;
        if (rad.ID.ToString() == "rad_university_grad_percentage")//% based canculation
        {

            btnPercentageCalculate.Enabled = true;
            txtGraduateGPA_1.Enabled = true;

            btnOutOfCalculate.Enabled = false;
            cmdOutOf.Enabled = false;
            txtOutOfMarks.Enabled = false;
            txtOutOfMarks.Text = "";
        }
        else//grade based calculation
        {
            btnOutOfCalculate.Enabled = true;
            cmdOutOf.Enabled = true;
            txtOutOfMarks.Enabled = true;

            btnPercentageCalculate.Enabled = false;
            txtGraduateGPA_1.Enabled = false;
            txtGraduateGPA_1.Text = "";
        }

    }

    protected void GraduationLink(object o, EventArgs e)
    {

        btnFetchData.Visible = false;
        radGraduate.Checked = true;
        btn_stage_3.Visible = false;
        img_tab_3.Visible = false;
        btn_stage_5.Visible = false;
        img_tab_5.Visible = false;
        btn_stage_4.Visible = true;
        img_tab_4.Visible = true;

        TabPanel tp_4 = (TabPanel)MainTab.FindControl("Tab_4");
        if (tp_4 != null)
        {
            tp_4.Enabled = true;
        }

        lnkGraduation.Enabled = false;
        lnkHighSchool.Enabled = false;
        
        TabPanel tp = (TabPanel)MainTab.FindControl("Tab_1");
        MainTab.ActiveTab = tp;
        btn_next_stage.ValidationGroup = "Tab_2";
        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_0");
        if (img != null)
            img.ImageUrl = "Images/moduleEnabled.gif";
        return;

    }

    protected void PickCountry1Param(object o, EventArgs e)
    {
        DropDownList cmbSelectedC = (DropDownList)o;
        if (cmbSelectedC.ID.ToString() == "cmbCountry_1")
        {
            if (cmbSelectedC.SelectedIndex == cmbSelectedC.Items.Count-1)
            {
                cmbSelectedC.SelectedIndex = 0;
                ModalCountry_1.Show();
            }
        }
        
    }

    protected void OtherCountry_1(object o, EventArgs e)
    {
        Button btnSelected = (Button)o;
        if (btnSelected.ID.ToString() == "btnOKCountry_1")
        {
    
        }
    }

    protected void CalculateOutOfGrade(object o, EventArgs e)
    {
        for (int i = 1; i < grade.Rows.Count; i++)
        {
            this.grade.Rows[i].BackColor = System.Drawing.Color.Transparent;
        }

        if(txtOutOfMarks.Text=="") return;

        if (cmdOutOf.Text == "5")
        {
            decimal dcOutOfMarks=Convert.ToDecimal(txtOutOfMarks.Text);
            if (dcOutOfMarks >Convert.ToDecimal(4.75))
            {
                this.grade.Rows[1].BackColor = System.Drawing.Color.CadetBlue;
            }else if(dcOutOfMarks>Convert.ToDecimal(4.50))
            {
                this.grade.Rows[2].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dcOutOfMarks > Convert.ToDecimal(4.00))
            {
                this.grade.Rows[3].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dcOutOfMarks > Convert.ToDecimal(3.50))
            {
                this.grade.Rows[4].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dcOutOfMarks > Convert.ToDecimal(3.00))
            {
                this.grade.Rows[5].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dcOutOfMarks > Convert.ToDecimal(2.50))
            {
                this.grade.Rows[6].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dcOutOfMarks > Convert.ToDecimal(2.00))
            {
                this.grade.Rows[7].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dcOutOfMarks > Convert.ToDecimal(1.00))
            {
                this.grade.Rows[8].BackColor = System.Drawing.Color.CadetBlue;
            }
        }
    }
}
