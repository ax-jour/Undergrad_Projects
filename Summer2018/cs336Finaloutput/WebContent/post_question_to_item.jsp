<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Service Contact Form</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in.<br/>
<a href="RegLog.jsp">Please Login</a>
<%} else {
%>
	<%=session.getAttribute("user")%>, what do you want to ask about this item? 
	<form action="question_item.jsp">
	<table>
	<tr><td>Question:</td><td><textarea rows='5' cols='50' name="question" maxlength='499' required></textarea></td>
	</tr>
	</table>
	<input type="reset" value="Reset"> <input type="submit">
			<button type="button" onclick="javascript:history.back()">Back</button>
	</form>
	<a href='logout.jsp'>Log out</a>
	<%} %>
</body>
</html>