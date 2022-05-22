<%@ Page Language="C#" AutoEventWireup="true" CodeFile="high_school.aspx.cs" Inherits="high_school" %>

<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>الشروط والقوانين</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="mathertel.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/default.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/spread.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/mac_os_x.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alert_lite.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/alphacube.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/darkX.css" rel="stylesheet" type="text/css" />
    <link href="css/themes/nuncio.css" rel="stylesheet" type="text/css" />

</head>
<body dir="rtl"  >
<form id="frmRegistration" runat="server">
 <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
<table  width="100%" id="tb" runat="server">
<tr>
<td>&nbsp;&nbsp;&nbsp;&nbsp;
</td>

<td >
	<%--<ajaxToolkit:Accordion  ID="Accordion1" runat="server" SelectedIndex="0"
            HeaderCssClass="accordionHeader"  ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" RequireOpenedPane="true"  SuppressHeaderPostbacks="true">
           <Panes>
           <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                <Header><b>شريط التصفح</b></Header>
                <Content>   
                   <span style="font-family:Tahoma;font-size:smaller">
                   شروط وتعليمات القبول الخاصة بكلية الطب والعلوم الطبية التطبيقية بجامعة الملك سعود بن عبدالعزيز للعلوم الصحية لطلبة الثانوية العامة:<br />
                   </span>
                </Content>
                </ajaxToolkit:AccordionPane>
             </Panes>         
            
        
       
        
        </ajaxToolkit:Accordion>--%>
        
        <ajaxToolkit:Accordion  ID="Accordion2" runat="server" SelectedIndex="0"
            HeaderCssClass="dialog_content"  ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" RequireOpenedPane="true"  SuppressHeaderPostbacks="true">
           <Panes>
             
             <ajaxToolkit:AccordionPane  ContentCssClass="dialog_content" ID="AccordionPane3" runat="server">
           
             <Header> <b> <font style="font-size:large;font-family:Traditional Arabic;font-weight:bold">
             <center>
             عمادة القبول والتسجيل
             </center>
             <br />
             <font size="4">
    شروط القبول:</font></font></b></Header>
    <Content>
        <span style="font-family:Tahoma;font-size:small">
        
•	أن يكون المتقدم سعودي الجنسية.
    <br />
•	يفضل ألا يقل المعدل التراكمي للمتقدمين عن 3.5 من خريجي كلية الطب.
    <br />
•	ألا يقل المعدل التراكمي لبقية المتقدمين من التخصصات الصحية الأخرى عن جيد جداً 3.75.
    <br />
•	إجـادة اللغة الإنجليزية
    <br />
•	 أن يكمل المتقدم إستمارة طلب الإلتحاق مرفقاً المستندات التالية:
    <br />
    ـ  موافقة خطية من جهة العمل على الدراسة لمدة سنتين أكاديميتين.
    <br />
ـ  صورة من الشهادات الجامعية أو وثائق التخرج مع إحضار الأصل للمطابقة عند الحضور للمقابلة الشخصية.
    <br />
    ـ 	صورة مصدقة من السجل الأكاديمي للمتقدم. 
    <br />
    ـ 	صورة البطاقة الشخصية مع إحضار الأصل للمطابقة.
    <br />
    ـ 	3 صور شخصية ملونة مقاس 4*6.



        </span>
    </Content>
             </ajaxToolkit:AccordionPane>
             </Panes>
           </ajaxToolkit:Accordion>
        
         <ajaxToolkit:Accordion  ID="Accordion3" runat="server" SelectedIndex="0"
            HeaderCssClass="dialog_content"  ContentCssClass="accordionContent"
            FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250"
            AutoSize="none" RequireOpenedPane="true"  SuppressHeaderPostbacks="true">
          
          <Panes>
       <ajaxToolkit:AccordionPane ID="id_3" ContentCssClass="dialog_content" runat="server">
       <Header><b><font style="font-size:large;font-family:Traditional Arabic;font-weight:bold">
       <hr />
الأنظمة المتعلقة بالقبول:
   </font></b></Header>
   
   <Content>
   <span style="font-family:Tahoma;font-size:small">
•	 يجب على المتقدمين التقديم عن طريق موقع الجامعة على الإنترنت بعد تعبئة الاستمارة الخاصة بذلك في الموقع.    
        <br />
•	 على المتقدمين الاطلاع على نظم ولوائح الجامعة وقراءتها بدقة حتى يكون على إلمام كامل بها قبل الشروع في تعبئة بيانات طلب التقديم.
    <br />
•	  التقديم عن طريق موقع الجامعة الإلكتروني لايضمن لك القبول بالبرنامج.
    <br />
•	  يرتبط القبول بتوفر المقاعد المتاحة لبرنامج الماجستير في التعليم الطبي والمفاضلة بين المتقدمين حسب شروط القبول والمقابلة الشخصية.
    <br />
•	 غياب المتقدم/المتقدمة عن استكمال أي إجراء من إجراءات التقديم يخرجه من المنافسة.
    <br />
•	 تُنشر النتائج النهائية للقبول على موقع الجامعة بالإنترنت وموقع التسجيل الإلكتروني، يمكن للمتقدم/المتقدمة من خلال إستخدام إسم المستخدم وكلمة المرور من متابعة نتيجة التقديم( القبول من عدمه )  أو عن طريق البريد الإلكتروني.
    <br />
•	 يكتب الاسم كاملاً باللغة العربية مطابقًا لشهــادة البكالورويس.
    <br />
•	 بعد استدعاء المتقدم/المتقدمة للمقابلة الشخصية سيطلب منه مطابقة الوثائق الاصلية وتسليم الشهادة الاصلية.
        <br />
•	 التأكد من الوثائق المطلوبة كاملة بعد استدعاء المتقدم/المتقدمة للمقابلة الشخصيه.

    

                     </span>
                     <div dir=ltr>
                     <font style="font-size:large;font-family:Traditional Arabic;font-weight:bold">
                     <b>
                     عميد القبول والتسجيل
                     <br />
                     أ.د. علي سليمان التويجري
                     </b>
                     
                     </font>
                     </div>
   </Content>
       </ajaxToolkit:AccordionPane>
       </Panes>
           </ajaxToolkit:Accordion>
           
            
          
</td>
</tr>

</table>
</form>
</body>
</html>
