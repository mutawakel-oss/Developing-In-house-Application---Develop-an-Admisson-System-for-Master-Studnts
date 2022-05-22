<%@ Control Language="C#" %>

<%// UI for the control %>
<h3>Books:</h3>
  <div id="<%=this.ID %>" style="border:solid 1px green;height:40px"></div>

<%// setup then AJAX WebPart connections for the control %>
  <script type="text/javascript">
    obj = document.getElementById("<%=this.ID %>");
    obj.GetValue = function (prop, value) {
      this.innerText = "Books by " + value;
    }
    jcl.DataConnections.RegisterConsumer(obj, "Author");
  </script>

