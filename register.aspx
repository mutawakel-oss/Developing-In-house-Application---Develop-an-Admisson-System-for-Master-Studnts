<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<%@ Register Assembly="ComponentArt.Web.UI" Namespace="ComponentArt.Web.UI" TagPrefix="ComponentArt" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebGrid.v7.2, Version=7.2.20072.61, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebGrid" TagPrefix="igtbl" %>

<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<%@ Register Assembly="ScsComboBox" Namespace="SCS.WebControls" TagPrefix="scs" %>
<%@ Register TagPrefix="ve" TagName="links"  Src="~/controls/PopUp.ascx" %>
<%--Registring the dlls and required components--%>

<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <link rel="stylesheet" type="text/css" media="screen, projection" href="css/ajaxmdi.css" />

  
    <!-- Required Css's Files -->
    <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
  
    <script type="text/javascript" src="script/HWWeb.js"></script>
    
    <title>مرحباً بك في نظام التسجيل الإلكتروني</title>
    <link href="mathertel.css" rel="stylesheet" type="text/css" />
    <%--<script type="text/javascript" src="controls/PopUp.js"> </script>--%>


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
function showHelpStatusIndex(windowID, obj, horizPadding, vertPadding, goRight,tabIndex)
{
	var w = document.getElementById(windowID);
	if (w != null)
	{	
		w.style.display = "block";
		w.style.visibility = 'visible';
		
		w.style.top =(getAscendingTops(obj) + vertPadding);
		w.style.width=300;
		w.style.height=300;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = (getAscendingLefts(obj) - horizPadding)+175;
			if ((getAscendingLefts(obj) - horizPadding) < 0) w.style.left = (getAscendingLefts(obj) + obj.offsetWidth + horizPadding)-550;
		}
		
		if(tabIndex==0)
		{
		    w.style.left = 620;		    
		}		
		else if(tabIndex==2)
		{	w.style.left = 620;	    
		    w.style.height = 350;
		}
		else if(tabIndex==3)
		{
		    w.style.left = 620;
		    w.style.height = 380;
		}
		else if(tabIndex==4)
		{		    
		    w.style.left = 620;
		    w.style.height = 430;
		}
		else if(tabIndex==5)
		{		    
		    w.style.left = 620;
		    w.style.height = 180;
		}
		else if(tabIndex==6)
		{		    
		    w.style.left = 620;
		    w.style.height = 180;
		}
		else if(tabIndex==7)
		{		    
		    w.style.left = 620;
		    w.style.height = 430;
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
		w.style.height=180;
		if (getAscendingTops(obj) + vertPadding < 0) w.style.top = 0;
		
		if (goRight == true)
			w.style.left = getAscendingLefts(obj) + obj.offsetWidth + horizPadding;
		else
		{
			w.style.left = getAscendingLefts(obj) - horizPadding-30;
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
		w.style.height=50;
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
</head>
<body dir="rtl">
    <form id="frmRegistration" runat="server" method="post" enctype="multipart/form-data">
            <div align="center">
            
            </div>         
            
            <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
            <%--<div align="center">--%>
            <div id="body"  dir="rtl" style="width: 988px;">	    
              <asp:UpdatePanel ID="upd_main" runat="server">
        <ContentTemplate>
        
            <div  id="">
            <table id="table_main" runat="server">
            <tr>
            <td>
                <img  id="Img3" src="Images/hed.gif" runat="server" />
            </td>
            <td style="text-align:center;font-size:small;" valign="top">
            <div >
            
            <ajax:RoundedArea  BorderStyle="None" BorderWidth="0" style="background: url(images/banner.gif);background-repeat:no-repeat"
            ID="rnd_area" runat="server" >
            <ajax:RoundedArea BorderStyle="None" BorderWidth="0"  ID="inline_2" 
            style="background: url(App_Themes/Blue/Images/background_user_assist.jpg);" Width="190px" runat="server">
            <table  id="tb_img_bk" runat="server">
            <tr>
            <td dir="ltr" >
            <asp:Label  ForeColor="black"  ID="lblCurrentStatus"
            onmouseout="hideHelpFloatWindow('id_status_index');" onmouseover="showHelpStatusIndex('id_status_index', this,310, 20, false);" 
             Font-Bold="true" Text="Your application Current Status is " runat="server" ></asp:Label>&nbsp;
             <br />
            <asp:LinkButton  ID="lnkAck" OnClick="Acknowledge" Visible="false" runat="server" Text="اضغط هنا لقبول الدعوة"></asp:LinkButton>
            <br />
                    <asp:LinkButton ID="lnkStatusDet" OnClick="gotoStatusTab" runat="server" Font-Italic="true" Text="التفاصيل"></asp:LinkButton>
                   <%-- <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender7" runat="server" 
            TargetControlID="lnkStatusDet"  PopupControlID="Panel8" 
            BackgroundCssClass="modalBackground" 
            DropShadow="true"   CancelControlID="btnCancelPWD">
            </ajaxToolkit:ModalPopupExtender>          
            
            <asp:Panel  Direction="leftToRight"    ID="Panel8" runat="server" CssClass="modalPopup" Style="display:none;" Height="300px" Width="340px">
                <div Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">            
                    تفاصيل حالة تسجيلك
                </div>
                
                <div align="right" dir="rtl">
              'اذا كنت مستخدم جديد للنظام فأن حالة طلبك ستكون  'مسجل جديد<br /><br />
              'في حالة تسجيلك بنجاح فأن حلة طلبك ستكون 'مسجل
              <br />
              <br />
              عند رؤيتك هذا الرابط فهذا معناه قبولك لحضور المقابلة ويجب عليك الضغط عليه للتأكيد <asp:Label ID="lbl_12" Font-Bold="true"  runat="server" Text="'اضغط هنا لقبول الدعوة'"></asp:Label>
              <br /><br />
              الدعوة في حالة قبولك للمقابلة فأن حالة تسجيلك ستكون تم قبول
              
              <br />
              اذا كنت تقدمت للمقابلة فأن حالة تسجيلك ستكون <asp:Label id="lbl_90" runat="server" Font-Bold="true" Text="تمت المقابلة"></asp:Label>
               </div>
                <br />
                <br />
                <asp:UpdatePanel ID="pwd_upd" runat="server">
                <ContentTemplate>
                <table dir="rtl" id="pwd" runat="server">
               
                <tr>
                <td></td>
                <td colspan="2" align="center">                    
                <asp:Button ID="btnCancelPWD" CausesValidation="false" runat="server" Text="إلغاء" />
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
                
            </asp:Panel>--%>
                        
			<br />
			
            </td>
            </tr>
            </table>
            </ajax:RoundedArea>
            

            </ajax:RoundedArea>
            
			</div>
			
            </td>
            </tr>
            </table>
            
			
			
			<div id="user_assistance" style="height:100%">
					<table dir="ltr" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n">
          <div  class="dialog_title title_window"><b>شريط التصفح</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
        <tr>
          <td ></td>
            <td style="font-size:medium;text-align:right;" >للتنقل بين الصفحات قم بالضغط على عنوان الصفحة المراد تصفحها</td>
          
        </tr>
      </table>
			<ajaxToolkit:Accordion Visible="false" ID="Accordion1" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader"  ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" RequireOpenedPane="false" SuppressHeaderPostbacks="true">
           <Panes>
           <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                <Header><b>شريط التصفح</b></Header>
                <Content>   
                    للتنقل بين الصفحات قم بالضغط على عنوان الصفحة المراد تصفحها<br />
                </Content>
                </ajaxToolkit:AccordionPane>
             </Panes>
        </ajaxToolkit:Accordion>
        
        	<table dir="ltr" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n">
          <div  class="dialog_title title_window"><b>حالة البيانات</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
        <tr>
          <td ></td>
            <td style="font-size:medium;text-align:right" >
             الجدول بالأسفل يعكس مدى تقدمك في إدخال البيانات في جميع الصفحات المراد تعبئتها، حيث 
                    <img id="Img4" src="Images/moduleEnabled.gif" alt="" runat="server" />  تبين أنه تم تعبئة جميع البيانات في تلك الصفحة، بينما <img id="Img5" src="Images/moduleDisabled.gif" alt="" runat="server" /> تبين تبين عدم إكتمال البيانات في تلك الصفحة.  
                     
            </td>
          
        </tr>
      </table>
      
          <ajaxToolkit:Accordion ID="Accordion2" Visible="false" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="None" Width="100%" RequireOpenedPane="false" SuppressHeaderPostbacks="true">
           <Panes>
           <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
                <Header><b>حالة البيانات</b></Header>
                <Content>   
                    الجدول بالأسفل يعكس مدى تقدمك في إدخال البيانات في جميع الصفحات المراد تعبئتها، حيث 
                    <img id="Img1" src="Images/moduleEnabled.gif" alt="" runat="server" />  تبين أنه تم تعبئة جميع البيانات في تلك الصفحة، بينما <img id="Img2" src="Images/moduleDisabled.gif" alt="" runat="server" /> تبين تبين عدم إكتمال البيانات في تلك الصفحة.  
                     
                </Content>
                </ajaxToolkit:AccordionPane>
             </Panes>
        </ajaxToolkit:Accordion>
        
       <table dir="ltr" cellpadding="0" cellspacing="0"  class="top table_window">
        <tr >
          <td class="dialog_nw"></td>
          <td class="dialog_n">
          <div  class="dialog_title title_window"><b>حالة البيانات</b></div></td>
          <td class="dialog_ne"></td>
        </tr>
        <tr>
          <td ></td>
            <td dir="rtl"  style="font-size:medium;">
            <asp:Label Width="120px" Visible="false" ID="btn_stage_0" Text="مسارات الدراسة"      runat="server"/>
                <asp:Image  ID="img_tab_0" Visible="false" ImageUrl="~/Images/moduleDisabled.gif" AlternateText="Step 0-Radio Selection"  runat="server" />                           
                
                <asp:Label Width="120px" ID="btn_stage_1" Text="البيانات الشخصية"  runat="server"/>
                <asp:Image  ID="img_tab_1" AlternateText="Step 1-Personal Info" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />     
                
                
                <asp:Label Width="120px" ID="btn_stage_2" Text="العنوان"  runat="server"/>
                <asp:Image  ID="img_tab_2" AlternateText="Step 2-Address" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                <asp:Label Width="120px"  ID="btn_stage_3" Text="بيانات الدراسة"  runat="server" />
                <asp:Image  ID="img_tab_3"  AlternateText="Step 3-High School" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                <asp:Label Width="120px"  ID="btn_stage_4" Text="الدراسات العليا"  runat="server"/>
                <asp:Image  ID="img_tab_4"   AlternateText="Step 4-University" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                                
                <asp:Label Width="120px" ID="btn_stage_6" Text="تحميل المستندات" runat="server" />
                
                <asp:Image  ID="img_tab_6" AlternateText="Step 6-File Upload" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />
                <asp:Image  ID="img_tab_6_2" AlternateText="Step 6-File Upload" ImageUrl="~/Images/moduleEnabled.gif" Visible="false" runat="server" />
                
                <asp:Label Width="120px" ID="btn_stage_7" Text="اسم المستخدم" runat="server" />
                <asp:Image  ID="img_tab_7" AlternateText="Step 7-EMailAddress" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />
            </td>
          
        </tr>
      </table>
      
          <ajaxToolkit:Accordion Visible="false" ID="MyAccordion" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" Width="100%"  RequireOpenedPane="true" SuppressHeaderPostbacks="true">
           <Panes>
           <ajaxToolkit:AccordionPane ID="AccordionPane1"  runat="server">
                <Header><b>إظهار حالة البيانات</b></Header>
                <Content>   
                </Content>
            </ajaxToolkit:AccordionPane>
             </Panes>
            
        </ajaxToolkit:Accordion>
        
       
			</div>
		
		    </div>
		    
		     <div id="col_main_right"  >
			<div  class="content_right" >
          <asp:LinkButton ID="lblLoginID"  Font-Bold="false" runat="server" Visible="false">
          </asp:LinkButton>&nbsp;&nbsp;
          <asp:LinkButton ID="lnkChangePWD" Font-Bold="false"  runat="server" Visible="false" Text="تغيير كلمة المرور"></asp:LinkButton>&nbsp;&nbsp;
          <asp:LinkButton ID="lnkLogout"  OnClick="logout" CausesValidation="false" Font-Bold="false" runat="server" Visible="false" Text="خروج"></asp:LinkButton>
          
          <asp:Button ID="Button4" Style="display: none;" runat="server" Text="Fake" />
            <ajaxToolkit:ModalPopupExtender  ID="ModalPopupExtender5" runat="server" 
            TargetControlID="lnkChangePWD"  PopupControlID="Panel4" 
            BackgroundCssClass="modalBackground" CancelControlID="Button5"
            DropShadow="true" >
            </ajaxToolkit:ModalPopupExtender>

            <asp:Panel Direction="RightToLeft"  ID="Panel4" runat="server" CssClass="modalPopup" Style="display:none" Width="320">
                 <asp:Panel ID="Panel5" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    تغيير كلمة المرور
                
                </div>
            </asp:Panel>
                <table id="tb_password" runat="server">
                <tr>
                <td><br />كلمة المرور الحالية</td>
                <td> <br /><asp:TextBox ValidationGroup="passgrp" ID="txtOldPWD" runat="server" TextMode="password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="req_old_pwd"  ValidationGroup="passgrp"
                runat="server" ControlToValidate="txtOldPWD" ErrorMessage="*" ></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td>كلمة المرور الجديدة</td>
                <td><asp:TextBox ID="txtNewPWD" ValidationGroup="passgrp" runat="server" TextMode="password"></asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="passgrp" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPWD" ErrorMessage="*" ></asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td>تاكيد كتابة كلمة المرور</td>
                <td><asp:TextBox ID="txtRetypeNewPWD" ValidationGroup="passgrp" runat="server" TextMode="password"> </asp:TextBox>
                <asp:RequiredFieldValidator ValidationGroup="passgrp" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRetypeNewPWD" ErrorMessage="*" ></asp:RequiredFieldValidator>
               
                </td>
                </tr>
                <tr>
                <td colspan="2"  align="center">
                <br />
                <asp:Label ID="lblChangePWDStatus"  ForeColor="red" runat="server"></asp:Label>
                </td>
                </tr>
                </table>
                <br />
                <br />
                <div style="text-align:center;">
                <asp:Button ID="btnChangePWD" ValidationGroup="passgrp" OnClick="ChangePwd"  runat="server" Text="حفظ"  />
                <asp:Button ID="Button5"   runat="server" Text="اغلاق"  />
                </div>
                
            </asp:Panel>
            &nbsp;
            <asp:LinkButton ID="lnkTry" runat="server" Text="طلب المساعدة" OnClick="openContactUs"  CausesValidation="false"></asp:LinkButton>
        <ajaxToolkit:TabContainer   Width="760px" EnableViewState="true"  runat="server" ID="MainTab">                
        
         
            <ajaxToolkit:TabPanel ID="tab_2" runat="server" HeaderText="البيانات الشخصية">
            <ContentTemplate>
                <table Width="745px"  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table_01">
            
            <tr>
            <td colspan="3">
             <asp:UpdatePanel ID="UpdatePanel15" runat="server" RenderMode="Inline">
            <ContentTemplate>

            

            </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            </tr>
            <tr>
            <td>
            
            
            </td>
            </tr>
             <tr>
            <td dir="ltr"   align="right" style="font-family:Simplified Arabic;font-size: 12pt;width:170px;">
            
            <asp:Label Font-Bold="true" runat="server" ID="lblLocalID"
             Text="رقم بطاقة الاحوال" ></asp:Label>
            
            </td>
            <td style="width:205px">    
            
              <asp:UpdatePanel runat="server" id="myID" RenderMode="Inline">
                            <ContentTemplate>
                        <asp:TextBox ID="txtLocalID"  
                         MaxLength="10" Width="100px"  CssClass="textback"  runat="server"></asp:TextBox>
                        
                       

            <asp:LinkButton Visible="false" ID="lblValidateID" runat="server" 
            CausesValidation="False" Text="Validate"  ></asp:LinkButton>
            <asp:Button ID="btnFetchData" Visible="false"  Text="تحقق" runat="server" UseSubmitBehavior="false"/>
            
            
            <asp:Button ID="btnFake" Style="display: none;" runat="server" Text="Fake" />
            
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
            TargetControlID="btnFake"  PopupControlID="mb" 
            BackgroundCssClass="modalBackground"
            DropShadow="true" CancelControlID="btnOK">
            </ajaxToolkit:ModalPopupExtender>           
           
            
            <asp:Panel Direction="RightToLeft"  ID="mb" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="Panel3" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div><b>
                    خطأ في إدخال رقم بطاقة الأحوال
                </b>
                </div>
            </asp:Panel>
                <b><div dir="rtl" align="Justify" id="divInfo" runat ="server"><span style="font-family:Tahoma; font-size:small">
                 رقم الأحوال المدنيةالذي أدخلته غير موجود في قاعدة بيانات وزارة التربية والتعليم لخريجي هذا العام ، فضلا تأكد من الرقم الصحيح ، 
                .وفي حالة ظهور الرسالة مرة ً أخرى اضغط زر "لدي مشكلة" لإرسال تقرير عنها..               
                </span></div></b>
                <br />                
                <br />
                <div style="text-align:center;"><asp:Button ID="lnkContactUs" runat="server" Text="لدي مشكلة" OnClick="openContactUs"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnOK" runat="server" Text="إغلاق" Width="80px" /></div>
            </asp:Panel>
            
             </ContentTemplate>
                             <Triggers>
                                <%--<asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />--%>
                                <asp:PostBackTrigger ControlID="btnFetchData" />
                             </Triggers>
                            </asp:UpdatePanel>
                            
            </td>
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <b>
            <asp:Label ID="Label1" Text="الإسم كاملاً" Font-Bold="true" runat="server" ></asp:Label>            
            </b>
            </td>
            <td >
             <asp:UpdatePanel runat="server" id="FullNamePnl">
                            <ContentTemplate>                       
            <%--<asp:TextBox ID="txtFullName" ValidationGroup="Tab_2" Width="200px" runat="server" CssClass="user_info" MaxLength ="100"></asp:TextBox>--%>            
            <b>
            <asp:Label ID="lblFullName" Width="200px" runat="server" CssClass="user_info"></asp:Label>
            </b>                      
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            
            </td>
            </tr>
            <tr>            
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            
            
            
            <b>
            <asp:Label ID="lblFirstName_Arabic" Text="الإسم الأول" Font-Bold="true" runat="server" ></asp:Label>
            
            </b>
            </td>
            <td >
             <asp:UpdatePanel runat="server" id="FirstNamePnl">
                            <ContentTemplate>                       
            <asp:TextBox ID="txtFirstName_A" ValidationGroup="Tab_2" Width="160px" runat="server" CssClass="user_info" MaxLength ="35"></asp:TextBox>
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            
            </td>
            
           
            <td dir="ltr">
            <asp:TextBox ID="txtFirstName_E" ValidationGroup="Tab_2" CssClass="textback" Width="160px" runat="server" MaxLength="35"></asp:TextBox>
            </td>
            <td align="left" style="font-size:10px;width:150px">
            <asp:Label ID="lblFirstName_Eng" runat="server" Text="First Name"></asp:Label>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblFatherName_A" runat="Server" Text="إسـم الأب" Font-Bold="true"></asp:Label>
            </td>
            <td>
            <asp:UpdatePanel runat="server" id="FatherName_pnl">
            <ContentTemplate>
          <%--  <span style="color:Gray">?</span>--%>
                <asp:TextBox ID="txtFatherName_A" ValidationGroup="Tab_2" CssClass="textback" Width="160px" runat="server" MaxLength ="35"></asp:TextBox>
            
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            
            <td dir="ltr"><asp:TextBox ID="txtFatherName_E" ValidationGroup="Tab_2" CssClass="textback" Width="160px" runat="server" MaxLength="35"></asp:TextBox></td>
            <td align="left" style="font-size:10px;width:250px" >
            <asp:Label ID="lblFatherName_Eng" runat="server" Text="Father Name"></asp:Label>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
            <asp:Label ID="lblGrandfatherName_A" Text="إسم الجد" runat="server"></asp:Label>
            </b>
            </td>
            <td>
            <asp:UpdatePanel runat="server" id="GrandFather_pnl">
            <ContentTemplate>
          <%--  <span style="color:Gray">
            ?</span>--%>
                <asp:TextBox ID="txtGrandFatherName_A" CssClass="textback" Width="160px" runat="server" MaxLength="35"></asp:TextBox>
                
                 </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
                            
                </td>
                
            <td dir="ltr"><asp:TextBox ID="txtGrandFatherName_E" CssClass="textback" Width="160px" runat="server" MaxLength="35"></asp:TextBox></td>
            <td align="left"  style="font-size:10px;width:280px"><asp:Label ID="lblGrandFatherName_Eng" runat="server" Text="Grand Father"></asp:Label></td>
            </tr>
            
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
            <asp:Label ID="lblLastName_A" runat="server" Text="اسم العـائلة"></asp:Label>
            </b>
            
            </td>
            
            <td>
             <asp:UpdatePanel runat="server" id="LastName_Pnl">
            <ContentTemplate><%--<span style="color:Gray">?</span>--%>
            <asp:TextBox ID="txtLastName_A" CssClass="textback" Width="160px" runat="server" MaxLength="35"></asp:TextBox>
             </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            <td dir="ltr"><asp:TextBox ID="txtLastName_E" CssClass="textback" Width="160px" runat="server" MaxLength="35"></asp:TextBox></td>
            <td align="left"  style="font-size:10px;width:150px"><asp:Label id="lblLastName_Eng" Text="Last Name" runat="server"></asp:Label></td>
            </tr>
              <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <b><asp:Label ID="lblDOB" runat="server" Text="تاريـخ الميلاد"></asp:Label></b></td>
            <td  >
            <asp:UpdatePanel runat="server" id="hijri_dob_pnl">
            <ContentTemplate>
             <asp:DropDownList ID="cmdHijiDob_Date" runat="server" 
                OnSelectedIndexChanged="ChangeEnglishDate" AutoPostBack="true">
            </asp:DropDownList>
            <asp:DropDownList ID="cmdHijiDob_Month" 
            runat="server" Width="60" OnSelectedIndexChanged="ChangeEnglishDate" AutoPostBack="true">
            <asp:ListItem >مُحَرَّم</asp:ListItem>
            <asp:ListItem>صَقَر</asp:ListItem>
            <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
            <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
            <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
            <asp:ListItem >جُمادى الثّاني</asp:ListItem>
            <asp:ListItem >رَجَب</asp:ListItem>
            <asp:ListItem >شَعْبانُ</asp:ListItem>
            <asp:ListItem >رَمَضانُ</asp:ListItem>
            <asp:ListItem >شَوّال</asp:ListItem>
            <asp:ListItem >ذُو القَعدة</asp:ListItem>
            <asp:ListItem >ذُو الحِجّة</asp:ListItem>
            
            
            </asp:DropDownList>
            
            <asp:DropDownList ID="cmdHijiDob_Year" 
            runat="server" OnSelectedIndexChanged="ChangeEnglishDate" AutoPostBack="true">                        
            </asp:DropDownList>
            
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>         
                            
                            
            </td>
             <td>
             
             <asp:UpdatePanel runat="server" id="UpdatePanel1">
            <ContentTemplate>
            <asp:DropDownList  ID="dob_date" onmouseout="hideHelpFloatWindow('dob');" onmouseover="showHelpFloatWindow2('dob', this, 310, 20, false);" runat="server" Enabled="false">
            </asp:DropDownList>
            <asp:DropDownList ID="dob_month" onmouseout="hideHelpFloatWindow('dob');" onmouseover="showHelpFloatWindow2('dob', this, 310, 20, false);" runat="server" Width="60" Enabled ="false">
            <asp:ListItem >Jan</asp:ListItem>
            <asp:ListItem>Feb</asp:ListItem>
            <asp:ListItem >Mar</asp:ListItem>
            <asp:ListItem >Apr</asp:ListItem>
            <asp:ListItem >May</asp:ListItem>
            <asp:ListItem >Jun</asp:ListItem>
            <asp:ListItem >Jul</asp:ListItem>
            <asp:ListItem >Aug</asp:ListItem>
            <asp:ListItem >Sep</asp:ListItem>
            <asp:ListItem >Oct</asp:ListItem>
            <asp:ListItem >Nov</asp:ListItem>
            <asp:ListItem >Dec</asp:ListItem>
            
            
            </asp:DropDownList>
            
            <asp:DropDownList ID="dob_year" onmouseout="hideHelpFloatWindow('dob');" onmouseover="showHelpFloatWindow2('dob', this, 310, 20, false);" runat="server" Enabled="false">                       
            </asp:DropDownList>
            
             <asp:Image  Visible="false" ID="Image4" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />
                            
                             </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
                            
           
                         </td>               
             <td align="left" style="font-size:10px;width:150px">Birth Date</td>
            
            </tr>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;font-weight:bold">الجنس</td>
            <td>
                <asp:RadioButton GroupName="gender" Checked=true ID="radmale" Text="ذكر" runat="server" />
                <asp:RadioButton GroupName="gender" ID="radfemale" Text="أنثى" runat="server" />
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <b><asp:Label ID="lblPOB" Text="مكان الميلاد" runat="server"></asp:Label>
                        
            </b>
            </legend>
            </td>
           
            <td>
              <asp:UpdatePanel runat="server" id="pob_pnl">
            <ContentTemplate>
            
            <asp:TextBox ID="txtPOB" ToolTip="Enter te place of birth" CssClass="textback" Width="160px" runat="server" MaxLength="25"></asp:TextBox>
               </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            
            
            <td rowspan="6" colspan="2" style="vertical-align:top">                                    
            
            </td>
            
            </tr>
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
           <b>
            الحالة الاجتماعيـة
            </b>
            </legend>
            </td>
            
            <td>
            <asp:RadioButton ID="RadSingle" GroupName="Marital"  Checked="true" runat="server" Text="اعزب" />
            <asp:RadioButton ID="RadMarried"  GroupName="Marital"  runat="server" Text="متزوج" />
            
            </td>
             
            <td colspan="2" rowspan="4">            
             </td>
           
            </tr>
            
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
           <b>
            عـدد الاشخاص الذين تعولهم
           </b>
            </td>
            <td>
            <%--<span style="font-weight:bold"  class="VEKeyword"  poptext="">
            
            ?</span>--%>
            
            <asp:TextBox ID="txtChildCount"  onmouseout="hideHelpFloatWindow('pob');" onmouseover="showHelpPOB('pob', this, 310, 20, false);"
             CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server"
            TargetControlID="txtChildCount"
            Mask="9"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
        <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator3" runat="server"
            ControlExtender="MaskedEditExtender4"
            ControlToValidate="txtChildCount"
            IsValidEmpty="true"            
            ValidationGroup="Demo1"
            Display="Dynamic"
            />
            
            </td>
            </tr>
            
            <tr>
            <td id="idissueddt" style="font-family:Simplified Arabic;font-size: 12pt;"><b>
            <asp:Label ID="lblIssuedDate" runat="server" Text="تاريخ اصدار البطاقة"></asp:Label></b>
            </td>
            <td>
            
 <asp:UpdatePanel runat="server" id="idissued_date_pnl">
            <ContentTemplate>
          

            <asp:TextBox Visible="false" ID="txtIDIssuedDate" 
            
              CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            
            <asp:DropDownList ID="issue_dt_date" 
             runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="issue_dt_month" 
            runat="server" Width="60">
             <asp:ListItem >مُحَرَّم</asp:ListItem>
            <asp:ListItem>صَقَر</asp:ListItem>
            <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
            <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
            <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
            <asp:ListItem >جُمادى الثّاني</asp:ListItem>
            <asp:ListItem >رَجَب</asp:ListItem>
            <asp:ListItem >شَعْبانُ</asp:ListItem>
            <asp:ListItem >رَمَضانُ</asp:ListItem>
            <asp:ListItem >شَوّال</asp:ListItem>
            <asp:ListItem >ذُو القَعدة</asp:ListItem>
            <asp:ListItem >ذُو الحِجّة</asp:ListItem>
            </asp:DropDownList>
            
            <asp:DropDownList ID="issue_dt_year"  runat="server">
           <%-- <asp:ListItem Value="1405"></asp:ListItem>
            <asp:ListItem Value="1406"></asp:ListItem>
            <asp:ListItem Value="1407"></asp:ListItem>
            <asp:ListItem Value="1408"></asp:ListItem>
            <asp:ListItem Value="1409"></asp:ListItem>
            <asp:ListItem Value="1410"></asp:ListItem>
            <asp:ListItem Value="1411"></asp:ListItem>
            <asp:ListItem Value="1412"></asp:ListItem>
            <asp:ListItem Value="1413"></asp:ListItem>
            <asp:ListItem Value="1414"></asp:ListItem>
            <asp:ListItem Value="1415"></asp:ListItem>         --%>           
            
            </asp:DropDownList>
            
            <%--==============================================--%>
          
</ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            
            </tr>
            
            <tr>
            <td id="idexpdate" style="font-family:Simplified Arabic;font-size: 12pt;"><b><asp:Label ID="lblExpdate" Text="تاريخ الانتهاء" runat="server"></asp:Label></b>
            </td>
            <td>
            <%-- <span visible="false" style="font-weight:bold"  class="VEKeyword"  poptext="قم بتحديد تاريخ إنتهاء البطاقة وذلك بالضغط على الأيقونة التي على شكل جدول والموجودة بجوار  
الحقل المخصص لكتابة تاريخ إنتهاء البطاقة، يمكنك التنقل بين الأعوام والأشهر وذلك بالضغط على الأسهم  
الصغيرة الظاهرأمامك في نافذة التاريخ. كما أنه بالضغط على الشهر والسنة الموجودة في أعلى هذه  
النافذة فإنه سيتم عرض جميع الأشهر لتلك السنة وكذلك عندما تقوم بالضغط على السنة الظاهرة في أعلى  
نافذة المساعدة فإنه سيتم عرض قائمة بعدد من السنوات ومن خلال الأسهم الصغيرة الموجودة في هذه  
النافذة يمكنك تحديد السنة المناسبة. 
">?</span>--%>
            <asp:TextBox Visible="false" ID="txtIDExpDate"
             CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            
            
             <asp:Image ID="Image3" Visible="false" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />

             <asp:DropDownList ID="exp_date"  runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="exp_month"  runat="server" Width="60">
             <asp:ListItem >مُحَرَّم</asp:ListItem>
            <asp:ListItem>صَقَر</asp:ListItem>
            <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
            <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
            <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
            <asp:ListItem >جُمادى الثّاني</asp:ListItem>
            <asp:ListItem >رَجَب</asp:ListItem>
            <asp:ListItem >شَعْبانُ</asp:ListItem>
            <asp:ListItem >رَمَضانُ</asp:ListItem>
            <asp:ListItem >شَوّال</asp:ListItem>
            <asp:ListItem >ذُو القَعدة</asp:ListItem>
            <asp:ListItem >ذُو الحِجّة</asp:ListItem>
            </asp:DropDownList>
            
            <asp:DropDownList ID="exp_year" 
             runat="server">            
            
            </asp:DropDownList>
            
                            
            </td>
            </tr>
            
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;"><b>
            <asp:Label ID="lblIdIssuedPlace" runat="server" Text="مكان اصدار البطاقة"></asp:Label>
            </b>
            </td>
            <td>
            

            <asp:UpdatePanel runat="server" id="idissuedplace_pnl">
                <ContentTemplate>
                <asp:TextBox ID="txtidissuedplace"  Width="160px" runat="server" MaxLength ="50"></asp:TextBox>
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="lblValidateID"  />
                </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>        
            
            <ajaxToolkit:TabPanel ID="tab_3"  runat="server" HeaderText="العنوان">
            <ContentTemplate>
                  
                <table Width="745px"  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top; " runat="server" id="table3">
            <tr>
            <td >
                        
            <asp:LinkButton ID="lnk_Tab2" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_tab2')" onmouseover="showHelpStatusIndex('id_hlp_tab2', this,102, 50, false,2)"></asp:LinkButton>			    			   			    
            <div id="id_hlp_tab2" class="HelpWindow" >
            <iframe  frameborder="0" height="100%"
            src="hlp_Tab_Two.htm"></iframe>
            </div>            
            <ajax:RoundedArea ID="rndAdress" runat="server">
            <table>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;"><b>العنوان الدائم</b>
            </td>
            </tr>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblAddress_1_1" runat="server" Text="العنوان 1"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtAddress_1_1" ValidationGroup="Tab_3" runat="server" Width="160px" CssClass="textback" MaxLength="100"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblAddress_1_2" runat="server" Text="العنوان 2" ></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtAddress_1_2" runat="server" Width="160px" CssClass="textback" MaxLength="100"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblZip_1" runat="server" Text="الرمز البريدي"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtZip_1" runat="server" Width="160px" CssClass="textback" MaxLength="10"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender12" runat="server"
            TargetControlID="txtZip_1"
            Mask="99999"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblPostal_1" Text="صندوق البريد" runat="server"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtPostal_1" runat="server" Width="160px" CssClass="textback" MaxLength="10"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender13" runat="server"
            TargetControlID="txtPostal_1"
            Mask="99999"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblCity_1" runat="server" Text="المـديـنـة"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtCity_1" runat="server" Width="160px" CssClass="textback" MaxLength ="50"></asp:TextBox>
            </td>
            </tr>
            
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblAddressCountry_1" Text="الــدولـة" runat="server"></asp:Label>
            </td>
            <td dir=ltr >
            <asp:DropDownList Width="160px" ID="cmbCountry_1" runat="server"></asp:DropDownList>
            <asp:UpdatePanel runat="server" id="pnl_coutry_1">
            <ContentTemplate>
            

            <asp:Panel ID="DropPanel"  Direction=RightToLeft runat="server" CssClass="ContextMenuPanel" Style="display :none; visibility: hidden;">
            </asp:Panel>
          
            </ContentTemplate>
            </asp:UpdatePanel>
            
            </td>
            
            </tr>
           
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblStudentMobile" Text="الجــوال" runat="server"></asp:Label>
            
            </td>
            <td dir="ltr">
            <asp:UpdatePanel runat="server" id="UpdatePanel16">
            <ContentTemplate>                   
             <asp:TextBox ID="mobile_1_mask" Visible=false Text="05" ReadOnly="true"  Width="20px" runat="server"></asp:TextBox>
             <asp:TextBox ID="txtStudentMobile" runat="server" Width="160px" CssClass="textback" MaxLength=9></asp:TextBox>
                
          
                        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblHomePhone_1" Text="هاتف المنزل" runat="server"></asp:Label>
            </td>            
            <td dir="ltr" align="left">
            
            <asp:UpdatePanel ID="upl_home_phone" runat="server">
            <ContentTemplate>
                        
            <asp:DropDownList Width="40px" Visible=false ID="cmbAreaCode1" runat="server">
            <asp:ListItem>01</asp:ListItem>
            <asp:ListItem>02</asp:ListItem>
            <asp:ListItem>03</asp:ListItem>
            <asp:ListItem>04</asp:ListItem>
            <asp:ListItem>05</asp:ListItem>
            <asp:ListItem>06</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>            
            </asp:DropDownList><asp:TextBox ID="txtHomePhone" runat="server" Width="160px" CssClass="textback" MaxLength=7></asp:TextBox>                                  
                                  
            
          
            </ContentTemplate>                        
            </asp:UpdatePanel> 
            </td>
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;"><asp:Label ID="lblEmailAddress_2" Text="البريد الإكتروني" runat="server"></asp:Label></td>
            <td dir="ltr">
            <asp:UpdatePanel runat="server" id="upd_email">
            <ContentTemplate>
            <asp:TextBox ID="txtEmailAddress_2"  runat="server" Width="160px" CssClass="textback" MaxLength="40"></asp:TextBox>          
            
            
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>            
            </table>
            </ajax:RoundedArea>
            </td>
            <td >
           
 <asp:UpdatePanel runat="server" id="address_copy_pnl">
            <ContentTemplate>
            
            
                        <asp:Button ID="btnCopyAddress"  onmouseout="hideHelpFloatWindow('id_copy_paste');" onmouseover="showHelpIDCopyPaste('id_copy_paste', this, 310, 20, false);"
                        OnClick="CopyAddress" runat="server" CausesValidation="false" Text=">>" ToolTip="Click to copy the address" />
           </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>               
                   
            <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="address_copy_pnl" runat="server">
                <ProgressTemplate>
                <img src="Images/loading.gif" alt="" id="progress" />
                </ProgressTemplate>
            </asp:UpdateProgress>            
            </td>         
                        
            <td>
            <ajax:RoundedArea ID="RoundedArea4" runat="server">
            <table>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;"><b>العنوان الحالي</b>
            </td>
            
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblAddress_2_1" Text="العنوان 1" runat="server"></asp:Label>
            </td>
            <td>
            
            <asp:UpdatePanel runat="server" id="address_pnl">
            <ContentTemplate>

            <asp:TextBox ID="txtAddress_2_1" runat="server" Width="160px" CssClass="textback" MaxLength ="100"></asp:TextBox>

            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblAddress_2_2" runat="server" Text="العنوان 2"></asp:Label>
            </td>
            <td>
             <asp:UpdatePanel runat="server" id="address_pnl_2">
            <ContentTemplate>

            <asp:TextBox ID="txtAddress_2_2" runat="server" Width="160px" CssClass="textback" MaxLength="100"></asp:TextBox>
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblZip_2" runat="server" Text="الرمز البريدي"></asp:Label>
            </td>
            <td>
              <asp:UpdatePanel runat="server" id="address_zip_1">
            <ContentTemplate>

            <asp:TextBox ID="txtZip_2" runat="server" Width="160px" CssClass="textback" MaxLength="10"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender14" runat="server"
            TargetControlID="txtZip_2"
            Mask="99999" 
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Number"
            InputDirection="lefttoright"
            AcceptNegative="Left"
            />
            
             </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
            
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblPostal_2" runat="server" Text="صندوق البريد"></asp:Label>
            </td>
            <td>
             <asp:UpdatePanel runat="server" id="address_postal_1">
            <ContentTemplate>

            <asp:TextBox ID="txtPostal_2" runat="server" Width="160px" CssClass="textback" MaxLength="10"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender15" runat="server"
            TargetControlID="txtPostal_2"
            Mask="99999" 
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Number"
            InputDirection="lefttoright"
            AcceptNegative="Left"
            />
            
            
              </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
              <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblCity_2" Text="المـديـنـة" runat="server"></asp:Label>
            </td>
            <td>
             <asp:UpdatePanel runat="server" id="address_city_1">
            <ContentTemplate>

            <asp:TextBox ID="txtCity_2" runat="server" Width="160px" CssClass="textback" MaxLength="50"></asp:TextBox>
              </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblcmbCountry_2" Text="الــدولـة" runat="server"></asp:Label>
            </td>
            <td>
            <asp:UpdatePanel runat="server" id="counttry_pnl">
            <ContentTemplate>
            
            <asp:DropDownList Width="160px" ID="cmbCountry_2" runat="server">
            </asp:DropDownList>
             <asp:Panel ID="DropPanel_1"  Direction=RightToLeft runat="server" CssClass="ContextMenuPanel" Style="display :none; visibility: hidden;">
            </asp:Panel>
            
            
            
            </ContentTemplate>
            
            </asp:UpdatePanel>
            </td>
            </tr>
           
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lbl1" runat="server" Text="الجــوال"></asp:Label>
            </td>
            <td dir="ltr" >
            <asp:UpdatePanel runat="server" id="UpdatePanel17">
            <ContentTemplate>
             <asp:TextBox ID="TextBox1" Text="05" ReadOnly="true" Visible=false Width="20px" runat="server"></asp:TextBox>
             <asp:TextBox  ID="txtStudentMobile_2"   runat="server" Width="160px" CssClass="textback" MaxLength=9></asp:TextBox>
            
            
                        </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lbl2" runat="server"  Text="هاتف المنزل"></asp:Label>
 
            </td>
            <td dir="ltr" align="left">
            <asp:UpdatePanel runat="server" id="UpdatePanel18">
            <ContentTemplate>           
                        
            <asp:DropDownList Width="40px" Visible=false ID="cmbAreaCode2" runat="server">
            <asp:ListItem>01</asp:ListItem>
            <asp:ListItem>02</asp:ListItem>
            <asp:ListItem>03</asp:ListItem>
            <asp:ListItem>04</asp:ListItem>
            <asp:ListItem>05</asp:ListItem>
            <asp:ListItem>06</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>            
            </asp:DropDownList><asp:TextBox ID="txtHomeTelephone_2"   runat="server" Width="160px" CssClass="textback" MaxLength=7></asp:TextBox>
            
            
            
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
           
            </tr>
            
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblEmailAddress" runat="server" Text="البريد الإكتروني"></asp:Label>
            </td>
            <td dir ="ltr">
             <asp:UpdatePanel runat="server" id="UpdatePanel2">
            <ContentTemplate>
            <asp:TextBox ID="txtEMailAddress"   runat="server" Width="160px" CssClass="textback"></asp:TextBox>
                        </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
            </table>
           
            </ajax:RoundedArea>
            </td>
            </tr>
          
           
            <tr >
            
            <td >
            <ajax:RoundedArea ID="child_rel" runat="server">
            <table id="test123" runat="server">
            <tr>
            <td>
            <asp:Label ID="lblRelativeName" runat="server" Text="اسم شخص للاتصال<br />عليه عند الحاجه"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtRelativeName" runat="server" Width="145px" CssClass="textback" MaxLength="50"></asp:TextBox> 
            </td>
            </tr>
            <tr>
            <td> صلة القرابة</td>
            <td><asp:DropDownList Width="151px" ID="txtRelationship" runat="server">
            <asp:ListItem>جد</asp:ListItem>
            <asp:ListItem>أب</asp:ListItem>
            <asp:ListItem>عم</asp:ListItem>
            <asp:ListItem>خال</asp:ListItem>
            <asp:ListItem>أخ</asp:ListItem>
            <asp:ListItem>شخص آخر</asp:ListItem>
            </asp:DropDownList></td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="lblRelativeMobile_1" Text="الجــوال" runat="server"></asp:Label>
            </td>
            <td dir="ltr">
            <asp:TextBox ID="TextBox2" Text="05" ReadOnly="true" Visible=false Width="20px" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtRelativeMobile"  runat="server" Width="145px" CssClass="textback" MaxLength=9></asp:TextBox>
            
            </td>
            </tr>
            <tr>
            <td>
            <asp:Label ID="lblRelativeMobile" runat="server" Text="هاتف المنزل"></asp:Label>
            </td>
            <td dir="ltr">
           
            <asp:DropDownList Width="40px" Visible=false ID="cmbAreaCode3" runat="server">
            <asp:ListItem>01</asp:ListItem>
            <asp:ListItem>02</asp:ListItem>
            <asp:ListItem>03</asp:ListItem>
            <asp:ListItem>04</asp:ListItem>
            <asp:ListItem>05</asp:ListItem>
            <asp:ListItem>06</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>            
            </asp:DropDownList><asp:TextBox ID="txtRelativePhone"  runat="server" Width="145px" CssClass="textback" MaxLength=7></asp:TextBox>
            
           
            
            </td>
            </tr>
            </table>
                
            </ajax:RoundedArea>
            
            </td>
            <td>&nbsp;</td>
            <td>
            <ajax:RoundedArea ID="RoundedArea5" runat="server">
                <table id="Table9" runat="server">
            <tr>
            <td><asp:Label ID="lblRelativeName_2" runat="server" Text="اسم شخص آخر للاتصال عليه عند الحاجه"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtRelativeName_2" runat="server" Width="145px" CssClass="textback" MaxLength="50"></asp:TextBox> 
            </td>
            </tr>
            <tr>
            <td> صلة القرابة</td>
            <td><asp:DropDownList Width="151px"  ID="cmbRelationShip_2" runat="server">
            <asp:ListItem>جد</asp:ListItem>
            <asp:ListItem>أب</asp:ListItem>
            <asp:ListItem>عم</asp:ListItem>
            <asp:ListItem>خال</asp:ListItem>
            <asp:ListItem>أخ</asp:ListItem>
            <asp:ListItem>شخص آخر</asp:ListItem>
            </asp:DropDownList></td>
            </tr>
            <tr>
            <td><asp:Label ID="lblRelativeMobile_2" runat="server" Text="الجــوال"></asp:Label></td>
            <td dir="ltr"><asp:TextBox ID="TextBox3" Text="05" Visible=false ReadOnly="true"  Width="20px" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtRelativeMobile_2"  runat="server" Width="145px" CssClass="textback" MaxLength=9></asp:TextBox>
           
            </td>
            </tr>
            <tr>
            <td><asp:Label ID="lblRelativePhone_2" runat="server" Text="هاتف المنزل"></asp:Label></td>
            <td dir="ltr">
            
            <asp:DropDownList Visible=false Width="40px" ID="cmbAreaCode4" runat="server">
            <asp:ListItem>01</asp:ListItem>
            <asp:ListItem>02</asp:ListItem>
            <asp:ListItem>03</asp:ListItem>
            <asp:ListItem>04</asp:ListItem>
            <asp:ListItem>05</asp:ListItem>
            <asp:ListItem>06</asp:ListItem>
            <asp:ListItem>07</asp:ListItem>            
            </asp:DropDownList><asp:TextBox ID="txtRelativePhone_2"  runat="server" Width="145px" CssClass="textback" MaxLength=7></asp:TextBox>            
            
           
            </td>
            </tr>
            </table>
            </ajax:RoundedArea>
            </td>
          
            </tr>
           
            
            
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>        
            
            <ajaxToolkit:TabPanel ID="tab_4" runat="server" HeaderText="بيانات الدراسة">
            <ContentTemplate>
                <table Width="745px"  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table4">
             <tr>           
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><asp:LinkButton ID="lnkSchoolGPA" runat="server" 
             CausesValidation="False" Visible="false" Text="Validate" ></asp:LinkButton><b>             
            <asp:LinkButton ID="lnk_Tab_Three" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_tab3')" onmouseover="showHelpStatusIndex('id_hlp_tab3', this,102, 50, false,3)"></asp:LinkButton>			    			   			    
            <div id="id_hlp_tab3" class="HelpWindow" >
            <iframe  frameborder="0" height="100%"
            src="hlp_Tab_Three.htm"></iframe>
            </div>
            <br />
                
             <asp:Label ID="lblSchoolName" Text="اســـم الجـامعة" runat="server"></asp:Label>
             </b></td>
            <td dir="rtl" align="right" style="font-family:Simplified Arabic;font-size: 12pt;">

            <asp:UpdatePanel runat="server" id="school_name_pnl">
            <ContentTemplate>
            <br />            
            <asp:TextBox ID="cmbSchoolName" ValidationGroup="Tab_4" runat="server" Width="160px" CssClass="textback" MaxLength="50"></asp:TextBox>            
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            <td>
            &nbsp;
            </td>
            <td>&nbsp;
              
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
            
            <asp:Label ID="lblSchoolCity" Text="المـديـنـة" runat="server"></asp:Label>
            </b>
            </td>
            
            <td>            
            <asp:TextBox ID="txtSchoolCountryCity" runat="server"  ValidationGroup="Tab_4" Width="160px" CssClass="textback" MaxLength="50"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>

            </tr>
             <tr>
             
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
             <asp:Label ID="lblSchoolCountry" Text="الــدولـة" runat="server"></asp:Label>
             </b>
             </td>
             <td dir=rtl>
             
             <asp:UpdatePanel ID="upd_school_country" runat="server">
             <ContentTemplate>
             <asp:DropDownList Width="162px"  ID="cmb_12" runat="server"></asp:DropDownList>
             <asp:TextBox Width="160px" Visible="false" ID="cmbSchoolCountry" runat="server" MaxLength="50"></asp:TextBox>
             
              <asp:Panel ID="DropPanel_3"  Direction=RightToLeft runat="server" CssClass="ContextMenuPanel" Style="display :none; visibility: hidden;">
                <asp:LinkButton runat="server" ID="LinkButton6" Text="المملكه العربيه السعودية" CssClass="ContextMenuItem" OnClick="OnSelect_3" />
                <asp:LinkButton runat="server" ID="LinkButton7" Text="الكويت" CssClass="ContextMenuItem" OnClick="OnSelect_3" />
                <asp:LinkButton runat="server" ID="LinkButton8" Text="عمان" CssClass="ContextMenuItem" OnClick="OnSelect_3" />        
                <asp:LinkButton runat="server" ID="LinkButton9" Text="الإمارات العربيه المتحدة" CssClass="ContextMenuItem" OnClick="OnSelect_3" />        
                <asp:LinkButton runat="server" ID="LinkButton10" Text="البحرين" CssClass="ContextMenuItem" OnClick="OnSelect_3" />        
            </asp:Panel>
             <ajaxToolkit:DropDownExtender   runat="server" ID="DropDownExtender1"
            TargetControlID="cmbSchoolCountry"
            DropDownControlID="DropPanel_3" />         
            </ContentTemplate>
            <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="LinkButton6" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="LinkButton7" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="LinkButton8" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="LinkButton9" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="LinkButton10" EventName="Click" />
                </Triggers>
             </asp:UpdatePanel>
             </td>
             </tr>    
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
                تاريخ تخرجــك من الجـامعـة</b>
             </td>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
             <asp:DropDownList ID="txtSchoolGraduationDt" Width="162px"   ValidationGroup="Tab_4" runat="server">
               
             </asp:DropDownList>
             <asp:TextBox Enabled="false" ID="txtSchoolGraduationDt_1" Visible="False" ValidationGroup="Tab_4" runat="server" Width="160px" ReadOnly="false" CssClass="textback"></asp:TextBox>
             
             </td>
             <td>
             </td>
             <td>
             
           
             </td>
             </tr>
            
            <tr>
            <td><asp:Label ID="lblGraduationDuration" Font-Names="Simplified Arabic" Font-Size=12 Font-Bold=true runat="server" Text="مدة الحصول على الشهادة"></asp:Label> </td>
            <td>
                <asp:TextBox ID="txtGraduationDuration" Width="160px" runat="server"></asp:TextBox>
                <ajaxToolkit:MaskedEditExtender ID="txtGraduationDurationMask" runat="server"
            TargetControlID="txtGraduationDuration"
            Mask="9"            
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="number"/>
            </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="lblMajor" Text="التخصص في درجة البكالوريوس" Font-Names="Simplified Arabic" Font-Size=12 Font-Bold=true runat="server"></asp:Label>
                
                </td>
                <td>
                    <asp:DropDownList Width="160px" ID="cmbBachelorMajor" runat=server>
                        <asp:ListItem>طب</asp:ListItem>
                        <asp:ListItem>طب الأسنان</asp:ListItem>
                        <asp:ListItem>صيدلة</asp:ListItem>
                        <asp:ListItem>علوم طبية تطبيقية</asp:ListItem>
                        <asp:ListItem>أكاديمي</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
            </tr>
            
             <tr>
             <td  align="right" style="font-family:Simplified Arabic;font-size: 12pt;">
               <b> المعـدل التـراكمي
                </b>
             </td>
             <td>
              <table width="300px"  id="Table5" border="1" runat="server">               
                 <tr>             
             <td style="text-align:center">
                <asp:Label ID="lblChoice" runat=server Text="الإختيار"></asp:Label>
             </td>
             <td  style="text-align:center" colspan=2 >
             <asp:Label ID="lblActualMarks" runat="server" Text="الدرجة الفعلية"></asp:Label>
             </td>
             </tr>
              
            <tr>
                <td id="cell_validate" colspan="3">
                    <asp:UpdatePanel ID="upd_pnl_ma" runat="server">
                    <ContentTemplate>
                    <asp:DropDownList ID="cmbPercentage" OnSelectedIndexChanged="validatecalculationparams" 
                    AutoPostBack=true runat="server">
                    <asp:ListItem Text=""></asp:ListItem>
                        <asp:ListItem Value="100" Text="out of 100%"></asp:ListItem>
                        <asp:ListItem Value="5" Text="out of 5"></asp:ListItem>
                        <asp:ListItem Value="4" Text="out of 4"></asp:ListItem>
                    </asp:DropDownList>
                    
                    <asp:Label id="lblMarks" ForeColor=red runat=server Visible="false"></asp:Label>
                    <asp:TextBox ID="txtAcualMarks" Enabled=false Width="50px" runat="server"></asp:TextBox>
                 
                      <asp:RangeValidator ID="rngMarks"  runat="server" ControlToValidate="txtAcualMarks" ErrorMessage="Invalid"></asp:RangeValidator>
                    <asp:Button ID="btnPercentageCalculate"  OnClick="CalculateGrade" runat="server" Text="..." />
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    <asp:UpdateProgress ID="prg_marks" runat="server" AssociatedUpdatePanelID="upd_pnl_ma" >
                    <ProgressTemplate>                    
                        <asp:Image ID="imgMarks" runat="server" ImageUrl="~/Images/loading.gif" />
                    </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                
            </tr> 
            
             </table>
             </td>
             </tr>             
             
             </tr>
            </table>
            <table id="grade_table" runat="server">
            <tr>
              
             <td  dir="rtl" colspan="3">
             
             <asp:UpdatePanel ID="cal" runat="server">
                            <ContentTemplate> 

             <asp:Table   CellSpacing="1"   GridLines="Both" CellPadding="1" BorderWidth="1" runat="server" BorderStyle="Groove" ID="grade">
             <asp:TableRow id="APLUS" >
             <asp:TableCell VerticalAlign="top" Font-Size="10px"  HorizontalAlign="center" Text="English Meaning"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center" Text="المعنى بالعربي"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" Width="70px" HorizontalAlign="center" Text="Points<br>(Out of 5)"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" Width="70px" HorizontalAlign="center" Text="Points<br>(Out of 4)"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center" Text="Score Range"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center" >English Grade Score </asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center">Arabic Grade Score </asp:TableCell>
             </asp:TableRow>
             <asp:TableRow>
             <asp:TableCell Font-Size="10px"  HorizontalAlign="center" >Excellent Plus</asp:TableCell>
             <asp:TableCell Font-Size="10px">ممتاز مرتفع</asp:TableCell>
             <asp:TableCell Font-Size="10px">5.00</asp:TableCell>
             <asp:TableCell Font-Size="10px">4.00</asp:TableCell>
             <asp:TableCell  dir="ltr" align="center" Font-Size="10px">95-100</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">+A</asp:TableCell>
             <asp:TableCell Font-Size="10px">أ+</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="A">
             <asp:TableCell  Font-Size="10px" HorizontalAlign="center" >Excellent</asp:TableCell>
             <asp:TableCell Font-Size="10px">ممتاز</asp:TableCell>
             <asp:TableCell Font-Size="10px">4.75</asp:TableCell>
             <asp:TableCell Font-Size="10px">3.75</asp:TableCell>
             <asp:TableCell dir="ltr" Font-Size="10px" align="center" >90-<95</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">A</asp:TableCell>
             <asp:TableCell Font-Size="10px">أ</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="BPLUS">
             <asp:TableCell  Font-Size="10px" HorizontalAlign="center">Very Good Plus</asp:TableCell>
             <asp:TableCell Font-Size="10px">جيدجداً مرتفع</asp:TableCell>
             <asp:TableCell Font-Size="10px">4.50</asp:TableCell>
             <asp:TableCell Font-Size="10px">3.50</asp:TableCell>
             <asp:TableCell Font-Size="10px" dir="ltr" align="center">85-<90</asp:TableCell>
             <asp:TableCell  HorizontalAlign="center">+B</asp:TableCell>
             <asp:TableCell Font-Size="10px">ب+</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="B">
             <asp:TableCell  Font-Size="10px" HorizontalAlign="center">Very Good</asp:TableCell>
             <asp:TableCell Font-Size="10px">جيدجداً</asp:TableCell>
             <asp:TableCell Font-Size="10px">4.00</asp:TableCell>
             <asp:TableCell Font-Size="10px">3.00</asp:TableCell>
             <asp:TableCell Font-Size="10px" dir="ltr" align="center">80-<85</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">B</asp:TableCell>
             <asp:TableCell Font-Size="10px">ب</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="CPLUS">
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">Good Plus</asp:TableCell>
             <asp:TableCell Font-Size="10px">جيد مرتفع</asp:TableCell>
             <asp:TableCell Font-Size="10px">3.50</asp:TableCell>
             <asp:TableCell Font-Size="10px">2.50</asp:TableCell>
             <asp:TableCell Font-Size="10px"  dir="ltr" align="center">75-<80</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">+C</asp:TableCell>
             <asp:TableCell Font-Size="10px">ج+</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="C">
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">Good</asp:TableCell>
             <asp:TableCell Font-Size="10px">جيد</asp:TableCell>
             <asp:TableCell Font-Size="10px">3.00</asp:TableCell>
             <asp:TableCell Font-Size="10px">2.00</asp:TableCell>
             <asp:TableCell Font-Size="10px" dir="ltr" align="center">70-<75</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">C</asp:TableCell>
             <asp:TableCell Font-Size="10px">ج</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="DPLUS">
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">High Pass</asp:TableCell>
             <asp:TableCell Font-Size="10px">مقبول مرتفع</asp:TableCell>
             <asp:TableCell Font-Size="10px">2.50</asp:TableCell>
             <asp:TableCell Font-Size="10px">1.50</asp:TableCell>
             <asp:TableCell Font-Size="10px" dir="ltr" align="center">65-<70</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">+D</asp:TableCell>
             <asp:TableCell>د+</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="D">
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">Pass</asp:TableCell>
             <asp:TableCell Font-Size="10px">مقبول</asp:TableCell>
             <asp:TableCell Font-Size="10px">2.00</asp:TableCell>
             <asp:TableCell Font-Size="10px">1.00</asp:TableCell>
             
             <asp:TableCell Font-Size="10px" dir="ltr" align="center">60-<65</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">D</asp:TableCell>
             <asp:TableCell Font-Size="10px">د</asp:TableCell>
             </asp:TableRow>
             
             <asp:TableRow ID="fail">
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">Fail</asp:TableCell>
             <asp:TableCell Font-Size="10px">راسب</asp:TableCell>
             <asp:TableCell Font-Size="10px">1.00</asp:TableCell>
             <asp:TableCell Font-Size="10px">0.00</asp:TableCell>
             <asp:TableCell Font-Size="10px" dir="ltr" align="center"><60</asp:TableCell>
             <asp:TableCell Font-Size="10px" HorizontalAlign="center">F</asp:TableCell>
             <asp:TableCell>&nbsp;</asp:TableCell>
             </asp:TableRow>
             
             </asp:Table>
               </ContentTemplate>
               </asp:UpdatePanel>
             </td>
             </tr>
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>        
                       
        
           <ajaxToolkit:TabPanel   HeaderText="الدراسات العليا" id="post_graduation" runat="server">
            <ContentTemplate>
            <asp:UpdatePanel ID="addrowspnl" runat="server">
            <ContentTemplate>
             <asp:SqlDataSource  
            ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:RegistrationMedicalEducationConnectionString %>">
            </asp:SqlDataSource>
            <asp:Table ID="table_degree" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>نوع الشهادة</asp:TableHeaderCell>
                    <asp:TableHeaderCell>مسمى الشهادة</asp:TableHeaderCell>
                    <asp:TableHeaderCell>إسم الجامعة</asp:TableHeaderCell>
                    <asp:TableHeaderCell>مدة الدراسة</asp:TableHeaderCell>
                    <asp:TableHeaderCell>تاريخ الصحول عليها</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow ToolTip="1" >
                    <asp:TableCell>  
                    <asp:DropDownList ID="dmbProgramType1" runat="server">
                                <asp:ListItem Selected=True>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtCertName" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni1" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                        <ajaxToolkit:MaskedEditExtender ID="txtCertDuration1_Mask" runat="server"
                        TargetControlID="txtCertDuration1"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
            
                     <asp:TextBox ID="txtCertDuration1" Width="20px" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                        <asp:DropDownList ID="cmbday1" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmdMonth1"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbyear1"
                             runat="server" Width="60" >
                                
                        </asp:DropDownList>
                     </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ToolTip="2" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType2" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem Selected=True>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertName2" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni2" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration2" Width="20px" runat="server"></asp:TextBox>
                       <ajaxToolkit:MaskedEditExtender ID="txtCertDuration2_mask" runat="server"
                        TargetControlID="txtCertDuration2"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
            
                    
                    </asp:TableCell>
                    
                    <asp:TableCell>
                        <asp:DropDownList ID="cmbDay2" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth2"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear2"
                             runat="server" Width="60" >
                               
                        </asp:DropDownList>
                     </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow ToolTip="3" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType3" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem Selected=True>Diploma</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertName3" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni3" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration3" Width="20px" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    
                     <asp:TableCell>
                        <asp:DropDownList ID="cmbDay3" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth3"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear3"
                             runat="server" Width="60" >
                              
                        </asp:DropDownList>
                     </asp:TableCell>
                     
                </asp:TableRow>
                
                <asp:TableRow ToolTip="4" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType4" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem Selected=True>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertName4" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni4" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration4" Width="20px" runat="server"></asp:TextBox>
                    
                       <ajaxToolkit:MaskedEditExtender ID="txtCertDuration4_mask" runat="server"
                        TargetControlID="txtCertDuration4"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
                        
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:DropDownList ID="cmbday4" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth4"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear4"
                             runat="server" Width="60" >
                               
                        </asp:DropDownList>
                     </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow ToolTip="5" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType5" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem Selected=True>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertNam5" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni5" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration5" Width="20px" runat="server"></asp:TextBox>
                    
                     <ajaxToolkit:MaskedEditExtender ID="txtCertDuration5_mask" runat="server"
                        TargetControlID="txtCertDuration5"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
                    </asp:TableCell>
                    
                    
                      <asp:TableCell>
                        <asp:DropDownList ID="cmbDay5" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth5"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear5"
                             runat="server" Width="60" >
                               <%-- <asp:ListItem>2007</asp:ListItem><asp:ListItem>2006</asp:ListItem><asp:ListItem>2005</asp:ListItem>
                                <asp:ListItem>2004</asp:ListItem><asp:ListItem>2003</asp:ListItem><asp:ListItem>2002</asp:ListItem>
                                <asp:ListItem>2001</asp:ListItem><asp:ListItem>2000</asp:ListItem>--%>
                        </asp:DropDownList>
                     </asp:TableCell>
                     
                </asp:TableRow>
                
                
                 <asp:TableRow ToolTip="6" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType6" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem Selected=True>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertName6" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni6" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration6" Width="20px" runat="server"></asp:TextBox>
                    
                     <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
                        TargetControlID="txtCertDuration6"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
                    </asp:TableCell>
                    
                    
                      <asp:TableCell>
                        <asp:DropDownList ID="cmbDay6" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth6"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear6"
                             runat="server" Width="60" >                               
                        </asp:DropDownList>
                     </asp:TableCell>
                     
                </asp:TableRow>
                
                 <asp:TableRow ToolTip="7" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType7" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem Selected=True>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertName7" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni7" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration7" Width="20px" runat="server"></asp:TextBox>
                    
                     <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
                        TargetControlID="txtCertDuration7"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
                    </asp:TableCell>
                    
                    
                      <asp:TableCell>
                        <asp:DropDownList ID="cmbDay7" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth7"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear7"
                             runat="server" Width="60" >                               
                        </asp:DropDownList>
                     </asp:TableCell>
                     
                </asp:TableRow>
                
                 <asp:TableRow ToolTip="8" Visible=true>
                    <asp:TableCell>
                        <asp:DropDownList ID="dmbProgramType8" runat="server">
                                  <asp:ListItem>Master</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                                <asp:ListItem>Diploma</asp:ListItem>
                                <asp:ListItem Selected=True>Other</asp:ListItem>
                            </asp:DropDownList></asp:TableCell>
                            <asp:TableCell>
                        <asp:TextBox ID="txtCertName8" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtUni8" runat="server"></asp:TextBox>
                     </asp:TableCell>
                     
                     <asp:TableCell>
                    <asp:TextBox ID="txtCertDuration8" Width="20px" runat="server"></asp:TextBox>
                    
                     <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
                        TargetControlID="txtCertDuration8"
                        Mask="9"            
                        MessageValidatorTip="true"
                        OnFocusCssClass="MaskedEditFocus"
                        OnInvalidCssClass="MaskedEditError"
                        MaskType="number"/>
                    </asp:TableCell>
                    
                    
                      <asp:TableCell>
                        <asp:DropDownList ID="cmbDay8" runat="server">
                                <asp:ListItem>1</asp:ListItem><asp:ListItem>2</asp:ListItem><asp:ListItem>3</asp:ListItem><asp:ListItem>4</asp:ListItem><asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem><asp:ListItem>7</asp:ListItem><asp:ListItem>8</asp:ListItem><asp:ListItem>9</asp:ListItem><asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem><asp:ListItem>12</asp:ListItem><asp:ListItem>13</asp:ListItem><asp:ListItem>14</asp:ListItem><asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem><asp:ListItem>17</asp:ListItem><asp:ListItem>18</asp:ListItem><asp:ListItem>19</asp:ListItem><asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem><asp:ListItem>22</asp:ListItem><asp:ListItem>23</asp:ListItem><asp:ListItem>24</asp:ListItem><asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem><asp:ListItem>27</asp:ListItem><asp:ListItem>28</asp:ListItem><asp:ListItem>29</asp:ListItem><asp:ListItem>30</asp:ListItem>
                                
                            </asp:DropDownList>
                            <asp:DropDownList ID="cmbMonth8"
                             runat="server" Width="60" >
                                <asp:ListItem >مُحَرَّم</asp:ListItem>
                                <asp:ListItem>صَقَر</asp:ListItem>
                                <asp:ListItem >رّبِيعُ الأوَّل</asp:ListItem>
                                <asp:ListItem >رَبيعُ الثّاني</asp:ListItem>
                                <asp:ListItem >جُمادى الأوَّل</asp:ListItem>
                                <asp:ListItem >جُمادى الثّاني</asp:ListItem>
                                <asp:ListItem >رَجَب</asp:ListItem>
                                <asp:ListItem >شَعْبانُ</asp:ListItem>
                                <asp:ListItem >رَمَضانُ</asp:ListItem>
                                <asp:ListItem >شَوّال</asp:ListItem>
                                <asp:ListItem >ذُو القَعدة</asp:ListItem>
                                <asp:ListItem >ذُو الحِجّة</asp:ListItem>
                        </asp:DropDownList>
                       
                       <asp:DropDownList ID="cmbYear8"
                             runat="server" Width="60" >                               
                        </asp:DropDownList>
                     </asp:TableCell>
                     
                </asp:TableRow>
                
            </asp:Table>
                
                <asp:Table ID="tb_runtime"  runat="server" BorderStyle=Inset BorderWidth=1 CellPadding=1 Width="100%">
               
            
            </asp:Table>
            <asp:Button ID="btnAddRow" Visible=false Text="إضـافة" runat="server" OnClick="AddNewRow" />
            </ContentTemplate>
            </asp:UpdatePanel>
            
            <br />
            الدرجات العلمية التي تم الحصول عليها<br />
          <table  width="100%" dir=ltr runat="server" id="tb_degrees">
          
            <tr>
                <td dir=ltr>
                    <igtbl:UltraWebGrid Visible="false"  ID="grd_Post" runat="server"  CaptionAlign=Right DisplayLayout-TableLayout=Fixed Height="200px"
                                Style="left: 168px; top: 508px" Width="50%" StyleSetName="Office2007Silver" >
                                <Bands>
                                    <igtbl:UltraGridBand>
                                        <RowEditTemplate>
                                            <p align="center">
                                                <input id="igtbl_TextBox_0_0" columnkey="" width="25px" type="text" /><br />                                               
                                                <input id="Text1" columnkey="" width="25px" type="text" />
                                                
                                            </p>
                                            <br />
                                           
                                        </RowEditTemplate>
                                        <AddNewRow  View="NotSet"  Visible="NotSet">
                                        </AddNewRow>
                                        <Columns>
                                            
                                            <igtbl:UltraGridColumn Type="DropDownList" AllowResize=Fixed    >
                                            <ValueList>
                                                <ValueListItems>
                                                    <igtbl:ValueListItem DisplayText="Master" Key="1" DataValue="1" />
                                                    <igtbl:ValueListItem DisplayText="PHD" Key="2" DataValue="2" />
                                                    <igtbl:ValueListItem DisplayText="Deploma" Key="3" DataValue="3" />
                                                    <igtbl:ValueListItem DisplayText="Other" Key="4" DataValue="4" />
                                                </ValueListItems>
                                            </ValueList>
                                            <Header Caption="نوع الشهادة"></Header>
                                            </igtbl:UltraGridColumn>
                                            
                                            <igtbl:UltraGridColumn  >
                                                <Header Caption="مسمى الشهادة"></Header>
                                            </igtbl:UltraGridColumn>
                                            
                                            <igtbl:UltraGridColumn DataType=numeric  Width="100px" >
                                                <Header Caption="مدة الدراسة"></Header>
                                                
                                            </igtbl:UltraGridColumn>
                                            <igtbl:UltraGridColumn    >
                                                <Header Caption="إسم الجامعة"></Header>
                                            </igtbl:UltraGridColumn>
                                            
                                             <igtbl:UltraGridColumn Type="DropDownList"   >
                                                <Header Caption="تاريخ الصحول عليها"></Header>
                                                
                                                
                                            </igtbl:UltraGridColumn>

                                        </Columns>
                                        <RowTemplateStyle BackColor="Window" BorderColor="Window" BorderStyle="Ridge">
                                            <BorderDetails WidthBottom="3px" WidthLeft="3px" WidthRight="3px" WidthTop="3px" />
                                        </RowTemplateStyle>
                                    </igtbl:UltraGridBand>
                                </Bands>
                                <DisplayLayout AllowAddNewDefault="Yes" AllowColSizingDefault="Free" AllowColumnMovingDefault="OnServer"
                                    AllowDeleteDefault="Yes" AllowSortingDefault="OnClient" AllowUpdateDefault="Yes"
                                    BorderCollapseDefault="Separate" HeaderClickActionDefault="SortMulti" Name="UltraWebGrid1"
                                    RowHeightDefault="20px" RowSelectorsDefault="No" SelectTypeRowDefault="Extended"
                                    StationaryMargins="Header" StationaryMarginsOutlookGroupBy="True" TableLayout="Fixed"
                                    Version="4.00" ViewType="Hierarchical">
                                    <GroupByBox>
                                        <BoxStyle BackColor="ActiveBorder" BorderColor="Window">
                                        </BoxStyle>
                                    </GroupByBox>
                                    <GroupByRowStyleDefault BackColor="Control" BorderColor="Window">
                                    </GroupByRowStyleDefault>
                                    <ActivationObject BorderColor="" BorderWidth="">
                                    </ActivationObject>
                                    <FooterStyleDefault BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                                    </FooterStyleDefault>
                                    <RowStyleDefault BackColor="Window" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"
                                        Font-Names="Microsoft Sans Serif" Font-Size="8.25pt">
                                        <BorderDetails ColorLeft="Window" ColorTop="Window" />
                                        <Padding Left="3px" />
                                    </RowStyleDefault>
                                    <FilterOptionsDefault>
                                        <FilterOperandDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid"
                                            BorderWidth="1px" CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                                            Font-Size="11px">
                                            <Padding Left="2px" />
                                        </FilterOperandDropDownStyle>
                                        <FilterHighlightRowStyle BackColor="#151C55" ForeColor="White">
                                        </FilterHighlightRowStyle>
                                        <FilterDropDownStyle BackColor="White" BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"
                                            CustomRules="overflow:auto;" Font-Names="Verdana,Arial,Helvetica,sans-serif"
                                            Font-Size="11px" Height="300px" Width="200px">
                                            <Padding Left="2px" />
                                        </FilterDropDownStyle>
                                    </FilterOptionsDefault>
                                    <HeaderStyleDefault BackColor="LightGray" BorderStyle="Solid" HorizontalAlign="Left">
                                        <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                                    </HeaderStyleDefault>
                                    <EditCellStyleDefault  Font-Bold=true BorderStyle="None" BorderWidth="0px">
                                    </EditCellStyleDefault>
                                    <FrameStyle BackColor="Window" BorderColor="InactiveCaption" BorderStyle="Solid"
                                        BorderWidth="1px" Font-Names="Microsoft Sans Serif" Font-Size="8.25pt" Height="200px"
                                        Width="100%">
                                    </FrameStyle>
                                    <Pager MinimumPagesForDisplay="2">
                                        <PagerStyle BackColor="LightGray" BorderStyle="Solid" BorderWidth="1px">
                                            <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                                        </PagerStyle>
                                    </Pager>
                                    <AddNewBox Hidden="False">
                                        <BoxStyle BackColor="Window" BorderColor="InactiveCaption" BorderStyle="Solid" BorderWidth="1px">
                                            <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" WidthTop="1px" />
                                        </BoxStyle>
                                    </AddNewBox>
                                </DisplayLayout>
                            </igtbl:UltraWebGrid>   
                </td>
            </tr>
          </table>
            
             
            </ContentTemplate>
           </ajaxToolkit:TabPanel>
        
            <ajaxToolkit:TabPanel HeaderText="تحميل المستندات" ID="tab_7" runat="server">
                <ContentTemplate>
                <asp:UpdatePanel ID="file_upd_pnl" runat="server">
                    <ContentTemplate>
                    <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table8">
             <tr>
             <td colspan="4" style="font-family:Simplified Arabic;font-size: 12pt;">             
            <asp:LinkButton ID="lnk_tab5" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_tab5')" onmouseover="showHelpStatusIndex('id_hlp_tab5', this,100, 50, false,5)"></asp:LinkButton>			    			   			    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            
            <font color=red> <asp:Label ID="lblUploadErr" runat="server" Visible="false" Text="File Size must be less then 1mb"></asp:Label> </font>
            <div id="id_hlp_tab5" class="HelpWindow" >
            <iframe  frameborder="0" height="100%"
            src="hlp_Tab_Five.htm"></iframe>
            </div>            
             <br />
              <b>
                            بإمكانك تحميل صور مستنداتك من خلال هذه الصفحة.
                        وذلك بالضغط غلى زر إستعراض وتحديد مكان المستندات المراد تحمليها من على جهازك 
                        ومن ثم الضغط على زر تحميل الملفات المختارة.
                        <br />
                        <br />
                        إذا كان لديك مستندات أخرى تريد تحميلها قم بإتباع نفس الخطوة السابقة في طريقة تحميل الملفات.
                        مع ملاحظة أنه ربما يتم طلب الشهادات والوثائق
                        الرسمية منك لاحقاً وذلك بغرض المطابقة والتأكد منها.                        
                        <br />
                        
                        ملاحظة: الرجاء إستخدام الملفات ذات الإمتداد jpg. فقط
                        </b>
                        
                        </td>  
             </tr>
             <tr>
             <td colspan="3">
              <hr />
             </td>
             </tr>
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
            
              <b>نوع الوثيقة</b></td>
              <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>الوثيقة</b>
              </td>
              
              <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>ملاحظات</b></td>
             </tr>
             <tr>
             
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>الصورة الشخصية</b>
             <td  >  
                                <asp:TextBox Width="180px" id="FilePath_1"  ReadOnly="true" runat="server"></asp:TextBox>
                                <asp:ImageButton ID="btn_1" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                                &nbsp;
                                <asp:ImageButton ID="btnDelFile1" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                                <asp:Label ID="lblFileID1" runat="server" Text="" Visible="false"></asp:Label> 							    
								</td>
                                <td >
                                    <asp:TextBox ID="txtFilePath_1" runat="server" ></asp:TextBox></td>
               
				
             </td>
             </tr>             
             <tr>              
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>البطاقة الشخصية</b>
                             
				</td>
								<td >
								    <asp:TextBox Width="180px" id="FilePath_2" ReadOnly="true" runat="server"></asp:TextBox>
                                    <asp:ImageButton ID="btn_2" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" /> 
                                    &nbsp;
                                    <asp:ImageButton ID="btnDelFile2" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                                    <asp:Label ID="lblFileID2" runat="server" Text="" Visible="false"></asp:Label> 							    
                                
									
								</td>
                                <td >
                                    <asp:TextBox ID="txtFilePath_2"  runat="server" ></asp:TextBox></td>
							</tr>
							
							<tr>
                                
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>شهادة الجامعة</b>
                               
				</td>
								<td >
								 <asp:TextBox Width="180px" id="FilePath_3" ReadOnly="true" runat="server"></asp:TextBox>
                                    <asp:ImageButton ID="btn_3" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" /> 
                                    &nbsp;
                                    <asp:ImageButton ID="btnDelFile3" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                                    <asp:Label ID="lblFileID3" runat="server" Text="" Visible="false"></asp:Label> 							                                        
									
								</td>
                                <td >
                                    <asp:TextBox ID="txtFilePath_3" runat="server" ></asp:TextBox></td>
							</tr>	
<%--							<tr>                               
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>شهادة البكالوريوس</b>
				</td>
								<td >
								 <asp:TextBox Width="180px" id="FilePath_4" ReadOnly="true" runat="server"></asp:TextBox>
                                    <asp:ImageButton ID="btn_4" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                                    &nbsp;
                                    <asp:ImageButton ID="btnDelFile4" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                                    <asp:Label ID="lblFileID4" runat="server" Text="" Visible="false"></asp:Label> 							                                                                            									
								</td>>
                                <td >
                                    <asp:TextBox ID="txtFilePath_4" runat="server" ></asp:TextBox></td>
							</tr>
--%>						
							
							<tr>
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
						    كشف الدرجات </b>
							</td>
							<td>
							<asp:TextBox Width="180px" id="FilePath_5" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btn_5" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="btnDelFile5" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="lblFileID5" runat="server" Text="" Visible="false"></asp:Label> 							                                        
                                    
							    <%--<input class="textback" type="file" id="UploadAptitude" runat="server"  />--%>
							</td>
							<td >
                                    <asp:TextBox ID="txtFilePath_5" runat="server" ></asp:TextBox></td>
							<td>
							
							</td>
							</tr>
							
						
							
							<tr>
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>السيرة الذاتية</b></td>
							
							 <td >
							 <asp:TextBox Width="180px" id="FilePath_7" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btn_7" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="btnDelFile7" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="lblFileID7" runat="server" Text="" Visible="false"></asp:Label> 							                                        
                                    <%--<input class="textback" type="file" id="File2" runat="server"  />--%></td>
                                <td>
                                    <asp:TextBox ID="txtFilePath_7" runat="server" ></asp:TextBox></td>
                                    
							</tr>
							<tr>
							<td><b>أخرى</b>
							
							</td>
							<td> 
							 <asp:TextBox Width="180px" id="FilePath_8" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="btn_8" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="btnDelFile8" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="lblFileID8" runat="server" Text="" Visible="false"></asp:Label> 							                                                                    
							<%--<input  type="file" id="htmlIFImage6" runat="server"  />--%></td>
							
							<td><asp:TextBox ID="txtFilePath_8" runat="server"  CssClass="textback"></asp:TextBox></td>
							</tr>
							
							
							<tr>
							<td><b>أخرى</b>
							
							</td>
							<td> 
							 <asp:TextBox Width="180px" id="TextBox8" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="ImageButton2" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label> 							                                                                    
							<%--<input  type="file" id="htmlIFImage6" runat="server"  />--%></td>
							
							<td><asp:TextBox ID="TextBox9" runat="server"  CssClass="textback"></asp:TextBox></td>
							</tr>
							
							<tr>
							<td><b>أخرى</b>
							
							</td>
							<td> 
							 <asp:TextBox Width="180px" id="TextBox10" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton3" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="ImageButton4" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label> 							                                                                    
							<%--<input  type="file" id="htmlIFImage6" runat="server"  />--%></td>
							
							<td><asp:TextBox ID="TextBox11" runat="server"  CssClass="textback"></asp:TextBox></td>
							</tr>
							
							<tr>
							<td><b>أخرى</b>
							
							</td>
							<td> 
							 <asp:TextBox Width="180px" id="TextBox12" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton5" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="ImageButton6" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label> 							                                                                    
							<%--<input  type="file" id="htmlIFImage6" runat="server"  />--%></td>
							
							<td><asp:TextBox ID="TextBox13" runat="server"  CssClass="textback"></asp:TextBox></td>
							</tr>
							
							<tr>
							<td><b>أخرى</b>
							
							</td>
							<td> 
							 <asp:TextBox Width="180px" id="TextBox14" ReadOnly="true" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="ImageButton7" ImageUrl="~/Images/AlignTopRight.gif" OnClick="ShowFile" runat="server" />
                            &nbsp;
                            <asp:ImageButton ID="ImageButton8" ImageUrl="~/Images/Reject.gif" Visible="false" OnClick="DelFile" runat="server"/>
                            <asp:Label ID="Label5" runat="server" Text="" Visible="false"></asp:Label> 							                                                                    
							<%--<input  type="file" id="htmlIFImage6" runat="server"  />--%></td>
							
							<td><asp:TextBox ID="TextBox15" runat="server"  CssClass="textback"></asp:TextBox></td>
							</tr>
                            
             </table>
             
              <asp:Button ID="Button1" Style="display: none;" runat="server" Text="Fake" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" runat="server" 
            TargetControlID="Button1"  PopupControlID="pnl_file" 
            BackgroundCssClass="modalBackground"
            DropShadow="true"  CancelControlID="btnFileCancel">
            </ajaxToolkit:ModalPopupExtender>

            <asp:Panel Direction="RightToLeft"  ID="pnl_file" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="pnl_file_head" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    استعراض ملفاتك 
                
                </div>
            </asp:Panel>
                <b><span style="font-family:Simplified Arabic;">
                <asp:FileUpload ID="txtFilePath"  runat="server"/>                                                              
                </span></b>
                <br />
                <br />
                <div style="text-align:center;"><asp:Button ID="Button3"  OnClick="CopyFile"  runat="server" Text="موافق"  />&nbsp;<asp:Button ID="btnFileCancel"  runat="server" Text="ا لغاء"  /></div>                
            </asp:Panel>
            
             
             </ContentTemplate>
             <Triggers>
                <asp:PostBackTrigger ControlID="Button3" />                
            </Triggers>
                </asp:UpdatePanel>
                
                </ContentTemplate>
                
                
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel ID="tab_8" runat="server" HeaderText="اسم المستخدم">
            <ContentTemplate>
                <table Width="745px"  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table10">
                    <tr>
                        <td colspan="3" style="font-family:Simplified Arabic;font-size: 12pt;">                        
                        <asp:LinkButton ID="lnk_tab6" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_tab6')" onmouseover="showHelpStatusIndex('id_hlp_tab6', this,100, 50, false,6)"></asp:LinkButton>			    			   			    
                        <div id="id_hlp_tab6" class="HelpWindow" >
                        <iframe  frameborder="0" height="100%"
                        src="hlp_Tab_Six.htm"></iframe>
                        </div>            
                        <br />
                        <ajax:RoundedArea runat='server' ID="email"><b>
                        في هذه الصفحة ستقوم بتكوين إسم مستخدم وكلمة مرور خاصة بنظام التسجيل الإلكتروني، وذلك لتتمكن من إستخدام النظام مرة ً أخرى في المستقبل لغرض متابعة حالة طلبك أو تحديث المعلومات الخاصة بك.
                        <br />ملاحظة: يمكنك إستخدام البريد الإلكتروني الذي قمت بإدخاله كإسم مستخدم وفي حالة عدم رغبتك بذلك قم بإدخال إسم المستخدم المناسب. <font color=red>  إسم المستخدم وكلمة المرور تكون باللغة الانجليزية فقط. </font></ajax:RoundedArea>
                        </b>
                        </td>
                    </tr>
                     <tr>
                        <td id="Td1"  style="font-family:Simplified Arabic;font-size: 12pt;">إسم المستخدم</td>                        
                        <td dir="ltr">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtEMailII"   MaxLength="25" Width="160px" runat="server"></asp:TextBox>                          
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr >
                        <td id="password"  style="font-family:Simplified Arabic;font-size: 12pt;">كلمـة المرور</td>
                        <td dir="ltr">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtPassword"  ValidationGroup="Tab_Login" MaxLength="10" TextMode="password" CssClass="textback" Width="160px" runat="server"></asp:TextBox>                            
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>


                    <tr >
                        <td id="retypepwd"  style="font-family:Simplified Arabic;font-size: 12pt;">تأكيد كلمـة المرور</td>
                        <td dir="ltr">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtRetypePWD"  ValidationGroup="Tab_Login" MaxLength="10" TextMode="password" CssClass="textback" Width="160px" runat="server"></asp:TextBox>                            
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>    &nbsp;</td>
                        <td>
                        
                        <asp:UpdatePanel ID="upd_avail" runat="server">
                                 <ContentTemplate>
                                 
                        <asp:LinkButton ID="email_validate" OnClick="CheckLogin" Font-Bold="true" runat="server" Text="تحقق من إمكانية إستعمال إسم المستخدم الذي قمت بإدخاله" CausesValidation="false"></asp:LinkButton>
                        
                         </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="email_validate" EventName="Click" />
                            </Triggers>
                             </asp:UpdatePanel>
                             
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2"> <asp:UpdatePanel ID="upd_login_stat" runat="server">
                                 <ContentTemplate>
                                 <br />
                                 <br />                                 
                            <asp:Label ID="lblLoginAvalStatus" runat="server" ForeColor="red"></asp:Label>
                              </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="email_validate" EventName="Click" />
                            </Triggers>
                             </asp:UpdatePanel></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr >
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>                        
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    
                </table>                
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
           <ajaxToolkit:TabPanel ID="tb_status" HeaderText="حالة التسجيل" runat="server">
           <ContentTemplate>           
           <asp:LinkButton ID="lnk_tab7" runat ="server" Text="إرشادات" ForeColor=red onmouseout="hideHelpFloatWindow('id_hlp_tab7')" onmouseover="showHelpStatusIndex('id_hlp_tab7', this,100, 50, false,7)"></asp:LinkButton>			    			   			    
           <div id="id_hlp_tab7" class="HelpWindow" >
           <iframe  frameborder="0" height="100%"
           src="hlp_Tab_Seven.htm"></iframe>
           </div>            
           <br />
           <div><b>حالة التسجيل
           <br />في هذه الصفحة تجد ملخصاً يعكس مرحلة التسجيل بالنسبة للطالب</b></div>
           <table dir="rtl" border="1" cellpadding="0"  cellspacing="0" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;font-weight:bold;" id="tbl_status" runat="server">           
           <tr>
           <td>&nbsp;</td>
           <td>ملخص مراحل التسجيل </td>
           <td>الشــــــــــــــــــــــــــــــــرح</td>           
           </tr>
           
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_progress" Checked="true" runat="server" /></td>
           <td>جاري التسجيل</td>
           <td>أنت لازلت في مرحلة التسجيل</td>
           </tr>
           
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_registred" runat="server" /></td>
           <td>التسجيل مكتمل </td>
           <td>لقد أتممت عملية إدخال بيانات التسجيل بنجاح</td>
           </tr>
           
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_invited" runat="server" /></td>
           <td>أنت مدعو للمقابلة الشخصية
 (بانتظار تأكيدك )
</td>
           <td>لقد تم اختيارك بناء على مفاضلة الدرجة المكافئة للمقابلة الشخصية ( أول مرحلة في القبول المبدئي ) في  يوم      وتاريخ
اضغط هنا لتسجيل قبولك الدعوة للمقابلة الشخصية.
يجب عليك ملاحظة إن عدم قبول الدعوة سيسقط دعوتك حيث إن النظام سيتخطاك إلى دعوة متقدمين آخرين لذلك ننصحك بمتابعة الدخول إلى الموقع يوميا أو مراقبة بريدك الالكتروني حيث سيتم دعوتك بهاتين الطريقتين
 </td>
           </tr>
          
          
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_acknowledged" runat="server" /></td>
           <td>
أنت مدعو للمقابلة الشخصية
 (وقد أكدت قبولك للدعوة)
</td>
           <td>بمجرد قبولك الدعوة أعلاه سيعكس النظام جاهزيتك لحضور المقابلة الشخصية
           ، لقبول الدعوة للمقابلة الرجاء <br /><asp:LinkButton OnClick="Acknowledge" ID="lnkAcknowledge" Text="الضغط هنا." runat="server" Enabled="false"></asp:LinkButton> </td>
           </tr>
          
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_interviewed" runat="server" /></td>
           <td>
الحضور للمقابلة الشخصية 
</td>
           <td>
لقد تم حضورك الفعلي للمقابلة الشخصية
 </td>
           </tr>
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_accepted" runat="server" /></td>
           <td>
مقبول 
</td>
           <td>
لقد تم قبولك 
</td>
           </tr>
           
           
           <tr>
           <td><asp:CheckBox Enabled="false" ID="chk_status_rejected" runat="server" /></td>
           <td>
غير مقبول 
</td>
           <td>
نعتذر عن قبولك هذا العام
</td>
           </tr>
           
           </b>
           </table>
           </ContentTemplate>
           </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>        
        
        </ContentTemplate>        
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="imgNext" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="imgPrev" EventName="Click" />                        
            <asp:PostBackTrigger ControlID="imgSave" />            
        </Triggers>
        </asp:UpdatePanel>
            </div>            
            </div>
		<%--</div>--%>         		
		
   <div align="center">
   
    <asp:UpdatePanel ID="act_pnl" runat="server">
    <ContentTemplate>            
        <asp:ImageButton ID="imgPrev" ImageUrl="~/Images/previous button.jpg" CausesValidation="false" ToolTip="Click here to move previous" OnClick="goPrev" runat="server" />  
        <asp:ImageButton ID="imgNext" ImageUrl="~/Images/next button.jpg" CausesValidation="false" ToolTip="Click here to move next" OnClick="goNext" runat="server" />  
        
        <asp:ImageButton ID="imgSave" ImageUrl="~/Images/save button.jpg" CausesValidation="false" ToolTip="Click here to save your data" OnClick="goSave" runat="server" />
        <asp:ImageButton ID="imgCancel" ImageUrl="~/Images/cancel button.jpg" CausesValidation="false" OnClick="goCancel" runat="server" /> 
        
    </ContentTemplate>                        
        </asp:UpdatePanel>    
   </div>                  
   


            <asp:Button ID="Button1_1" Style="display: none;" runat="server" Text="Fake" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" 
            TargetControlID="Button1_1"  PopupControlID= "Panel1" 
            BackgroundCssClass="modalBackground"
            DropShadow="true" CancelControlID="Button2">
            </ajaxToolkit:ModalPopupExtender>

            <asp:Panel Direction="RightToLeft"  ID="Panel1" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="Panel2" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    بيانات غير مكتملة
                
                </div>
            </asp:Panel>
                <b><span style="font-family:Simplified Arabic;">
                الرجاء تعبئة جميع البيانات وإلا لن تتمكن من حفظ بياناتك وتكملة تعبئة طلب الإلتحاق بالكلية. قم بمراجعة البيانات الظاهرة باللون الأحمر وتعبئة الحقول المقابله لها.
                </span></b>
                <br />
                <br />
                <div style="text-align:center;"><asp:Button ID="Button2" OnClick="CloseRefreshwindow" runat="server" Text="OK"  /></div>
            </asp:Panel>            
            
            <asp:Button ID="Button6" Style="display: none;" runat="server" Text="Fake" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender6" runat="server" 
            TargetControlID="Button6"  PopupControlID="Panel6" 
            BackgroundCssClass="modalBackground"
            DropShadow="true" CancelControlID="Button7">
            </ajaxToolkit:ModalPopupExtender>

            <asp:Panel Direction="RightToLeft"  ID="Panel6" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="Panel7" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    رسالة من النظام                
                </div>
            </asp:Panel>
                <b ><span  style="font-family:tahoma;text-align:Justify;">
                   أنت مسجل بالفعل ، استخدم البيانات المرسلة إلى بريدك مسبقا لاستخدام النظام                
                </span></b>
                <br />
                <br />
                <div style="text-align:center;"><asp:Button ID="Button7" OnClick="CloseRefreshwindow" runat="server" Text="إغلاق"  /></div>
            </asp:Panel>
            
            <asp:Button ID="Button8" Style="display: none;" runat="server" Text="Fake" />
                        
            <ajaxToolkit:ModalPopupExtender ID="ModalPopUpPassword" runat="server" 
            TargetControlID="Button8"  PopupControlID="pnlPassword" 
            BackgroundCssClass="modalBackground"
            DropShadow="true" CancelControlID="btnPasswordClose">
            </ajaxToolkit:ModalPopupExtender>

            <%--First Panel That will be shown when error comes for Password--%>            
            <asp:Panel Direction="LeftToRight"   ID="pnlPassword" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="Panel9" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    رسالة من النظام                
                </div>
            </asp:Panel>
                <b><span  style="font-family:Arial;text-align:justify;">
                    <br />يجب ألا تقل كلمة المرور عن ستة أحرف <br/>ويجب أن تدخلها مرة أخرى للتأكد من تطابقها.                
                </span></b>
                <br />
                <br />                
                <div style="text-align:center;"><asp:Button ID="btnPasswordClose" OnClick="CloseRefreshwindow" runat="server" Text="OK"  /></div>
            </asp:Panel>
            
            <%--Second Panel That will be shown when error comes File UPloading--%>
            <asp:Panel Direction="LeftToRight"   ID="pnlFileErr" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="pnlFile1" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    رسالة من النظام                
                </div>
            </asp:Panel>
                <b><span  style="font-family:Arial;text-align:justify;">
                    <br />يجب أن تكون الملفات صورا من الامتداد JPG و ألا يزيد حجمها عن 1 ميجابايت                
                </span></b>
                <br />
                <br />                
                <div style="text-align:center;"><asp:Button ID="BtnFileClose" OnClick="CloseRefreshwindow" runat="server" Text="OK"  /></div>
            </asp:Panel>
            
            <%--third Panel for telling that School ID already Exists--%>
            <asp:Panel Direction="LeftToRight"   ID="pnlSchoolID" runat="server" CssClass="modalPopup" Style="display:none" Width="300">
                 <asp:Panel ID="pnlSchoolID1" runat="server" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div>
                    رسالة من النظام                
                </div>
            </asp:Panel>
                <b><span  style="font-family:Arial;text-align:justify;">
                    <br />This ID Already exists in Database.<br />Kindly Login with a valid User ID and Password                
                </span></b>
                <br />
                <br />                
                <div style="text-align:center;"><asp:Button ID="btnSchoolID" OnClick="CloseRefreshwindow" runat="server" Text="OK"  /></div>
            </asp:Panel>
            
            
            
            
	 <div id="LocalID" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_local_id.htm"></iframe>
                         </div>
                         
                         
                          <div id="dob" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_dob.htm"></iframe>
                         </div>
                         
                           
                          <div id="pob" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_pob.htm"></iframe>
                         </div>
                         
                         <div id="id_issued_date" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_id_issue_dt.htm"></iframe>
                         </div>
                         
                          <div id="id_exp_date" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_id_exp_date.htm"></iframe>
                         </div>
                         
                         <div id="id_copy_paste" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_copy_paste.htm"></iframe>
                         </div>
                         
                          <div id="id_stream_selection" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_stream_selection.htm"></iframe>
                         </div>
                         
                         
                         <div id="id_status_index" class="HelpWindow" >
                          <iframe  frameborder="0" height="100%"
                                src="hlp_status.htm"></iframe>
                         </div>
                
        
            
        <br />
       
        
        
            
            
    </form>
    <div align=center>
			    <font style="font-size:small">
                    ITS Developers ©2009
                    College of Medicine
                </font>            
            </div>
</body>
</html>
