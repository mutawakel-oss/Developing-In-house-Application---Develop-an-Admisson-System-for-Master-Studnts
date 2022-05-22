<%@ Control Language="C#" AutoEventWireup="false"%>


<%// UI for the control %>
<h3>Details:</h3>
  <div id="<%=this.ID %>" style="border:solid 1px blue;height:120px">Details:</div>

<%// setup then AJAX WebPart connections for the control %>
  <script type="text/javascript">
    obj = document.getElementById("<%=this.ID %>");
    obj.GetValue = function (prop, value) {
      this.innerText = "Details of " + value + "\nProfession: Writer";
    }
    jcl.DataConnections.RegisterConsumer(obj, "Author");
  </script>
