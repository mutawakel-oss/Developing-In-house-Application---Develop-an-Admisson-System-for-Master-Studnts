<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../mathertel.css" rel="stylesheet" type="text/css" />
</head>
<body  dir="rtl">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="MasterScript" runat="server"  EnableScriptGlobalization="true"></asp:ScriptManager>	
    <div dir="rtl" align="right">
    <br />
         <ajax:RoundedArea  runat='server' ID="RoundedArea1">
         <asp:RadioButton ID="radAnd" Text="and" runat="server" GroupName="AndOR"  />
         <asp:RadioButton ID="radOR" Text="or" runat="server" GroupName="AndOR"  />
         <ajaxToolkit:TabContainer  ID="tabsearch"  Width="600px" runat="server">
            <ajaxToolkit:TabPanel HeaderText="البيانات الشخصية" runat="server" ID="Tab_1">
                <ContentTemplate>
                
                <table id="table1" runat="server">
                <tr>
                <td>Local id</td>
                <td>
                <asp:TextBox ID="txtLocalID" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                    <td>
                        First Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName_A" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Father Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtFatherName_A" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Grand Father
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        Last Name
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                
                  <tr>
          <td dir="rtl" >DOB</td>
         <td >
         <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>        
         
           <img src="../Images/Calendar_scheduleHS.png" id="img_txtDOB" runat="server" />
         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" FirstDayOfWeek="saturday" runat="server" BehaviorID="Image_txtDOB"
                                  Animated="true" CssClass="MyCalendar" PopupButtonID="img_txtDOB" Format="dd/MM/yyyy" TargetControlID="txtDOB">
                            </ajaxToolkit:CalendarExtender>
                            
         </td>
         </tr>
         
                </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ToolTip="Address" HeaderText="العنوان" ID="Tab_2" runat="server">                        
            <ContentTemplate>
            <table id="tab_add" runat="server">
            <tr>
            <td>
            <ajax:RoundedArea ID="per_address" runat="server">            
                    <table runat="server" ID="addresstable">
                    <tr>
                        <td>Email</td>
                        <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Postal Code
                        </td>
                        <td>
                            <asp:TextBox ID="txtPostal_code_1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zip Code
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipCode_1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                     <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity_1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList ID="country_1" runat="server">
                                 <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
                                <asp:ListItem >الكويت</asp:ListItem>
                                <asp:ListItem >عمان</asp:ListItem>
                                <asp:ListItem >قطر</asp:ListItem>
                                <asp:ListItem >الإمارات العربيه المتحدة</asp:ListItem>
                                <asp:ListItem >البحرين</asp:ListItem>
            
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr><td>Mobile</td>
                    <td><asp:TextBox ID="txtMobile1" runat="server"></asp:TextBox> </td>
                    </tr>
                    
                </table>
            </ajax:RoundedArea>
            
            </td>
            
             <td>
            <ajax:RoundedArea  ID="RoundedArea2" runat="server">
            
                        <table runat="server" ID="Table2">
                    <tr>
                        <td>Email</td>
                        <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Postal Code
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Zip Code
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                     <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                 <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
                                <asp:ListItem >الكويت</asp:ListItem>
                                <asp:ListItem >عمان</asp:ListItem>
                                <asp:ListItem >قطر</asp:ListItem>
                                <asp:ListItem >الإمارات العربيه المتحدة</asp:ListItem>
                                <asp:ListItem >البحرين</asp:ListItem>
            
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                      <tr><td>Mobile</td>
                    <td><asp:TextBox ID="TextBox7" runat="server"></asp:TextBox> </td>
                    </tr>
                </table>
            </ajax:RoundedArea>
            
            </td>
            </tr>
            </table>
            
        
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="tbSchool" HeaderText="بيانات الدراسة" runat="server">
            <ContentTemplate>
                <table id="tab_school" runat="server">
                    <tr>
                        <td>
                            School Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtSchoolName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="txtSchoolCity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList ID="cmbSchoolCountry" runat="server">
                                <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
                                <asp:ListItem >الكويت</asp:ListItem>
                                <asp:ListItem >عمان</asp:ListItem>
                                <asp:ListItem >قطر</asp:ListItem>
                                <asp:ListItem >الإمارات العربيه المتحدة</asp:ListItem>
                                <asp:ListItem >البحرين</asp:ListItem>
            
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel HeaderText="الخيارات الدراسية" runat="server" ID="Tab_5">
            <ContentTemplate>
               <table id="tab_select" runat="server">
                <tr>
                <td >الإختيار الأول</td>
                    <td>
                         <asp:DropDownList ID="cmb1" Width="270px" runat="server" >
                                  
                                  <asp:ListItem Text="الإختيار الأول"></asp:ListItem>
                                  <asp:ListItem Text="كلية الطب"></asp:ListItem>
                                  <asp:ListItem Text="علوم المختبرات الطبية"></asp:ListItem>
                                  <asp:ListItem Text="العلاج التنفسي"></asp:ListItem>
                                  <asp:ListItem Text="خدمات الإسعاف والطوارئ"></asp:ListItem>
                                </asp:DropDownList>
                    </td>
                </tr>
                <tr>
             <td >الإختيار الثاني</td>
             <td>
                  <asp:DropDownList ID="cmb2" Width="270px" Enabled="false" runat="server">
                                   <asp:ListItem Text="الإختيار الثاني"></asp:ListItem>
                                  <asp:ListItem Text="كلية الطب"></asp:ListItem>
                                  <asp:ListItem Text="علوم المختبرات الطبية"></asp:ListItem>
                                  <asp:ListItem Text="العلاج التنفسي"></asp:ListItem>
                                  <asp:ListItem Text="خدمات الإسعاف والطوارئ"></asp:ListItem>
                                </asp:DropDownList>
             </td>
             </tr>
             
              <tr>
             <td >الإختيار الثالث</td>
             <td>
                 <asp:DropDownList ID="cmb3" Width="270px" Enabled="false" runat="server">
                                  <asp:ListItem Text="الإختيار الثالث"></asp:ListItem>
                                  <asp:ListItem Text="كلية الطب"></asp:ListItem>
                                  <asp:ListItem Text="علوم المختبرات الطبية"></asp:ListItem>
                                  <asp:ListItem Text="العلاج التنفسي"></asp:ListItem>
                                  <asp:ListItem Text="خدمات الإسعاف والطوارئ"></asp:ListItem>
                                </asp:DropDownList>
             </td>
             </tr>
             
               </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel HeaderText="..." runat="server">
                <ContentTemplate>
                    <table runat="server" id="tb_extra">
                    <tr>
                        <td dir="ltr">
                            Application Date(from)
                        </td>
                        <td>
                            <asp:TextBox ID="app_date_from" runat="server"></asp:TextBox>
                            <img src="../Images/Calendar_scheduleHS.png" alt="" id="Image1" runat="server" />
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" FirstDayOfWeek="saturday" runat="server" BehaviorID="Image1"
                            Animated="true" CssClass="MyCalendar" PopupButtonID="Image1" Format="dd/MM/yyyy" TargetControlID="app_date_from">
                            </ajaxToolkit:CalendarExtender>
                            
                        </td>
                    </tr>
                    </table>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
         </ajaxToolkit:TabContainer>
         <br />
         <asp:Button ID="btnSearch" Text="Search" runat="server" />
         </ajax:RoundedArea>
        
        <FTB:FreeTextBox   EnableHtmlMode="false" ReadOnly="true" toolbarlayout="Preview,Print" id="Report" Width="100%" Height="600px" TextDirection="RightToLeft"
			
			runat="Server" 
			
			DesignModeCss="designmode.css"		 
			/>
			
    </div>
    </form>
</body>
</html>
