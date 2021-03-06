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
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void lblValidateID_Click(object o, EventArgs e)
    {

        if (txtLocalID.Text != "")
        {
            System.Data.Odbc.OdbcDataReader reader = GeneralClass.Program.gRetrieveHistory(this.txtLocalID.Text.Trim(), "14271426");
            try
            {
                while (reader.Read())
                {
                    CalendarLibrary cl = new CalendarLibrary();
                    cl.Dates();

                    txtDOB.Text = cl.HijriToGreg(reader["birth_date"].ToString());
                    txtPOB.Text = reader["birth_place"].ToString();

                    int intFName = reader["st_name"].ToString().IndexOf(" ");
                    int intLName = reader["st_name"].ToString().LastIndexOf(" ");
                    txtFirstName_A.Text = reader["st_name"].ToString().Substring(0, intFName);
                    txtLastName_A.Text = reader["st_name"].ToString().Substring(intLName);
                    txtGrandFatherName_A.Text = reader["st_name"].ToString().Substring(intFName, intLName);
                    txtIDIssuedDate.Text = cl.HijriToGreg(reader["card_issued_date"].ToString());
                    txtidissuedplace.Text = reader["card_issued_place"].ToString();
                    //txtSchoolGPA.Text = reader["GPA"].ToString();
                    txtGeneralPercentage.Text = reader["GPA"].ToString();
                    double dml1 = double.Parse(txtGeneralPercentage.Text);
                    double dml2 = dml1 * 0.1;
                    txtGPAComputed.Text = dml2.ToString();
                    cmbSchoolName.Text = reader["schoolname"].ToString();
                }

                reader.Close();

                decimal decMadano33 = 0;
                decimal decMadano32 = 0;
                decimal decMadano60 = 0;
                decimal decMadano80 = 0;
                decimal aptitudeexam = 0;
                decimal knowledgeexam = 0;
                decimal decMadano31 = 0;
                reader = GeneralClass.Program.gRetrieveRecord("SELECT degree_total_subj1 FROM st_examination " +
                    " WHERE maddano=33 AND st_examination.STUDENT_ID='" + this.txtLocalID.Text.Trim() + "'");

                while (reader.Read())
                {
                    decMadano33 = decimal.Parse(reader["degree_total_subj1"].ToString());
                    txtChemistry_33.Text = decMadano33.ToString();
                }
                reader.Close();

                reader = GeneralClass.Program.gRetrieveRecord("SELECT degree_total_subj1 FROM st_examination " +
                    " WHERE maddano=32 AND st_examination.STUDENT_ID='" + this.txtLocalID.Text.Trim() + "'");

                while (reader.Read())
                {
                    decMadano32 = decimal.Parse(reader["degree_total_subj1"].ToString());
                    txtBiology_32.Text = decMadano32.ToString();
                }
                reader.Close();

                reader = GeneralClass.Program.gRetrieveRecord("SELECT degree_total_subj1 FROM st_examination " +
                   " WHERE maddano=60 AND st_examination.STUDENT_ID='" + this.txtLocalID.Text.Trim() + "'");

                while (reader.Read())
                {
                    decMadano60 = decimal.Parse(reader["degree_total_subj1"].ToString());
                    txtMaths_60.Text = decMadano60.ToString();
                }
                reader.Close();

                reader = GeneralClass.Program.gRetrieveRecord("SELECT degree_total_subj1 FROM st_examination " +
                  " WHERE maddano=80 AND st_examination.STUDENT_ID='" + this.txtLocalID.Text.Trim() + "'");

                while (reader.Read())
                {
                    decMadano80 = decimal.Parse(reader["degree_total_subj1"].ToString());
                    txtEnglish_80.Text = decMadano80.ToString();
                }
                reader.Close();


                reader = GeneralClass.Program.gRetrieveRecord("SELECT degree_total_subj1 FROM st_examination " +
                  " WHERE maddano=31 AND st_examination.STUDENT_ID='" + this.txtLocalID.Text.Trim() + "'");

                while (reader.Read())
                {
                    decMadano31 = decimal.Parse(reader["degree_total_subj1"].ToString());
                    txtPhy.Text = decMadano31.ToString();
                }
                reader.Close();

                decimal todatl_madda = (decMadano32 + decMadano33 + decMadano60 + decMadano80 + decMadano31) / 5;
                txtScintificMarksConverted.Text = todatl_madda.ToString();
                double txtScMarks = double.Parse(txtScintificMarksConverted.Text);
                double txtFinalScMarks = txtScMarks * 0.25;
                txtScintificMarksConverted.Text = txtFinalScMarks.ToString();

                reader = GeneralClass.Program.gRetrieveRecord("SELECT aptitudemarks,knowledge_exam FROM new_aptitude_exam WHERE [local id]='" + txtLocalID.Text.Trim() + "'");
                while (reader.Read())
                {
                    aptitudeexam = decimal.Parse(reader["aptitudemarks"].ToString());
                    txtGodarat.Text = aptitudeexam.ToString();

                    double dblGod = double.Parse(txtGodarat.Text);
                    double dblGod2 = dblGod * 0.30;

                    txtGodaratFinal.Text = dblGod2.ToString();

                    knowledgeexam = decimal.Parse(reader["knowledge_exam"].ToString());
                    txtKnowExam.Text = knowledgeexam.ToString();

                    double dblKnow = double.Parse(txtKnowExam.Text);
                    double dblKnow2 = dblKnow * 0.35;

                    txtFinalKnowledgeExam.Text = dblKnow2.ToString();
                }
                reader.Close();

                //txtTotalConvertedMarks.Text = double.Parse(txtGPAComputed.Text) + double.Parse(txtScintificMarksConverted.Text);
            }

            catch (System.Data.Odbc.OdbcException exp)
            {
                if (reader != null)
                    reader.Close();
            }


        }
        //txtLocalID.Text = "You have clicked me";
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
    }

    protected void UniversitySelected(Object o, EventArgs e)
    {
        if (cmdUniversityName.SelectedIndex == cmdUniversityName.Items.Count - 1)
        {
            txtOtherUniversity.Visible = true;
        }
        else
        {
            txtOtherUniversity.Visible = false;
        }
    }

    protected void SpecialityChanged(object o, EventArgs e)
    {
        if (cmbUniversitySpecility.SelectedIndex == cmbUniversitySpecility.Items.Count - 1)
        {
            txtOtherSpeciality.Visible = true;
        }
        else
        {
            txtOtherSpeciality.Visible = false;
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
}

