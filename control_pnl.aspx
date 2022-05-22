<%@ Page Language="C#" AutoEventWireup="true" CodeFile="control_pnl.aspx.cs" Inherits="control_pnl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Control Panel</title>
      <link href="mathertel.css" rel="stylesheet" type="text/css" />
        <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
         <link href="css/themes/spread.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert_lite.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alphacube.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/darkX.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/nuncio.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        
         <table align="center" id="tbmain" runat="server" >
    <tr>
    <td>
        <img  id="Img3" src="Images/hed.gif" runat="server" />
        <table dir="ltr" width="100%" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n" >
          <div  class="dialog_title title_window" ><b>Administrator Page</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
      </table>
      
     <table dir="ltr" width="100%" cellpadding="0" cellspacing="0" class="mid table_window">
        <tr>
          <td class="dialog_w"></td>
            <td class="dialog_content"  dir="ltr" style="font-family:Arial;font-size:medium" valign="top">&nbsp;
              <asp:DataGrid  OnItemDataBound="ItemDataBound" Font-Names=Arial ID="grd_action_report" Font-Size="Small"  
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" runat="server" OnDeleteCommand="grd_action_report_DeleteCommand">
                        <Columns>  
                            <asp:TemplateColumn Visible=False>
                                <ItemTemplate>
                                    <asp:Label ID="lblID" Visible=false runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateColumn>     
                            <asp:BoundColumn DataField="Serial_No" HeaderText="No"></asp:BoundColumn> 
                            <asp:BoundColumn DataField="id" HeaderText="Id"></asp:BoundColumn> 
                            <asp:BoundColumn DataField="Name" HeaderText="Name"></asp:BoundColumn> 
                            <asp:BoundColumn DataField="bachelor_major" HeaderText="Bachelor Major"></asp:BoundColumn> 
                            <asp:BoundColumn DataField="actual_marks" HeaderText="G.P.A"></asp:BoundColumn>
                            <asp:BoundColumn DataField="graduation_year" HeaderText="Graduation Year"></asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="Qualifications">
                                <ItemTemplate>
                            
                                </ItemTemplate>
                            </asp:TemplateColumn>     
                            
                             <asp:TemplateColumn HeaderText="Select for&lt;br&gt;Interview">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkStatus" 
                                    Checked='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))!="Submitted" ? true: false %>'
                                    Enabled='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))!="Submitted" ? false: true %>'
                                     runat="Server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>    
                             <asp:TemplateColumn HeaderText="Interview &lt;br&gt;Status&lt;br&gt;(pass/fail)">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkPassYN" runat="Server" 
                                    Enabled='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Submitted" ? false: true %>'
                                    />
                                </ItemTemplate>
                            </asp:TemplateColumn>  
                            <asp:ButtonColumn CommandName="Delete" HeaderText="Select" Text="--&gt;"></asp:ButtonColumn>
                            
                        </Columns>
        </asp:DataGrid>
            </td>
          <td class="dialog_e" ></td>
        </tr>
      </table>
        <table dir="ltr" width="100%" cellpadding="0" cellspacing="0" class="bot table_window">
        <tr>
          <td class="dialog_sw">&nbsp;</td>
            <td class="dialog_s" width="100%"><div class='status_bar' align="center" >&nbsp;
            <asp:LinkButton ID="lnlInterviewCall" OnClick="CallForInterview" ToolTip="Click here to call the selected candiates for interview." Text="Call for Interview" runat="server" ></asp:LinkButton>
            
            <asp:LinkButton ID="lnkPassfail"  ToolTip="Click here to Select the candidate " Text="Select Students" runat="server" ></asp:LinkButton>
                       
            
            </div></td>
            
        </tr>
      </table>
      
      
    </td>
    </tr>
    
    <tr>
    <td align="center">
    

        
    </td>
    </tr>
    </table>
    </div>
            <asp:SqlDataSource  
            ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:RegistrationMedicalEducationConnectionString %>">
    </asp:SqlDataSource>
    </form>
    <div align=center>
			    <font style="font-size:small">
                    ITS Developers ©2009
                    College of Medicine
                </font>            
            </div>
</body>
</html>
