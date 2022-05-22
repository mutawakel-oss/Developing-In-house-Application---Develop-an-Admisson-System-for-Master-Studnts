<%@ Control Language="C#" AutoEventWireup="false" %>
<%// UI for the control %>

<div id="<%=this.ID %>" style="border: solid 1px blue; height: 240px; overflow: hidden">
  <h3 style="margin-bottom: 0px">Event Log:</h3>
</div>

<script type="text/javascript">
    obj = document.getElementById("<%=this.ID %>");
    obj.GetValue = function (prop, value) {
      var p = window.document.createElement("div");
      this.appendChild(p);
      p.innerText = prop + ":" + value;
      
      if (this.childNodes.length > 14)
        this.removeChild(this.childNodes[1]);
    } // GetValue
    jcl.DataConnections.RegisterConsumer(obj, "*");
  </script>
