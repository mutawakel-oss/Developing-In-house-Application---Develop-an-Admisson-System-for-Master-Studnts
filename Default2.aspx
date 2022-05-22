<%@ Page Language="C#"  CodeFile="Default2.aspx.cs" Inherits="Default2" %>
<%@ Register Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">




<head id="Head1" runat="server">   
</head>

<body  style="font-size:15pt; font-family: Simplified Arabic; background-color:White;">    
   <form id="form1" runat="server">    
   <asp:HiddenField ID="HIDD_ID" runat="server" />         
   <br />         
   &nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp&nbsp;&nbsp   
   <input type="image" id="imgPrint" src="Images/print.jpg" runat="server" onclick="window.print()" />
   <hr />
   <div id="divLogo" align="center" runat="server" style="background-color:White" >
   <asp:Image ImageUrl="~/Images/KSAUHSLogo.jpg" ID="imgLogo" runat="server" /> 
   </div> 
   <div align='center' dir="rtl" style="font-family:Simplified Arabic" style="background-color:White">
   <asp:Label ID="lblInfo" runat="server" Visible ="true" Font-Size="Small"></asp:Label>       
    <%--<FCKeditorV2:FCKeditor  FullPage="false"  FontNames="Simplified Arabic" id="FCKeditor1" Width='900px'  Height="800px" 
     ContentLangDirection="rightToLeft" ToolbarStartExpanded="true" BasePath="~/FCKeditor/" runat="server" EnableXHTML="false" >        
    </FCKeditorV2:FCKeditor>--%>
    </div>
    
    <br />
    
    
    </form>
</body>
</html> 


