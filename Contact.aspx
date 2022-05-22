<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <link href="mathertel.css" rel="stylesheet" type="text/css" />
     <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
     <link href="css/themes/spread.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert_lite.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alphacube.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/darkX.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/nuncio.css" rel="stylesheet" type="text/css" />
    <title>طلب المساعدة</title>       
</head>
<body>     
    
    <form id="frmMain" runat="server">
    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
    <div id="body"  dir="rtl" style="width: 780px;">	        
   
                     
    <table cellpadding="0" cellspacing="0" align="center" id="tbmain" runat="server" >
    <tr>
    <td>
        <img  id="Img3" src="Images/hed.gif" runat="server" />
        <table visible="false"  dir="ltr" width="100%" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >          
          <td class="dialog_nw"></td>
          <td class="dialog_n" >
          <div  class="dialog_title title_window" ><b>طلب المساعدة</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
      </table>
      <table cellpadding="0" cellspacing="0"   style="background: transparent url(images/background.jpeg) no-repeat 0 0;"  
                     runat="server" id="table1">  
                     <tr>
                     <td align="center"    style="font-size: 12pt; font-family: Simplified Arabic; " dir="rtl">
                        <ajax:RoundedArea runat='server' ID="RoundedArea1" Width="780" Height="500  " EnableViewState="false">                                                
                       <br />    
                         <b><span style="font-size:x-large;text-align:center" ></span>إذا واجهت أي صعوبة أثناء استخدامك للنظام ، أرسل بياناتك و ستتصل بك عمادة القبول و التسجيل خلال الأربع و العشرين ساعة القادمة </b>                                                               
                         <br /><br />                         
                         <b><asp:Label ID="lblAdminID" runat="server" Text="الا سم"></asp:Label></b>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtName" runat="server" MaxLength="35"></asp:TextBox>                                                                         
                         <br />                  
                         <b><asp:Label ID="lblAdminPassword" runat="server" Text="الها تف"></asp:Label></b>                      
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtPhone" runat="server" MaxLength="10"></asp:TextBox>                                                                          
                         
                         <ajaxToolkit:MaskedEditExtender ID="mskLocalID" runat="server"
                        TargetControlID="txtPhone"
                        Mask="9999999999"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
                                                                        
                         <br />                                                  
                         
                         
                         <b><asp:Label ID="lblEmail" runat="server" Text="البريد الالكتروني"></asp:Label></b>                                                                        
                         <asp:TextBox ID="txtEmail" runat="server" MaxLength="30"></asp:TextBox>                                                  
                         &nbsp;&nbsp;&nbsp;
                         <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp                         
                         
                         <b><asp:Label ID="Label1" runat="server" Text="المشكلة"></asp:Label></b>                      
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:DropDownList ID="ddlProblem" runat="server" >
                         <asp:ListItem Text="بياناتي ليست موجودة في النظام" ></asp:ListItem>
                         <asp:ListItem Text="النظام يعرض بياناتي لكنها غير صحيحة" ></asp:ListItem>
                         <asp:ListItem Text="لا أستطيع استخدام النظام" ></asp:ListItem>                         
                         <asp:ListItem Text="أواجه مشكلة أخرى" ></asp:ListItem>
                         </asp:DropDownList>
                         
                         
                         <br />                         
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtDetail" runat="server" TextMode=MultiLine Height="150" Width="390" MaxLength="500"></asp:TextBox>                                                      
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp                                              
                         
                          <asp:UpdatePanel ID="pnlButtons" runat ="server">
                          <ContentTemplate>
                          <div id="divLogin" runat="server" align="center">                                                  
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Button ID="btnSave" runat="server" Text="ارسال" OnClick="Save" UseSubmitBehavior="false"/><asp:Button ID="btnCancel" runat="server" Text="الغاء" OnClick="Home" UseSubmitBehavior="false"/>                                                                           
                          <br /><br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <font color="red"><asp:Label ID="lblStatus" runat="server" Visible="false"></asp:Label></font> 
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <font color="red"><asp:LinkButton ID="lnkHome" runat="server" Visible="false" Text="اضغط هنا للعودة للصفحة الرئيسيه" OnClick="Home"></asp:LinkButton></font> 
                          </div>                                                   
                          
                          </ContentTemplate>
                          </asp:UpdatePanel>                     
                         
                         </ajax:RoundedArea>                                             
                         </td>
                        </tr>                                      
                        
                     </table>          
    </td>
    </tr>
    </table>    
    </div>
    </form>
    <div align=center>
			    <font style="font-size:small">
                    ITS Developers ©2009
                    College of Medicine
                </font>            
            </div>
</body>
</html>
