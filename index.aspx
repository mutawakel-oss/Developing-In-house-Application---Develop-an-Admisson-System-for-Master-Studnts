<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Title="مرحباً بك في نظام التسجيل الإلكتروني لماجستير التعليم الطبي" Inherits="index" %>
<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<%@ Register TagPrefix="cs" Namespace="Codesummit" Assembly="WebModalControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    
    <link href="mathertel.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/spread.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert_lite.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alphacube.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/darkX.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/nuncio.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="content-type" content="UTF-8" />
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
		
		w.style.top =(getAscendingTops(obj) + vertPadding) -20;
		w.style.width=300;
		w.style.height=280;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = (getAscendingLefts(obj) - horizPadding)+60;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = (getAscendingLefts(obj) + obj.offsetWidth + horizPadding);
		}
	}
}


function showHelpStreamSelection(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top =  150;//getAscendingTops(obj) + vertPadding;
		w.style.width=300;
		w.style.height=200;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		}
	}
}

      
function showHelpFloatWindow(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top =  150;//getAscendingTops(obj) + vertPadding;
		w.style.width=300;
		w.style.height=200;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		}
	}
}

function showHelpFloatWindow2(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top = 150;// getAscendingTops(obj) + vertPadding;
		w.style.width=300;
		w.style.height=250;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		}
	}
}

function showHelpPOB(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top =  150;//getAscendingTops(obj) + vertPadding;
		w.style.width=300;
		w.style.height=150;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		}
	}
}



function showHelpIDIssuedDt(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top = 150;//getAscendingTops(obj) ;
		w.style.width=300;
		w.style.height=280;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		}
	}
}
function showHelpIDExpDt(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top = 150;//getAscendingTops(obj) ;
		w.style.width=300;
		w.style.height=280;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		}
	}
}

function showHelpIDCopyPaste(windowID, obj, horizPadding, vertPadding, goRight)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top = 150;//getAscendingTops(obj) ;
		w.style.width=300;
		w.style.height=200;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
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

<style>
.link, .link #lnkForgotPWD
{
font-family:tahoma;
text-decoration:none;
color:#0000ee;
}

.link:hover, .link:hover #lnkForgotPWD
{
 font-weight:bold;
 text-decoration:underline overline;
 color:#D89D30;
}
</style>

</head>
<body >
    <form id="form1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>   
    
    <div align="center">
    
    <img  id="Img1" src="Images/hed.gif" runat="server" /><br />
    
    <span style="font-size:smaller;font-family:Tahoma">مرحبا ً بك في نظام التسجيل
                                                            الإلكتروني للعام الدراسي 1430-1431 هـ&nbsp; 2009-2010 م</span>
   </div>
   <div id="body">
        
		<div id="col_main_left">
			<div id="user_assistance" class="dialog_title title_window">
				<a id="content_start" ></a>
				
                    للذين سبق لهم التسجيل
                
				<p  dir="rtl" align="justify">
                    <span style="font-size: 10pt">إذا إستخدمت النظام من قبل وتريد إستخدامه مرة ً أخرى
                        فضلا ً قم بكتابة إسم المستخدم وكلمة المرور التي قمت بإنشائها عند إستخدامك النظام
                        لأول مرة ثم إضغط على زر تسجيل الدخول</span></p>
                <span style="font-size: 10pt"></span>
                <h2 class="section">
				دخول</h2>				
                <p style="text-align: right" >
                    <span style="color: black">&nbsp;اسم المستخدم</span>
                    
                    <asp:TextBox ID="txtLoginname" runat="server" CssClass="textback" Width="146px"></asp:TextBox><br />
                    <span style="color: black">كلمـة المرور</span><br />
                    <asp:TextBox  ID="txtPassword" runat="server" TextMode="Password" CssClass="textback" Width="146px"></asp:TextBox>
                    
                    <asp:Button ID="btnLogin" OnClick="fnCheckLogin" runat="server" Text="دخول" />
                    <br />
                    <asp:RequiredFieldValidator ID="req_id" runat="server" Display="None" ErrorMessage="*" ControlToValidate="txtLoginname"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="req_pass" runat="server" Display="None" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                    
                    <br />
                    <asp:Label ID="lblLoginStatus" ForeColor="Red"  Visible="False" runat="server"></asp:Label>
                    
                    
                </p>
                <p style="text-align: right">
                    	<span class="link"><asp:LinkButton ID="lnkForgotPWD"  runat="server"  Text="في حالة نسيانك لكلمة المرور إضغط هنا ؟"></asp:LinkButton></span>
                    	
                    	 <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
            TargetControlID="lnkForgotPWD"  PopupControlID="Panel4" 
            BackgroundCssClass="modalBackground" 
            DropShadow="true"   CancelControlID="btnCancelPWD">
            </ajaxToolkit:ModalPopupExtender>          
            
            <asp:Panel  Direction="rightToLeft"    ID="Panel4" runat="server" CssClass="modalPopup" Style="display:none" Width="440px">
                <div>
            <asp:Panel Direction="rightToLeft" ID="title_pnl" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
            نسيان كلمة المرور
            </asp:Panel>
            </div>
               أدخل بريدك الإلكتروني أو رقم بطاقة الأحوال الشخصية لتصلك كلمة المرور على بريدك الإلكتروني.<br />
                <br />
                <asp:UpdatePanel ID="pwd_upd" runat="server">
                <ContentTemplate>
                <table dir="rtl" id="pwd" runat="server">
                <tr>
                <td>البريد الإلكتروني ؟
                </td>
                <td dir="ltr">
                   <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td  >أو</td>
                </tr>
                <tr>
                <td>
                رقم بطاقة الأحوال الشخصية؟
                </td>
                <td dir="ltr">
                <asp:TextBox ID="txtLocalID" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr visible="false">
                <td>
                تاريخ الميلاد؟
                </td>
                <td dir="ltr">
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                </td>
                </tr>
                <tr>
                <td></td>
                <td colspan="2" align="center">
                    <asp:Button ID="btnOKPWD" CausesValidation="false" UseSubmitBehavior="true" OnClick="retrieve_pwd" runat="server" Text="موافق" />
                <asp:Button ID="btnCancelPWD" OnClick="ClosePassWindow" CausesValidation="false" runat="server" Text="إلغاء" />
                </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblStatus" ForeColor="red" runat="server" ></asp:Label>
                </td>
                </tr>
                </table>
                
                </ContentTemplate>
                </asp:UpdatePanel>
                
            </asp:Panel>
            
                </p>
			</div>
		</div>
		<div id="col_main_right">
			
			<div  dir="ltr">
			     <table dir="ltr" width="575px" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n" >      
        

          <div  class="dialog_title title_window" >لمستخدمي النظام لأول مرة </div></td>
          <td class="dialog_ne"></td>
        </tr>
      </table>
      
			  <table dir="ltr" width="575px" cellpadding="0" cellspacing="0" class="mid table_window">
        <tr>
          <td class="dialog_w"></td>
            <td class="dialog_content"  dir="rtl" style="font-family:Simplified Arabic;font-size:medium" valign="top">
            <table runat="server"  id="Table1">
			    <tr>
			    <td valign=top>
			    <%--<img  id="Img4" width=200 src="Images/Building 1.JPG" runat="server" />--%>
			     <asp:LinkButton ID="btnHelp" runat ="server" Text="إرشادات " ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_welcome')" onmouseover="showHelpStatusIndex('id_hlp_welcome', this,310, 50, false)"></asp:LinkButton>			    			   			    			     			     
			     <div id="id_hlp_welcome" class="HelpWindow" >
                <iframe  frameborder="0" height="100%"
                src="hlp_welcome.htm"></iframe>
                </div>                      
			    </td>			    
			    <td  align="center"  valign=top dir="rtl" style="font-weight:bold;font-family:Traditional Arabic; font-size:larger;">
                <font size="5px"><b>كلمة الجامعة </b> </font>                                                                                              
                <br /><br /><b> <p align="justify">                             
			
			 أعزاءنا الطلاب.
			                    <br />
                                أخلص التهاني القلبية بالنجاح و التفوق ، و نبارك اختياركم جامعة الملك سعود بن عبدالعزيز للعلوم الصحية بشئون الحرس الوطني الصحية ، حيث نعتز بطلابنا و بقيمنا نحو الريادة في التعليم الطبي و في الممارسة الصحية.
                                <br />
                                القبول في الجامعة عبر هذه البوابة الإلكترونية إلى نهاية فترة التسجيل المعلنة ، و سوف يتم فرز طلبات التسجيل حسب أفضلية المعدل و المقاعد المتاحة بعد إغلاق التسجيل ، و سوف تتصل عمادة القبول و التسجيل بالطلاب المقبولين مبدئيا لترتيب إجراء المقابلة الشخصية ، و تتمنى لمن لم يحالفهم الحظ التوفيق في أماكن أخرى.
                                للاستفسارات و طلب المساعدة ، يرجى استخدام نظام المساعدة المدمج في النظام ، و سوف يتصل منسوبو القبول و التسجيل بكم لتقديم المساعدة.


        
			     <br />		
			     <br />
			    </td>    			    
			    </tr>
		
			    </table>
			    
			     <table dir="ltr" width="575px" cellpadding="0" cellspacing="0" class="bot table_window">
        <tr>
          <td class="dialog_sw">&nbsp;</td>
            <td class="dialog_s" width="100%"><div class='status_bar' align="center" >
            <asp:LinkButton ID="LinkButton1" runat="server" ><span class="link">إضغط هنا لقراءة الشروط والتعليمات</span></asp:LinkButton>				
             </div></td>
            
        </tr>
      </table>
            </td>
            </tr>
            </table>
			   
			   
<br />
<div dir="rtl" align="Justify">              
<p align="center"><font color='red' style="font-weight:bold;font-family:Simplified Arabic;">ملاحظات غاية في الأهمية  </font> <br /> </p>
<ul style="font-family:Traditional Arabic;font-size:larger;font-weight:bold" dir="rtl"> 

<li>  أولوية القبول لحاملي شهـادات التخصصات العليا في الطب وطب الأسنان والصيدلة والعلوم الطبية التطبيقية والأكاديميين.</li>
<li>  سيكون التسجيل الإلكتروني متاحاً من (السبت 25 ذوالحجة  1430هـ الموافق 12 ديسمبر 2009م) حتى (الجمعة 29 محرم 1431هـ الموافق 15 يناير 2010م).</li>
<li> ننصح بشدة باستخدام متصفح انترنت اكسبلورر للاستفادة المثلى من مزايا النظام ، و ألا تقل أبعاد الشاشة عن 1280*1204 </li>
</ul>
</div>            
<br /><br />			          
			          <cs:webmodalanchor id="anchor" title="THIS WINDOW TITLE" runat="server" linkedcontrolid="LinkButton1" url="high_school.aspx"
					scrolling="true" windowheight="420" windowwidth="600" showversion="True">
					<cs:property key="Property1" value="Value1"></cs:property>
					<cs:property key="Property2" value="Value2"></cs:property>
					<cs:property key="Character Support" ></cs:property>
				</cs:webmodalanchor>				
            
            <asp:UpdatePanel ID="chk_terms" runat="server">
            <ContentTemplate>            
              <div align="center" >
                 <asp:Button ID="btnAgree" Enabled="false" runat="server" Text="تابع " CausesValidation="false" OnClick="gotoRegister"  Width="47px" />
             <asp:CheckBox Font-Size="small" TextAlign="left" ID="chk_agree_terms" 
             OnCheckedChanged="chk_agree_terms_CheckedChanged" Text="أوافق على الشروط والتعليمات المتعلقة بالقبول والتسجيل"
              AutoPostBack="true"   runat="server"/>
              </div>
              <br /><hr />              
              <div align="Center">              
             
              </div>            
              
			</ContentTemplate>
            </asp:UpdatePanel>
			</div>  
			<div align=center>
		
			    <font size="1px">
                   تطوير : جامعة الملك سعود بن عبدالعزيز للعلوم الصحية 2009 © - فريق تقانة المعلومات بكلية الطب
                </font>            
            </div>
		</div>
			
	</div>		       
        
	
    </form>
</body>
</html>
