<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report Page</title>
</head>

<body>
<h2><% out.println("Sales Report Request Page"); %></h2>
<h4><% out.println("Hello Admin!"); %></h4>

<form method="post" action="sales.jsp">
	Check specific sales report<br>
	<%--
	Enter report's date:
	<input type="text" name="reportDate"/>
	<br>
	--%>
	Enter report's id:
	<input type="text" name="reportID"/>
	<br>
	<input type="submit" value="Search"/>
</form>
<br>
	Back to Previous Page
	<button type="button" name="back2" onclick="history.back()">back</button>
<br>

</body>
</html>