<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" ValidateRequest="false" %>
<%@ Register TagPrefix="cs" Namespace="Codesummit" Assembly="WebModalControls" %>
<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>مرحباً بك في نظام التسجيل الإلكتروني </title>
     <link href="mathertel.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src= "ajaxcore/ajax.js"></script>
</head>
<body  style="background-image:url(images/arabic-only-with-title-with-stpic-no-title.jpg);background-repeat:no-repeat;background-position:top " >
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br /><br /><br />
        
       
        <br />
        <br />
        
        <table align="center" id="we" runat="server" border="0" cellpadding="0" cellspacing="0" style="font-size: 13px;
            width: 79%; background-repeat: repeat-x; background-color: transparent; text-align: right">
            <tr>
                <td valign="top" style="text-align: left">
                
                    <span style="font-family: Tahoma">
                        <div >
                            <table align="center" cellpadding="0" cellspacing="0"  style="width: 986px"
                               >
                                <tr>
                                    <td align="center"
                                        valign="top">
                                        <p align="right" class="MsoNormal" style="text-align: center">
                                            <strong><span dir="rtl" style="font-family: Tahoma"><span><span dir="rtl" lang="AR-SA" >
                                                
                                                     <asp:UpdatePanel ID="news" runat="server">
                                                     <ContentTemplate> 
                                                         <span style="font-size: 12pt">
                                                        &nbsp;<strong><span>مرحبا ً بك في نظام التسجيل
                                                            الإلكتروني للعام الدراسي 1428-1429 هـ&nbsp; 2007-2008 م</span></strong></span>
                                                                                         
                                                    
                </ContentTemplate>
                </asp:UpdatePanel>
                                                   </span></span></span></strong><span style="font-size: 10pt">&nbsp;</span></p>
                                                                                                  </td>
                                </tr>
                            </table>
                        </div>
                        
                    </span>
                </td>
            </tr>
        </table>
    <table  align="center" id="we1" runat="server" border="0" cellpadding="0" cellspacing="0" style="font-size: 13px;
            width: 79%; background-repeat: repeat-x; background-color: transparent; text-align: right"  >
    <tr>
    <td valign="top">
  
   
     <table align="center" 
     style="background: #F9F9F8 url(app_themes/Green/images/background_title.jpg) repeat-x top; width: 87%; height: 212px;" >
     
        
        <tr>
        <td style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;font-size:medium">
        
        <ajax:RoundedArea    Font-Names="Simplified Arabic" runat='server' id='RoundedArea1' >
        <asp:Panel ID="Panel2" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div align="center"><b>
                    للذين سبق لهم التسجيل                </b>
                </div>
            </asp:Panel>
        <b>
        إذا إستخدمت النظام من قبل
        وتريد إستخدامه مرة
        ً أخرى فضلا ً قم بكتابة إسم المستخدم وكلمة المرور التي قمت بإنشائها
        عند إستخدامك النظام لأول مرة ثم إضغط على زر تسجيل الدخول.
        
        </b>
        
        <br /><br /><br />
            <asp:TextBox ID="txtLoginname" runat="server" Width="189px" CssClass="textback"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;اسم المستخدم&nbsp;&nbsp;
                
        <br />
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Width="189px"></asp:TextBox>&nbsp;&nbsp;كلمـة المرور&nbsp;&nbsp;
        <br /><br />
        
        <br />
       
        
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Label ID="lblLoginStatus" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <asp:Button ID="btnLogin" OnClick="ValidateLogin" runat="server" Text="تسجيل الدخول"  /> <br />
        <asp:LinkButton ID="lnkForgotPWD"  runat="server"  Text="في حالة نسيانك لكلمة المرور إضغط هنا ؟"></asp:LinkButton>
        
          <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
            TargetControlID="lnkForgotPWD"  PopupControlID="Panel4" 
            BackgroundCssClass="modalBackground" OkControlID="btnOKPWD"
            DropShadow="true"   CancelControlID="btnCancelPWD">
            </ajaxToolkit:ModalPopupExtender>          
            
            <asp:Panel  Direction="leftToRight"  Height="250px"  ID="Panel4" runat="server" CssClass="modalPopup" Style="display:none" Width="440px">
                <div>
            <asp:Panel ID="title_pnl" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
            نسيان كلمة المرور
            </asp:Panel>
            </div>
               الرجاء إدخال أحد الخيارات التالية ( إما بريدك الإلكتروني أو رقم بطاقة الأحوال الشخصية وتاريخ الميلاد معاً ) وذلك لكي يتم إرسال كلمة المرور الجديدة لبريدك الإلكتروني<br />
                <br />
               البريد الإلكتروني ؟<asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                <br />
                <div align="center" >أو</div>
                رقم بطاقة الأحوال الشخصية؟
                <asp:TextBox ID="txtLocalID" runat="server"></asp:TextBox><br />
                
                تاريخ الميلاد؟<asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                
                 <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
            TargetControlID="txtDOB"
            Mask="99/99/9999"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Date"/>
                 <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator1" runat="server"
            ControlExtender="MaskedEditExtender1"
            ControlToValidate="txtDOB"
            IsValidEmpty="true"           
            ValidationGroup="Demo1"
            Display="Dynamic"
            TooltipMessage="Input a Date" />
                <div align="center">
                <asp:Button ID="btnOKPWD" runat="server" Text="موافق" />
                <asp:Button ID="btnCancelPWD" runat="server" Text="إلغاء" />
                </div>
            </asp:Panel>
        
        </ContentTemplate>
        </asp:UpdatePanel>
        </ajax:RoundedArea>
       
           
        
        </td>
        </tr>
        </table>
    </td>
    
    <td valign="top" dir="rtl" style="height: 295px;" > 
   
    <table align="center" border="0"  >
        <tr>
        <td style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;font-size:medium">
        <ajax:RoundedArea    Font-Names="Simplified Arabic" runat='server' id='any' >
         <asp:Panel ID="Panel1" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div align="center"><b>
                    لمستخدمي النظام لأول مرة                </b>
                </div>
            </asp:Panel>
        <b>
       التسجيل عن طريق الموقع
       الإلكتروني أحد خطوات عملية القبول
       فيجب عدم تجاهلها وتعبئة جميع       
       الحقول بدقه لضمان وصول المعلومات الصحيحه.        
       قبل الإستمرار بالتسجيل ننصح
       بأن يتم تجهيزالوثائق التاليه نظراً لحاجتك
        اليها عند تعبئة بياناتك إلكترونياً:  <br />  
        1- بطاقة الأحوال الشخصية<br />          
        2- شهادة الثانوية العامة ( قسم العلوم الطبيعية ). <br />
      <br />
        
        كذلك ننصح بعمل مسح ضوئي ( Scanning ) للوثائق الخاصة بك لتحميلها على الموقع أو إحضارها لعمادة القبول والتسجيل ( مع العلم أن المسح الضوئي لهذه الوثائق يوفر عليك الحضور الشخصي للعمادة ). 
        </b>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="true" Font-Names="Simplified Arabic" >إضغط هنا لقراءة الشروط والتعليمات،</asp:LinkButton>
        <span  style="font-family: Simplified Arabic"><b>
                                                 الرجاء قراءة الشروط والتعليمات جيداً 
                                                    </b>
                                                    <asp:Button ID="btnFake" Style="display: none;" runat="server" Text="Fake" /><span
                                                             style="font-size: 10pt; font-family: Simplified Arabic">
                                                             
                                                         </span>
                                                         <b>
                                                          علما ً بأن إستخدامك للنظام يعني إدراكك
                                                          
                                                            وإقرارك بتعليمات وأنظمة 
                                                                                                                      
                                                                الجامعة. </b>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="LinkButton1"  PopupControlID="mb" 
            BackgroundCssClass="modalBackground"
            DropShadow="true" CancelControlID="btnOK">
            </ajaxToolkit:ModalPopupExtender>          

            <asp:Panel  Direction="leftToRight"  ID="mb" runat="server" CssClass="modalPopup" Style="display:none" Width="381px">
                <asp:Panel ID="Panel3" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div align="center"><b>
                    الشروط والتعليمات
                </b>
                </div>
            </asp:Panel>
            
                <br />
                     <div align="center">           
                <asp:Image
                ID="Image1" runat="server" ImageUrl="~/Images/arrow-2.jpg" />
                <asp:LinkButton ID="LinkButton2"  runat="server" Font-Names="Tahoma"  >الشروط والتعليمات لحملة الشهادة الثانوية</asp:LinkButton>&nbsp;<asp:Image
                ID="Image2" runat="server" ImageUrl="~/Images/arrow-1.jpg" /><br />
                <asp:Image
                ID="Image4" runat="server" ImageUrl="~/Images/arrow-2.jpg" />

                <asp:LinkButton ID="LinkButton3"  runat="server" Font-Names="Tahoma" >الشروط والتعليمات لحملة الشهادة الجامعية</asp:LinkButton>
                <asp:Image
                ID="Image3" runat="server" ImageUrl="~/Images/arrow-1.jpg" />
                </div>
             <cs:webmodalanchor id="anchor" title="THIS WINDOW TITLE" runat="server" linkedcontrolid="LinkButton2" url="high_school.aspx"
					scrolling="true" windowheight="600" windowwidth="600" showversion="True">
					<cs:property key="Property1" value="Value1"></cs:property>
					<cs:property key="Property2" value="Value2"></cs:property>
					<cs:property key="Character Support" value="~!~&quot;SD&quot;&quot;&quot;@$&quot;''' sdaf's'df'' ' s'df'// &lt;&lt;/ sdf&gt;&lt;xml&gt;"></cs:property>
				</cs:webmodalanchor>
				
				 <cs:webmodalanchor id="Webmodalanchor1" title="THIS WINDOW TITLE" runat="server" linkedcontrolid="LinkButton3" url="graduation.aspx"
					scrolling="true" windowheight="600" windowwidth="600" showversion="True">
					<cs:property key="Property1" value="Value1"></cs:property>
					<cs:property key="Property2" value="Value2"></cs:property>
					<cs:property key="Character Support" ></cs:property>
				</cs:webmodalanchor>
            
                <div style="text-align:center;">
                <br />
                <asp:Button ID="btnOK" runat="server" Text="إغلاق" /></div>
            </asp:Panel>
          <span style="font-size: 10pt; font-family: Simplified Arabic"></span>
        <br />
        
        
                                                                
        <asp:UpdatePanel ID="upd_i_agree" runat="server">
        <ContentTemplate>
             <asp:CheckBox TextAlign="right" ID="chk_agree_terms" Font-Bold="true" Text="أوافق على الشروط والتعليمات المتعلقة بالقبول والتسجيل"
             OnCheckedChanged="chk_agree_terms_CheckedChanged" AutoPostBack="true"   runat="server" Height="27px" 
              />
              <asp:Button ID="btnAgree" Enabled="false" runat="server" Text="تابع " PostBackUrl="default.aspx" Width="47px" />
        </ContentTemplate>
        <Triggers>
                 <asp:AsyncPostBackTrigger  ControlID="chk_agree_terms" EventName="CheckedChanged" />
                 </Triggers>
        </asp:UpdatePanel>
        </ajax:RoundedArea>
           </td>
                           
                  </tr>
        </table></td>
    </tr>
    </table>
    
 
        
			
    </form>
</body>
</html>
