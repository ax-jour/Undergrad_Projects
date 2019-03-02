<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Answer</title>
</head>
<body>
Before we get someone to help you...
<br>
<br> Could you tell us about something about your question?
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="RegLog.jsp">Please Login</a>

<%} else {
%>

	<form action="searchRresult_crQuestion.jsp">
	<table>
	<tr>
	<td>Keyword:</td><td><textarea rows='1' cols = '30' name="keyword" maxlength='49'></textarea></td>
	</tr>
	
	</table>
	<input type="submit"> <button type="button" onclick="javascript:history.back()">Back</button>
	</form>
	
	<br>
	<br>
	<form method="post" action="searchRresult_crQuestion.jsp">
		<input type="submit"  
			value="I just want to browse.">
	</form>
	<br><br>
	<form method="post" action="post_question_to_cr.jsp">
		<input type="submit"
			value="I want to find someone to help me.">
	</form>
	<br>
	<a href='logout.jsp'>Log out</a>
	
	<%} %>
</body>
</html>