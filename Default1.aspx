
<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"   ValidateRequest="false"
CodeFile="Default1.aspx.cs" UICulture="ar-SA" Culture="ar-SA" Inherits="_Default" Title="مرحباً بك في نظام التسجيل الإلكتروني" %>
<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="ProgStudios.WebControls" Namespace="ProgStudios.WebControls"
    TagPrefix="cc1" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">

 <script runat="Server" type="text/C#">
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            return new AjaxControlToolkit.Slide[] { 
            new AjaxControlToolkit.Slide("images/1.jpg", "", ""),
            new AjaxControlToolkit.Slide("images/2.jpg", "", " "),
            new AjaxControlToolkit.Slide("images/3.jpg", "", " "),
            new AjaxControlToolkit.Slide("images/ui_applyTab.gif", "", " ")
            };            
        }
    </script>
    
<ve:PopUp runat="server"  ID="popup1" />

<asp:ScriptManager ID="MasterScript" runat="server" 
 ></asp:ScriptManager>	
	<div id="body" dir="rtl" style="width: 988px">	    
		<div id="">
			<div id="user_assistance" style="height:100%">
					<p>
				<ajaxToolkit:Accordion ID="Accordion1" runat="server" SelectedIndex="0"
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
        </p>
        <p>
          <ajaxToolkit:Accordion ID="Accordion2" runat="server" SelectedIndex="0"
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
        </p>
        <p>
          <ajaxToolkit:Accordion ID="MyAccordion" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" Width="100%"  RequireOpenedPane="true" SuppressHeaderPostbacks="true">
           <Panes>
           <ajaxToolkit:AccordionPane ID="AccordionPane1"  runat="server">
                <Header><b>إظهار حالة البيانات</b></Header>
                <Content>   
                                 
                <asp:Label Width="120px" ID="btn_stage_0" Text="مسارات الدراسة"      runat="server"/>
                <asp:Image  ID="img_tab_0" ImageUrl="~/Images/moduleDisabled.gif" AlternateText="Step 0-Radio Selection"  runat="server" />                           
                
                <asp:Label Width="120px" ID="btn_stage_1" Text="البيانات الشخصية"  runat="server"/>
                <asp:Image  ID="img_tab_1" AlternateText="Step 1-Personal Info" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />     
                
                
                <asp:Label Width="120px" ID="btn_stage_2" Text="العنوان"  runat="server"/>
                <asp:Image  ID="img_tab_2" AlternateText="Step 2-Address" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                <asp:Label Width="120px" Visible="false" ID="btn_stage_3" Text="بيانات الدراسة"  runat="server" />
                <asp:Image  ID="img_tab_3" Visible="false" AlternateText="Step 3-High School" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                <asp:Label Width="120px" Visible="false" ID="btn_stage_4" Text="بيانات الدراسة"  runat="server"/>
                <asp:Image  ID="img_tab_4"  Visible="false" AlternateText="Step 4-University" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                <asp:Label Width="120px" Visible="false" ID="btn_stage_5" Text="الخيارات الدراسية"   runat="server"/>
                <asp:Image  ID="img_tab_5" Visible="false" AlternateText="Step 5-Stream Selection" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />  
                
                <asp:Label Width="120px" ID="btn_stage_6" Text="تحميل المستندات" runat="server" />
                <asp:Image  ID="img_tab_6" AlternateText="Step 6-File Upload" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />
                
                <asp:Label Width="120px" ID="btn_stage_7" Text="اسم المستخدم" runat="server" />
                <asp:Image  ID="img_tab_7" AlternateText="Step 7-EMailAddress" ImageUrl="~/Images/moduleDisabled.gif" runat="server" />
                
                </Content>
            </ajaxToolkit:AccordionPane>
             </Panes>
            
        </ajaxToolkit:Accordion>
        </p>
        <p>
       
        <ajaxToolkit:Accordion ID="Accordion3" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader" ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" Width="100%"  RequireOpenedPane="true" SuppressHeaderPostbacks="true">
           
            <Panes>
             <ajaxToolkit:AccordionPane ID="slideshow"   runat="server">             
             
              <Content >
            <asp:Image ID="Image5" runat="server"                
                ImageUrl="~/Images/1.jpg"
                Height="80"
                AlternateText="s" />
            <asp:Label runat="Server" ID="imageLabel1"/><br /><br />
            <asp:Button runat="Server" Visible="false" ID="prevButton" Text="Prev" Font-Size="Larger" />
            <asp:Button runat="Server" ID="playButton"  Text="Play" Font-Size="Larger" />
            <asp:Button runat="Server" Visible="false" ID="nextButton" Text="Next" Font-Size="Larger" />
            <ajaxToolkit:SlideShowExtender ID="slideshowextend1" runat="server" 
                TargetControlID="Image5"
                SlideShowServiceMethod="GetSlides" 
                AutoPlay="true" 
                ImageDescriptionLabelID="imageLabel1"
                NextButtonID="nextButton" 
                PlayButtonText="Play"                 
                PreviousButtonID="prevButton" 
                PlayButtonID="playButton" 
                Loop="true" />
        
        </Content>
             </ajaxToolkit:AccordionPane>
             </Panes>
             
           
          </ajaxToolkit:Accordion>
       
        </p>
			</div>
		</div>
		<div id="col_main_right"  >
			<div  class="content_right" >
				<fieldset >
				     <ajaxToolkit:TabContainer Width="760px" id="MainTab" runat="server"  >
                    <ajaxToolkit:TabPanel   HeaderText="مسارات الدراسة" ID="Tab_0" runat="server">
                        <ContentTemplate>
                        
                           

                            <table  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;"  
                             runat="server" id="table2">  
                            
                            
                             <tr>
                             <td align="right"   style="font-size: 12pt; font-family: Simplified Arabic; ">
                                <ajax:RoundedArea runat='server' ID="RoundedArea1">
                                 <b><span style="font-size:x-large" >كلية الطب</span> <br />
                                 توفر كلية الطب مسارين للدراسة:</b><br />
                                 
                                 
                                 <b>1- مسار حملة الشهادة الثانوية: هذا المسار مخصص لحملة شهادة الثانوية العامة قسم العلوم الطبيعية. وفي هذا المسار يدرس الطالب لمدة سنتين تحضيريتين مشتركة مع طلاب المرحلة التحضيرية لكلية العلوم الطبية التطبيقية.</b>
                                    <br />
                                    <B>2- مسار حملة الشهادة الجامعية: هذا المسار مخصص لحملة شهادة البكالوريوس من كلية العلوم، كلية العلوم الطبية التطبيقية، كلية الصيدلة، وكلية الطب البيطري. وفيه يدرس الطالب المقرارات الدراسية لمدة أربع سنوات ونصف 
                                                             تتبعها سنة الإمتياز.</B>
                                        <br />
                                        
                                </ajax:RoundedArea>
                                
                                
                                
                             </td>
                             </tr>
                            
                             <tr>
                             <td align="right" style="font-size: 12pt; font-family: Simplified Arabic;">
                              <ajax:RoundedArea runat='server' ID="RoundedArea2">
                                <b>
                             <span style="font-size:x-large" > كلية العلوم الطبية التطبيقية</span><br />
                             </b>
                             
                             
                              <b>
                             يدرس الطالب مدة سنتين تحضيريتين مشتركة مع طلاب كلية الطب، تليها سنتين للتخصص بأحد التخصصات التالية:<br />
                             1- علوم المختبرات الطبية.<br />
                             2- تقنية الطوارئ.<br />
                             3- العلاج التنفسي.<br />
                             
                             </b>
                              </ajax:RoundedArea>
                              
                           
                             </td>
                             </tr>
                            
                             <tr>
                             <td  align="center" style="font-size: 12pt; font-family: Simplified Arabic; ">      
                                <ajax:RoundedArea  runat='server' ID="RoundedArea3">
                                    <span  style="font-size: 12pt; font-family: Simplified Arabic">
                                    <b>
                                    ملاحظة: القبول في الوقت الحاضر محصور للطلبة الذكور فقط
                                    </b><br />
                                    <b>الرجاء إختيار المسار المناسب لمؤهلك الدراسي</b></span>  
                                    <asp:UpdatePanel ID="upd_Education" runat="server">
                                    <ContentTemplate>                     
                                        <asp:RadioButton Visible="false" style="font-size: 10pt; font-family: Simplified Arabic" 
                                        ID="radHighSchool" AutoPostBack="True" runat="server" GroupName="Academic" Text="مسار حملة الشهادة الثانوية ( كلية الطب وكلية العلوم الطبية التطبيقية )" 
                                        Font-Bold="true"  OnCheckedChanged="radHighSchool_CheckedChanged" />   

                                        <asp:LinkButton ID="lnkHighSchool" runat="server" Text="مسار حملة الشهادة الثانوية ( كلية الطب وكلية العلوم الطبية التطبيقية )" 
                                        Font-Names="Simplified Arabic" ></asp:LinkButton>           
                                        <br />

                                        <asp:LinkButton  ID="lnkGraduation" OnClick="GraduationLink" runat="server" Text="مسار حملة الشهادة الجامعية ( كلية الطب فقط - طلاب )" 
                                        Font-Names="Simplified Arabic" ></asp:LinkButton>           



                                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" 
                                        TargetControlID="lnkHighSchool"  PopupControlID="mb1" 
                                        BackgroundCssClass="modalBackground"
                                        DropShadow="true"   >
                                        </ajaxToolkit:ModalPopupExtender>

                                    
                                        <%--Panel I--%>
                                        <asp:Panel Direction="rightToLeft"  ID="mb1" runat="server" CssClass="modalPopup"    Width="381px">
                                            <asp:Panel ID="pan_heading_1" runat="server" 
                                            Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                                                <div>
                                                       <b>ملاحظة هامة </b>
                                                </div>                                        
                                            </asp:Panel>
                                        نود التنويه بأن البيانات التي ستظهر لك عند قيامك بإدخال رقم بطاقة أحوالك الشخصية هي بيانات تم الحصول عليها من قاعدة البيانات الخاصة بوزارة التربية والتعليم، عند ملاحظتك لوجود أي خطأ في هذه البيانات الرجاء تعديل هذا الخطأ مع العلم بأنه سوف يتبين للكلية بأنه تم تعديل البيانات.                                
                                        <div style="text-align:center;">
                                        <asp:Button ID="btnOK1" AutopostBack="true" onClick="OkClicked" 
                                        runat="server" Text="Ok" /></div>
                                        
                                        </asp:Panel>
                                        
                                    
                                        <br />
                                        <asp:RadioButton  ID="radGraduate" Font-Bold="true" Text="مسار حملة الشهادة الجامعية ( كلية الطب فقط - طلاب ) " 
                                        style="font-size: 10pt; font-family: Simplified Arabic"  
                                        AutoPostBack="True" runat="server" 
                                        GroupName="Academic"  Visible="false"
                                        Font-Size="Large" OnCheckedChanged="radHighSchool_CheckedChanged" />



                                    </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="radHighSchool" />
                                            <asp:PostBackTrigger ControlID="radGraduate" />
                                            <asp:PostBackTrigger ControlID="btnOK1" />   
                                            <asp:PostBackTrigger ControlID="lnkGraduation" />   
                                                                         
                                        </Triggers>
                                    </asp:UpdatePanel> 
                                </ajax:RoundedArea>
                             </td>
                             </tr>
                             
                             </table>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel HeaderText="البيانات الشخصية" runat="server" ID="Tab_1">           
             <ContentTemplate>
            
            <table   style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table_01">
            
            <tr>
            <td colspan="3">
             <asp:UpdatePanel ID="UpdatePanel15" runat="server" RenderMode="Inline">
            <ContentTemplate>

            

            </ContentTemplate>
            </asp:UpdatePanel>
            </td>
            </tr>
             <tr>
            <td dir="ltr"   align="right" style="font-family:Simplified Arabic;font-size: 12pt;width:170px;"><asp:Label Font-Bold="true" runat="server" ID="lblLocalID"
             Text="رقم بطاقة الاحوال" ></asp:Label>
            
            </td>
            <td style="width:205px">    
            
              <asp:UpdatePanel runat="server" id="myID" RenderMode="Inline">
                            <ContentTemplate>
                            
                        <span  style="font-weight:bold" class="VEKeyword" 
                        poptext="قم بإدخال رقم البطاقة الشخصية والمكون من 10 خانات. عند الضغط على كلمة (تحقق)سيقوم النظام بشكل تلقائي بتعبئة باقي الفراغات ">
                        ?</span>         
                        <asp:TextBox ID="txtLocalID" AutoPostBack="true" MaxLength="10" Width="100px" ValidationGroup="tab_1" CssClass="textback"  runat="server">1045048442</asp:TextBox>
                        
            <asp:LinkButton Visible="false" ID="lblValidateID" runat="server" CausesValidation="False" Text="Validate"  OnClick="lblValidateID_Click"></asp:LinkButton>
            <asp:Button ID="btnFetchData" Text="تحقق" runat="server" OnClick="lblValidateID_Click"  />
            
            
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
                <b><span style="font-family:Simplified Arabic;">
                إن ظهور هذه الرسالة يدل على أن رقم الأحوال الذي قمت بإدخاله غير موجود في قاعدة البيانات لدينا والمستقاة من وزارة التربية والتعليم.
                الرجاء إعادة إدخال الرقم بشكل صحيح، وفي حالة ظهور الرسالة مرة ً أخرى قم بإدخال البيانات بشكل يدوي.               
                </span></b>
                <br />
                <br />
                <div style="text-align:center;"><asp:Button ID="btnOK" runat="server" Text="OK" Width="80px" /></div>
            </asp:Panel>
            
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
                            
                       <span style="color:Gray">?</span>    
            <asp:TextBox ID="txtFirstName_A" ValidationGroup="Tab_2" Width="160px" runat="server" CssClass="user_info"></asp:TextBox>
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            
            </td>
            
           
            <td>
            <asp:TextBox ID="txtFirstName_E" ValidationGroup="Tab_2" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            </td>
            <td align="left" style="font-size:10px;width:150px">
            <asp:Label ID="lblFirstName_Eng" runat="server" Text="First Name"></asp:Label>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lblFatherName_A" runat="Server" Text="إسـم الأب" Font-Bold="true"></asp:Label>
            </td>
            <td >
            <asp:UpdatePanel runat="server" id="FatherName_pnl">
            <ContentTemplate>
            <span style="color:Gray">?</span>
                <asp:TextBox ID="txtFatherName_A" ValidationGroup="Tab_2" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            
            <td><asp:TextBox ID="txtFatherName_E" ValidationGroup="Tab_2" CssClass="textback" Width="160px" runat="server"></asp:TextBox></td>
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
            <span style="color:Gray">
            ?</span>
                <asp:TextBox ID="txtGrandFatherName_A" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
                
                 </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
                            
                </td>
                
            <td><asp:TextBox ID="txtGrandFatherName_E" CssClass="textback" Width="160px" runat="server"></asp:TextBox></td>
            <td align="left"  style="font-size:10px;width:280px"><asp:Label ID="lblGrandFatherName_Eng" runat="server" Text="Grand Father"></asp:Label></td>
            </tr>
            
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>اسم العـائلة</b>
            
            </td>
            
            <td>
             <asp:UpdatePanel runat="server" id="LastName_Pnl">
            <ContentTemplate><span style="color:Gray">?</span>
            <asp:TextBox ID="txtLastName_A" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
             </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            <td><asp:TextBox ID="txtLastName_E" CssClass="textback" Width="160px" runat="server"></asp:TextBox></td>
            <td align="left"  style="font-size:10px;width:150px"><asp:Label id="lblLastName_Eng" Text="Last Name" runat="server"></asp:Label></td>
            </tr>
              <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <b><asp:Label ID="lblDOB" runat="server" Text="تاريـخ الميلاد"></asp:Label></b></td>
            <td  >
            
            <asp:UpdatePanel runat="server" id="dob_pnl">
            <ContentTemplate>
            
            <span dir="rtl" style="font-weight:bold" class="VEKeyword"  poptext="قم تحديد تاريخ الميلاد وذلك بالضغط على الأيقونة التي على شكل جدول والموجودة بجوار الحقل المخصص لكتابة تاريخ الميلاد، يمكنك التنقل بين الأعوام والأشهر وذلك بالضغط على الأسهم الصغيرة الظاهرأمامك في نافذة التاريخ كما أنه بالضغط على الشهر والسنة الموجودة في أعلى هذه النافذة فإنه عرض جميع الأشهر لتلك السنة وكذلك عندما تقوم بالضغط على السنة الظاهرة في أعلى نافذة المساعدة  فإنه سيتم عرض قائمة بعدد من السنوات ومن خلال الأسهم الصغيرة الموجودة في هذه النافذة يمكنك تحديد السنة المناسبة ومن ثم الشهر ثم اليوم.">?</span>
            
            <asp:TextBox ID="txtDOB" CssClass="textback"  Width="160px" runat="server"></asp:TextBox>
         
            
             <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />
             
             <ajaxToolkit:CalendarExtender ID="CalendarExtender3" FirstDayOfWeek="saturday" runat="server" BehaviorID="Image1"
                                  Animated="true" CssClass="MyCalendar" PopupButtonID="Image1" Format="dd/MM/yyyy" TargetControlID="txtDOB">
                            </ajaxToolkit:CalendarExtender>
                            
                             </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
                            
                            
                            
            </td>
             <td>
            <asp:UpdatePanel runat="server" id="hijri_dob_pnl">
            <ContentTemplate>
             <asp:TextBox ID="txtHijriDOB" Width="160px" runat="server"></asp:TextBox>
            </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
                         </td>               
             <td align="left" style="font-size:10px;width:150px">Hijri DOB</td>
            
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
            <span style="color:Gray">?</span>
            <asp:TextBox ID="txtPOB" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
               </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                             </Triggers>
                            </asp:UpdatePanel>
            </td>
            
            
            <td rowspan="5" colspan="2" style="vertical-align:top">            
            <ajax:RoundedArea  Height="200px" runat='server' id='any' >في حالة رغبتك في معرفة معلومات إضافية عن كل حقل من 
            <br />الحقول الظاهر أمامك الرجاء الضغط على علامة الإستفهام 
            (?) المجاورة لذلك الحقل وسوف تظهر لك نافذة تبين كيفية إدخال البيانات في هذا الحقل.

            <br />
            <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="myID" runat="server">
                <ProgressTemplate>
                <img src="Images/loading.gif" alt="" id="progress" />
                </ProgressTemplate>
                </asp:UpdateProgress>
            </ajax:RoundedArea>

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
            <span style="font-weight:bold"  class="VEKeyword"  poptext="الأشخاص المعالين هم الزوجة والأولاد فقط">
            
            ?</span>
            
            <asp:TextBox ID="txtChildCount" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            
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
            <td id="idissueddt" style="font-family:Simplified Arabic;font-size: 12pt;"><b><asp:Label ID="lblIssuedDate" runat="server" Text="تاريخ اصدار البطاقة"></asp:Label></b>
            </td>
            <td>
            
 <asp:UpdatePanel runat="server" id="idissued_date_pnl">
            <ContentTemplate>
            <span style="font-weight:bold"  class="VEKeyword"  poptext="قم بتحديد تاريخ إصدارالبطاقة وذلك بالضغط على الأيقونة التي على شكل جدول والموجودة بجوار  
الحقل المخصص لكتابة تاريخ إصدارالبطاقة، يمكنك التنقل بين الأعوام والأشهر وذلك بالضغط على  
الأسهم الصغيرة الظاهرأمامك في نافذة التاريخ. كما أنه بالضغط على الشهر والسنة الموجودة في أعلى  
هذه النافذة فإنه سيتم عرض جميع الأشهر لتلك السنة وكذلك عندما تقوم بالضغط على السنة الظاهرة في  
أعلى نافذة المساعدة فإنه سيتم عرض قائمة بعدد من السنوات ومن خلال الأسهم الصغيرة الموجودة في هذه  
النافذة يمكنك تحديد السنة المناسبة. 
">?</span>
            <asp:TextBox ID="txtIDIssuedDate"   CssClass="textback" Width="160px" runat="server"></asp:TextBox>
          
            <%--==============================================--%>
             <asp:Image ID="Image2" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />

             <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" BehaviorID="Image2"
                                 Enabled="True" CssClass="MyCalendar"  PopupButtonID="Image2" Format="dd/MM/yyyy" TargetControlID="txtIDIssuedDate">
                            </ajaxToolkit:CalendarExtender>
                            
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
             <span style="font-weight:bold"  class="VEKeyword"  poptext="قم بتحديد تاريخ إنتهاء البطاقة وذلك بالضغط على الأيقونة التي على شكل جدول والموجودة بجوار  
الحقل المخصص لكتابة تاريخ إنتهاء البطاقة، يمكنك التنقل بين الأعوام والأشهر وذلك بالضغط على الأسهم  
الصغيرة الظاهرأمامك في نافذة التاريخ. كما أنه بالضغط على الشهر والسنة الموجودة في أعلى هذه  
النافذة فإنه سيتم عرض جميع الأشهر لتلك السنة وكذلك عندما تقوم بالضغط على السنة الظاهرة في أعلى  
نافذة المساعدة فإنه سيتم عرض قائمة بعدد من السنوات ومن خلال الأسهم الصغيرة الموجودة في هذه  
النافذة يمكنك تحديد السنة المناسبة. 
">?</span>
            <asp:TextBox ID="txtIDExpDate"  CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            
             <asp:Image ID="Image3" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />

             <ajaxToolkit:CalendarExtender ID="CalendarExtender5" CssClass="MyCalendar" runat="server" BehaviorID="Image3"
                                 Enabled="True"  PopupButtonID="Image3" Format="dd/MM/yyyy" TargetControlID="txtIDExpDate">
                            </ajaxToolkit:CalendarExtender>
                            
            </td>
            </tr>
            
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;"><b>مكان اصدار البطاقة</b>
            </td>
            <td>
            

            <asp:UpdatePanel runat="server" id="idissuedplace_pnl">
                <ContentTemplate>?
                <asp:TextBox ID="txtidissuedplace" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="lblValidateID" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
            <%--<tr>
            <td id="loginname" style="font-family:Simplified Arabic;font-size: 12pt;"><b>البريد الإكتروني</b></td>
            <td>?
            <asp:TextBox ID="txtEmailAddress" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
            </td>
            </tr>--%>
            
            <tr>
            <td colspan="2" dir="ltr">
            
            <%--<asp:RequiredFieldValidator ID="asp_txtFirstName_A" Width="100%" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtFirstName_A"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" ID="ajax_txtFirstName_A" 
            TargetControlID="asp_txtFirstName_A" runat="server" BehaviorID="asp_txtFirstName_A_behave" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
            <%--<asp:RequiredFieldValidator ID="asp_txtFirstName_E" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtFirstName_E"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtFirstName_E" 
            TargetControlID="asp_txtFirstName_E" runat="server" BehaviorID="asp_txtFirstName_E_behave" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            <asp:RequiredFieldValidator ID="asp_father_name_a" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtFatherName_A"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_father_name_a" 
            TargetControlID="asp_father_name_a" runat="server" BehaviorID="asp_asp_father_name_1" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            
             <asp:RequiredFieldValidator ID="asp_father_name_e" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtFatherName_e"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_father_name_e" 
            TargetControlID="asp_father_name_e" runat="server" BehaviorID="asp_asp_father_name_2" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            <asp:RequiredFieldValidator ID="asp_txtGrandFatherName_A" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtGrandFatherName_A"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtGrandFatherName_A" 
            TargetControlID="asp_txtGrandFatherName_A" runat="server" BehaviorID="asp_txtGrandFatherName_ext" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            <asp:RequiredFieldValidator ID="asp_txtGrandFatherName_E" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtGrandFatherName_E"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtGrandFatherName_E" 
            TargetControlID="asp_txtGrandFatherName_E" runat="server" BehaviorID="asp_txtGrandFatherName_E" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            
            <asp:RequiredFieldValidator ID="asp_txtLastName_A" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtLastName_A"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtLastName_A" 
            TargetControlID="asp_txtLastName_A" runat="server" BehaviorID="asp_txtLastName_A" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            <asp:RequiredFieldValidator ID="asp_txtLastName_E" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtLastName_E"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtLastName_E" 
            TargetControlID="asp_txtLastName_E" runat="server" BehaviorID="asp_txtLastName_E" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
           <%-- <asp:RequiredFieldValidator ID="asp_dob" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtDOB"></asp:RequiredFieldValidator>--%>
            
            <%--<ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_dob" 
            TargetControlID="asp_dob" runat="server" BehaviorID="txtDOB_behave" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
            
            <%--<asp:RequiredFieldValidator ID="asp_txtPOB" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtPOB"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="asp_pob" 
            TargetControlID="asp_txtPOB" runat="server" BehaviorID="ajax_pob_behave" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
            
           <%-- <asp:RequiredFieldValidator ID="asp_txtIDIssuedDate" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtIDIssuedDate"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtIDIssuedDate" 
            TargetControlID="asp_txtIDIssuedDate" runat="server" BehaviorID="asp_txtIDIssuedDate_behave" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
            <%--ID Exp Date--%>
            <%--<asp:RequiredFieldValidator ID="asp_txtIDExpDate" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtIDExpDate"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtIDExpDate" 
            TargetControlID="asp_txtIDExpDate" runat="server" BehaviorID="ajax_txtIDExpDate" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            --%>
             <%--ID Issue Place--%>
            
            <%--<asp:RequiredFieldValidator ID="asp_txtidissuedplace" ValidationGroup="Tab_2" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtidissuedplace"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtidissuedplace" 
            TargetControlID="asp_txtidissuedplace" runat="server" BehaviorID="asp_txtidissuedplace" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
            </td>
            </tr>
            </table>
            
            
                            
                            
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel ToolTip="Address" HeaderText="العنوان" ID="Tab_2" runat="server">
            
            <ContentTemplate>
            
             
             
            <table  width="100%"  style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top; " runat="server" id="table3">
            <tr>
            <td dir="rtl" align="right" style="font-family:Simplified Arabic;font-size: 12pt;">
              <ajax:RoundedArea ID="ADDRESS1" runat="server">
            
            <table>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;"><b>العنوان الدائم</b>
            </td>
            </tr>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
            العنوان
            </td>
            <td>
            <asp:TextBox ID="txtAddress_1_1" ValidationGroup="Tab_3" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">العنوان</td>
            <td>
            <asp:TextBox ID="txtAddress_1_2" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">الرمز البريدي</td>
            <td>
            <asp:TextBox ID="txtZip_1" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">صندوق البريد</td>
            <td>
            <asp:TextBox ID="txtPostal_1" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">المـديـنـة</td>
            <td>
            <asp:TextBox ID="txtCity_1" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            </td>
            </tr>
            
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">الــدولـة
            </td>
            <td dir="ltr" >
            <asp:UpdatePanel runat="server" id="pnl_coutry_1">
            <ContentTemplate>
            
            <asp:DropDownList  ID="cmbCountry_1" CssClass="FormDropdown"  runat="server" Width="165px" >            
            <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
            <asp:ListItem >الكويت</asp:ListItem>
            <asp:ListItem >عمان</asp:ListItem>
            <asp:ListItem >قطر</asp:ListItem>
            <asp:ListItem >الإمارات العربيه المتحدة</asp:ListItem>
            <asp:ListItem >البحرين</asp:ListItem>
            
            </asp:DropDownList>
            
             <asp:Button ID="btnOtherCountry_1" Style="display: none;" runat="server" Text="Fake" />
            <ajaxToolkit:ModalPopupExtender ID="ModalCountry_1" runat="server" 
            TargetControlID="btnOtherCountry_1"  PopupControlID="mb_country_1" 
            BackgroundCssClass="modalBackground"
            DropShadow="true" OkControlID="btnOKCountry_1">
            </ajaxToolkit:ModalPopupExtender>

            <asp:Panel Direction="RightToLeft"  ID="mb_country_1" runat="server" CssClass="modalPopup" Style="display:none" Width="300">                 
                <span style="font-family:Simplified Arabic;">
                الــدولـة:<asp:TextBox id="txtOtherCountry_1" runat="server" ></asp:TextBox>
                </span>
                <br />
                <br />
                <div style="text-align:center;"><asp:Button ID="btnOKCountry_1"  onClick="OtherCountry_1" runat="server" Text="OK" /></div>
            </asp:Panel>           
            </ContentTemplate>
          
            </asp:UpdatePanel>
            
            </td>
            
            </tr>
           
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">الجــوال
            </td>
            <td>
            <asp:UpdatePanel runat="server" id="UpdatePanel16">
            <ContentTemplate>                   
                <asp:TextBox ID="txtStudentMobile" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
                        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">هاتف المنزل</td>
            <td><asp:TextBox ID="txtHomePhone" runat="server" Width="160px" CssClass="textback"></asp:TextBox></td>
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">البريد الإكتروني</td>
            <td>
            <asp:UpdatePanel runat="server" id="upd_email">
            <ContentTemplate>
            <asp:TextBox ID="txtEmailAddress_2"  runat="server" Width="160px" CssClass="textback"></asp:TextBox>
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
            
            <span dir="rtl" class="VEKeyword" 
                        poptext="في حالة كانت بينات عنوانك الدائم هي نفس بيانات عنوانك الحالي قم بالضغط على زر ( >> ) وذلك لنسخ البيانات نفسها من العنوان الدائم إلى العنوان الحالي.">
                        ?</span> 
                        <asp:Button ID="btnCopyAddress" OnClick="CopyAddress" runat="server" CausesValidation="false" Text=">>" />
           </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
           
            </td>
            
            <td>
            <ajax:RoundedArea ID="RoundedArea4" runat="server">
            <table>
            <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;"><b>العنوان الحالي</b>
            </td>
            
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">العنوان</td>
            <td>
            
            <asp:UpdatePanel runat="server" id="address_pnl">
            <ContentTemplate>

            <asp:TextBox ID="txtAddress_2_1" runat="server" Width="160px" CssClass="textback"></asp:TextBox>

            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">العنوان</td>
            <td>
             <asp:UpdatePanel runat="server" id="address_pnl_2">
            <ContentTemplate>

            <asp:TextBox ID="txtAddress_2_2" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">الرمز البريدي</td>
            <td>
              <asp:UpdatePanel runat="server" id="address_zip_1">
            <ContentTemplate>

            <asp:TextBox ID="txtZip_2" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            
             </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
            
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">صندوق البريد</td>
            <td>
             <asp:UpdatePanel runat="server" id="address_postal_1">
            <ContentTemplate>

            <asp:TextBox ID="txtPostal_2" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
            
              </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
              <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">المـديـنـة</td>
            <td>
             <asp:UpdatePanel runat="server" id="address_city_1">
            <ContentTemplate>

            <asp:TextBox ID="txtCity_2" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
              </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
            </td>
            </tr>
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">الــدولـة</td>
            <td>
            <asp:UpdatePanel runat="server" id="counttry_pnl">
            <ContentTemplate>
                       
            <asp:DropDownList  ID="cmbCountry_2" CssClass="FormDropdown"  runat="server" Width="165px" >
            
            <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
            <asp:ListItem>الكويت</asp:ListItem>
            <asp:ListItem>عمان</asp:ListItem>
            <asp:ListItem>قطر</asp:ListItem>
            <asp:ListItem>الإمارات العربيه المتحدة</asp:ListItem>
            <asp:ListItem>البحرين</asp:ListItem>            
            </asp:DropDownList>
            
            <asp:Button ID="btnOtherCountry_2" Style="display: none;" runat="server" Text="Fake" />              
            
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
            </tr>
           
             <tr>
            <td  style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lbl1" runat="server" Text="الجــوال"></asp:Label>
            </td>
            <td>
            <asp:UpdatePanel runat="server" id="UpdatePanel17">
            <ContentTemplate>
            <asp:TextBox ID="txtStudentMobile_2"   runat="server" Width="160px" CssClass="textback"></asp:TextBox>
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
            <td>
            <asp:UpdatePanel runat="server" id="UpdatePanel18">
            <ContentTemplate>
            <asp:TextBox ID="txtHomeTelephone_2"   runat="server" Width="160px" CssClass="textback"></asp:TextBox>
                  </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="btnCopyAddress" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            </td>
           
            </tr>
            
             <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">
            <asp:Label ID="lbl3" runat="server" Text="البريد الإكتروني"></asp:Label>
            </td>
            <td>
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
            <td>اسم شخص للاتصال<br />عليه عند الحاجه
            </td>
            <td>
            <asp:TextBox ID="txtRelativeName" runat="server" Width="145px" CssClass="textback"></asp:TextBox> 
            </td>
            </tr>
            <tr>
            <td> صلة القرابة</td>
            <td><asp:DropDownList Width="151px" ID="txtRelationship" runat="server">
            <asp:ListItem>أب</asp:ListItem>
            <asp:ListItem>أم</asp:ListItem>
            <asp:ListItem>أخ</asp:ListItem>
            </asp:DropDownList></td>
            </tr>
            <tr>
            <td>الجــوال</td>
            <td><asp:TextBox ID="txtRelativeMobile"  runat="server" Width="145px" CssClass="textback"></asp:TextBox></td>
            </tr>
            <tr>
            <td>هاتف المنزل</td>
            <td>
            <asp:TextBox ID="txtRelativePhone"  runat="server" Width="145px" CssClass="textback"></asp:TextBox>
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
            <td>اسم شخص للاتصال<br />عليه عند الحاجه
            </td>
            <td>
            <asp:TextBox ID="txtRelativeName_2" runat="server" Width="145px" CssClass="textback"></asp:TextBox> 
            </td>
            </tr>
            <tr>
            <td> صلة القرابة</td>
            <td><asp:DropDownList Width="151px" ID="cmbRelationShip_2" runat="server">
            <asp:ListItem>أب</asp:ListItem>
            <asp:ListItem>أم</asp:ListItem>
            <asp:ListItem>أخ</asp:ListItem>
            </asp:DropDownList></td>
            </tr>
            <tr>
            <td>الجــوال</td>
            <td><asp:TextBox ID="txtRelativeMobile_2"  runat="server" Width="145px" CssClass="textback"></asp:TextBox></td>
            </tr>
            <tr>
            <td>هاتف المنزل</td>
            <td>
            <asp:TextBox ID="txtRelativePhone_2"  runat="server" Width="145px" CssClass="textback"></asp:TextBox>
            </td>
            </tr>
            </table>
            </ajax:RoundedArea>
            </td>
          
            </tr>
           
            <tr>
            <td align="left"  dir="ltr">
                
                <%--Address 1--%>
                <asp:RequiredFieldValidator ID="asp_txtAddress_1_1" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtAddress_1_1">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtAddress_1_1" 
                TargetControlID="asp_txtAddress_1_1" runat="server" BehaviorID="asp_txtAddress_1_1" Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="asp_txtAddress_1_2" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtAddress_1_2">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ValidatorCalloutExtender2" 
                TargetControlID="asp_txtAddress_1_2" runat="server" BehaviorID="txtAddress_1_2"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                
                <asp:RequiredFieldValidator ID="asp_zip_1" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtZip_1">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_zip_1" 
                TargetControlID="asp_zip_1" runat="server" BehaviorID="asp_zip_1"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="asp_postal_1" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtPostal_1">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtPostal_1" 
                TargetControlID="asp_postal_1" runat="server" BehaviorID="ajax_txtPostal_1"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="asp_city_1" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtCity_1">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ValidatorCalloutExtender3" 
                TargetControlID="asp_city_1" runat="server" BehaviorID="txtCity_1_ben"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                
                <%--Address 2--%>
                
                
                 <asp:RequiredFieldValidator ID="asp_txtAddress_2_1" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtAddress_2_1">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtAddress_2_1" 
                TargetControlID="asp_txtAddress_2_1" runat="server" BehaviorID="asp_txtAddress_2_1" Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="asp_txtAddress_2_2" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtAddress_2_2">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtAddress_2_2" 
                TargetControlID="asp_txtAddress_2_2" runat="server" BehaviorID="asp_txtAddress_2_2"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                
                <asp:RequiredFieldValidator ID="asp_txtZip_2" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtZip_2">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtZip_2" 
                TargetControlID="asp_txtZip_2" runat="server" BehaviorID="ajax_txtZip_2"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="asp_Postal_2" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtPostal_2">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_Postal_2" 
                TargetControlID="asp_Postal_2" runat="server" BehaviorID="ajax_Postal_2"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                <asp:RequiredFieldValidator ID="asp_txtCity_2" ValidationGroup="Tab_3" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtCity_2">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtCity_2" 
                TargetControlID="asp_txtCity_2" runat="server" BehaviorID="asp_txtCity_2"  Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                
                
            </td>
            </tr>
            </table>
           
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel Enabled="false" ToolTip="School" HeaderText="بيانات الدراسة" runat="server" ID="Tab_3">
           
            <ContentTemplate>
             <table  width="100%" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table4">
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><asp:LinkButton ID="lnkSchoolGPA" runat="server" 
             CausesValidation="False" Visible="false" Text="Validate" OnClick="lblValidateID_Click"></asp:LinkButton><b>
             اســـم المدرســة</b></td>
            <td dir="rtl" align="right" style="font-family:Simplified Arabic;font-size: 12pt;">

            <asp:UpdatePanel runat="server" id="school_name_pnl">
            <ContentTemplate>
            <asp:TextBox ID="cmbSchoolName" ToolTip="School Name" ValidationGroup="Tab_4" runat="server" Width="160px" CssClass="textback"></asp:TextBox>            
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
            المـديـنـة</b>
            </td>
            
            <td>            
            <asp:TextBox ID="txtSchoolCountryCity" ToolTip="School City" runat="server"  ValidationGroup="Tab_4" Width="160px" CssClass="textback"></asp:TextBox>
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
             
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>الــدولـة</b>
             
             </td>
             <td>
                <asp:DropDownList Width="164px" ID="cmbSchoolCountry" ToolTip="Country" runat="server">
                
                </asp:DropDownList>
             </td>
             </tr>    
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
             تاريخ تخرجــك من الثانويــة العامة</b>
             </td>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
             <asp:TextBox ToolTip="Year" ID="txtSchoolGraduationDt" ValidationGroup="Tab_4" runat="server" Width="160px" ReadOnly="false" CssClass="textback"></asp:TextBox>
             <asp:Image ID="Image4" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />
             <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" CssClass="MyCalendar" BehaviorID="txtSchoolGraduationDt_ext"
                                 Enabled="True"  PopupButtonID="Image4" Format="dd/MM/yyyy" TargetControlID="txtSchoolGraduationDt">
                            </ajaxToolkit:CalendarExtender>
             </td>
             <td>
             </td>
             <td>
             
           
             </td>
             </tr>
             
            
            
             <tr>
             <td colspan="2" align="right">
             <table border="1" runat="server">               
                 <tr>             
             <td >&nbsp;</td>
             <td  style="text-align:center" >الدرجة الفعلية</td>
             <td align="Center">المعامل</td>
             <td align="Center">الدرجة المكافئة</td>
             </tr>
                <tr>
                    <td align="right" dir="ltr">
                        النسبة العامة
                    </td>
                    <td>
                        <asp:UpdatePanel runat="server" id="UpdatePanel3">
            <ContentTemplate>

                <asp:TextBox ID="txtGeneralPercentage" ToolTip="General %" Enabled="false" runat="server" Width="50px"></asp:TextBox>
                
                 <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server"
            TargetControlID="txtGeneralPercentage"
            Mask="99.99"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Number"
            InputDirection="RightToLeft"
            AcceptNegative="Left"
            />
            
           
            
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
                    </td>
                    
                     <td>
             <asp:TextBox ID="gpapoint" runat="server" Text="35%" Width="50px" Enabled="false"></asp:TextBox>
             </td>
             <td>
              <asp:UpdatePanel runat="server" id="UpdatePanel4">
            <ContentTemplate>

             <asp:TextBox ID="txtGPAComputed" ToolTip="Computed GPA" Enabled="false"  Width="50px" runat="server"></asp:TextBox>
              </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
             </td>
             
                </tr>
                <tr visible="false">
                <td colspan="4" align="right" dir="ltr">
                نسبة المواد العلمية
                </td>
               
                </tr>
                <tr visible="false">
                <td align="right" dir="ltr">الكيمياء</td>
                 <td >
                  <asp:UpdatePanel runat="server" id="UpdatePanel5">
            <ContentTemplate>

                <asp:TextBox id="txtChemistry_33" Enabled="false" runat="server" Width="50px"></asp:TextBox>
                 </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
                </td>
                 <td rowspan="5"><asp:TextBox ID="txtScientificPoint" runat="server" Text="25%" Width="50px"
                 Enabled="false"></asp:TextBox></td>
                
                <td rowspan="5">
                  <asp:UpdatePanel runat="server" id="UpdatePanel9">
            <ContentTemplate>
                <asp:TextBox ID="txtScintificMarksConverted" runat="server" Enabled="false"  Width="50px"></asp:TextBox>
                
                     </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
                </td>
                </tr>
                <tr visible="false">
                <td align="right" dir="ltr">الأحياء</td>
                <td>
                     <asp:UpdatePanel runat="server" id="UpdatePanel6">
            <ContentTemplate>

                <asp:TextBox id="txtBiology_32" Enabled="false" runat="server" Width="50px"></asp:TextBox>
                 </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
                </td>
                </tr>
                
                 <tr visible="false">
                <td align="right" dir="ltr">الرياضيات</td>
                <td>
                     <asp:UpdatePanel runat="server" id="UpdatePanel7">
            <ContentTemplate>

                <asp:TextBox id="txtMaths_60" Enabled="false" runat="server" Width="50px"></asp:TextBox>
                 </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
                </td>
                </tr>
                <tr visible="false">
                <td>
                الفيزياء
                </td>
                <td>
                  <asp:UpdatePanel runat="server" id="UpdatePanephy">
            <ContentTemplate>
                <asp:TextBox runat="server" Enabled="false" ID="txtPhy" Width="50px"></asp:TextBox>
                
                 </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
                </td>          
                </tr>
                 <tr visible="false">
                <td align="right" dir="ltr">اللغة الإنجليزية</td>
                <td >
                     <asp:UpdatePanel runat="server" id="UpdatePanel8">
            <ContentTemplate>

                <asp:TextBox id="txtEnglish_80" Enabled="false" runat="server" Width="50px"></asp:TextBox>
                 </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
                </td>
               
                </tr>
                
               <tr>
               <td>إختبار القدرات</td>
               <td>
                <asp:UpdatePanel runat="server" id="UpdatePanel10">
            <ContentTemplate>
               <asp:TextBox ID="txtGodarat" ToolTip="Godarat" Enabled="false" runat="server" Width="50px"></asp:TextBox>
                     </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
               </td>
               <td>
               <asp:TextBox Enabled="false" ID="txtGodaratPoint" Text="30%" runat="server" Width="50px"></asp:TextBox>
               </td>
               <td>
                 <asp:UpdatePanel runat="server" id="UpdatePanel11">
            <ContentTemplate>
               <asp:TextBox ID="txtGodaratFinal" ToolTip= "Final Godarat" runat="server" Width="50px"  Enabled="false"></asp:TextBox>
               
                     </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
               </td>
               </tr> 
               <tr>
               <td>الإختبار التحصيلي</td>
               <td>
                <asp:UpdatePanel runat="server" id="UpdatePanel12">
            <ContentTemplate>
               <asp:TextBox ID="txtKnowExam" ToolTip="Knowledge)tahseeli)" Enabled="false" runat="server" Width="50px"></asp:TextBox>
               
                </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
            
               </td>
               <td>
               <asp:TextBox ID="txtKnowPoint" runat="server" Enabled="false" Width="50px" Text="35%"></asp:TextBox>
               </td>
               
               <td>
                <asp:UpdatePanel runat="server" id="UpdatePanel13">
            <ContentTemplate>
               <asp:TextBox ID="txtFinalKnowledgeExam" ToolTip="Final Tahseeli" runat="server" Enabled="false" Width="50px"></asp:TextBox>
               
               
                     </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
               </td>
               </tr>
               <tr>
               <td ><b>الدرجة المكافئة الكلية</td>
               <td>
               &nbsp;
               </td>
               <td>&nbsp;</td>
               <td>
               <asp:UpdatePanel runat="server" id="UpdatePanel14">
            <ContentTemplate>
               <asp:TextBox ID="txtTotalConvertedMarks" ToolTip="Total" runat="server" Enabled="false"
               Width="50px" Font-Bold="true"></asp:TextBox>
                    </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger  ControlID="lnkSchoolGPA" EventName="Click" />
            </Triggers>
            </asp:UpdatePanel>
               </td>
               </tr>
               <tr>
               <td>
               <asp:UpdatePanel runat="server" id="upd_edit">
                <ContentTemplate>
                    <asp:LinkButton OnClick="EnableSchoolParam" ID="lnkSchoolEnableModify" Font-Bold="true" runat="server" Text="تعديل"></asp:LinkButton>
                 </ContentTemplate>
                 <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="lnkSchoolEnableModify" EventName="Click" />
                 </Triggers>
                 </asp:UpdatePanel>
               </td>
               <td colspan="3" >
                <asp:UpdatePanel runat="server" id="school_recalc">
            <ContentTemplate>
               <asp:LinkButton OnClick="CalculateSchoolParam" ID="HighSchoolRecalculate" Font-Bold="true" Text="حساب" runat="server"></asp:LinkButton>
               </ContentTemplate>
               </asp:UpdatePanel>
                
               </td>
               
               </tr>
             </table>
             </td>
             <td  valign="top" colspan="2" >
             <ajax:RoundedArea  Font-Bold="true" Width="270px" ID="high_school_table" runat="server">
             إن هذه البيانات الظاهرة أمامك مستقاة من قاعدة البيانات الخاصة بوزارة التربية والتعليم، في حالة وجود خطأ في هذه البيانات قم بتعديل هذا الخطأ وذلك بالضغط على زر تعديل ومن ثم الضغط على زر حساب وذلك لحساب الدرجة المكافئة الخاصة بك. مع ملاحظة أن أي تعديل على هذه البيانات سوف يكون معلوم للكلية.
             </ajax:RoundedArea>
             </td>
             </tr>
             
             
             <tr>
             <td align="left" dir="ltr" colspan="2">
                <asp:RequiredFieldValidator ID="asp_cmbSchoolName" ValidationGroup="Tab_4" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="cmbSchoolName">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_cmbSchoolName" 
                TargetControlID="asp_cmbSchoolName" runat="server" BehaviorID="asp_cmbSchoolName" Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                  
                  
                 <asp:RequiredFieldValidator ID="asp_txtSchoolCountryCity" ValidationGroup="Tab_4" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtSchoolCountryCity">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtSchoolCountryCity" 
                TargetControlID="asp_txtSchoolCountryCity" runat="server" BehaviorID="asp_txtSchoolCountryCity" Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
                  
                 <asp:RequiredFieldValidator ID="asp_txtSchoolGraduationDt" ValidationGroup="Tab_4" 
                Display="None" runat="server" ErrorMessage="*" ControlToValidate="txtSchoolGraduationDt">
                </asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" 
                WarningIconImageUrl="Images/warning.gif" ID="ajax_txtSchoolGraduationDt" 
                TargetControlID="asp_txtSchoolGraduationDt" runat="server" BehaviorID="txtSchoolGraduationDt" Enabled="True">
                </ajaxToolkit:ValidatorCalloutExtender>
             </td>
             </tr>
            
             
             
            
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel Enabled="false" ToolTip="Unviersity" HeaderText="بيانات الدراسة" runat="server" ID="Tab_4">
            <ContentTemplate>
                <table  width="100%" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table5">
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
             اسـم الجامــعة
             </td>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
             <div>
             <asp:DropDownList ToolTip="University Name" id="cmdUniversityName" Width="166px" runat="server">
             <asp:ListItem> جامعة الملك سعود</asp:ListItem>
                            <asp:ListItem> جامعة الملك فيصل</asp:ListItem>
                            <asp:ListItem> جامعة الملك خالد</asp:ListItem>
                            <asp:ListItem> جامعة أم القرى</asp:ListItem>
                            <asp:ListItem> جامعة طيبة</asp:ListItem>
                            <asp:ListItem> جامعة الطائف</asp:ListItem>
                            <asp:ListItem> جامعة الجوف</asp:ListItem>
                            <asp:ListItem> جامعة القصيم</asp:ListItem>
                            <asp:ListItem> جامعة حائل</asp:ListItem>
                            <asp:ListItem> جامعة الأمير سلطان</asp:ListItem>
                            <asp:ListItem> جامعة جازان</asp:ListItem>    
             
             </asp:DropDownList>
              <%--<cc1:ComboBox ID="1aa"  runat="server">
                            <asp:ListItem> جامعة الملك سعود</asp:ListItem>
                            <asp:ListItem> جامعة الملك فيصل</asp:ListItem>
                            <asp:ListItem> جامعة الملك خالد</asp:ListItem>
                            <asp:ListItem> جامعة أم القرى</asp:ListItem>
                            <asp:ListItem> جامعة طيبة</asp:ListItem>
                            <asp:ListItem> جامعة الطائف</asp:ListItem>
                            <asp:ListItem> جامعة الجوف</asp:ListItem>
                            <asp:ListItem> جامعة القصيم</asp:ListItem>
                            <asp:ListItem> جامعة حائل</asp:ListItem>
                            <asp:ListItem> جامعة الأمير سلطان</asp:ListItem>
                            <asp:ListItem> جامعة جازان</asp:ListItem>    
                    
             </cc1:ComboBox>--%>
                 
			</div>
             <asp:UpdatePanel ID="upd_university" runat="server">
                           <ContentTemplate>
            <%-- <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="UniversitySelected"
              Font-Names="Simplified Arabic"  ID="cmdUniversityName"  runat="server" Width="166px">
             <asp:ListItem> جامعة الملك عبدالعزيز</asp:ListItem>
                            <asp:ListItem> جامعة الملك سعود</asp:ListItem>
                            <asp:ListItem> جامعة الملك فيصل</asp:ListItem>
                            <asp:ListItem> جامعة الملك خالد</asp:ListItem>
                            <asp:ListItem> جامعة أم القرى</asp:ListItem>
                            <asp:ListItem> جامعة طيبة</asp:ListItem>
                            <asp:ListItem> جامعة الطائف</asp:ListItem>
                            <asp:ListItem> جامعة الجوف</asp:ListItem>
                            <asp:ListItem> جامعة القصيم</asp:ListItem>
                            <asp:ListItem> جامعة حائل</asp:ListItem>
                            <asp:ListItem> جامعة الأمير سلطان</asp:ListItem>
                            <asp:ListItem> جامعة جازان</asp:ListItem>    
                            <asp:ListItem>أخرى </asp:ListItem>   
             </asp:DropDownList>--%>
             
             </ContentTemplate>
              
             </asp:UpdatePanel>
             </td>
             <%--<td colspan="2" style="width:190px">
             <asp:UpdatePanel ID="upd_otherUni" runat="server">
                            <ContentTemplate> 
                                
             <asp:TextBox ID="txtOtherUniversity" Width="160px" runat="server" Visible="false" runat="server"></asp:TextBox>
               </ContentTemplate>
                                <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="cmdUniversityName" EventName="SelectedIndexChanged" />
                            </Triggers>
                            </asp:UpdatePanel> 
             </td>--%>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"></td>
             
            </tr>
            
            <tr>
            <td style="font-family:Simplified Arabic;font-size: 12pt;">التخصص</td>
            <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
           <%-- <cc1:ComboBox ID="cmbUniversitySpecility1"  runat="server">
            <asp:ListItem>علوم</asp:ListItem>
            <asp:ListItem>علوم طبية تطبيقية</asp:ListItem>
            <asp:ListItem>صيدلة</asp:ListItem>
            <asp:ListItem>طب بيطري</asp:ListItem>
            </cc1:ComboBox>--%>
            <asp:DropDownList ToolTip="Speciality" ID="cmbUniversitySpecility" Width="166px" runat="server">
            <asp:ListItem>علوم</asp:ListItem>
            <asp:ListItem>علوم طبية تطبيقية</asp:ListItem>
            <asp:ListItem>صيدلة</asp:ListItem>
            <asp:ListItem>طب بيطري</asp:ListItem>
            </asp:DropDownList>
            </ContentTemplate>
              
             </asp:UpdatePanel>
            </td>
            <td>
            &nbsp;
            </td>
            
            </tr>
            <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">الكلية المتخرج منها</td>
             <td><asp:TextBox ID="txtUniCollegeName" ToolTip="College Name" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
             </td>
             </tr>
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">المـديـنـة</td>
             <td>
                <asp:TextBox ID="txtUniCountryCityName" ToolTip="City Name" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
             </td>
             </tr>
             <tr>
             <td  dir="rtl" style="font-family:Simplified Arabic;">الــدولـة
             </td>
             <td>
             <asp:DropDownList ID="cmbUniversityCountry" ToolTip="Country Name" runat="server" Width="166px">
                <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
            <asp:ListItem>الكويت</asp:ListItem>
            <asp:ListItem>عمان</asp:ListItem>
            <asp:ListItem>قطر</asp:ListItem>
            <asp:ListItem>الإمارات العربيه المتحدة</asp:ListItem>
            <asp:ListItem>البحرين</asp:ListItem>
            
             </asp:DropDownList>
           <%-- <cc1:ComboBox ID="ww"   runat="server">
            <asp:ListItem>المملكه العربيه السعودية</asp:ListItem>
            <asp:ListItem>الكويت</asp:ListItem>
            <asp:ListItem>عمان</asp:ListItem>
            <asp:ListItem>قطر</asp:ListItem>
            <asp:ListItem>الإمارات العربيه المتحدة</asp:ListItem>
            <asp:ListItem>البحرين</asp:ListItem>
            
            </cc1:ComboBox>--%>
                         
             </td>
             </tr>
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">تاريخ الالتحاق بالجامعه
             
             </td>
             <td style="text-align: right">
             
             <asp:TextBox ID="txtGraduationYearFrom" ToolTip="Graduation Started Date" runat="server" ReadOnly="false" Width="160px" CssClass="textback"></asp:TextBox>
             <asp:Image ID="img_grad_year_from" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />
             </td>
             <td>
             <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="Calendar_xtender1"
                                 Enabled="True" CssClass="MyCalendar" PopupButtonID="img_grad_year_from" Format="dd/MM/yyyy" TargetControlID="txtGraduationYearFrom">
                            </ajaxToolkit:CalendarExtender>
             </td>
             </tr>
             <tr>
             
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
                تاريخ التخرج من الجامعه
             </td>
             <td>
                
                <asp:TextBox ID="txtGraduationYearTo" ToolTip="Graduation End date" runat="server" ReadOnly="false" Width="160px" CssClass="textback"></asp:TextBox>
                <asp:Image ID="img_grad_year_to" runat="server" ImageAlign="Middle" ImageUrl="~/Images/Calendar_scheduleHS.png" />                          
             </td>
             <td>
             <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="MyCalendar" BehaviorID="CalendarExtender2"
                                 Enabled="True" PopupButtonID="img_grad_year_to" Format="dd/MM/yyyy" TargetControlID="txtGraduationYearTo">
                            </ajaxToolkit:CalendarExtender>
             </td>
             </tr>
             
              <%--<tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;">شهادة التخصص</td>
             <td>
             <asp:TextBox ID="txtCertificateName" runat="server" Width="160px" CssClass="textback"></asp:TextBox>
             </td>
             </tr>--%>
             
            
            <tr>
            <td colspan="2"><b>حدد معدلك التراكمي أو النسبة المئوية لشهادتك الجامعية</b></td>
            </tr>
             <tr>
             <td >
             <asp:UpdatePanel ID="upd_out_of" runat="server">
             <ContentTemplate> 
             <asp:RadioButton AutoPostback="true" OnCheckedChanged="EnableGradeParam"  GroupName="rad_grade_group" 
             ID="rad_university_grad_outof" 
             runat="server" Text="المعدل التراكمي" />
            </ContentTemplate>
            </asp:UpdatePanel>
             </td>
             <td colspan="2">
             
             
             
            
             <asp:UpdatePanel ID="enable_outofButton" runat="server">
             <ContentTemplate> 
             
             <asp:TextBox ID="txtOutOfMarks" Enabled="false" Width="50px" runat="server"></asp:TextBox>
             <asp:Label ID="lblOutOf" runat="server" Text="out of" Font-Size="Small"></asp:Label>
               <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" runat="server"
            TargetControlID="txtOutOfMarks"
            Mask="9.99"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Number"
            InputDirection="LeftToRight"
            AcceptNegative="Left"
            />
            
             <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
            ControlExtender="MaskedEditExtender2"
            ControlToValidate="txtOutOfMarks"
            IsValidEmpty="False"
            MaximumValue="5" 
            EmptyValueMessage="Number is required"
            InvalidValueMessage="Number is invalid"
            MaximumValueMessage="Number > 5"
            MinimumValueMessage="Number < 0"
            MinimumValue="0"
            ValidationGroup="Demo1"
            Display="none"
            TooltipMessage="Input a valid number" />
            
            <asp:DropDownList Enabled="false" Width="54px"  ID="cmdOutOf" runat="server">
            <asp:ListItem Text="5"></asp:ListItem>
            <asp:ListItem Text="4"></asp:ListItem>
            </asp:DropDownList>
            
            <asp:Button ID="btnOutOfCalculate" OnClick="CalculateOutOfGrade"  Enabled="false"  runat="server" Text="..." />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger  ControlID="rad_university_grad_outof" EventName="CheckedChanged" />
            </Triggers>
            </asp:UpdatePanel>
             </td>
           
             </tr>
             
             <tr >
             <td style="font-family:Simplified Arabic;font-size: 12pt;">
             
              <asp:UpdatePanel ID="upd_percentage" runat="server">
             <ContentTemplate> 
             <asp:RadioButton AutopostBack="true" OnCheckedChanged="EnableGradeParam" GroupName="rad_grade_group" runat="server" ID="rad_university_grad_percentage" 
             Text="الدرجة من 100(%)" />
            </ContentTemplate>
            </asp:UpdatePanel>            
             </td>
             <td>
             <asp:UpdatePanel ID="btnCalc" runat="server">
                            <ContentTemplate> 

             <asp:TextBox ID="txtGraduateGPA_1" Enabled="false" runat="server" Width="160px"></asp:TextBox>
             
             <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server"
            TargetControlID="txtGraduateGPA_1"
            Mask="999.99"
            MessageValidatorTip="true"
            OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError"
            MaskType="Number"
            InputDirection="RightToLeft"
            AcceptNegative="Left"
            />
            
             <ajaxToolkit:MaskedEditValidator ID="MaskedEditValidator1" runat="server"
            ControlExtender="MaskedEditExtender3"
            ControlToValidate="txtGraduateGPA_1"
            IsValidEmpty="False"
            MaximumValue="100" 
            EmptyValueMessage="Number is required"
            InvalidValueMessage="Number is invalid"
            MaximumValueMessage="Number > 5"
            MinimumValueMessage="Number < 0"
            MinimumValue="0"
            ValidationGroup="Demo1"
            Display="dynamic"
            TooltipMessage="Input a valid number" />
            <asp:Button ID="btnPercentageCalculate" Enabled="false" OnClick="CalculateGrade" runat="server" Text="..." />
             </ContentTemplate>
                              
                            </asp:UpdatePanel> 
             </td>
             </tr>
             <tr>
             <td colspan="2"><b>التقدير النهائي ( يحسب تلقائياً حسب المعدل أو النسبة المئوية )</b></td>
             </tr>
             <tr>
              
             <td  dir="rtl" colspan="3">
             
             <asp:UpdatePanel ID="cal" runat="server">
                            <ContentTemplate> 

             <asp:Table   CellSpacing="1"   GridLines="Both" CellPadding="1" BorderWidth="1" runat="server" BorderStyle="Groove" ID="grade">
             <asp:TableRow id="APLUS" >
             <asp:TableCell VerticalAlign="top" Font-Size="10px"  HorizontalAlign="center" Text="English Meaning"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center" Text="Arabic Meaning"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center" Text="Points(Out of 5)"></asp:TableCell>
             <asp:TableCell VerticalAlign="top" Font-Size="10px" HorizontalAlign="center" Text="Points(Out of 4)"></asp:TableCell>
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
             <td>&nbsp;</td>
             </tr>
                    
             
            </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel ToolTip="Selection" Enabled="false" HeaderText="الخيارات الدراسية" runat="server" ID="Tab_5">
            <ContentTemplate>
            <asp:UpdatePanel ID="Choices" runat="server">
                    <ContentTemplate>
             <table  width="100%" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table6">
             
             <tr>
             <td colspan="2" >
             <ajax:RoundedArea ID="ra_choice_hlp" runat="server">
             الرجاء القيام بتحديد إختياراتك المفضلة للدراسة في كلية الطب والعلوم الطبية التطبيقية، مع ملاحظة أنه لايمكنك إختيار نفس التخصص أكثر من مرة.<br /> علماً أنك لاتستطيع الإنتقال للصفحة التالية من نظام التسجيل الإلكتروني بدون تحديد إختياراتك
             </ajax:RoundedArea>
             </td>
             </tr>
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>الإختيار الأول</b></td>
              <td style="font-family:Simplified Arabic;font-size: 12pt;">
                                <asp:DropDownList ID="cmb1" Width="270px" runat="server" OnSelectedIndexChanged="Selected" AutoPostBack="true">
                                  
                                  <asp:ListItem Text="الإختيار الأول"></asp:ListItem><%--Please Select--%>
                                  <asp:ListItem Text="كلية الطب"></asp:ListItem><%--Medicine--%>
                                  <asp:ListItem Text="علوم المختبرات الطبية"></asp:ListItem><%--LAB--%>
                                  <asp:ListItem Text="العلاج التنفسي"></asp:ListItem><%--Respiratory--%>
                                  <asp:ListItem Text="خدمات الإسعاف والطوارئ"></asp:ListItem><%--ER--%>
                                </asp:DropDownList>
                            </td>
             </tr>
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>الإختيار الثاني</b></td>
             <td>
                  <asp:DropDownList ID="cmb2" Width="270px" Enabled="false" runat="server" OnSelectedIndexChanged="Selected"  AutoPostBack="true">
                                   <asp:ListItem Text="الإختيار الثاني"></asp:ListItem>
                                  <asp:ListItem Text="كلية الطب"></asp:ListItem>
                                  <asp:ListItem Text="علوم المختبرات الطبية"></asp:ListItem>
                                  <asp:ListItem Text="العلاج التنفسي"></asp:ListItem>
                                  <asp:ListItem Text="خدمات الإسعاف والطوارئ"></asp:ListItem>
                                </asp:DropDownList>
             </td>
             </tr>
             <tr>
             <td style="font-family:Simplified Arabic;font-size: 12pt;"><b>الإختيار الثالث</b></td>
             <td>
                 <asp:DropDownList ID="cmb3" Width="270px" Enabled="false" runat="server" OnSelectedIndexChanged="Selected"  AutoPostBack="true">
                                  <asp:ListItem Text="الإختيار الثالث"></asp:ListItem>
                                  <asp:ListItem Text="كلية الطب"></asp:ListItem>
                                  <asp:ListItem Text="علوم المختبرات الطبية"></asp:ListItem>
                                  <asp:ListItem Text="العلاج التنفسي"></asp:ListItem>
                                  <asp:ListItem Text="خدمات الإسعاف والطوارئ"></asp:ListItem>
                                </asp:DropDownList>
             </td>
             </tr>
             <tr>
             <td></td>
             <td>
             <asp:Button ID="btnClear" runat="server" CausesValidation="false" Text="إعادة الإختيار" OnClick="ResetValues" 
                        BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="small" ForeColor="#284E98" Font-Bold="False"  />
                <span style="font-weight:bold"  class="VEKeyword"  poptext="في حالة رغبتك إعادة الإختيار. قم بالضغط على زر <b> إعادة الإختيار </b> وسيقوم النظام بشكل تلقائي بمسح جميع إختياراتك السابقة.">?</span>
             </td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             <tr>
             <td>&nbsp;</td>
             </tr>
             
             <tr>
             <td>&nbsp;</td>
             </tr>
             
             
             <tr>
             <td>&nbsp;</td>
             </tr>
             
             
             <tr>
             <td>&nbsp;</td>
             </tr>
             
             
             
             
             </table>
              </ContentTemplate>
                          <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="btnClear" EventName="Click" />
                          </Triggers>
                        
                    </asp:UpdatePanel>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            
            <ajaxToolkit:TabPanel HeaderText="تحميل المستندات" runat="server" ID="Tab_6">
            <ContentTemplate>
             <table  width="100%" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table7">
             <tr>
             <td colspan="4" style="font-family:Simplified Arabic;font-size: 12pt;">
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
             <td  style="width:140px">
                                
								<input class="textback" type="file"  id="htmlIFImage" runat="server"  />
								
								</td>
                                <td >
                                    <asp:TextBox ID="TextBox9" runat="server" ></asp:TextBox></td>
               
				
             </td>
             </tr>             
             <tr>              
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>البطاقة الشخصية</b>
                             
				</td>
								<td >
									<input class="textback" type="file" id="htmlIFImage1" runat="server"  />
								</td>
                                <td >
                                    <asp:TextBox ID="TextBox4"  runat="server" ></asp:TextBox></td>
							</tr>
							
							<tr>
                                
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>شهادة الثانوية العامة</b>
                               
				</td>
								<td >
									<input class="textback" type="file" id="htmlIFImage2" runat="server"  />
								</td>
                                <td >
                                    <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox></td>
							</tr>	
							<tr>
                               
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>شهادة البكالوريوس</b>
				</td>
								<td >
									<input  type="file" id="htmlIFImage3" runat="server"  />
								</td>
                                <td >
                                    <asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox></td>
							</tr>
							
							
							<tr>
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
							نتيجة إختبار القدرات </b>
							</td>
							<td>
							    <input class="textback" type="file" id="UploadAptitude" runat="server"  />
							</td>
							<td >
                                    <asp:TextBox ID="txtAptitudeRemarks" runat="server" ></asp:TextBox></td>
							<td>
							
							</td>
							</tr>
							
							<tr>
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>
							نتيجة الإختبار التحصيلي </b>
							</td>
							<td>
							    <input class="textback" type="file" id="UploadNAT" runat="server"  />
							</td>
							<td >
                                    <asp:TextBox ID="txtNATRemarks" runat="server" ></asp:TextBox></td>
							<td>
							
							</td>
							</tr>
							
							<tr>
							<td style="font-family:Simplified Arabic;font-size: 12pt;"><b>أخرى</b></td>
							
							 <td >
                                    <input class="textback" type="file" id="File2" runat="server"  /></td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" ></asp:TextBox></td>
                                    
							</tr>
							<tr>
							<td><b>أخرى</b>
							
							</td>
							<td> <input  type="file" id="htmlIFImage6" runat="server"  /></td>
							
							<td><asp:TextBox ID="TextBox8" runat="server"  CssClass="textback"></asp:TextBox></td>
							</tr>
                            
             </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel HeaderText="اسم المستخدم" runat="server" ID="Tab_Login">
                <ContentTemplate>
                <table  width="100%" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table8">
                    <tr>
                        <td colspan="3" style="font-family:Simplified Arabic;font-size: 12pt;">
                        <ajax:RoundedArea runat='server' ID="email"><b>
                        في هذه الصفحة ستقوم بتكوين إسم مستخدم وكلمة مرور خاصة بنظام التسجيل الإلكتروني، وذلك لتتمكن من إستخدام النظام مرة ً أخرى في المستقبل لغرض متابعة حالة طلبك أو تحديث المعلومات الخاصة بك.
                        <br />ملاحظة: يمكنك إستخدام البريد الإلكتروني الذي قمت بإدخاله كإسم مستخدم وفي حالة عدم رغبتك بذلك قم بإدخال إسم المستخدم المناسب.</ajax:RoundedArea>
                        </b>
                        </td>
                    </tr>
                     <tr >
                        <td id="Td1"  style="font-family:Simplified Arabic;font-size: 12pt;">إسم المستخدم</td>
                        <td>
                            <asp:TextBox ID="txtEMailII" ValidationGroup="Tab_Login"  MaxLength="25" Width="160px" runat="server"></asp:TextBox>
                          
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr >
                        <td id="password"  style="font-family:Simplified Arabic;font-size: 12pt;">كلمـة المرور</td>
                        <td>
                            <asp:TextBox ID="txtPassword"  ValidationGroup="Tab_Login" MaxLength="10" TextMode="password" CssClass="textback" Width="160px" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>


                    <tr >
                        <td id="retypepwd"  style="font-family:Simplified Arabic;font-size: 12pt;">تأكيد كلمـة المرور</td>
                        <td>
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
                                 
                        <asp:LinkButton ID="email_validate" OnClick="CheckLogin" Font-Bold="true" runat="server" Text="تحقق من إمكانية إستخدام إسم المستخدم الذي قم بإدخاله" CausesValidation="false"></asp:LinkButton>
                        
                         </ContentTemplate>
                             <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="email_validate" EventName="Click" />
                            </Triggers>
                             </asp:UpdatePanel>
                             
                        </td>
                    </tr>
                    <tr>
                        <td> <asp:UpdatePanel ID="upd_login_stat" runat="server">
                                 <ContentTemplate>
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
                    <tr>
                        <td align="left" dir="ltr">
                        
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="Tab_Login" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtEMailII"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ValidatorCalloutExtender4" 
            TargetControlID="RequiredFieldValidator1" runat="server" BehaviorID="txtEMailII" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>--%>
            
            
             <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEMailII"
                            ErrorMessage="Invalid" Display="None"  ValidationGroup="Tab_Login" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                             
             <ajaxToolkit:ValidatorCalloutExtender WarningIconImageUrl="Images/warning.gif"  ID="ValidatorCalloutExtender5" runat="server"
             TargetControlID="RegularExpressionValidator1" BehaviorID="txtEMailII_ext" CloseImageUrl="Images/Reject.gif" Enabled="True" 
             ></ajaxToolkit:ValidatorCalloutExtender>--%>
             
             
                        <asp:RequiredFieldValidator ID="asp_txtPassword"  ValidationGroup="Tab_Login" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender  CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtPassword" 
            TargetControlID="asp_txtPassword" runat="server" BehaviorID="asp_txtPassword" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
              
             <asp:RequiredFieldValidator ID="asp_txtRetypePWD"  ValidationGroup="Tab_Login" Display="None" runat="server" ErrorMessage="*" 
            ControlToValidate="txtRetypePWD"></asp:RequiredFieldValidator>
            
            <ajaxToolkit:ValidatorCalloutExtender CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_txtRetypePWD" 
            TargetControlID="asp_txtRetypePWD" runat="server" BehaviorID="ajax_txtRetypePWD" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
            
            <asp:CompareValidator ID="asp_compare_pwd"  ValidationGroup="Tab_Login" runat="server" ControlToValidate="txtRetypePWD"  
            ControlToCompare="txtPassword" Display="none" ErrorMessage="Password does not match">
            
            </asp:CompareValidator>
            
            
            <ajaxToolkit:ValidatorCalloutExtender  CloseImageUrl="Images/Reject.gif" WarningIconImageUrl="Images/warning.gif" 
            ID="ajax_pwd_match" 
            TargetControlID="asp_compare_pwd" runat="server" BehaviorID="asp_compare_pwd" Enabled="True">
            </ajaxToolkit:ValidatorCalloutExtender>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>                
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ToolTip="Summary report" Enabled="false" HeaderText="إتمام التسجيل"  runat="server" ID="Tab_7">
            <ContentTemplate> 
            <FTB:FreeTextBox  	toolbarlayout="Preview,Print" id="txtSummary" Width="100%" Height="300px" TextDirection="RightToLeft"
			
			runat="Server" 
			
			DesignModeCss="designmode.css"		 
			/>
			
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel Enabled="false" ID="tab_status" HeaderText="status" runat="server">
            <ContentTemplate>
                 <table  width="100%" style="background: #F9F9F8 url(app_themes/Green/images/background_user_assist.jpg) repeat-x top;" runat="server" id="table10">
                    <tr>
                        <td style="font-family:Simplified Arabic;font-size: 12pt;">
                        <ajax:RoundedArea runat='server' ID="RoundedArea6"></ajax:RoundedArea>
                        
                        </td>
                    </tr>
                    </table>
            </ContentTemplate>
            </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
            
	   
				</fieldset>
			</div>
		</div>
	</div>
	
	    <asp:Button ID="Button1" Style="display: none;" runat="server" Text="Fake" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" runat="server" 
            TargetControlID="Button1"  PopupControlID="Panel1" 
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
                <div style="text-align:center;"><asp:Button ID="Button2" runat="server" Text="OK"  /></div>
            </asp:Panel>
	
<div id="buttonID" runat="server" align="center">
  
    
      
        <asp:ImageButton ID="btn_save" OnClick="Actioned" Enabled="false"  ImageUrl="Images/save button.jpg" runat="server"  />
        <asp:ImageButton ID="btn_next_stage" Enabled="false" OnClick="Actioned"   ImageUrl="Images/next button.jpg" runat="server"  />
        <asp:ImageButton ID="btn_previous_stage" OnClick="Actioned"  ImageUrl="Images/previous button.jpg" runat="server"  />
        
        <asp:ImageButton id="btn_cancel_stage" PostBackUrl="~/login.aspx" ImageUrl="Images/cancel button2.jpg" CausesValidation="false"  runat="server"  />    
  
        </div>
 
</asp:Content>


