<%@ page language="java" contentType="text/text; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ page import="javax.xml.transform.*"%>
<%@ page import="javax.xml.transform.stream.*"%>
<%
  String url = request.getScheme() + "://" + request.getServerName()
    + ":" + request.getServerPort() + request.getContextPath();

  String service = request.getParameter("service");
  if ((service != null) && (!service.startsWith("/")))
	  url += "/";
  url += service;

  ServletContext ctx = pageContext.getServletContext();

  String xsdlFile = ctx.getRealPath("ajaxcore/wsdl.xslt");

  TransformerFactory tFactory = TransformerFactory.newInstance();

  Transformer transformer = tFactory.newTransformer(new StreamSource(
		  xsdlFile));
  transformer.transform(new StreamSource(url), new StreamResult(out));

  // http://localhost:8080/AJAXEngine/sample1/x.jsp
  // http://localhost:8080/AJAXEngine/services/Calc?wsdl
  // http://localhost:8080/AJAXEngine/sample1/CalcService.jws?wsdl
%>
