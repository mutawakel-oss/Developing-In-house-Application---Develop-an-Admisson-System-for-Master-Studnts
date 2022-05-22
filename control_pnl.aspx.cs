using System;
using System.Data;
using System.Data.Odbc;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class control_pnl : System.Web.UI.Page
{
    OdbcDataReader reader = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT ((row_number() over ( order by actual_marks desc))) AS 'Serial_No',id,current_status,first_name_e+' ' +grand_father_e [Name],bachelor_major,actual_marks,graduation_year FROM [registration_main]";
        SqlDataSource1.DataBind();
        if (!IsPostBack)
        {
            
        }
    }

    protected void ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
        {
            Label lblID = (Label)e.Item.FindControl("lblID");
            if (lblID != null)
            {
                try
                {
                    Table tbQualification = new Table();
                    
                    TableHeaderRow th1 = new TableHeaderRow();
                    th1.BackColor = System.Drawing.Color.LightGray;
                    TableHeaderCell tc2 = new TableHeaderCell();
                    tc2.Font.Bold = false;
                    tc2.Text = "Type|";
                    th1.Cells.Add(tc2);
                    TableHeaderCell tc1 = new TableHeaderCell();
                    tc1.Font.Bold = false;
                    tc1.Text = "Title|";
                    th1.Cells.Add(tc1);
                                        
                  

                    TableHeaderCell tc3 = new TableHeaderCell();
                    tc3.Font.Bold = false;
                    tc3.Text = "Acquiaition Date";
                    th1.Cells.Add(tc3);
                    

                    tbQualification.Rows.Add(th1);
                    reader = GeneralClass.Program.gRetrieveRecord("SELECT * FROM t_post_graduation WHERE registration_id=" + lblID.Text);
                    while (reader.Read())
                    {                        
                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();
                        tbQualification.Rows.Add(tr);                        
                        Label lblDegreeName = new Label();
                        lblDegreeName.Text = reader["post_graduation"].ToString();
                        tc.Controls.Add(lblDegreeName);
                        e.Item.Cells[6].Controls.Add(tc);
                        tr.Cells.Add(tc);
                        TableCell tctype = new TableCell();
                        tctype.Text = reader["Type"].ToString();
                        tr.Cells.Add(tctype);

                        TableCell tcQualification = new TableCell();
                        tcQualification.Text = reader["dateofacquisition"].ToString();
                        tr.Cells.Add(tcQualification);
                        
                    }
                    reader.Close();
                    e.Item.Cells[6].Controls.Add(tbQualification);
                }
                catch (OdbcException exp1)
                {
                    if (reader != null)
                        reader.Close();
                }
            }
        }
    }

    protected void CallForInterview(object sender, EventArgs e)
    {
        foreach (DataGridItem dg in grd_action_report.Items)
        {
            CheckBox chk = (CheckBox)dg.FindControl("chkStatus");
            if (chk.Checked == true && chk.Enabled==true)
            {
                Label lblID = (Label)dg.FindControl("lblID");
                GeneralClass.Program.Add("current_status", "Invited For Interview", "S");
                GeneralClass.Program.UpdateRecordStatement("registration_main", "id", lblID.Text);
            }
        }

        grd_action_report.DataBind();

    }
    protected void grd_action_report_DeleteCommand(object source, DataGridCommandEventArgs e)
    {

        //=====================================================//
        /// <summary>
        /// Description:This function will be used to open the details page of the student information
        /// Author: mutawakelm
        /// Date :1/31/2009 8:25:25 AM
        /// Parameter:
        /// input:
        /// output:
        /// Example:
        /// <summary>
        //=====================================================//
        try
        {
           //The following query will get the informaion of the student
            string strStQuery = "SELECT id,login,first_name_a + ' '+father_name_a +' '+ grand_father_a + ' '+last_name_a [Name] FROM registration_main WHERE id=" + e.Item.Cells[2].Text;
            reader = GeneralClass.Program.gRetrieveRecord(strStQuery);
            if (reader.HasRows)
            {
                reader.Read();
                Session.Add("StudentName", reader["Name"].ToString());
                Session.Add("StudentID", reader["ID"].ToString());
                Session["order"] = "Intermediate1";
                HttpContext.Current.Response.Redirect("register.aspx");
                reader.Close();
            }
            else reader.Close();
               
            
        }
        catch (Exception exp)
        {
            if (reader != null)
                reader.Close();
        }
    }
}
