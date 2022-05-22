<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report1.aspx.cs" Inherits="report1" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link href="../mathertel.css" rel="stylesheet" type="text/css" />
</head>
<body dir="rtl"  >
    <form  id="frmReport" runat="server">
    <asp:ScriptManager ID="MasterScript" runat="server"  EnableScriptGlobalization="true"></asp:ScriptManager>	
   
    
    <asp:SqlDataSource runat="server" ID="SQLTop500" 
    ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
    
    
    
    <asp:SqlDataSource runat="server" ID="Param1_source" 
    ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
    
     <asp:SqlDataSource runat="server" ID="Invite_source" 
    ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
    <div align="center">
    <table id="maintable" runat="server">
    <tr>
    <td  valign="top">    
         <asp:UpdatePanel  ID="upd_top_500" runat="server">
    <ContentTemplate>
    <div id="divLogOut" runat="server" align="left">
    <font color="green" size="1"><asp:Label ID="lblWelcome" runat="server" Text="Welcome To Control Panel"></asp:label></font>
    <br />
    <font color="red" size="1"><asp:LinkButton ID="lnkLogOut" runat="server" Text="Log Out" OnClick="LogOut"></asp:LinkButton></font>
    </div>
    <ajaxToolkit:TabContainer Width="875px" id="tabmain" runat="server">
    <ajaxToolkit:TabPanel ID="TabPanel1"  HeaderText="Top 500" runat="server">
    <ContentTemplate>
    
         <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
         <tr>
         <td>
          
         <span style="font-size:medium;font-family:Simplified Arabic;font-style:italic">
        Info #1:The following list shows applicant details based on the criteria:<br /> (Top 500 in the "Total Marks")
    </span><br /><br />
    
        <asp:DataGrid ID="grd_top_500" Font-Size="Medium" Font-Names="Simplified Arabic" 
                        AutoGenerateColumns="false" Width="850px" DataSourceID="SQLTop500" runat="server">
        <Columns>
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <asp:Label ID="lblAuthNumber" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>         
            
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <asp:Label ID="Label3" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "local_id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
              <asp:TemplateColumn ItemStyle-HorizontalAlign="right" HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="100px" headertext="Choices">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            1
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_1")%><br />
                                2
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_2")%>
                                <br />3
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_3")%>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <asp:Label Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'  runat="server" id="name"></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label ID="Label1" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label ID="lblGPA" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label ID="Label2" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label ID="Label3" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                       
        </Columns>
        </asp:DataGrid>
         </td>
         </tr>
         </table>
        
    </ContentTemplate>
    </ajaxToolkit:TabPanel>
    
    <ajaxToolkit:TabPanel runat="server" ID="tab_medicine" HeaderText="Medcine Top 60">
         <ContentTemplate>
            <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
         <tr>
         <td>
          <span style="font-size:medium;font-family:Simplified Arabic;font-style:italic">
        Info #2:The following list shows applicant details based on the criteria:<br /> (Top 60 in the "Total Marks" + Criteria selected in "Medicine")
    </span><br /><br />
        
    
        <asp:DataGrid ID="grd_top_60_medicine" DataSourceID="SQLTopMedcine_60" runat="server"  Font-Size="Medium" Font-Names="Simplified Arabic" 
                        AutoGenerateColumns="false" Width="850px">
      
      <Columns>
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <asp:Label ID="lblAuthNumber_2" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>         
            
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
              <asp:TemplateColumn HeaderStyle-VerticalAlign=Top ItemStyle-HorizontalAlign="right" HeaderStyle-Width="100px" headertext="Choices">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            1
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_1")%><br />
                                2
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_2")%>
                                <br />3
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_3")%>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>                                               
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  Visible="false" headertext="Email">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label Visible="false" ID="lblEmail_1" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "email_address_1") %>' ></asp:Label>
                                               <br />
                                               <asp:Label Visible="false" ID="lblEmail_2" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "emailaddress_2") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderText="Choose">
                        <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                <tr>
                                    <td style="border: 0px;">                                           
                                        <span>
                                            <asp:CheckBox id="chk_top_medicine" runat="server" />
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        </asp:TemplateColumn>
        </Columns>
        </asp:DataGrid>
        
         </td>
         </tr>
         <tr>         
         <td style="text-align:left" dir=ltr><asp:Button OnClick="SelectAllMedicineApps" ID="btnSelectAllMedicineApp" runat="server" Text="Check all" />
         <asp:Button Text="Invite" OnClick="InviteMedicineApps"  ID="btnInviteMedicine" runat="server" />
         </td>
         </tr>
         </table>
         </ContentTemplate>
         
         
    </ajaxToolkit:TabPanel>
    
    <ajaxToolkit:TabPanel ID="TabPanel2" HeaderText="Top 30 Respiratory" runat="server">
    <ContentTemplate>
         <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
         <tr>
         <td>
         <span style="font-size:medium;font-family:Simplified Arabic;font-style:italic">
        Info #3:The following list shows applicant details based on the criteria: <br />        
        (Top 30 in the "Total Marks" + Criteria selected in "Respiratory" as the 1st Or 2nd or 3rd Choice)
    </span><br /><br />
    
      
        
    <asp:DataGrid ID="grd_top_30_respiratory"  DataSourceID="SQLTop_Respiratory" runat="server" Font-Names="Simplified Arabic" 
                        AutoGenerateColumns="false" Width="850px">
    
         <Columns>
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <asp:Label ID="lblAuthNumber_3" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>         
            
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
              <asp:TemplateColumn HeaderStyle-VerticalAlign=Top ItemStyle-HorizontalAlign="right" HeaderStyle-Width="100px" headertext="Choices">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            1
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_1")%><br />
                                2
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_2")%>
                                <br />3
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_3")%>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  Visible="false" headertext="Email">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label Visible="false" ID="lblEmail_Resp_1" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "email_address_1") %>' ></asp:Label>
                                               <br />
                                               <asp:Label Visible="false" ID="lblEmail_Resp_2" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "emailaddress_2") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderText="Choose">
                        <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                <tr>
                                    <td style="border: 0px;">                                           
                                        <span>
                                            <asp:CheckBox id="chk_top_respiratory" runat="server" />
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
         </td>
         </tr>
         <tr>
         <td style="text-align:left" dir=ltr><asp:Button OnClick="SelectAllRespiratoryApps" ID="btnSelectRespiratory" runat="server" Text="Check all" />
         <asp:Button Text="Invite" OnClick="InviteRespiratoryApps"  ID="btnInviteRespiratory" runat="server" />
         </tr>
         </table>
    </ContentTemplate>
    </ajaxToolkit:TabPanel>
    
    <ajaxToolkit:TabPanel ID="TabPanel3" HeaderText="Top 30 ER" runat="server">
        <ContentTemplate>
         <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
         <tr>
         <td>
         <span style="font-size:medium;font-family:Simplified Arabic;font-style:italic">
        Info #4:The following list shows applicant details based on the criteria: <br />        
        (Top 30 in the "Total Marks" + Criteria selected in "ER" as the 1st Or 2nd or 3rd Choice)
    </span><br /><br />
       <asp:DataGrid ID="grd_top_30_er"  DataSourceID="SQLTop_ER" runat="server" Font-Names="Simplified Arabic" 
                        AutoGenerateColumns="false" Width="850px">
    
         <Columns>
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <asp:Label ID="lblAuto_ER_Number" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>         
            
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
              <asp:TemplateColumn HeaderStyle-VerticalAlign=Top ItemStyle-HorizontalAlign="right" HeaderStyle-Width="100px" headertext="Choices">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            1
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_1")%><br />
                                2
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_2")%>
                                <br />3
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_3")%>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  Visible="false" headertext="Email">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label Visible="false" ID="lblEmail_1" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "email_address_1") %>' ></asp:Label>
                                               <br />
                                               <asp:Label Visible="false" ID="lblEmail_2" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "emailaddress_2") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderText="Choose">
                        <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                <tr>
                                    <td style="border: 0px;">                                           
                                        <span>
                                            <asp:CheckBox id="chk_top_er" runat="server" />
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
    
         </td>
         </tr>
         <tr>         
         <td style="text-align:left" dir=ltr><asp:Button   ID="btnCheckERApps" runat="server" Text="Check all" />
         <asp:Button Text="Invite"  ID="btnInviteERApps" OnClick="InviteERApps" runat="server" />
         </td>
         </tr>
         </table>
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    
    <ajaxToolkit:TabPanel ID="TabPanel4" HeaderText="Top 30 Lab" runat="server">
     <ContentTemplate>
      <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
         <tr>
         <td>
            <span style="font-size:medium;font-family:Simplified Arabic;font-style:italic">
        Info #5:The following list shows applicant details based on the criteria: <br />        
        (Top 30 in the "Total Marks" + Criteria selected in "Lab" as the 1st Or 2nd or 3rd Choice)
    </span><br /><br />
    
    <asp:DataGrid ID="DataGrid1"  DataSourceID="SQLTop_Lab" runat="server" Font-Names="Simplified Arabic" 
                        AutoGenerateColumns="false" Width="850px">
    
         <Columns>
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <asp:Label ID="lblAuthNumber_3" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                        </tr>
                        
         
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>         
            
            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
            
             <asp:TemplateColumn HeaderStyle-VerticalAlign=Top ItemStyle-HorizontalAlign="right" HeaderStyle-Width="100px" headertext="Choices">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            1
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_1")%><br />
                                2
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_2")%>
                                <br />3
                                <%# DataBinder.Eval(Container.DataItem, "cmb_selection_3")%>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
            
            
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  Visible="false" headertext="Email">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:Label Visible="false" ID="lblEmail_1" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "email_address_1") %>' ></asp:Label>
                                               <br />
                                               <asp:Label Visible="false" ID="lblEmail_2" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "emailaddress_2") %>' ></asp:Label>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderText="Choose">
                        <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                <tr>
                                    <td style="border: 0px;">                                           
                                        <span>
                                            <asp:CheckBox id="chk_top_lab" runat="server" />
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>
         </td>
         </tr>
         
         <tr>         
                             <td style="text-align:left" dir=ltr><asp:Button   ID="btnCheckLabApps" runat="server" Text="Check all" />
                             <asp:Button Text="Invite"  ID="btnInviteLabApps" runat="server" />
                             </td>
                             </tr>
         </table>
     </ContentTemplate>
     
    
    </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
    
    
      <br />
        
    
    <asp:SqlDataSource runat="server" ID="SQLTop_Lab" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      <br />
        
    </ContentTemplate>
    </asp:UpdatePanel>
    </td>    
    </tr>
    <tr>
    <td valign=top>
    <asp:UpdatePanel ID="upd_Interview" runat="server">
    <ContentTemplate>
    
    
        <ajaxToolkit:TabContainer ID="tab_invitation"     runat="server">
            <ajaxToolkit:TabPanel runat="server" HeaderText="Medicine" ID="medicine_invite">
            <ContentTemplate>
                <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
                     <tr>
                         <td>
                         <asp:DataGrid ID="grd_invited_medicine" DataSourceID="SQLMedicine_Invited"
                         runat="server" Width="850px" AutoGenerateColumns="false"> 

                        <Columns>
                            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                            <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                            <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            <asp:Label ID="lblInvited_medicine_id" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                            </tr>
                            </table>
                            </ItemTemplate>
                            </asp:TemplateColumn> 
                            
                             <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
            
            
            
            
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                         
                           
                        <asp:TemplateColumn  HeaderStyle-VerticalAlign="top" HeaderStyle-Width="60px" headertext="Acknoledged">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox Enabled="false" ID="chk_medcine_ack"
                                               Checked='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Acknowledged" || Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Interviewed" ? true: false %>'
                                                runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Attended">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox ID="chk_medcine_interview_attended" Checked='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? false: true %>' Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' 
                                               runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:TextBox ID="txtMedicineInterview" Text=' <%# DataBinder.Eval(Container.DataItem, "interview_marks") %>' runat="server" Width="50px" Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server"
            TargetControlID="txtMedicineInterview"
            Mask="99.99"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
        <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
            ControlExtender="MaskedEditExtender4"
            ControlToValidate="txtMedicineInterview"
            IsValidEmpty="true"            
            ValidationGroup="Demo1"
            Display="Dynamic"
            />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                         <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                            <asp:Button runat="server" Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>'  OnClick="SaveInterviewMarks" 
                                            ID="btnSaveInterviewMarks" Text="Save"  />
                                            </span>
                                            </td>
                                            </tr>
                                            </table>
                                            </ItemTemplate>
                                            </asp:TemplateColumn>     
                                            
                      
                       <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <asp:Label ID="lblStageStatus" runat="server" Text="" ></asp:Label>
                                            </span>
                                            </td>
                                            </tr>
                                            </table>
                                            </ItemTemplate>
                                            </asp:TemplateColumn>          
                                                                                   
                                           
                        </Columns>                        
                         </asp:DataGrid>
                         </td>
                     </tr>
                 </table>
                    
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel runat="server" HeaderText="Respiratory" ID="respiratory_invite">
            <ContentTemplate>
                 <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
                     <tr>
                         <td>
                         <asp:DataGrid ID="DataGrid2" DataSourceID="SQLRespiratory_Invited"
                         runat="server" Width="850px" AutoGenerateColumns="false"> 
                         
                         <Columns>
                            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                            <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                            <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            <asp:Label ID="lblInvited_Respiratory_id" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                            </tr>
                            </table>
                            </ItemTemplate>
                            </asp:TemplateColumn> 
                            
                             <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                <ItemTemplate>
                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                        <tr>
                            <td style="border: 0px;">                                           
                            <span>
                                <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                            </span>
                            </td>                                       
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateColumn>  
            
            
            
            
             <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                            <ItemTemplate>
                                <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                          <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                         
                           
                        <asp:TemplateColumn  HeaderStyle-VerticalAlign="top" HeaderStyle-Width="60px" headertext="Acknoledged">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox Enabled="false" ID="chk_medcine_ack"
                                               Checked='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Acknowledged" ? true: false %>'
                                                runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Attended">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox ID="chk_respiratory_interview_attended" Checked='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? false: true %>' Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' 
                                               runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:TextBox ID="txtRespiratoryInterview" Text=' <%# DataBinder.Eval(Container.DataItem, "interview_marks") %>' runat="server" Width="50px" Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server"
            TargetControlID="txtRespiratoryInterview"
            Mask="99.99"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
        <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
            ControlExtender="MaskedEditExtender4"
            ControlToValidate="txtRespiratoryInterview"
            IsValidEmpty="true"            
            ValidationGroup="Demo1"
            Display="Dynamic"
            />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                         <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                            <asp:Button runat="server" Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>'  OnClick="SaveRespiratoryInterviewMarks" 
                                            ID="btnSaveInterviewMarks" Text="Save"  />
                                            </span>
                                            </td>
                                            </tr>
                                            </table>
                                            </ItemTemplate>
                                            </asp:TemplateColumn>     
                                            
                      
                       <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                                <asp:Label ID="lblStageStatus" runat="server" Text="" ></asp:Label>
                                            </span>
                                            </td>
                                            </tr>
                                            </table>
                                            </ItemTemplate>
                                            </asp:TemplateColumn>          
                                                                                   
                                           
                        </Columns>
                         </asp:DataGrid>
                         </td>
                         </tr>
                         </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" HeaderText="ER" ID="er_invite">
            <ContentTemplate>
            <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
                     <tr>
                         <td>
                         <asp:DataGrid ID="grd_er_invite" DataSourceID="SQLER_Invited"
                         runat="server" Width="850px" AutoGenerateColumns="false">
                         
                          <Columns>
                            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                            <ItemTemplate>
                            <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                            <tr>
                            <td style="border: 0px;">                                           
                            <span>
                            <asp:Label ID="lblInvited_ER_id" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                            </span>
                            </td>                                       
                            </tr>
                            </table>
                            </ItemTemplate>
                            </asp:TemplateColumn> 
                            
                             <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                                    <ItemTemplate>
                                        <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                            <tr>
                                                <td style="border: 0px;">                                           
                                                <span>
                                                    <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                                                </span>
                                                </td>                                       
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                            </asp:TemplateColumn>  
            
            
            
            
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                                <ItemTemplate>
                                    <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                    <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                                <ItemTemplate>
                                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                   <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        
                              <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                                <ItemTemplate>
                                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                   <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        
                            <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                                <ItemTemplate>
                                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                   <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                         
                           
                        <asp:TemplateColumn  HeaderStyle-VerticalAlign="top" HeaderStyle-Width="60px" headertext="Acknoledged">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox Enabled="false" ID="chk_er_ack"
                                               Checked='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Acknowledged" || Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Interviewed" ? true: false %>'
                                                runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Attended">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox ID="chk_er_interview_attended" Checked='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? false: true %>' Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' 
                                               runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                        <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:TextBox ID="txtERInterview" Text=' <%# DataBinder.Eval(Container.DataItem, "interview_marks") %>' runat="server" Width="50px" Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="mask_edt_er" runat="server"
            TargetControlID="txtERInterview"
            Mask="99.99"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
        <ajaxToolkit:MaskedEditValidator ID="mask_edt_validate" runat="server"
            ControlExtender="mask_edt_er"
            ControlToValidate="txtERInterview"
            IsValidEmpty="true"            
            ValidationGroup="Demo1"
            Display="Dynamic"
            />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                         <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                            <asp:Button runat="server" 
                                            Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' 
                                             OnClick="SaveERInterviewMarks" 
                                            ID="btnSaveERInterviewMarks"  Text="Save"  />
                                            </span>
                                            </td>
                                            </tr>
                                            </table>
                                            </ItemTemplate>
                                            </asp:TemplateColumn>     
                                            
                      
                      
                                                                                   
                                           
                        </Columns>
                         </asp:DataGrid>

                         </td>
                     </tr>
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tb_lab_invited" HeaderText="Lab" runat="server">
            <ContentTemplate>
                <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;">
                     <tr>
                         <td>
                         <asp:DataGrid ID="DataGrid3" DataSourceID="SQLLAB_Invited"
                         runat="server" Width="850px" AutoGenerateColumns="false">
                         
                          <Columns>
                            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="40px" headertext="#">
                                <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                <tr>
                                <td style="border: 0px;">                                           
                                <span>
                                <asp:Label ID="lblInvited_ER_id" runat="server"  Text='<%# DataBinder.Eval(Container.DataItem, "id") %>' ></asp:Label>
                                </span>
                                </td>                                       
                                </tr>
                                </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>                             
                            <asp:TemplateColumn HeaderStyle-VerticalAlign=Top HeaderStyle-Width="100px" headertext="رقــم بطاقة الاحوال">
                                    <ItemTemplate>
                                        <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                            <tr>
                                                <td style="border: 0px;">                                           
                                                <span>
                                                    <%# DataBinder.Eval(Container.DataItem, "local_id") %>
                                                </span>
                                                </td>                                       
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                            </asp:TemplateColumn>              
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="Top" HeaderStyle-Width="230px" headertext="Full name">
                                <ItemTemplate>
                                    <table  width="100%" dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                    <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-Width="50px" headertext="Total <br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <%# DataBinder.Eval(Container.DataItem, "school_total_converted") %>
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="top" HeaderStyle-Width="50px" headertext="الدرجة">
                                <ItemTemplate>
                                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                   <%# DataBinder.Eval(Container.DataItem, "school_calculated_gpa") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-Width="60px" headertext="إختبار القدرات">
                                <ItemTemplate>
                                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                   <%# DataBinder.Eval(Container.DataItem, "school_actual_godarat") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        
                            <asp:TemplateColumn  HeaderStyle-Width="60px" headertext="الإختبار التحصيلي">
                                <ItemTemplate>
                                    <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                        <tr>
                                            <td style="border: 0px;">                                           
                                                <span>
                                                   <%# DataBinder.Eval(Container.DataItem, "school_actual_tahseeli") %>
                                                </span>
                                            </td>                                       
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                         
                           
                            <asp:TemplateColumn  HeaderStyle-VerticalAlign="top" HeaderStyle-Width="60px" headertext="Acknoledged">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox Enabled="false" ID="chk_er_ack"
                                               Checked='<%# Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Acknowledged" || Convert.ToString(DataBinder.Eval(Container.DataItem, "current_status"))=="Interviewed" ? true: false %>'
                                                runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Attended">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:CheckBox ID="chk_er_interview_attended" Checked='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? false: true %>' Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' 
                                               runat="server" />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="Interview<br>Marks">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                               <asp:TextBox ID="txtERInterview" Text=' <%# DataBinder.Eval(Container.DataItem, "interview_marks") %>' runat="server" Width="50px" Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' ></asp:TextBox>
                                                <ajaxToolkit:MaskedEditExtender ID="mask_edt_er" runat="server"
            TargetControlID="txtERInterview"
            Mask="99.99"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
        <ajaxToolkit:MaskedEditValidator ID="mask_edt_validate" runat="server"
            ControlExtender="mask_edt_er"
            ControlToValidate="txtERInterview"
            IsValidEmpty="true"            
            ValidationGroup="Demo1"
            Display="Dynamic"
            />
                                            </span>
                                        </td>                                       
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        
                            <asp:TemplateColumn HeaderStyle-VerticalAlign="top" headertext="">
                            <ItemTemplate>
                                <table dir="rtl" align="right" cellpadding="0" cellspacing="0" style="cursor:default;">
                                    <tr>
                                        <td style="border: 0px;">                                           
                                            <span>
                                            <asp:Button runat="server" 
                                            Enabled='<%# Convert.IsDBNull(DataBinder.Eval(Container.DataItem, "interview_marks")) ? true: false %>' 
                                             OnClick="SaveERInterviewMarks" 
                                            ID="btnSaveERInterviewMarks"  Text="Save"  />
                                            </span>
                                            </td>
                                            </tr>
                                            </table>
                                            </ItemTemplate>
                                            </asp:TemplateColumn>     
                                           
                        </Columns>
                         </asp:DataGrid>

                         </td>
                     </tr>
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
    
    </ContentTemplate>
    </asp:UpdatePanel>
    </td>
    </tr>
    </table>
   
    
    </div>
     
     <asp:SqlDataSource runat="server" ID="SQLTopMedcine_60" 
        ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
        
        <asp:SqlDataSource runat="server" ID="SQLTop_Respiratory" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      
      
     <asp:SqlDataSource runat="server" ID="SQLTop_ER" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      
      
      
      <asp:SqlDataSource runat="server" ID="SQLMedicine_Invited" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      
      <asp:SqlDataSource runat="server" ID="SQLRespiratory_Invited" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      
      <asp:SqlDataSource runat="server" ID="SQLER_Invited" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      
      
      <asp:SqlDataSource runat="server" ID="SQLLAB_Invited" 
      ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString1 %>"></asp:SqlDataSource>
      
    </form>
</body>
</html>
