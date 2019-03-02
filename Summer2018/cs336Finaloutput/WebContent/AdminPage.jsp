<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminManage</title>
</head>

<body>
<h1><% out.println("Administrator Management Page"); %></h1>

<%-- Current Date time --%>
<%	Date date = new Date();
	out.print( "<h2 align = \"center\">" +date.toString()+"</h2>");%>
<h4><% out.println("Hello Admin!"); %></h4>

<%-- Redirect to Customer Representative Page --%>
<form method="post" action="CRacct.jsp">
	Customer Representative Management Page
	<input type="Submit" value="Go to"/>
</form>

<%-- Redirect to Sales Reports Page --%>
<form method="post" action="salesReport.jsp">
	Sales Report Page
	<input type="Submit" value="Go to"/>
</form>
<br>

<%-- Logout --%>
<form method="post" action="logout.jsp"> 
	<input type="Submit" value="Logout"/>
</form>
</body>

</html>