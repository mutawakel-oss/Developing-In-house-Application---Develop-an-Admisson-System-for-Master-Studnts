
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="intermediate.aspx.cs" Inherits="intermediate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    
        <link href="mathertel.css" rel="stylesheet" type="text/css" />
        <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
         <link href="css/themes/spread.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert_lite.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alphacube.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/darkX.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/nuncio.css" rel="stylesheet" type="text/css" />
    <%--<link href="css/themes/theme1.css" rel="stylesheet" type="text/css" />--%>

<script language="javascript" type="text/javascript">   
            
          // Important variable, dont rename
        var contentWin = null;
    
        // Show User Manager Window
        function showMesageWindow()  {
            if (! isWinExist("winUserMan")) {  // If window exist
                contentWin =  new HWWeb("winUserMan");

            
                contentWin.showWindow({title:'Messages From Editor', themeName:'theme1', url:'inbox.aspx', top:'100', left:'10', width:'600', height:'430'});
                contentWin.toFront();
                
            }
            else {
                alert("This window is open !");
            }    
        }
        
        function showTermsWindow()  {
            if (! isWinExist("winterms")) {  // If window exist
                contentWin =  new HWWeb("winterms");

            
                contentWin.showWindow({title:'Terms and Condition', themeName:'theme1', url:'about:blank', top:'100', left:'10', width:'600', height:'430'});
                contentWin.toFront();
                
            }
            else {
                alert("This window is open !");
            }    
        }


function showHelpStatusIndex(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top =(getAscendingTops(obj) + vertPadding) ;
		w.style.width=300;
		w.style.height=100;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = (getAscendingLefts(obj) - horizPadding)+65;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = (getAscendingLefts(obj) + obj.offsetWidth + horizPadding)-150;
		}
	}
}
function hideHelpFloatWindow(windowID)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{
		w.style.display = 'none';
		w.style.visibility = 'hidden';
		
		w.top = -999;
		w.left = -999;
	}
}

function getAscendingLefts(elem){
	if (elem==null)
		return 0;
	else
		return elem.offsetLeft+getAscendingLefts(elem.offsetParent);
}

function getAscendingTops(elem){
	if (elem==null)
		return 0;
	else
		return elem.offsetTop+getAscendingTops(elem.offsetParent);
}
            </script>
</head>
<body >
    <form id="form1" runat="server">
    <div id="body"  dir="rtl" style="width: 780px;">	        
    <table align="center" id="tbmain" runat="server" >
    <tr>
    <td>
        <img  id="Img3" src="Images/hed.gif" runat="server" />
        <table dir="ltr" width="100%" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n" >
          <div  class="dialog_title title_window" ><b>اقرأ التعليمات التالية قبل المتابعة</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
      </table>
      
     <table dir="ltr" width="100%" cellpadding="0" cellspacing="0" class="mid table_window">
        <tr>
          <td class="dialog_w"></td>
            <td class="dialog_content"  dir="rtl" style="font-family:Simplified Arabic;font-size:medium" valign="top">&nbsp;
            <asp:LinkButton ID="btnHelp" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_welcome')" onmouseover="showHelpStatusIndex('id_hlp_welcome', this,310, 50, false)"></asp:LinkButton>			    			   			    
            <div id="id_hlp_welcome" class="HelpWindow" >
                <iframe  frameborder="0" height="100%"
                src="hlp_Second_Page.htm"></iframe>
                </div>      
                <br />
            <b>
            التسجيل عن طريق الموقع الإلكتروني أحد خطوات عملية القبول فيجب عدم تجاهلها وتعبئة جميع الحقول بدقه لضمان وصول المعلومات الصحيحه. قبل الإستمرار بالتسجيل ننصح بأن يتم تجهيزالوثائق التاليه نظراً لحاجتك اليها عند تعبئة بياناتك إلكترونياً:<br /><br /> 1- بطاقة الأحوال الشخصية

<br />2- الشهـادة الجامعية + السجـل الأكاديمي . 
<br />3- شـهـادة الدراسات العليا  (إن وجدت)  . 
<br />4- شـهـادة إجادة اللغة الإنجليزية  (إن وجدت) . 
<br />5- الموافقة الخطية من جهة العمل . 
<br />6- السيرة الذاتية. 
<br />7- صـورة شخصـية . 
<br />
<br />
</b>
 &nbsp;&nbsp;&nbsp;كذلك ننصح بعمل مسح ضوئي ( Scanning ) للوثائق الخاصة بك لتحميلها على الموقع ( مع العلم بأن المسح الضوئي للوثائق هو إختياري وليس &nbsp;&nbsp;&nbsp; إجباري الا اننا ننصح به لضمان تكامل وثائقك ) 

<br />

<br />
<!--
&nbsp;&nbsp;&nbsp; نود التنويه بأن البيانات التي ستظهر لك عند قيامك بإدخال رقم بطاقة أحوالك الشخصية هي بيانات تم الحصول عليها من قاعدة البيانات الخاصة &nbsp;&nbsp;&nbsp;بوزارة التربية والتعليم، عند ملاحظتك لوجود أي خطأ في هذه البيانات الرجاء تعديل هذا الخطأ مع العلم بأنه سوف يتبين للكلية بأنه تم تعديل البيانات.
-->
            </td>
          <td class="dialog_e" ></td>
        </tr>
      </table>
        <table dir="ltr" width="100%" cellpadding="0" cellspacing="0" class="bot table_window">
        <tr>
          <td class="dialog_sw">&nbsp;</td>
            <td class="dialog_s" width="100%"><div class='status_bar' align="center" >&nbsp;<i>اضغط على التالي للمتابعة </i></div></td>
            
        </tr>
      </table>
      
      
    </td>
    </tr>
    
    <tr>
    <td align="center">
    <br /><br /><br /><br /><br />

        <asp:ImageButton ID="imgPrev" ImageUrl="~/Images/previous button.jpg" PostBackUrl="~/index.aspx" ToolTip="Click here to move to previous page "  runat="server" />  
            <asp:ImageButton ID="imgNext" ImageUrl="~/Images/next button.jpg" PostBackUrl="~/intermediate_1.aspx" ToolTip="Click here to move to next page "  runat="server" />  
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
