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
public partial class register : System.Web.UI.Page
{
   
    System.Data.Odbc.OdbcDataReader reader;
    string[] strTempDate;
    CalendarLibrary cl = new CalendarLibrary();
    //This Interger will be used to count the files while retrieving
    int intFileCount = 0;
    //This Interger will be used to keep track of the result of insertion statement.
    int intNextID = 0;
    

    protected void gvOrderDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {  

    }
    protected void AddNewRow(object o, EventArgs e)
    {
        for (int intx = 1; intx < table_degree.Rows.Count; intx++)
        {
            if (table_degree.Rows[intx].Visible == false)
            {
                table_degree.Rows[intx].Visible = true;
                break;
            }
        }
    }

    protected void ChangeArabicDate(object o, EventArgs e)
    {
        cmdHijiDob_Date.SelectedIndex = dob_date.SelectedIndex;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //This code will check the order of navigation through website
        if (Session.Count > 0 && Session["order"] != null && Session["order"].ToString() == "Intermediate1")
        {
            Session["order"] = "Intermediate1";
        }
        else
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("index.aspx");
        }
        
        lblCurrentStatus.Text = "وضعية طلبك الحالية&nbsp;&nbsp;&nbsp;&nbsp;<br><br> 'مسجل جديد' ";                        
        //txtSchoolGraduationDt.Text = DateTime.Today.Date.Year.ToString();

       
        if (!IsPostBack)
        {

            txtSchoolGraduationDt.Items.Clear();
            cmbYear5.Items.Clear();
            cmbYear4.Items.Clear();
            cmbYear3.Items.Clear();
            cmbYear2.Items.Clear();
            cmbyear1.Items.Clear();
            
            for (int intY = 1360; intY <= 1429; intY++)
            {
                txtSchoolGraduationDt.Items.Add(intY.ToString());
                cmbYear5.Items.Add(intY.ToString());
                cmbYear4.Items.Add(intY.ToString());
                cmbYear3.Items.Add(intY.ToString());
                cmbYear2.Items.Add(intY.ToString());
                cmbyear1.Items.Add(intY.ToString());
                cmbYear6.Items.Add(intY.ToString());
                cmbYear7.Items.Add(intY.ToString());
                cmbYear8.Items.Add(intY.ToString());
            }
        
            #region combo box values
            for (int i = 1; i <= 31; i++)
            {                
             
                issue_dt_date.Items.Add(i.ToString());
                dob_date.Items.Add(i.ToString());
                exp_date.Items.Add(i.ToString());
                cmdHijiDob_Date.Items.Add(i.ToString());             
                
            }

           

            for (int i = 1370; i <= 1415; i++)
            {
                cmdHijiDob_Year.Items.Add(i.ToString());
            }

            for (int i = 1405; i <=1440; i++)
            {
                exp_year.Items.Add(i.ToString());
                issue_dt_year.Items.Add(i.ToString());
            }
            for (int i = 1946; i <= 1994; i++)
            {
                
                dob_year.Items.Add(i.ToString()); 

            }
            GeneralClass.Program.AddComboItems("t_country_preset", "country_name", "id", cmb_12);
            cmb_12.Items[cmb_12.SelectedIndex].Text = "SAUDI ARABIA";
            GeneralClass.Program.AddComboItems("t_country_preset", "country_name", "id", cmbCountry_1);
            cmbCountry_1.Items[cmbCountry_1.SelectedIndex].Text = "SAUDI ARABIA";
            GeneralClass.Program.AddComboItems("t_country_preset", "country_name", "id", cmbCountry_2);
            cmbCountry_2.Items[cmbCountry_2.SelectedIndex].Text = "SAUDI ARABIA";
            
            
            #endregion

            if (Session["StudentID"] != null)
            {
                txtLocalID.Enabled = false; 
                txtEMailII.Enabled = false;
                try
                {
                    reader = GeneralClass.Program.gRetrieveRecord("SELECT * FROM registration_main WHERE id=" + Session["StudentID"].ToString());
                    if (reader.HasRows)
                    {
                        lblLoginID.Visible = true;
                        lnkChangePWD.Visible = true;
                        lnkLogout.Visible = true;
                        TabPanel tp = (TabPanel)MainTab.FindControl("tab_8");
                        if (tp != null)
                            tp.Enabled = false;

                        #region changing the images ticked
                        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_0");
                        if (img != null)
                            img.ImageUrl = "Images/moduleEnabled.gif";

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_1");
                        if (img != null)
                            img.ImageUrl = "Images/moduleEnabled.gif";

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_2");
                        if (img != null)
                            img.ImageUrl = "Images/moduleEnabled.gif";

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_3");
                        if (img != null)
                            img.ImageUrl = "Images/moduleEnabled.gif";

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_4");
                        if (img != null)
                            img.ImageUrl = "Images/moduleEnabled.gif";

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_6");
                        if (img != null)
                            img.ImageUrl = "Images/moduleDisabled.gif";

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_6_2");
                        if (img != null)
                        {
                            img.ImageUrl = "Images/moduleEnabled.gif";
                            img_tab_6_2.Visible =true;
                        }

                        img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_7");
                        if (img != null)
                            img.Visible = false;


                        Label lbl = (Label)AccordionPane1.FindControl("btn_stage_7");

                        if (lbl != null)
                            lbl.Visible = false;

                        #endregion
                    }
                    while (reader.Read())
                    {

                        if (reader["Gender"].ToString() == "M")
                        {
                            radmale.Checked = true;
                        }
                        else
                        {
                            radfemale.Checked = true;
                        }
                        lblLoginID.Text = "مرحبا " + reader["login"].ToString();

                        if (lblCurrentStatus != null)
                        {
                            lblCurrentStatus.Visible = true;
                            lblCurrentStatus.Text = "وضعية طلبك الحالية&nbsp;&nbsp;&nbsp;&nbsp;<br>'" + reader["current_status"].ToString() + "'";
                            if (reader["current_status"].ToString() != "Submitted")
                            {
                                //imgSave.Enabled = false;
                            }
                            if (reader["current_status"].ToString() == "Invited")
                            {

                                imgSave.Enabled = false;
                                lnkAck.Visible = true;
                                chk_status_invited.Checked = true;
                            }

                            if (reader["current_status"].ToString() == "Submitted")
                            {
                                chk_status_registred.Checked = true;
                            }
                            else if (reader["current_status"].ToString() == "Submitted" ||
                                reader["current_status"].ToString() == "Invited")
                            {
                                chk_status_registred.Checked = true;
                                chk_status_invited.Checked = true;
                            }
                            else if (reader["current_status"].ToString() == "Submitted" ||
                           reader["current_status"].ToString() == "Invited" || reader["current_status"].ToString() == "Acknowledged")
                            {
                                chk_status_registred.Checked = true;
                                chk_status_invited.Checked = true;
                                chk_status_acknowledged.Checked = true;
                            }
                            else if (reader["current_status"].ToString() == "Submitted" ||
                       reader["current_status"].ToString() == "Invited" || reader["current_status"].ToString() == "Acknowledged" ||
                           reader["current_status"].ToString() == "Interviewed")
                            {
                                chk_status_registred.Checked = true;
                                chk_status_invited.Checked = true;
                                chk_status_acknowledged.Checked = true;
                                chk_status_interviewed.Checked = true;
                            }
                        }
                        #region data from registration_main
                        txtLocalID.Text = reader["local_id"].ToString();
                        txtLocalID.ReadOnly = true;
                        lblFullName.Text = reader["full_name"].ToString();
                        txtFirstName_A.Text = reader["first_name_a"].ToString();
                        txtFirstName_E.Text = reader["first_name_e"].ToString();
                        txtFatherName_A.Text = reader["father_name_a"].ToString();
                        txtFatherName_E.Text = reader["father_name_e"].ToString();
                        txtGrandFatherName_A.Text = reader["grand_father_a"].ToString();
                        txtGrandFatherName_E.Text = reader["grand_father_e"].ToString();
                        txtLastName_A.Text = reader["last_name_a"].ToString();
                        txtLastName_E.Text = reader["last_name_e"].ToString();

                        if (!reader["marital_status"].Equals(null) && reader["marital_status"].ToString().Equals("M"))
                        {
                            RadMarried.Checked = true;                            
                        }

                        if (!reader["marital_status"].Equals(null) && reader["marital_status"].ToString().Equals("S"))
                        {                            
                            RadSingle.Checked = true; 
                        }

                        if (!reader["childrens"].Equals(null))
                        {
                            txtChildCount.Text = reader["childrens"].ToString();
                        }                        

                        strTempDate = reader["dob"].ToString().Split(new char[] { '/' });
                        dob_date.Text = strTempDate[0].ToString();
                        dob_month.Text = strTempDate[1].ToString();
                        dob_year.Text = strTempDate[2].ToString();

                        txtPOB.Text = reader["birth_place"].ToString();
                        txtidissuedplace.Text = reader["place_of_issue"].ToString();

                        strTempDate = reader["date_of_issue"].ToString().Split(new char[] { '/' });
                        issue_dt_date.Text = strTempDate[0].ToString();
                        issue_dt_month.Text = strTempDate[1].ToString();
                        issue_dt_year.Text = strTempDate[2].ToString();


                        strTempDate = reader["exp_date"].ToString().Split(new char[] { '/' });
                        exp_date.Text = strTempDate[0].ToString();
                        exp_month.Text = strTempDate[1].ToString();
                        exp_year.Text = strTempDate[2].ToString();

                        strTempDate = reader["hijri_dob"].ToString().Split(new char[] { '/' });
                        cmdHijiDob_Date.Text = strTempDate[0].ToString();
                        cmdHijiDob_Month.Text = strTempDate[1].ToString();
                        cmdHijiDob_Year.Text = strTempDate[2].ToString();

                        txtAddress_1_1.Text = reader["address_1_1"].ToString();
                        txtAddress_1_2.Text = reader["address_1_2"].ToString();
                        txtZip_1.Text = reader["zip_code_1"].ToString();
                        txtPostal_1.Text = reader["postal_code_1"].ToString();
                        txtCity_1.Text = reader["city_name_1"].ToString();
                        cmbCountry_1.Text = reader["country_id_1"].ToString();

                        txtStudentMobile.Text = reader["mobile"].ToString();
                        txtStudentMobile_2.Text = reader["mobile_2"].ToString();

                        if (reader["home_telephone"].ToString().Length > 2)
                        {
                            cmbAreaCode1.Text = reader["home_telephone"].ToString().Substring(0, 2);
                            txtHomePhone.Text = reader["home_telephone"].ToString().Substring(2);
                        }
                        if (reader["home_telephone_2"].ToString().Length > 2)
                        {
                            cmbAreaCode2.Text = reader["home_telephone_2"].ToString().Substring(0, 2);
                            txtHomeTelephone_2.Text = reader["home_telephone_2"].ToString().Substring(2);
                        }

                        txtEMailAddress.Text = reader["email_address_1"].ToString();
                        txtEmailAddress_2.Text = reader["emailaddress_2"].ToString();
                        txtAddress_2_1.Text = reader["address_2_1"].ToString();
                        txtAddress_2_2.Text = reader["address_2_2"].ToString();
                        txtCity_2.Text = reader["city_name_2"].ToString();
                        txtZip_2.Text = reader["zip_code_2"].ToString();
                        cmbCountry_2.Text = reader["country_id_2"].ToString();

                        txtPostal_2.Text = reader["postal_code_2"].ToString();

                        txtRelativeName.Text = reader["relative_name"].ToString();
                        txtRelationship.Text = reader["relation_ship"].ToString();
                        txtRelativeMobile.Text = reader["relative_mobile"].ToString();

                        if (reader["relative_phone_1"].ToString().Length > 2)
                        {
                            cmbAreaCode3.Text = reader["relative_phone_1"].ToString().Substring(0, 2);
                            txtRelativePhone.Text = reader["relative_phone_1"].ToString().Substring(2);
                            
                        }
                        txtRelativeName_2.Text = reader["relative_name_2"].ToString();
                        cmbRelationShip_2.Text = reader["relation_ship_2"].ToString();
                        txtRelativeMobile_2.Text = reader["relative_mobile_2"].ToString();
                        if (reader["relative_phone_2"].ToString().Length > 2)
                        {
                            cmbAreaCode4.Text = reader["relative_phone_2"].ToString().Substring(0,2);
                            txtRelativePhone_2.Text = reader["relative_phone_2"].ToString().Substring(2);
                        }
                        txtEMailII.Text = reader["login"].ToString();
                        cmbSchoolName.Text = reader["university_name"].ToString();
                        txtSchoolCountryCity.Text = reader["college_city"].ToString();
                        cmb_12.Text = reader["college_country"].ToString();
                        txtSchoolGraduationDt.Text = reader["graduation_year"].ToString().Trim();
                        txtGraduationDuration.Text = reader["graduation_duration"].ToString().Trim();
                        if (reader["choice_prefered"].ToString().Trim() == "100")
                            cmbPercentage.SelectedIndex = 1;
                        else if (reader["choice_prefered"].ToString().Trim() == "5")
                            cmbPercentage.SelectedIndex = 2;
                        else
                            cmbPercentage.SelectedIndex = 3;
                        txtAcualMarks.Enabled = true;
                        txtAcualMarks.Text = reader["actual_marks"].ToString();
                        cmbBachelorMajor.Text = reader["bachelor_major"].ToString().Trim();
                        #endregion

                    }
                    reader.Close();

                    #region for certificates
                    try
                    {
                        reader = GeneralClass.Program.gRetrieveRecord("SELECT * FROM t_graduation_data WHERE registration_id=" + Session["StudentID"].ToString());
                        while (reader.Read())
                        {
                            if (reader["row_pos"].ToString() == "1")
                            {
                                table_degree.Rows[1].Enabled = false;
                                dmbProgramType1.Text = reader["cert_type"].ToString().Trim();
                                txtCertName.Text = reader["cert_name"].ToString().Trim();
                                txtUni1.Text = reader["provider"].ToString().Trim();
                                txtCertDuration1.Text = reader["duration"].ToString().Trim();
                                cmbday1.Text = reader["day_val"].ToString().Trim();
                                cmdMonth1.Text = reader["month_val"].ToString().Trim();
                                cmbyear1.Text = reader["year_val"].ToString().Trim();
                            }

                            if (reader["row_pos"].ToString() == "2")
                            {
                                table_degree.Rows[2].Enabled = false;
                                dmbProgramType2.Text = reader["cert_type"].ToString().Trim();
                                txtCertName2.Text = reader["cert_name"].ToString().Trim();
                                txtUni2.Text = reader["provider"].ToString().Trim();
                                txtCertDuration2.Text = reader["duration"].ToString().Trim();
                                cmbDay2.Text = reader["day_val"].ToString().Trim();
                                cmbMonth2.Text = reader["month_val"].ToString().Trim();
                                cmbYear2.Text = reader["year_val"].ToString().Trim();
                            }
                        }
                        reader.Close();
                    }
                    catch (OdbcException exp_cert)
                    {
                        if (reader != null)
                            reader.Close();
                    }
                    #endregion
                    try
                    {
                        #region Loading Data information for files user has uploaded
                        
                        intFileCount = 1;
                        reader = GeneralClass.Program.gRetrieveRecord("SELECT id,student_id,filename from t_certificates WHERE student_id= " + Session["StudentID"].ToString());
                        while (reader.Read())
                        { 
                           switch(intFileCount)
                           {
                               case 1:
                                   lblFileID1.Text = reader["id"].ToString();                                   
                                   FilePath_1.Text  = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\")+1);
                                   FilePath_1.Enabled = false;
                                   btn_1.Enabled = false;
                                   btnDelFile1.Visible = true;
                                   break;                                                                      
                              case 2:
                                  lblFileID2.Text = reader["id"].ToString();
                                  FilePath_2.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                                  FilePath_2.Enabled = false;
                                  btn_2.Enabled = false;
                                  btnDelFile2.Visible = true;
                                  break;
                              case 3:
                                  lblFileID3.Text = reader["id"].ToString();
                                  FilePath_3.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                                  FilePath_3.Enabled = false;
                                  btn_3.Enabled = false;
                                  btnDelFile3.Visible = true;
                                  break;
                              //case 4:
                              //    lblFileID4.Text = reader["id"].ToString();
                              //    FilePath_4.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                              //    FilePath_4.Enabled = false;
                              //    btn_4.Enabled = false;
                              //    btnDelFile4.Visible = true;
                              //    break;
                              case 5:
                                  lblFileID5.Text = reader["id"].ToString();
                                  FilePath_5.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                                  FilePath_5.Enabled = false;
                                  btn_5.Enabled = false;
                                  btnDelFile5.Visible = true;
                                  break;
                              case 6:
                                  //lblFileID6.Text = reader["id"].ToString();
                                  //FilePath_6.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                                  //FilePath_6.Enabled = false;
                                  //btn_6.Enabled = false;
                                  //btnDelFile6.Visible = true;
                                  break;
                              case 7:
                                  lblFileID7.Text = reader["id"].ToString();
                                  FilePath_7.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                                  FilePath_7.Enabled = false;
                                  btn_7.Enabled = false;
                                  btnDelFile7.Visible = true;
                                  break;
                              case 8:
                                  lblFileID8.Text = reader["id"].ToString();
                                  FilePath_8.Text = reader["filename"].ToString().Substring(reader["filename"].ToString().LastIndexOf("\\") + 1);
                                  FilePath_8.Enabled = false;
                                  btn_8.Enabled = false;
                                  btnDelFile8.Visible = true;
                                  break;
                           }                         

                           intFileCount++;
                            //This Condition bcoz we deleted the File Text Box at number four..
                           if (intFileCount == 4)
                           {
                               intFileCount++;
                           }
                        }
                        if (!reader.IsClosed) reader.Close();   
                        #endregion
                    }
                    catch (Exception exp_2)
                    {
                        if (reader != null)
                        {                            
                            reader.Close();
                        }
                    }
                }
                catch (System.Data.Odbc.OdbcException exp)
                {
                    if (reader != null)
                        reader.Close();
                }
            }
            //else
            //    rnd_area.BackColor = System.Drawing.Color.Yellow;
        }        
    }
    protected void OkClicked(object o, EventArgs e)
    {
        //btnFetchData.Visible = true;        
        imgNext.Enabled = true;
        Button rad = (Button)o;
        if (rad.ID.ToString() == "btnOK1")
        {
            //radHighSchool.Checked = true;
            btn_stage_3.Visible = true;
            img_tab_3.Visible = true;
            //btn_stage_5.Visible = true;
            //img_tab_5.Visible = true;
            btn_stage_4.Visible = false;
            img_tab_4.Visible = false;

            TabPanel tp_3 = (TabPanel)MainTab.FindControl("tab_4");
            if (tp_3 != null)
            {
                tp_3.Enabled = true;
            }

            TabPanel tp_6 = (TabPanel)MainTab.FindControl("tab_6");
            if (tp_6 != null)
            {
                tp_6.Enabled = true;
            }

        }
        
        //lnkGraduation.Enabled = false;
        //lnkHighSchool.Enabled = false;

        TabPanel tp = (TabPanel)MainTab.FindControl("Tab_2");
        MainTab.ActiveTab = tp;
        
        System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_0");
        if (img != null)
            img.ImageUrl = "Images/moduleEnabled.gif";
        return;
        
    }

    bool ValidateFields()
    {       
        
        if(!mCheckSchoolIDExistence(txtLocalID.Text.Trim()))
        {
            return false;
        }
        //if (txtFirstName_A.Text == "" || txtFirstName_E.Text == "" || txtFatherName_A.Text == "" ||
        //    txtFatherName_E.Text == "" || txtLastName_A.Text == "" || txtLastName_E.Text == ""
        //    || txtPOB.Text=="" || txtidissuedplace.Text=="" )
        if(!mValidateNameData())
        {
            ModalPopupExtender3.Show();
            TabPanel tp = (TabPanel)MainTab.FindControl("tab_2");
            MainTab.ActiveTab = tp;
            return false;
        }
        //if (txtAddress_1_1.Text == "" || txtAddress_1_2.Text == "" || txtZip_1.Text == "" || txtPostal_1.Text == "" ||
        //    txtCity_1.Text == "" || txtPostal_1.Text == "" || txtAddress_2_1.Text == "" || txtAddress_2_2.Text == "" || txtZip_2.Text == "" ||
        //    txtPostal_2.Text == "" | txtCity_2.Text == "" || txtStudentMobile.Text == "" || txtHomePhone.Text == "" || txtRelativeName.Text == ""
        //    || txtRelativeMobile.Text == "")
        if(!mValidateAddressData())
        {
            TabPanel tp = (TabPanel)MainTab.FindControl("tab_3");
            ModalPopupExtender3.Show();
            MainTab.ActiveTab = tp;
            return false;
        }
        
        //if (cmbSchoolName.Text == "" || txtSchoolCountryCity.Text == "")
        if(!mValidateSchoolDate())
        {
            ModalPopupExtender3.Show();
            TabPanel tp = (TabPanel)MainTab.FindControl("tab_4");
            MainTab.ActiveTab = tp;
            return false;                
        }

        //if (!mValidateSubjectSelection())
        //{
        //    ModalPopupExtender3.Show();
        //    MainTab.ActiveTabIndex = 3;
        //    return false;
       // }

        //This Code will check the duplication of Student ID in insert mood only..        
        if (Session.Count == 0 || Session["StudentID"] == null)
        {
            if (!mCheckIDExistence())
            {
                return false;
            }

            if (!mValidatePassword())
            {
                return false;
            }
        }

        
        
        return true;
    }
    protected void goSave(object o, EventArgs e)
    {
        if (ValidateFields() == false)
        {
          return;
        }
       
        #region first tab
        GeneralClass.Program.Add("local_id", txtLocalID.Text.Trim(), "I");
        GeneralClass.Program.Add("place_of_issue", txtidissuedplace.Text.Trim(), "S");

        GeneralClass.Program.Add("date_of_issue", issue_dt_date.Text + "/" + issue_dt_month.Text.Trim()  + "/" + issue_dt_year.Text, "S");

        GeneralClass.Program.Add("exp_date", exp_date.Text + "/" + exp_month.Text + "/" + exp_year.Text, "S");
        if (Session["StudentID"] == null)
        {
            GeneralClass.Program.Add("login", txtEMailII.Text.Trim(), "S");
            GeneralClass.Program.Add("password", txtPassword.Text.Trim(), "S");
        }
        
        GeneralClass.Program.Add("full_name", lblFullName.Text.Trim(), "S");
        GeneralClass.Program.Add("first_name_e", txtFirstName_E.Text.Trim(), "S");
        GeneralClass.Program.Add("father_name_e", txtFatherName_E.Text.Trim(), "S");
        GeneralClass.Program.Add("grand_father_e", txtGrandFatherName_E.Text, "S");
        GeneralClass.Program.Add("last_name_e", txtLastName_E.Text, "S");
        GeneralClass.Program.Add("first_name_a", txtFirstName_A.Text, "S");
        GeneralClass.Program.Add("father_name_a", txtFatherName_A.Text, "S");
        GeneralClass.Program.Add("grand_father_a", txtGrandFatherName_A.Text, "S");
        GeneralClass.Program.Add("last_name_a", txtLastName_A.Text, "S");
        if (radmale.Checked == true)
        {
            GeneralClass.Program.Add("gender", "M", "S");
        }
        else
        {
            GeneralClass.Program.Add("gender", "F", "S");
        }
        if (RadMarried.Checked == true)
        {
            GeneralClass.Program.Add("marital_status", "M", "S");
            GeneralClass.Program.Add("childrens", txtChildCount.Text.Trim(), "S");
        }
        else
        {
            GeneralClass.Program.Add("marital_status", "S", "S");
            GeneralClass.Program.Add("childrens", "0", "S");
        }
        
        GeneralClass.Program.Add("dob", dob_date.Text + "/" + dob_month.Text +"/"+ dob_year.Text, "S");
        GeneralClass.Program.Add("hijri_dob", cmdHijiDob_Date.Text + "/" + cmdHijiDob_Month.Text + "/" + cmdHijiDob_Year.Text, "S");          
        GeneralClass.Program.Add("birth_place", txtPOB.Text, "S");
        #endregion end of first tab
        
        #region address tab
        GeneralClass.Program.Add("address_1_1", txtAddress_1_1.Text, "S");
        GeneralClass.Program.Add("address_1_2", txtAddress_1_2.Text, "S");
        GeneralClass.Program.Add("postal_code_1", txtPostal_1.Text, "S");
        GeneralClass.Program.Add("zip_code_1", txtZip_1.Text, "S");
        GeneralClass.Program.Add("city_name_1", txtCity_1.Text, "S");
        GeneralClass.Program.Add("country_id_1", cmbCountry_1.Text, "S");
        GeneralClass.Program.Add("address_2_1", txtAddress_2_1.Text, "S");
        GeneralClass.Program.Add("address_2_2", txtAddress_2_2.Text, "S");
        GeneralClass.Program.Add("postal_code_2", txtPostal_2.Text, "S");
        GeneralClass.Program.Add("zip_code_2", txtZip_2.Text, "S");
        GeneralClass.Program.Add("city_name_2", txtCity_2.Text, "S");
        GeneralClass.Program.Add("country_id_2", cmbCountry_2.Text, "S");
        
        if (txtHomePhone.Text.Length > 0)
        {
            GeneralClass.Program.Add("home_telephone", cmbAreaCode1.Text + txtHomePhone.Text, "S");
        }
        else
        {
            GeneralClass.Program.Add("home_telephone", txtHomePhone.Text, "S");
        }
        if (txtHomeTelephone_2.Text.Length > 0)
        {
            GeneralClass.Program.Add("home_telephone_2", cmbAreaCode2.Text + txtHomeTelephone_2.Text, "S");
        }
        else
        {
            GeneralClass.Program.Add("home_telephone_2", txtHomeTelephone_2.Text, "S");
        }

        GeneralClass.Program.Add("mobile", txtStudentMobile.Text, "S");
        GeneralClass.Program.Add("mobile_2", txtStudentMobile_2.Text, "S");
        GeneralClass.Program.Add("email_address_1", txtEMailAddress.Text, "S");
        GeneralClass.Program.Add("emailaddress_2", txtEmailAddress_2.Text, "S");
        GeneralClass.Program.Add("relative_name", txtRelativeName.Text, "S");
        GeneralClass.Program.Add("relation_ship", txtRelationship.Text, "S");
        GeneralClass.Program.Add("relative_mobile", txtRelativeMobile.Text, "S");
        if (txtRelativePhone.Text.Length > 0)
        {
            GeneralClass.Program.Add("relative_phone_1", cmbAreaCode3.Text + txtRelativePhone.Text, "S");
        }
        else
        {
            GeneralClass.Program.Add("relative_phone_1", txtRelativePhone.Text, "S");
        }

        GeneralClass.Program.Add("relative_name_2", txtRelativeName_2.Text, "S");
        GeneralClass.Program.Add("relation_ship_2", cmbRelationShip_2.Text, "S");
        GeneralClass.Program.Add("relative_mobile_2", txtRelativeMobile_2.Text, "S");
        if (txtRelativePhone_2.Text.Length > 0)
        {
            GeneralClass.Program.Add("relative_phone_2", cmbAreaCode4.Text + txtRelativePhone_2.Text, "S");
        }
        else
        {
            GeneralClass.Program.Add("relative_phone_2", txtRelativePhone_2.Text, "S");
        }
        #endregion end of address tab
        GeneralClass.Program.Add("university_name", cmbSchoolName.Text, "S");
        GeneralClass.Program.Add("college_city", txtSchoolCountryCity.Text, "S");
        GeneralClass.Program.Add("college_country", cmb_12.Text, "S");
        GeneralClass.Program.Add("graduation_year", txtSchoolGraduationDt.Text, "S");
        GeneralClass.Program.Add("graduation_duration", txtGraduationDuration.Text, "I");

        GeneralClass.Program.Add("choice_prefered", cmbPercentage.Text, "S");
        GeneralClass.Program.Add("actual_marks", txtAcualMarks.Text, "I");
        GeneralClass.Program.Add("bachelor_major", cmbBachelorMajor.Text, "S");
        
        if (Session["StudentID"] == null)
        {
            intNextID = GeneralClass.Program.InsertRecordStatement("registration_main");
            if (intNextID > 0)
            {
                #region
                for (int intIT = 1; intIT < table_degree.Rows.Count; intIT++)
                {
                    if (intIT == 1)
                    {
                        if (txtCertName.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "1")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType1.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni1.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration1.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbday1.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmdMonth1.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbyear1.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "1", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }
                    else if (intIT == 2)
                    {
                        if (txtCertName2.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "2")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType2.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName2.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni2.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration2.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbDay2.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth2.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear2.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "2", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }
                    else if (intIT == 3)
                    {
                        if (txtCertName3.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "3")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType3.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName3.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni3.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration3.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbDay3.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth3.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear3.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "3", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }
                    else if (intIT == 4)
                    {
                        if (txtCertName4.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "4")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType4.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName4.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni4.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration4.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbday4.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth4.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear4.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "4", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }

                    else if (intIT == 5)
                    {
                        if (txtCertName6.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "5")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType5.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertNam5.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni5.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration5.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbDay5.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth5.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear5.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "5", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }

                    else if (intIT == 6)
                    {
                        if (txtCertName6.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "6")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType6.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName6.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni6.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration6.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbDay6.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth6.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear6.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "6", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }

                    else if (intIT == 7)
                    {
                        if (txtCertName7.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "7")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType7.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName7.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni7.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration7.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbDay7.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth7.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear7.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "7", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }

                    else if (intIT == 8)
                    {
                        if (txtCertNam5.Text.Trim() != "")
                        {
                            if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "8")
                            {
                                GeneralClass.Program.Add("registration_id", intNextID.ToString(), "I");
                                GeneralClass.Program.Add("cert_type", dmbProgramType8.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("cert_name", txtCertName8.Text, "S");
                                GeneralClass.Program.Add("provider", txtUni8.Text, "S");
                                GeneralClass.Program.Add("duration", txtCertDuration8.Text, "S");
                                GeneralClass.Program.Add("day_val", cmbDay8.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("month_val", cmbMonth8.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("year_val", cmbYear8.SelectedItem.Text, "S");
                                GeneralClass.Program.Add("row_pos", "8", "S");
                                GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                            }
                        }
                    }
                }

                #endregion 1st row
                HttpContext.Current.Response.Redirect("success_message.aspx?id=" + intNextID.ToString());
            }
        }
        else
        {
            int intNextID = GeneralClass.Program.UpdateRecordStatement("registration_main", "id", Session["StudentID"].ToString());
            #region
            for (int intIT = 1; intIT < table_degree.Rows.Count; intIT++)
            {
                if (intIT == 1)
                {
                    if (txtCertName.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip=="1")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType1.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni1.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration1.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbday1.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmdMonth1.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbyear1.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "1", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }
                else if (intIT == 2)
                {
                    if (txtCertName2.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "2")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType2.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName2.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni2.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration2.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbDay2.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth2.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear2.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "2", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }
                else if (intIT == 3)
                {
                    if (txtCertName3.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "3")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType3.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName3.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni3.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration3.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbDay3.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth3.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear3.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "3", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }
                else if (intIT == 4)
                {
                    if (txtCertName4.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "4")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType4.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName4.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni4.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration4.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbday4.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth4.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear4.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "4", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }

                else if (intIT == 5)
                {
                    if (txtCertName6.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "5")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType5.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertNam5.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni5.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration5.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbDay5.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth5.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear5.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "5", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }

                else if (intIT == 6)
                {
                    if (txtCertName6.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "6")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType6.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName6.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni6.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration6.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbDay6.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth6.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear6.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "6", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }

                else if (intIT == 7)
                {
                    if (txtCertName7.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "7")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType7.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName7.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni7.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration7.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbDay7.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth7.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear7.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "7", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }

                else if (intIT == 8)
                {
                    if (txtCertNam5.Text.Trim() != "")
                    {
                        if (table_degree.Rows[intIT].Enabled == true && table_degree.Rows[intIT].ToolTip == "8")
                        {
                            GeneralClass.Program.Add("registration_id", Session["StudentID"].ToString(), "I");
                            GeneralClass.Program.Add("cert_type", dmbProgramType8.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("cert_name", txtCertName8.Text, "S");
                            GeneralClass.Program.Add("provider", txtUni8.Text, "S");
                            GeneralClass.Program.Add("duration", txtCertDuration8.Text, "S");
                            GeneralClass.Program.Add("day_val", cmbDay8.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("month_val", cmbMonth8.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("year_val", cmbYear8.SelectedItem.Text, "S");
                            GeneralClass.Program.Add("row_pos", "8", "S");
                            GeneralClass.Program.InsertRecordStatement("t_graduation_data");
                        }
                    }
                }
            }

            #endregion 1st row
            HttpContext.Current.Response.Redirect("success_message.aspx?id=" + Session["StudentID"].ToString());
        }
    }
    private void mInsertFiles()
    {
        //=================File Managmant=================//        
        if (FilePath_1.Text.Trim() == "" && FilePath_2.Text.Trim() == "" && FilePath_3.Text.Trim() == "" &&
            FilePath_5.Text.Trim() == ""  &&
            FilePath_7.Text.Trim() == "" && FilePath_8.Text.Trim() == "")
        {
            //do nothing
        }            
        else
        {
            Byte[] blob = null;
            System.Data.Odbc.OdbcCommand p_Command = null;
            System.Data.Odbc.OdbcParameter prm = null;
            System.Data.Odbc.OdbcParameter prm1 = null;
            System.Data.Odbc.OdbcParameter prm2 = null;
            System.Data.Odbc.OdbcParameter prm3 = null;

            bool errorOccured = false;
            #region file 1            
            if (FilePath_1.Text.Trim() != "" && lblFileID1.Text.Equals(""))
            {
                try
                {
                    FileStream fs = new FileStream(Server.MapPath("UFiles\\"+FilePath_1.Text.Substring(FilePath_1.Text.LastIndexOf("\\"))) , FileMode.Open, FileAccess.Read);
                    blob = new Byte[fs.Length];
                    fs.Read(blob, 0, blob.Length);
                    fs.Close();
                    p_Command = new System.Data.Odbc.OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
                    p_Command.CommandType = CommandType.StoredProcedure;

                    prm = p_Command.Parameters.Add("@imageFile", System.Data.Odbc.OdbcType.Image);
                    prm.Direction = ParameterDirection.Input;
                    prm.Value = blob;

                    prm1 = p_Command.Parameters.Add("@id", System.Data.Odbc.OdbcType.BigInt);
                    prm1.Direction = ParameterDirection.Input;

                    if (Session["StudentID"] == null)
                    {
                        prm1.Value = intNextID;
                    }
                    else
                    {
                        prm1.Value = Session["StudentID"].ToString();
                    }                   

                    prm2 = p_Command.Parameters.Add("@filename", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = FilePath_1.Text;

                    prm2 = p_Command.Parameters.Add("@type", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = txtFilePath_1.Text;

                    p_Command.ExecuteNonQuery();

                    p_Command = null;

                    //This Will Delete the File After Saving
                    File.Delete(Server.MapPath("UFiles\\" + FilePath_1.Text.Substring(FilePath_1.Text.LastIndexOf("\\"))));

                }
                catch (Exception exp)
                {
                    errorOccured = true;
                }

            }
            #endregion


            #region File 2
            if (FilePath_2.Text.Trim() != "" && lblFileID2.Text.Equals(""))
            {
                try
                {
                    FileStream fs = new FileStream(Server.MapPath("UFiles\\" + FilePath_2.Text.Substring(FilePath_2.Text.LastIndexOf("\\"))), FileMode.Open, FileAccess.Read);
                    blob = new Byte[fs.Length];
                    fs.Read(blob, 0, blob.Length);
                    fs.Close();
                    p_Command = new System.Data.Odbc.OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
                    p_Command.CommandType = CommandType.StoredProcedure;

                    prm = p_Command.Parameters.Add("@imageFile", System.Data.Odbc.OdbcType.Image);
                    prm.Direction = ParameterDirection.Input;
                    prm.Value = blob;

                    prm1 = p_Command.Parameters.Add("@id", System.Data.Odbc.OdbcType.BigInt);
                    prm1.Direction = ParameterDirection.Input;

                    if(Session["StudentID"]==null)
                    {
                        prm1.Value = intNextID;
                    }
                    else
                    {
                        prm1.Value = Session["StudentID"].ToString();
                    }

                    prm2 = p_Command.Parameters.Add("@filename", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = FilePath_2.Text;

                    prm2 = p_Command.Parameters.Add("@type", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = txtFilePath_2.Text;

                    p_Command.ExecuteNonQuery();
                    p_Command = null;

                    //This Will Delete the File After Saving
                    File.Delete(Server.MapPath("UFiles\\" + FilePath_2.Text.Substring(FilePath_2.Text.LastIndexOf("\\"))));

                }
                catch (Exception)
                {
                    errorOccured = true;
                }

            }

            #endregion

            #region File 3
            if (FilePath_3.Text.Trim() != "" && lblFileID3.Text.Equals(""))
            {
                try
                {
                    FileStream fs = new FileStream(Server.MapPath("UFiles\\" + FilePath_3.Text.Substring(FilePath_3.Text.LastIndexOf("\\"))), FileMode.Open, FileAccess.Read);
                    blob = new Byte[fs.Length];
                    fs.Read(blob, 0, blob.Length);
                    fs.Close();
                    p_Command = new System.Data.Odbc.OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
                    p_Command.CommandType = CommandType.StoredProcedure;

                    prm = p_Command.Parameters.Add("@imageFile", System.Data.Odbc.OdbcType.Image);
                    prm.Direction = ParameterDirection.Input;
                    prm.Value = blob;

                    prm1 = p_Command.Parameters.Add("@id", System.Data.Odbc.OdbcType.BigInt);
                    prm1.Direction = ParameterDirection.Input;

                    if (Session["StudentID"]==null)
                    {
                        prm1.Value = intNextID;
                    }
                    else
                    {
                        prm1.Value = Session["StudentID"].ToString();
                    }

                    prm2 = p_Command.Parameters.Add("@filename", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = FilePath_3.Text;

                    prm2 = p_Command.Parameters.Add("@type", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = txtFilePath_3.Text;

                    p_Command.ExecuteNonQuery();
                    p_Command = null;

                    //This Will Delete the File After Saving
                    File.Delete(Server.MapPath("UFiles\\" + FilePath_3.Text.Substring(FilePath_3.Text.LastIndexOf("\\"))));

                }
                catch (Exception)
                {
                    errorOccured = true;
                }

            }

            #endregion

            #region File 5
            if (FilePath_5.Text.Trim() != "" && lblFileID5.Text.Equals(""))
            {
                try
                {
                    FileStream fs = new FileStream(Server.MapPath("UFiles\\" + FilePath_5.Text.Substring(FilePath_5.Text.LastIndexOf("\\"))), FileMode.Open, FileAccess.Read);
                    blob = new Byte[fs.Length];
                    fs.Read(blob, 0, blob.Length);
                    fs.Close();
                    p_Command = new System.Data.Odbc.OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
                    p_Command.CommandType = CommandType.StoredProcedure;

                    prm = p_Command.Parameters.Add("@imageFile", System.Data.Odbc.OdbcType.Image);
                    prm.Direction = ParameterDirection.Input;
                    prm.Value = blob;

                    prm1 = p_Command.Parameters.Add("@id", System.Data.Odbc.OdbcType.BigInt);
                    prm1.Direction = ParameterDirection.Input;

                    if (Session["StudentID"]==null)
                    {
                        prm1.Value = intNextID;
                    }
                    else
                    {
                        prm1.Value = Session["StudentID"].ToString();
                    }

                    prm2 = p_Command.Parameters.Add("@filename", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = FilePath_5.Text;

                    prm2 = p_Command.Parameters.Add("@type", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = txtFilePath_5.Text;

                    p_Command.ExecuteNonQuery();

                    p_Command = null;

                    //This Will Delete the File After Saving
                    File.Delete(Server.MapPath("UFiles\\" + FilePath_5.Text.Substring(FilePath_5.Text.LastIndexOf("\\"))));

                }
                catch (Exception)
                {
                    errorOccured = true;
                }

            }

            #endregion

         

            #region File 7
            if (FilePath_7.Text.Trim() != "" && lblFileID7.Text.Equals(""))
            {
                try
                {
                    FileStream fs = new FileStream(Server.MapPath("UFiles\\" + FilePath_7.Text.Substring(FilePath_7.Text.LastIndexOf("\\"))), FileMode.Open, FileAccess.Read);
                    blob = new Byte[fs.Length];
                    fs.Read(blob, 0, blob.Length);
                    fs.Close();
                    p_Command = new System.Data.Odbc.OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
                    p_Command.CommandType = CommandType.StoredProcedure;

                    prm = p_Command.Parameters.Add("@imageFile", System.Data.Odbc.OdbcType.Image);
                    prm.Direction = ParameterDirection.Input;
                    prm.Value = blob;

                    prm1 = p_Command.Parameters.Add("@id", System.Data.Odbc.OdbcType.BigInt);
                    prm1.Direction = ParameterDirection.Input;

                    if (Session["StudentID"]==null)
                    {
                        prm1.Value = intNextID;
                    }
                    else
                    {
                        prm1.Value = Session["StudentID"].ToString();
                    }

                    prm2 = p_Command.Parameters.Add("@filename", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = FilePath_7.Text;

                    prm2 = p_Command.Parameters.Add("@type", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = txtFilePath_7.Text;

                    p_Command.ExecuteNonQuery();

                    p_Command = null;

                    //This Will Delete the File After Saving
                    File.Delete(Server.MapPath("UFiles\\" + FilePath_7.Text.Substring(FilePath_7.Text.LastIndexOf("\\"))));

                }
                catch (Exception)
                {
                    errorOccured = true;
                }

            }

            #endregion

            #region File 8
            if (FilePath_8.Text.Trim() != "" && lblFileID8.Text.Equals(""))
            {
                try
                {
                    FileStream fs = new FileStream(Server.MapPath("UFiles\\" + FilePath_8.Text.Substring(FilePath_8.Text.LastIndexOf("\\"))), FileMode.Open, FileAccess.Read);
                    blob = new Byte[fs.Length];
                    fs.Read(blob, 0, blob.Length);
                    fs.Close();
                    p_Command = new System.Data.Odbc.OdbcCommand("{ call sp_certificate_image (?,?,?,?)}", GeneralClass.Program.REG_CONN);
                    p_Command.CommandType = CommandType.StoredProcedure;

                    prm = p_Command.Parameters.Add("@imageFile", System.Data.Odbc.OdbcType.Image);
                    prm.Direction = ParameterDirection.Input;
                    prm.Value = blob;

                    prm1 = p_Command.Parameters.Add("@id", System.Data.Odbc.OdbcType.BigInt);
                    prm1.Direction = ParameterDirection.Input;

                    if (Session["StudentID"]==null)
                    {
                        prm1.Value = intNextID;
                    }
                    else
                    {
                        prm1.Value = Session["StudentID"].ToString();
                    }

                    prm2 = p_Command.Parameters.Add("@filename", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = FilePath_8.Text;

                    prm2 = p_Command.Parameters.Add("@type", System.Data.Odbc.OdbcType.VarChar);
                    prm2.Direction = ParameterDirection.Input;
                    prm2.Value = txtFilePath_8.Text;

                    p_Command.ExecuteNonQuery();
                    p_Command = null;

                    //This Will Delete the File After Saving
                    File.Delete(Server.MapPath("UFiles\\" + FilePath_8.Text.Substring(FilePath_8.Text.LastIndexOf("\\"))));

                }
                catch (Exception)
                {
                    errorOccured = true;
                }

            }

            #endregion
        }

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
    protected void goNext(object o, EventArgs e)
    {   
        //if (MainTab.ActiveTabIndex == 0)
        //{   
        //    TabPanel tp = (TabPanel)MainTab.FindControl("tab_2");
        //    MainTab.ActiveTab = tp;

        //    System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_0");
        //    if (img != null)
        //        img.ImageUrl = "Images/moduleEnabled.gif";
        //    return;
        //}
        //else 
        //This code will make Next button always visible.. before going to any Tab..
        imgNext.Visible = true;
        
        if (MainTab.ActiveTabIndex == 0)
        {
            #region local id validation
            if (txtLocalID.Text.Trim() == "")
            {
                lblLocalID.ForeColor = System.Drawing.Color.Red;
                ModalPopupExtender3.Show();
                return;
            }
            else
            {
                lblLocalID.ForeColor = System.Drawing.Color.Black;                
            }
            #endregion

#region name validation
            if (!mValidateNameData())
            {
                return;
            }
#endregion            
            #region            
            
            #endregion

            try
            {
                TabPanel tp = (TabPanel)MainTab.FindControl("tab_3");
                MainTab.ActiveTab = tp;

                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_1");
                if (img != null)
                    img.ImageUrl = "Images/moduleEnabled.gif";
                return;
            }
            catch (Exception exp)
            {
            }
        }
        else if (MainTab.ActiveTabIndex == 1)
        {
#region Validation Data            
            if(!mValidateAddressData())
            {
                return;
            }

            if (!mValidateRelative())
            {
                return;
            }

#endregion

            try
            {
                TabPanel tp = (TabPanel)MainTab.FindControl("tab_4");
                MainTab.ActiveTab = tp;
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_2");
                if (img != null)
                    img.ImageUrl = "Images/moduleEnabled.gif";
                return;
            }
            catch (Exception exp)
            {
            }
        }
        else if (MainTab.ActiveTabIndex == 2)
        {
            try
            {   
                if(!mValidateSchoolDate())
                {
                    return;
                }

                TabPanel tp = (TabPanel)MainTab.FindControl("post_graduation");
                MainTab.ActiveTab = tp;

                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_3");
                if (img != null)
                    img.ImageUrl = "Images/moduleEnabled.gif";
                return;
            }
            catch (Exception exp_1)
            {
            }
        }
        else if (MainTab.ActiveTabIndex == 3)
        {

            //if (!mValidateSubjectSelection())
            //{
            //    return;
           // }

            TabPanel tp = (TabPanel)MainTab.FindControl("tab_7");
            MainTab.ActiveTab = tp;
            System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_5");
            if (img != null)
                img.ImageUrl = "Images/moduleEnabled.gif";
            return;
        }
        else if (MainTab.ActiveTabIndex == 4)
        {
            if (Session["StudentId"] == null)
            {
                imgNext.Visible = false;
            }

            TabPanel tp = (TabPanel)MainTab.FindControl("tab_8");
            if (tp.Enabled == true)
            MainTab.ActiveTab = tp;
            if (FilePath_1.Text != "" || FilePath_2.Text != "" || FilePath_3.Text != "" ||
                FilePath_5.Text != "" ||
                FilePath_7.Text != "" || FilePath_8.Text != "")
            {
                System.Web.UI.WebControls.Image img = (System.Web.UI.WebControls.Image)AccordionPane1.FindControl("img_tab_6_2");
                if (img != null)
                    img.Visible = true;
            }
            return;
        }
        else if (MainTab.ActiveTabIndex == 5)
        {
            if (!mValidatePassword())
            {
                return;
            }
            MainTab.ActiveTabIndex = 6;            
        }
        else if (MainTab.ActiveTabIndex == 6)
        {
            TabPanel tp = (TabPanel)MainTab.FindControl("tab_8");
            if (tp.Enabled == true)
                MainTab.ActiveTab = tp;            
        }      

    }
    private Boolean mValidateSchoolDate()
    {
        if (cmbSchoolName.Text.Trim() == "" || !mCheckSpecialCharacters(cmbSchoolName.Text.Trim()))
        {
            lblSchoolName.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblSchoolName.ForeColor = System.Drawing.Color.Black;
        }

        

        if (txtSchoolCountryCity.Text.Trim() == "" || !mCheckSpecialCharacters(txtSchoolCountryCity.Text.Trim()))
        {
            lblSchoolCity.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblSchoolCity.ForeColor = System.Drawing.Color.Black;

        }
        if (txtGraduationDuration.Text.Trim() == "")
        {
            lblGraduationDuration.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblGraduationDuration.ForeColor = System.Drawing.Color.Black;

        }
        if (txtAcualMarks.Text.Trim() == "")
        {
            lblActualMarks.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblActualMarks.ForeColor = System.Drawing.Color.Black;
        }
        return true;
    }
    private Boolean mValidateNameData()
    {
        if (txtFirstName_A.Text.Trim() == "" || !mCheckSpecialCharacters((txtFirstName_A.Text.Trim())))
        {
            lblFirstName_Arabic.ForeColor = System.Drawing.Color.Red;            
            ModalPopupExtender3.Show();                        
            return false;
        }
        else
        {
            lblFirstName_Arabic.ForeColor = System.Drawing.Color.Black;
        }
        if (txtFatherName_A.Text.Trim() == "" || !mCheckSpecialCharacters(txtFatherName_A.Text.Trim()))
        {
            lblFatherName_A.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();            
            return false;
        }
        else
            lblFatherName_A.ForeColor = System.Drawing.Color.Black;

        if (txtGrandFatherName_A.Text.Trim() == "" || !mCheckSpecialCharacters(txtGrandFatherName_A.Text.Trim()))
        {
            lblGrandfatherName_A.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();            
            return false;
        }
        else
        {
            lblGrandfatherName_A.ForeColor = System.Drawing.Color.Black;
        }

        if (txtLastName_A.Text.Trim() == "" || !mCheckSpecialCharacters(txtLastName_A.Text.Trim()))
        {
            lblLastName_A.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();            
            return false;
        }
        else
        {
            lblLastName_A.ForeColor = System.Drawing.Color.Black;
        }

        if (txtFirstName_E.Text.Trim() == "" || !mCheckSpecialCharacters(txtFirstName_E.Text.Trim()))
        {
            lblFirstName_Eng.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();            
            return false;
        }
        else
            lblFirstName_Eng.ForeColor = System.Drawing.Color.Black;

        if (txtFatherName_E.Text.Trim() == "" || !mCheckSpecialCharacters(txtFatherName_E.Text.Trim()))
        {
            lblFatherName_Eng.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();            
            return false;
        }
        else
            lblFatherName_Eng.ForeColor = System.Drawing.Color.Black;

        if (txtGrandFatherName_E.Text.Trim() == "" || !mCheckSpecialCharacters(txtGrandFatherName_E.Text.Trim()))
        {
            lblGrandFatherName_Eng.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();            
            return false;
        }
        else
            lblGrandFatherName_Eng.ForeColor = System.Drawing.Color.Black;

        if (txtLastName_E.Text.Trim() == "" || !mCheckSpecialCharacters(txtLastName_E.Text.Trim()))
        {
            lblLastName_Eng.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblLastName_Eng.ForeColor = System.Drawing.Color.Black;
        }

        if (txtPOB.Text.Trim() == "" || !mCheckSpecialCharacters(txtPOB.Text.Trim()))
        {
            lblPOB.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblPOB.ForeColor = System.Drawing.Color.Black;
        }

        if (txtIDIssuedDate.Text.Trim() == "")
        {
            //lblIssuedDate.ForeColor = System.Drawing.Color.Red;
            //ModalPopupExtender3.Show();
            //return false;
        }
        else
            lblIssuedDate.ForeColor = System.Drawing.Color.Black;

        if (txtIDExpDate.Text.Trim() == "")
        {
            //               lblExpdate.ForeColor = System.Drawing.Color.Red;
            //             ModalPopupExtender3.Show();
            //            return false;
        }
        else
        {
            lblExpdate.ForeColor = System.Drawing.Color.Black;
        }

        if (txtidissuedplace.Text.Trim() == "" || !mCheckSpecialCharacters(txtidissuedplace.Text.Trim()))
        {
            lblIdIssuedPlace.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblIdIssuedPlace.ForeColor = System.Drawing.Color.Black;
        }

        return true;
    }
    private Boolean mCheckSpecialCharacters(string strData)
    {
        int intAsciiVal = 0;

        for (int i = 0; i < strData.Length; i++)
        {

            intAsciiVal = Convert.ToInt32(Convert.ToChar(strData.Substring(i, 1).ToString()));
            if (intAsciiVal >= 33 && intAsciiVal <= 47)
            {
                return false;
            }
            if (intAsciiVal >= 58 && intAsciiVal <= 64)
            {
                return false;
            }

            if (intAsciiVal >= 91 && intAsciiVal <= 96)
            {
                return false;
            }

            if (intAsciiVal >= 123 && intAsciiVal <= 126)
            {
                return false;
            }
        }
        return true;
    }
    private Boolean mValidateAddressData()
    {
        if (txtAddress_1_1.Text.Trim() == "" || !mCheckSpecialCharacters(txtAddress_1_1.Text.Trim()))
        {
            lblAddress_1_1.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblAddress_1_1.ForeColor = System.Drawing.Color.Black;
        }
        if (txtAddress_1_2.Text.Trim() == "" || !mCheckSpecialCharacters(txtAddress_1_2.Text.Trim()))
        {
            lblAddress_1_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblAddress_1_2.ForeColor = System.Drawing.Color.Black;

        //if (txtZip_1.Text.Trim() == "")
        //{
        //    lblZip_1.ForeColor = System.Drawing.Color.Red;
        //    ModalPopupExtender3.Show();
        //    return false;
        //}
        //else
        //{
        //    lblZip_1.ForeColor = System.Drawing.Color.Black;
        //}

        //if (txtPostal_1.Text.Trim() == "")
        //{
        //    lblPostal_1.ForeColor = System.Drawing.Color.Red;
        //    ModalPopupExtender3.Show();
        //    return false;
        //}
        //else
        //    lblPostal_1.ForeColor = System.Drawing.Color.Black;

        if (txtCity_1.Text.Trim() == "" || !mCheckSpecialCharacters(txtCity_1.Text.Trim()))
        {
            lblCity_1.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblCity_1.ForeColor = System.Drawing.Color.Black;
        }

        if (cmbCountry_1.Text.Trim().Equals("") || !mCheckSpecialCharacters(cmbCountry_1.Text.Trim()))
        {
            lblAddressCountry_1.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblAddressCountry_1.ForeColor = System.Drawing.Color.Black;
        }

        if (txtStudentMobile.Text.Trim() == "")
        {
            lblStudentMobile.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblStudentMobile.ForeColor = System.Drawing.Color.Black;

        if (txtHomePhone.Text.Trim() == "")
        {
            lblHomePhone_1.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblHomePhone_1.ForeColor = System.Drawing.Color.Black;

        if (!mValidateEmail(txtEmailAddress_2.Text))
        {
            lblEmailAddress_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblEmailAddress_2.ForeColor = System.Drawing.Color.Black;

        if (txtAddress_2_1.Text.Trim() == "" || !mCheckSpecialCharacters(txtAddress_2_1.Text.Trim()))
        {
            lblAddress_2_1.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }

        if (txtAddress_2_2.Text.Trim() == "" || !mCheckSpecialCharacters(txtAddress_2_2.Text.Trim()))
        {
            lblAddress_2_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblAddress_2_2.ForeColor = System.Drawing.Color.Black;


        //if (txtZip_2.Text.Trim() == "")
        //{
        //    lblZip_2.ForeColor = System.Drawing.Color.Red;
        //    ModalPopupExtender3.Show();
        //    return false;
        //}
        //else
        //{
        //    lblZip_2.ForeColor = System.Drawing.Color.Black;
        //}

        //if (txtPostal_2.Text.Trim() == "")
        //{
        //    lblPostal_2.ForeColor = System.Drawing.Color.Red;
        //    ModalPopupExtender3.Show();
        //    return false;
        //}
        //else
        //{
            
        //    lblPostal_2.ForeColor = System.Drawing.Color.Black;
            
        //}
        if (txtCity_2.Text.Trim() == "" || !mCheckSpecialCharacters(txtCity_2.Text.Trim()))
        {
            lblCity_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblCity_2.ForeColor = System.Drawing.Color.Black;
        }

        if (cmbCountry_2.Text.Trim().Equals("") || !mCheckSpecialCharacters(cmbCountry_2.Text.Trim()))
        {
            lblcmbCountry_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblcmbCountry_2.ForeColor = System.Drawing.Color.Black;
        }

        if (!mValidateEmail(txtEMailAddress.Text))
        {
            lblEmailAddress.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblEmailAddress.ForeColor = System.Drawing.Color.Black;
        }

        return true;
    }
    private Boolean mValidateRelative()
    {
        if (txtRelativeName.Text.Trim() == "" || !mCheckSpecialCharacters(txtRelativeName.Text.Trim()))
        {
            lblRelativeName.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblRelativeName.ForeColor = System.Drawing.Color.Black;

        if (txtRelativeMobile.Text.Trim() == "")
        {
            lblRelativeMobile_1.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
            lblRelativeMobile_1.ForeColor = System.Drawing.Color.Black;

        if (txtRelativePhone.Text.Trim() == "")
        {
            lblRelativeMobile.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblRelativeMobile.ForeColor = System.Drawing.Color.Black;
        }

        //Code starts for Second record of Relative
        if (txtRelativeName_2.Text.Trim().Equals("") || !mCheckSpecialCharacters(txtRelativeName_2.Text.Trim()))
        {
            lblRelativeName_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblRelativeName_2.ForeColor = System.Drawing.Color.Black;
        }

        if (txtRelativeMobile_2.Text.Trim().Equals(""))
        {
            lblRelativeMobile_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblRelativeMobile_2.ForeColor = System.Drawing.Color.Black;
        }
        if (txtRelativePhone_2.Text.Trim().Equals(""))
        {
            lblRelativePhone_2.ForeColor = System.Drawing.Color.Red;
            ModalPopupExtender3.Show();
            return false;
        }
        else
        {
            lblRelativePhone_2.ForeColor = System.Drawing.Color.Black;
        }
        return true;
    }
    protected Boolean mValidatePassword()
    {
        if (txtPassword.Text.Trim().Equals("") || txtPassword.Text.Trim().Length < 6 || !txtPassword.Text.Trim().Equals(txtRetypePWD.Text.Trim()))
        {            
            ModalPopUpPassword.PopupControlID = "pnlPassword";
            ModalPopUpPassword.CancelControlID = "btnPasswordClose";
            ModalPopUpPassword.Show();
            return false;
        }

        return true;
    }
    protected void goCancel(object o, EventArgs e)
    {
        Session.Clear(); 
        Session.Abandon();        
        HttpContext.Current.Response.Redirect("index.aspx");
    }    
    protected void CloseRefreshwindow(object o, EventArgs e)
    {
    }
    protected void goPrev(object o, EventArgs e)
    {

        imgNext.Visible = true;         

        if (MainTab.ActiveTabIndex == 6)
        {
            if (Session.Count > 0 && Session["StudentID"] != null)
            {
                MainTab.ActiveTabIndex = 4;
            }
            else
            {
                MainTab.ActiveTabIndex = 5;
            }
            return;
        }
        else if (MainTab.ActiveTabIndex == 5)
        {            
            MainTab.ActiveTabIndex = 4;
            return;
        }
        if (MainTab.ActiveTabIndex == 4)
        {            
            MainTab.ActiveTabIndex = 3;
            return;
        }
        else if (MainTab.ActiveTabIndex == 3)
        {
            MainTab.ActiveTabIndex = 2;
            return;
        }
        else if (MainTab.ActiveTabIndex == 2)
        {            
            MainTab.ActiveTabIndex  = 1;
            return;
        }
        else if (MainTab.ActiveTabIndex == 1)
        {            
            MainTab.ActiveTabIndex = 0;
            return;
        }
    }
    protected void CopyAddress(object o, EventArgs e)
    {
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

        if (txtEmailAddress_2.Text != "")
            txtEMailAddress.Text = txtEmailAddress_2.Text;
        if (txtStudentMobile.Text != "")
            txtStudentMobile_2.Text = txtStudentMobile.Text;
        if (txtHomePhone.Text != "")
            txtHomeTelephone_2.Text = txtHomePhone.Text;
    }          
    protected void ResetValues(object o, EventArgs e)
    {
        try
        {
            //cmb1.Items.Clear();
            //cmb1.Items.Add("الإختيار الأول");
            //cmb1.Items.Add("كلية الطب");
            //cmb1.Items.Add("علوم المختبرات الطبية");
            //cmb1.Items.Add("العلاج التنفسي");
            //cmb1.Items.Add("خدمات الإسعاف والطوارئ");
            //cmb1.Items.Add("لايوجد");

            //cmb2.Items.Clear();
            //cmb2.Items.Add("الإختيار الثاني");
            //cmb2.Items.Add("كلية الطب");
            //cmb2.Items.Add("علوم المختبرات الطبية");
            //cmb2.Items.Add("العلاج التنفسي)");
            //cmb2.Items.Add("خدمات الإسعاف والطوارئ");
            //cmb2.Items.Add("لايوجد");

            //cmb3.Items.Clear();
            //cmb3.Items.Add("الإختيار الثالث");
            //cmb3.Items.Add("كلية الطب");
            //cmb3.Items.Add("علوم المختبرات الطبية");
            //cmb3.Items.Add("العلاج التنفسي");
            //cmb3.Items.Add("خدمات الإسعاف والطوارئ");
            //cmb3.Items.Add("لايوجد");

            //cmb1.Enabled = true;
            //cmb2.Enabled = false;
            //cmb3.Enabled = false;

//            cmb1.SelectedIndex = -1;
  //          cmb2.SelectedIndex = -1;
  //          cmb3.SelectedIndex = -1;
        }
        catch (Exception exp)
        {
        }
    }
    protected void validatecalculationparams(object o, EventArgs e)
    {
        txtAcualMarks.Text = string.Empty;
        txtAcualMarks.Enabled = false;
        //lblMarks.Visible = true;
        if (cmbPercentage.Text.ToString() != null || cmbPercentage.Text.ToString() != "")
        {
            if (cmbPercentage.SelectedValue.ToString() == "100")
            {
                lblMarks.Text = "Enter a value <100";
                
                rngMarks.MaximumValue = "99.99";
                rngMarks.MinimumValue = "0.00";
            }
            else if (cmbPercentage.SelectedValue.ToString() == "5")
            {
                lblMarks.Text = "Enter a value <5";
                
                rngMarks.MaximumValue = "5.00";
                rngMarks.MinimumValue = "0.00";
            }
            else if (cmbPercentage.SelectedValue.ToString() == "4")
            {
                lblMarks.Text = "Enter a value <4";
                
                rngMarks.MaximumValue = "4.00";
                rngMarks.MinimumValue = "0.00";
            }
            txtAcualMarks.Enabled = true;

        }
    }
    protected void CheckLogin(object o, EventArgs e)
    {
        Boolean blnResult = true;
        blnResult = mCheckIDExistence();
        
    }
    private Boolean mCheckIDExistence()
    {
        try
        {
            if (txtEMailII.Text.Trim() == "")
            {
                lblLoginAvalStatus.Text = "الرجاء ادخال اسم مستخدم صحيح";
                return false;
            }
            else
            {
                reader = GeneralClass.Program.gRetrieveRecord("SELECT login FROM registration_main WHERE login='" + txtEMailII.Text.Trim() + "'");
                try
                {
                    if (!reader.HasRows)
                    {
                        lblLoginAvalStatus.Text = "يمكنك إستخدام هذا الإسم";
                        reader.Close();
                        return true;
                    }
                    else
                    {
                        lblLoginAvalStatus.Text = "لقد تم حجز هذا الإسم من قبل شخص آخر. الرجاء إعادة المحاولة مرة ً أخرى";
                        //Session.Add("Login", "LOGIN_FAILED");
                        reader.Close();
                        return false;
                    }

                }
                catch (System.Data.Odbc.OdbcException exp)
                {
                    if (reader != null)
                        reader.Close();

                    //Session.Add("Login", "LOGIN_FAILED");
                    return false;
                }

            }
        }
        catch (Exception exp)
        {
            return false;
        }
    }
    private bool mCheckSchoolIDExistence(string strSchoolID)
    {
        try
        {
            if (Session.Count > 0 && Session["StudentID"] != null)
            {
                return true;
            }
            reader = GeneralClass.Program.gRetrieveRecord("SELECT local_id FROM registration_main WHERE local_id='" + strSchoolID + "'");
            if (reader.HasRows)
            {
                ModalPopUpPassword.PopupControlID = "pnlSchoolID";
                ModalPopUpPassword.CancelControlID = "btnSchoolID";
                ModalPopUpPassword.Show();
                return false;
            }
            else
            {
                return true;
            }            
        }
        catch (Exception exp)
        {
            if (reader!=null)
            {
                reader.Close();
            }
            return false;
        }
        finally
        {
            if (reader!=null)
            {
                reader.Close();
            }
        }
    
    }
    protected void Acknowledge(object o, EventArgs e)
    {
        try
        {
            if (Session["StudentID"] != null)
            {
                GeneralClass.Program.Add("current_status", "Acknowledged", "S");
                int intReturnID = GeneralClass.Program.UpdateRecordStatement("registration_main", "id", Session["StudentID"].ToString());
                if (intReturnID > 0)
                {
                    chk_status_acknowledged.Checked = true;
                    //Response.Redirect("default2.aspx?applicant_id=" + Session["StudentID"].ToString().ToString());
                }
            }
        }
        catch (Exception exp)
        {
        }
    }
    protected void OnSelect(object sender, EventArgs e)
    {
        cmbCountry_1.Text = ((LinkButton)sender).Text;
    }
    protected void OnSelect_2(object sender, EventArgs e)
    {
        cmbCountry_2.Text = ((LinkButton)sender).Text;
    }
    protected void OnSelect_3(object sender, EventArgs e)
    {
        cmbSchoolCountry.Text = ((LinkButton)sender).Text;
    }


    protected void ShowFile(object o, EventArgs e)
    {
        ImageButton bt = (ImageButton)o;
        this.pnl_file.Attributes["new_id"] = bt.ID.ToString();
        ModalPopupExtender4.Show();        
    }    
    protected void CopyFile(object o, EventArgs e)
    {
        try               
        {         
            //This Code will make sure that selected file is having type of JPEG and its size is less then 1 MB.
            if (!txtFilePath.PostedFile.ContentType.Equals("image/pjpeg") || (txtFilePath.PostedFile.ContentLength / 1024) > 1024)
            {

                ModalPopUpPassword.PopupControlID = "pnlFileErr";
                ModalPopUpPassword.CancelControlID = "BtnFileClose";
                ModalPopUpPassword.Show();
                return;

            }

            if (this.pnl_file.Attributes["new_id"].ToString() == "btn_1")
            {
                FilePath_1.Text = txtFilePath.PostedFile.FileName;
            }
            else if (this.pnl_file.Attributes["new_id"].ToString() == "btn_2")
            {

                FilePath_2.Text = txtFilePath.PostedFile.FileName;
            }
            else if (this.pnl_file.Attributes["new_id"].ToString() == "btn_3")
            {
                FilePath_3.Text = txtFilePath.PostedFile.FileName;
            }
            //else if (this.pnl_file.Attributes["new_id"].ToString() == "btn_4")
            //{
            //    FilePath_4.Text = txtFilePath.PostedFile.FileName;
            //}
            else if (this.pnl_file.Attributes["new_id"].ToString() == "btn_5")
            {
                FilePath_5.Text = txtFilePath.PostedFile.FileName;
            }            
            else if (this.pnl_file.Attributes["new_id"].ToString() == "btn_7")
            {
                FilePath_7.Text = txtFilePath.PostedFile.FileName;
            }
            else if (this.pnl_file.Attributes["new_id"].ToString() == "btn_8")
            {
                FilePath_8.Text = txtFilePath.PostedFile.FileName;
            }
            txtFilePath.PostedFile.SaveAs(Server.MapPath("UFiles\\" + txtFilePath.FileName));
        }
        catch (Exception exp)
        { 
        
        }
    }

    protected void logout(object o, EventArgs e)
    {
        try
        {
            Session.Abandon();
            HttpContext.Current.Response.Redirect("index.aspx");
        }
        catch (Exception exp)
        {
        }
    }

    protected void ChangePwd(object o, EventArgs e)
    {
        try
        {
            string strEmail_1 = "";
            string strEmail_2 = "";

            if (Session["StudentID"] == null)
            {
                HttpContext.Current.Response.Redirect("index.aspx");
            }
            if (txtNewPWD.Text.Length<6)
            {
                lblChangePWDStatus.Text = "يجب أن تحوي كلمة المرور ستة أحرف أو أرقام"; // not less than 6 digits.              
                ModalPopupExtender5.Show();
                return;
            }
            else if (!txtNewPWD.Text.Trim().Equals(txtRetypeNewPWD.Text.Trim()))
            {
                lblChangePWDStatus.Text = "كلمتا المرور ليستا متطابقتين"; // not matched.
                ModalPopupExtender5.Show();
                return;
            }
            reader = GeneralClass.Program.gRetrieveRecord("SELECT password,email_address_1,emailaddress_2 FROM registration_main WHERE id=" + Session["StudentID"].ToString() + " AND password='" + txtOldPWD.Text + "'");
            if (!reader.HasRows)
            {
                lblChangePWDStatus.Text = "كلمة المرور القديمة غير صحيحة"; //Old password is not correct
                reader.Close();
                ModalPopupExtender5.Show();
                return;
            }
            else
            {
                while (reader.Read())
                {
                    strEmail_1 = reader["email_address_1"].ToString();
                    strEmail_2 = reader["emailaddress_2"].ToString();
                }
                reader.Close();
            }            
            if( reader!=null)
                reader.Close();

            GeneralClass.Program.Add("password", txtNewPWD.Text.Trim(), "S");
            int intRetID=GeneralClass.Program.UpdateRecordStatement("registration_main", "id", Session["StudentID"].ToString());
            if (intRetID > 0)
            {
                lblChangePWDStatus.Text = "تم تغيير كلمة المرور بنجاح"; //Successfully Changed
                if (strEmail_1 != "")
                {
                    GeneralClass.Program.SendMail("Addmission@ngha.med.sa", strEmail_1.Trim(), "تم تغيير كلمة المرور", "لقد تم تحديث كلمة المرور حسب طلبك");
                }
                if (strEmail_2 != "")
                {
                    GeneralClass.Program.SendMail("Addmission@ngha.med.sa", strEmail_2.Trim(), "تم تغيير كلمة المرور", "لقد تم تحديث كلمة المرور حسب طلبك");
                }
            }
            else
                lblChangePWDStatus.Text = "تأكد من البيانات المدخلة<br>لم يتم تغيير كلمة المرور الحالية."; //Never Changed, make sure you enter the correct data

            ModalPopupExtender5.Show();
            return;
        }
        catch (Exception exp)
        {
            
        }
    }
    protected void gotoStatusTab(object o, EventArgs e)
    {
        MainTab.ActiveTabIndex=6;// = "tb_status";
    }
    protected void DelFile(object o, EventArgs e)
    {
        ImageButton btnTemp = (ImageButton)o;
        switch (btnTemp.ID)
        { 
            case "btnDelFile1":
                GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID1.Text);
                btnDelFile1.Visible = false;
                FilePath_1.Enabled = true;
                FilePath_1.Text = "";
                lblFileID1.Text = "";
                btn_1.Enabled = true;
                return;
            case "btnDelFile2":
                GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID2.Text);
                btnDelFile2.Visible = false;
                FilePath_2.Enabled = true;
                FilePath_2.Text = "";
                lblFileID2.Text = "";
                btn_2.Enabled = true;
                return;
            case "btnDelFile3":
                GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID3.Text);
                btnDelFile3.Visible = false;
                FilePath_3.Enabled = true;
                FilePath_3.Text = "";
                lblFileID3.Text = "";
                btn_3.Enabled = true;
                return;
            //case "btnDelFile4":
            //    GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID4.Text);
            //    btnDelFile4.Visible = false;
            //    FilePath_4.Enabled = true;
            //    FilePath_4.Text = "";
            //    lblFileID4.Text = "";
            //    btn_4.Enabled = true;
            //    return;
            case "btnDelFile5":
                GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID5.Text);
                btnDelFile5.Visible = false;
                FilePath_5.Enabled = true;
                FilePath_5.Text = "";
                lblFileID5.Text = "";
                btn_5.Enabled = true;
                return;
            //case "btnDelFile6":
            //    GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID6.Text);
            //    btnDelFile6.Visible = false;
            //    FilePath_6.Enabled = true;
            //    FilePath_6.Text = "";
            //    lblFileID6.Text = "";
            //    btn_6.Enabled = true;
            //    return;
            case "btnDelFile7":
                GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID7.Text);
                btnDelFile7.Visible = false;
                FilePath_7.Enabled = true;
                FilePath_7.Text = "";
                lblFileID7.Text = "";
                btn_7.Enabled = true;
                return;
            case "btnDelFile8":
                GeneralClass.Program.gDeleteRecord("DELETE FROM t_certificates WHERE id= " + lblFileID8.Text);
                btnDelFile8.Visible = false;
                FilePath_8.Enabled = true;
                FilePath_8.Text = "";
                lblFileID8.Text = "";
                btn_8.Enabled = true;
                return;
        }        
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
    private void mSetFormControl(bool status)
    {
        txtFirstName_A.Enabled = status;
        txtFirstName_E.Enabled = status;
        txtFatherName_A.Enabled = status;
        txtFatherName_E.Enabled = status;
        txtGrandFatherName_A.Enabled = status;
        txtGrandFatherName_E.Enabled = status;
        txtLastName_A.Enabled = status;
        txtLastName_E.Enabled = status;
        cmdHijiDob_Date.Enabled = status;
        cmdHijiDob_Month.Enabled = status;
        cmdHijiDob_Year.Enabled = status;        
        txtPOB.Enabled = status;
        txtidissuedplace.Enabled = status;
        exp_date.Enabled = status;
        exp_month.Enabled = status;
        exp_year.Enabled = status;

        issue_dt_date.Enabled = status;
        issue_dt_month.Enabled = status;
        issue_dt_year.Enabled = status;

        txtAddress_1_1.Enabled = status;
        txtAddress_1_2.Enabled = status;
        txtAddress_2_1.Enabled = status;
        txtAddress_2_2.Enabled = status;
        txtZip_1.Enabled = status;
        txtZip_2.Enabled = status;
        txtCity_1.Enabled = status;
        txtCity_2.Enabled = status;
        cmbCountry_1.Enabled = status;
        cmbCountry_2.Enabled = status;
        txtStudentMobile.Enabled = status;
        txtStudentMobile_2.Enabled = status;
        txtHomePhone.Enabled = status;
        txtHomeTelephone_2.Enabled = status;
        txtEMailAddress.Enabled = status;
        txtEmailAddress_2.Enabled = status;

        txtRelativeName.Enabled = status;
        txtRelationship.Enabled = status;
        txtRelativeMobile.Enabled = status;
        txtRelativePhone.Enabled = status;
        txtRelativeName_2.Enabled = status;
        cmbRelationShip_2.Enabled = status;
        txtRelativePhone_2.Enabled = status;
        txtRelativeMobile_2.Enabled = status;

        cmbSchoolName.Enabled = status;
        txtSchoolCountryCity.Enabled = status;
        cmbSchoolCountry.Enabled = status;

        //cmb1.Enabled = status;
        //cmb2.Enabled = status;
        //cmb3.Enabled = status;
        txtEMailII.Enabled = status;

        //txtGeneralPercentage.Enabled = status;
        //txtGPAComputed.Enabled = status;
        txtPassword.Enabled = status;
        imgNext.Enabled = status;
        imgPrev.Enabled = status;
        imgSave.Enabled = status;       

        RadSingle.Enabled = status;
        RadMarried.Enabled = status;
        txtChildCount.Enabled = status;
        txtPostal_1.Enabled = status;
        txtPostal_2.Enabled = status;
        DropPanel.Enabled = status;
        DropPanel_1.Enabled = status;
        cmbAreaCode1.Enabled = status;
        cmbAreaCode2.Enabled = status;
        cmbAreaCode3.Enabled = status;
        cmbAreaCode4.Enabled = status;
        btnCopyAddress.Enabled = status;        
        
        btn_1.Enabled = status;
        btn_2.Enabled = status;
        btn_3.Enabled = status;
        btn_5.Enabled = status;
        
        btn_7.Enabled = status;
        btn_8.Enabled = status;
        txtRetypePWD.Enabled = status;
    }
    private void mClearFormCtrl()
    {
        lblFullName.Text = "";
        txtFirstName_A.Text = "";
        txtFirstName_E.Text = "";
        txtFatherName_A.Text = "";
        txtFatherName_E.Text = "";
        txtGrandFatherName_A.Text = "";
        txtGrandFatherName_E.Text = "";
        txtLastName_A.Text = "";
        txtLastName_E.Text = "";
        cmdHijiDob_Date.SelectedIndex = -1;
        cmdHijiDob_Month.SelectedIndex = -1;
        cmdHijiDob_Year.SelectedIndex = -1;
        dob_date.SelectedIndex = -1;
        dob_month.SelectedIndex = -1;
        dob_year.SelectedIndex = -1;
        txtPOB.Text = "";
        txtidissuedplace.Text = "";
        exp_date.SelectedIndex = -1;
        exp_month.SelectedIndex = -1;
        exp_year.SelectedIndex = -1;

        issue_dt_date.SelectedIndex = -1;
        issue_dt_month.SelectedIndex = -1;
        issue_dt_year.SelectedIndex = -1;

        txtAddress_1_1.Text = "";
        txtAddress_1_2.Text = "";
        txtAddress_2_1.Text = "";
        txtAddress_2_2.Text = "";
        txtZip_1.Text = "";
        txtZip_2.Text = "";
        txtCity_1.Text = "";
        txtCity_2.Text = "";
        cmbCountry_1.Text = "";
        cmbCountry_2.Text = "";
        txtStudentMobile.Text = "";
        txtStudentMobile_2.Text = "";
        txtHomePhone.Text = "";
        txtHomeTelephone_2.Text = "";
        txtEMailAddress.Text = "";
        txtEmailAddress_2.Text = "";

        txtRelativeName.Text = "";
        txtRelationship.SelectedIndex = 0;
        txtRelativeMobile.Text = "";
        txtRelativePhone.Text = "";
        txtRelativeName_2.Text = "";
        cmbRelationShip_2.SelectedIndex = 0;
        txtRelativePhone_2.Text = "";
        txtRelativeMobile_2.Text = "";

        cmbSchoolName.Text = "";
        txtSchoolCountryCity.Text = "";
        cmbSchoolCountry.Text = "";

        //cmb1.SelectedIndex = 0;
        //cmb2.SelectedIndex = 0;
        //cmb3.SelectedIndex = 0;
        txtEMailII.Text = "";

//        txtGeneralPercentage.Text = "00.00";
 //       txtGPAComputed.Text = "00.00";
    }
    private void mDisplayNames(string strFullName)
    {
        try
        {
            int intIndex = 0;

            if (!strFullName.IndexOf("بن").Equals(-1))
            {
                if (!strFullName.IndexOf("بن").Equals(strFullName.LastIndexOf("بن")))
                {
                    txtLastName_A.Text = strFullName.Substring(strFullName.LastIndexOf(" "));
                    txtFirstName_A.Text = strFullName.Substring(0, strFullName.IndexOf("بن"));
                    intIndex = strFullName.IndexOf("بن");
                    txtFatherName_A.Text = strFullName.Substring(intIndex + 2, strFullName.LastIndexOf("بن") - (intIndex + 2));
                    intIndex = strFullName.LastIndexOf("بن") + 3;
                    txtGrandFatherName_A.Text = strFullName.Substring(intIndex, strFullName.IndexOf(" ", intIndex) - intIndex);

                }
                else
                {
                    txtLastName_A.Text = strFullName.Substring(strFullName.LastIndexOf(" "));
                    txtFirstName_A.Text = strFullName.Substring(0, strFullName.IndexOf("بن"));
                    intIndex = strFullName.IndexOf("بن") + 2;
                    txtFatherName_A.Text = strFullName.Substring(intIndex, strFullName.IndexOf(" ", intIndex+1) - intIndex);
                    intIndex = strFullName.IndexOf(" ", intIndex + 1);
                    txtGrandFatherName_A.Text = strFullName.Substring(intIndex + 1, strFullName.IndexOf(" ", intIndex + 1) - intIndex);
                
                }
            }
            else
            {
                txtLastName_A.Text = strFullName.Substring(strFullName.LastIndexOf(" "));
                txtFirstName_A.Text = strFullName.Substring(0, strFullName.IndexOf(" "));
                intIndex = strFullName.IndexOf(" ");
                txtFatherName_A.Text = strFullName.Substring(intIndex + 1, strFullName.IndexOf(" ", intIndex + 1) - intIndex);
                intIndex = strFullName.IndexOf(" ", intIndex + 1);
                txtGrandFatherName_A.Text = strFullName.Substring(intIndex + 1, strFullName.IndexOf(" ", intIndex + 1) - intIndex);
            }
            
        }
        catch (Exception exp)
        { 
            
        }
    }
    protected void ChangeEnglishDate(object o,EventArgs e)
    {
        try
        {
            string strDate;            
            string[] strDateParts;
            cl.Dates();            

            strDate = cmdHijiDob_Year.Text.Trim() + "/" + Convert.ToString(cmdHijiDob_Month.SelectedIndex + 1) + "/" + Convert.ToString(cmdHijiDob_Date.SelectedIndex + 1);            

            if (cl.IsHijri(strDate))
            {
                strDateParts = cl.HijriToGreg(strDate).Split(new char[] { '/' });
                dob_date.SelectedIndex = Convert.ToInt32(strDateParts[0]) - 1;
                dob_month.SelectedIndex = Convert.ToInt32(strDateParts[1]) - 1;
                dob_year.Text = strDateParts[2]; 
            }
        }
        catch (Exception exp)
        { 
        
        }
        
    }
    protected void openContactUs(object o, EventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }
    protected void openContactUs1(object o, EventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }

    protected void CalculateGrade(object o, EventArgs e)
    {

        System.Threading.Thread.Sleep(500);
        if (txtAcualMarks.Text == null || txtAcualMarks.Text == "")
        {
            lblMarks.Visible = true;
            lblMarks.Text = "Invalid data";
        }
        for (int i = 1; i < grade.Rows.Count; i++)
        {
            this.grade.Rows[i].BackColor = System.Drawing.Color.Transparent;
        }
        #region
        if (txtAcualMarks.Text.Trim() != "" && cmbPercentage.SelectedValue.ToString() == "100")
        {
            double dbtScore = Convert.ToDouble(txtAcualMarks.Text);
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
        #endregion
        else if (txtAcualMarks.Text.Trim() != "" && cmbPercentage.SelectedValue.ToString() == "5")
        {
            double dbtScore = Convert.ToDouble(txtAcualMarks.Text);
            if (dbtScore >= 4.75)
            {
                this.grade.Rows[1].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 4.50)
            {
                this.grade.Rows[2].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >=4.00)
            {
                this.grade.Rows[3].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 3.50)
            {
                this.grade.Rows[4].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 3.00)
            {
                this.grade.Rows[5].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 2.50)
            {
                this.grade.Rows[6].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 2.00)
            {
                this.grade.Rows[7].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 1.50)
            {
                this.grade.Rows[8].BackColor = System.Drawing.Color.CadetBlue;
            }
            else 
            {
                this.grade.Rows[9].BackColor = System.Drawing.Color.CadetBlue;
            }
        }

        else if (txtAcualMarks.Text.Trim() != "" && cmbPercentage.SelectedValue.ToString() == "4")
        {
            double dbtScore = Convert.ToDouble(txtAcualMarks.Text);
            if (dbtScore >= 3.75)
            {
                this.grade.Rows[1].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 3.50)
            {
                this.grade.Rows[2].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 3.00)
            {
                this.grade.Rows[3].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 2.50)
            {
                this.grade.Rows[4].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 2.00)
            {
                this.grade.Rows[5].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 1.50)
            {
                this.grade.Rows[6].BackColor = System.Drawing.Color.CadetBlue;
            }
            else if (dbtScore >= 1.00)
            {
                this.grade.Rows[7].BackColor = System.Drawing.Color.CadetBlue;
            }
            else
            {
                this.grade.Rows[9].BackColor = System.Drawing.Color.CadetBlue;
            }
        }
    }
}


