<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>
<%@ Register Assembly="ScsComboBox" Namespace="SCS.WebControls" TagPrefix="scs" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
        <%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title></title>
  <link href="mathertel.css" rel="stylesheet" type="text/css" />
    
   <style type="text/css">
			    body {
				    font:11px Verdana;
				    color:#333333;
			    }
			    a {
				    font:11px Verdana;
				    color:#315686;
				    text-decoration:underline;
			    }
			    a:hover {
				    color:crimson;
			    }
		    </style>          
        
</head>
<body>
    <form runat="server"  id="form1">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>   
        <div  style="font-family:Simplified Arabic;font-size:medium;" align="Center" >
<asp:Label id="ad1" Text="Click" runat="server"></asp:Label>
    <obout:Flyout     NoneEffect =true  Align=MiDDLE FadingEffect = true
                SlidingEffect =RIGHT
                FlyingEffect = NONE
                SlidingRange = 10 runat="server" ID="Flyout1"  AttachTo="ad1" >
              
       
         <ajax:RoundedArea BorderStyle="None" BorderWidth="0"  ID="inline_2" 
             Width="290px" runat="server">
            <table  id="tb_img_bk" runat="server">
            <tr>
            <td>&nbsp;</td>
            <td dir="ltr" >
            في هذه الصفحة ستجد نبذة مختصرة عن كلية الطب وكلية العلوم الطبية التطبيقية والمسارات المتوفرة في كلية الطب.

يلاحظ أن التسجيل الالكتروني لهذا العام هو لخريجي الثانوية العامة وللطلبة الذكور فقط في كليتي الطب وكلية العلوم الطبية التطبيقية فقط.
                                                                                                               
            </td>
            </tr>
            </table>
            </ajax:RoundedArea>
	                 
        </obout:Flyout>
        			
       </div>   
       
          <div  style="font-family:Simplified Arabic;font-size:medium;" align="Center" >
<asp:Label id="Label1" Text="Click" runat="server"></asp:Label>
    <obout:Flyout     NoneEffect =true  Align=MiDDLE FadingEffect = true
                SlidingEffect =RIGHT
                FlyingEffect = NONE
                SlidingRange = 10 runat="server" ID="Flyout2"  AttachTo="Label1" >
              
       
         <ajax:RoundedArea BorderStyle="None" BorderWidth="0"  ID="RoundedArea1" 
             Width="290px" runat="server">
            <table  id="Table1" runat="server">
            <tr>
            <td>&nbsp;</td>
            <td dir="ltr" >
            في هذه الصفحة ستجد نبذة مختصرة عن كلية الطب وكلية العلوم الطبية التطبيقية والمسارات المتوفرة في كلية الطب.

يلاحظ أن التسجيل الالكتروني لهذا العام هو لخريجي الثانوية العامة وللطلبة الذكور فقط في كليتي الطب وكلية العلوم الطبية التطبيقية فقط.
                                                                                                               
            </td>
            </tr>
            </table>
            </ajax:RoundedArea>
	                 
        </obout:Flyout>
        			
       </div>   
  </form>
</body>
</html>
