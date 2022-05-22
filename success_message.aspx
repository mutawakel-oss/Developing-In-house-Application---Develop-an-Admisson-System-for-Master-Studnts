<%@ Page Language="C#" AutoEventWireup="true" CodeFile="success_message.aspx.cs" Inherits="success_message" %>
<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.2, Version=7.2.20072.61, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>


<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>صفحة الإعلام</title>
    
         <link href="mathertel.css" rel="stylesheet" type="text/css" />
        <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
         <link href="css/themes/spread.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert_lite.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alphacube.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/darkX.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/nuncio.css" rel="stylesheet" type="text/css" />
    <link href="gridStyle.css" type="text/css" rel="stylesheet" />
</head>
<body>
    
    <form id="form1" runat="server">
    <div id="body"  dir="rtl" style="width: 780px;">	        
    <table align="center" id="tbmain" runat="server" dir=rtl >
    <tr dir=rtl>
    <td>
        <img  id="Img3" src="Images/hed.gif" runat="server" />
        <table dir="rtl" width="100%" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n" >
          <div  class="dialog_title title_window" ><b>نجاح عملية التسجيل</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
      </table>
      
     <table dir=rtl width="100%" cellpadding="0" cellspacing="0" class="mid table_window">
        <tr>
          <td class="dialog_w"></td>
            <td class="dialog_content"  dir="rtl" style="font-family:Simplified Arabic;font-size:medium" valign="top">&nbsp;
                تم حفظ البيانات بنجاح.<br />
                <asp:LinkButton ID="lnkLoginBack" Text="اظغط هنا للذهاب الى صفحة الدخول للنظام." runat="server"  PostBackUrl="~/index.aspx"></asp:LinkButton>
            </td>
          <td class="dialog_e" ></td>
        </tr>
      </table>
        <table dir="rtl" width="100%" cellpadding="0" cellspacing="0" class="bot table_window">
        <tr>
          <td class="dialog_sw">&nbsp;</td>
            <td class="dialog_s" width="100%"><div class='status_bar' align="center" >&nbsp; </div></td>
            
        </tr>
      </table>
      
      
    </td>
    </tr>
    
    <tr>
    <td align="center">
    <br /><br />
        
        
    </td>
    </tr>
    </table>
    </div>
              
    </form>
    
</body>
</html>
