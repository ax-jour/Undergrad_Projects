<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!</title>
</head>
<body>

<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="RegLog.jsp">Please Login</a>
<%} else {
%>
Welcome!
	<br>
	<br>
	<form method="post" action=itemList.jsp>
		<input type="submit"
			value="I want to discover something!">
	</form>
	<br>
	<form method="post" action="create_item.jsp">
		<input type="submit" name="command"
			value="I want to sell some stuffs!" />
	</form>
	<br>
	<form method="post" action="search_questions_cr.jsp">
		<input type="submit" name="command"
			value="I need some help!" />
	</form>
	<br>
	<form method="post" action="msgBox_cus.jsp">
		<input type="submit" name="command"
			value="I want to check my messages." />
	</form>
	<br>
	 <%=session.getAttribute("user")%>  <!-- //this will display the username that is stored in the session. -->
<a href='logout.jsp'>Log out</a>
<%
    }
%>
</body>
</html>