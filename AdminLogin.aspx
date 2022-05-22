<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
    
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
    <title>Admin Login</title>
</head>
<body> 
    
    <form id="form1" runat="server">
    <div id="body"  dir="rtl" style="width: 780px;">	        
   
                     
    <table cellpadding="0" cellspacing="0" align="center" id="tbmain" runat="server" >
    <tr>
    <td>
        <img  id="Img3" src="Images/hed.gif" runat="server" />
        <table visible="false"  dir="ltr" width="100%" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >          
          <td class="dialog_nw"></td>
          <td class="dialog_n" >
          <div  class="dialog_title title_window" ><b>Admin Login Page</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
      </table>
      <table cellpadding="0" cellspacing="0"   style="background: transparent url(images/background.jpeg) no-repeat 0 0;"  
                     runat="server" id="table1">  
                     <tr>
                     <td align="center"    style="font-size: 12pt; font-family: Simplified Arabic; " dir="ltr">
                        <ajax:RoundedArea runat='server' ID="RoundedArea1" Width="780" Height="240  ">                                                
                       <br />    
                         <b><span style="font-size:x-large;text-align:center" >Administrator Page</span> </b>                                                               
                         <br /><br />                         
                         <b><asp:Label ID="lblAdminID" runat="server" Text="ID"></asp:Label></b>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtAdminID" runat="server" MaxLength="8"></asp:TextBox>
                         
                         
                         <br />                                                  
                         <b><asp:Label ID="lblAdminPassword" runat="server" Text="Password"></asp:Label></b>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox>
                         
                         
                         <br /><br />
                         <div id="divLogin" runat="server" align="center">                         
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                  
                         <asp:Button ID="btnOk" runat="server" Text="Login" OnClick="Login"/> 
                         <br /><br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <font color="red"><asp:Label ID="lblStatus" runat="server" Visible="False"></asp:Label></font> 
                         </div>                                                   
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
