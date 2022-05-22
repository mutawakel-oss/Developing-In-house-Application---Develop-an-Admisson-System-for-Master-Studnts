<%@ Control Language="C#" ClassName="Mathertel.Controls.Title" %>
<div style="background-color:#dddddd;padding:2px;height:32px;overflow:hidden">
  <a href="/" style="float: left; margin-right: 4px">
    <img src='<%=Page.ResolveClientUrl("~/images/home.png") %>' alt="Homepage" /></a>
    <a href="/AJAXEngine/" style="float: left; margin-right: 4px">
      <img src='<%=Page.ResolveClientUrl("~/images/ajax.png") %>' alt="AJAX engine framework" /></a>
  <h1><%=Page.Title %></h1>
</div>
