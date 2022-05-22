<%@ Page Language="C#" AutoEventWireup="true" CodeFile="intermediate_1.aspx.cs" Inherits="intermediate_1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
    
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
		
		w.style.top =(getAscendingTops(obj) + vertPadding)-25 ;
		w.style.width=300;
		w.style.height=150;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = (getAscendingLefts(obj) - horizPadding)+ 80;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = (getAscendingLefts(obj) + obj.offsetWidth + horizPadding)+ 130;
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
<body>
    <form id="form1" runat="server">
    <div id="body"  dir="rtl" style="width: 780px;">	    
    
   
                     
    <table cellpadding="0" cellspacing="0" align="center" id="tbmain" runat="server" >
    <tr>
    <td>
        <img  id="Img3" src="Images/hed.gif" runat="server" />
           <table visible="false"  dir="ltr" width="100%" cellpadding="0" cellspacing="0"  class="top table_window">
        <!-- <tr >          
          <td class="dialog_nw"></td>
           <td class="dialog_n" >
          <div  class="dialog_title title_window" ><b> التسجيل هنا لحملة الثانوية من الذكور في الكليات التالية</b></div></td>
            <td class="dialog_ne"></td>
        </tr> -->
      </table>
         <table cellpadding="0" cellspacing="0"   style="background: transparent url(images/background.jpeg) no-repeat 0 0;"  
                     runat="server" id="table1">  
                     <tr>
                     <td    style="font-size: 12pt; font-family: Simplified Arabic; ">
                        <ajax:RoundedArea runat='server' ID="RoundedArea1">
                        <asp:LinkButton ID="btnHelp" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_welcome')" onmouseover="showHelpStatusIndex('id_hlp_welcome', this,310, 50, false)"></asp:LinkButton>			    			   			    
                        <div id="id_hlp_welcome" class="HelpWindow" >
                            <iframe  frameborder="0" height="100%"
                            src="hlp_First_Page.htm"></iframe>
                        </div>      
                       <br />    
                         <b><span style="font-size:x-large" >قسم التعليم الطبي - كلية الطب</span> <br />
                         <span style="font-size:x-large" >برنـامج الماجستير في التعليم الطبي:</span>
                         
                         </b><br />
                         
                         
                         <b>يهدف البرنامج إلى فهم وتقويم الأداء للمناهج التعليمية النظرية منها والتطبيقية بالإضـافة إلى تخطيط وتصميم وتطبيق وتقييم المناهج والمقررات الخاصة بالمهن الصحية مع تهيئة كوادر فعالة في تقديم المشورة العلمية والنصح البناء لأعضـاء هيئة التدريس ولجان المناهج واللجان الإدارية.</b>    <br /><br />
                        
                        <b>يتكون البرنامج من اربعة فصول دراسية (سنتين اكاديميتين) عن طريق المقررات الدراسية يتم خلالها تغطية 10 مقررات بما فيها مشروع بحثي، يبلغ عدد الساعات المعتمدة 42 ساعة ويعتبر هذا البرنامج من برامج الماجستير المميزة في الجامعات السعودية وقد تمت الموافقة عليه من معالي وزير التعليم العالي في خطاب رقم 70 - أ بتاريخ 15/2/1427هـ بناء على قرار مجلس جامعة الملك سعود بن عبدالعزيز للعلوم الصحية برقم 50-ج م س ع ص بتاريخ 29/1/1427هـ .
وقد تم قبول الدفعة الأولى في العام الدراسي 1427-1428 هـ والمتوقع تخرجهم في نهاية الفصل الأول من العام الدراسي 1428-1429 هـ أما الدفعة الثانية فيتوقع تخرجهم في الفصل الأول من العام الدراسي 1430-1431هـ ويتم تنفيذ هذا البرنامج بالتعاون مع جامعة ماسترخت بهولندا ويشترك في التدريس اساتذة مشهود لهم بالكفاءة عالمياً ومحلياً من القسم أو من الجامعات العالمية المختلفة.
</b>    <br />
<hr />
<div dir=Ltr>
<font size="4"><b>
رئيس قسم التعليم الطبي
<br />
أ.د/ محي لدين محمد علي مجذوب       
</b></font>
</div>        
                        </ajax:RoundedArea>
                        
                        
                        
                     </td>
                     </tr>
                     <tr>
                     </tr>
                    
                     <tr>
                     <td align="right" style="font-size: 12pt; font-family: Simplified Arabic;">
                      <!-- <ajax:RoundedArea runat='server' ID="RoundedArea2">
                        <b>
                     <span style="font-size:x-large" > كلية العلوم الطبية التطبيقية</span><br />
                     </b>
                     
                     
                      <b>
                     يدرس الطالب مدة سنتين تحضيريتين مشتركة مع طلاب كلية الطب، تليها سنتين للتخصص بأحد التخصصات التالية:<br />
                     1- علوم المختبرات الطبية.<br />
                     2- تقنية الطوارئ.<br />
                     3- العلاج التنفسي.<br />
                     
                     </b>
                      </ajax:RoundedArea> -->
                      
                   
                     </td>
                     </tr>
                    
                     <tr visible="false">
                     <td  align="center" style="font-size: 12pt; font-family: Simplified Arabic; ">      
                        <ajax:RoundedArea  runat='server' ID="RoundedArea3">
                            <span  style="font-size: 12pt; font-family: Simplified Arabic">
                            <b>
                            ملاحظة: القبول في الوقت الحاضر محصور للطلبة الذكور فقط
                            </b><br />
                            <b>الرجاء إختيار المسار المناسب لمؤهلك الدراسي</b></span>  
                               
                            <br />             
                                <asp:RadioButton Visible="false" style="font-size: 10pt; font-family: Simplified Arabic" 
                                ID="radHighSchool" Checked="true" AutoPostBack="True" runat="server" GroupName="Academic" Text="مسار حملة الشهادة الثانوية ( كلية الطب وكلية العلوم الطبية التطبيقية )" 
                                Font-Bold="true"  />   

                                <asp:LinkButton ID="lnkHighSchool" runat="server" Text="مسار حملة الشهادة الثانوية ( كلية الطب وكلية العلوم الطبية التطبيقية )" 
                                Font-Names="Simplified Arabic" ></asp:LinkButton>           
                                <br />

                                <asp:LinkButton Visible="false" ID="lnkGraduation" runat="server" Text="مسار حملة الشهادة الجامعية ( كلية الطب فقط - طلاب )" 
                                Font-Names="Simplified Arabic" ></asp:LinkButton>           



                                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
                                TargetControlID="lnkHighSchool"  PopupControlID="mb1" 
                                BackgroundCssClass="modalBackground"
                                DropShadow="true"   >
                                </ajaxToolkit:ModalPopupExtender>

                            
                                
                                <asp:Panel Direction="rightToLeft"  ID="mb1" runat="server" CssClass="modalPopup"    Width="381px">
                                    <asp:Panel ID="pan_heading_1" runat="server" 
                                    Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                                        <div>
                                               <b>ملاحظة هامة </b>
                                        </div>                                        
                                    </asp:Panel>
                                نود التنويه بأن البيانات التي ستظهر لك عند قيامك بإدخال رقم بطاقة أحوالك الشخصية هي بيانات تم الحصول عليها من قاعدة البيانات الخاصة بوزارة التربية والتعليم، عند ملاحظتك لوجود أي خطأ في هذه البيانات الرجاء تعديل هذا الخطأ مع العلم بأنه سوف يتبين للكلية بأنه تم تعديل البيانات.                                
                                <div style="text-align:center;">
                                <asp:Button ID="btnOK1"  
                                runat="server" Text="Ok"   /></div>
                                
                                </asp:Panel>
                                
                            
                                <br />
                                <asp:RadioButton  ID="radGraduate" Font-Bold="true" Text="مسار حملة الشهادة الجامعية ( كلية الطب فقط - طلاب ) " 
                                style="font-size: 10pt; font-family: Simplified Arabic"  
                                AutoPostBack="True" runat="server" 
                                GroupName="Academic"  Visible="false"
                                Font-Size="Large" />



                        </ajax:RoundedArea>
                     </td>
                     </tr>
                     
                     </table>
                     
     
      
       <table visible="false" 
                     runat="server" id="table2">  
                     <tr>
                     <td align="right"  class="dialog_content"  dir="rtl" style="font-family:Simplified Arabic;font-size:medium" valign="top">
                        
                         <b><span style="font-size:x-large" >كلية الطب</span> <br /></b>
                         توفر كلية الطب مسارين للدراسة:<br />
                         
                         
                         1- مسار حملة الشهادة الثانوية: هذا المسار مخصص لحملة شهادة الثانوية العامة قسم العلوم الطبيعية. وفي هذا المسار يدرس الطالب لمدة سنتين تحضيريتين مشتركة مع طلاب المرحلة التحضيرية لكلية العلوم الطبية التطبيقية.</b>
                            <br />
                            2- مسار حملة الشهادة الجامعية: هذا المسار مخصص لحملة شهادة البكالوريوس من كلية العلوم، كلية العلوم الطبية التطبيقية، كلية الصيدلة، وكلية الطب البيطري. وفيه يدرس الطالب المقرارات الدراسية لمدة أربع سنوات ونصف 
                                                     تتبعها سنة الإمتياز.
                                <br />
                                
                       
                     يدرس الطالب مدة سنتين تحضيريتين مشتركة مع طلاب كلية الطب، تليها سنتين للتخصص بأحد التخصصات التالية:<br />
                     1- علوم المختبرات الطبية.<br />
                     2- تقنية الطوارئ.<br />
                     3- العلاج التنفسي.<br />
                     
                     
                        
                        
                        
                     </td>
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
    <br />
        
        <asp:ImageButton ID="imgPrev" ImageUrl="~/Images/previous button.jpg" PostBackUrl="~/intermediate.aspx" ToolTip="Click here to move to previous page "  runat="server" />  
        <asp:ImageButton ID="imgNext" ImageUrl="~/Images/next button.jpg" PostBackUrl="~/register.aspx" ToolTip="Click here to move to next page "  runat="server" />  
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
