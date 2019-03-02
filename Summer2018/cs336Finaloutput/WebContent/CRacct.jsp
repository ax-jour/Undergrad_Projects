<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Representative Mgm Page</title>
</head>

<body>
<h3><% out.println("Customer Representative Management Page"); %></h3>
<%-- Create new customer representative --%>
<form method="post" action="createAcct.jsp"> 
	<h4>Create a Customer Representative account</h4>
	Create an username:
	<input type="text" name="username"/>Do not exceed 20 characters!
	<br>
	Create a password:
	<input type="password" name="password"/>Do not exceed 20 characters!
	<br>
	<input type="submit" value="Create" name="create"/>
	<input type="reset" value=" Reset " name="reset"/>
</form>

<%-- Delete new customer representative --%>
<form method="post" action="deleteCR.jsp">
	<h4>Delete registered Customer Representative</h4>
	Please enter customer representative's username:
	<input type="text" name="username"/>
	<br>
	<input type="submit" value="Delete" name="delete"/>
</form>
<br>

<%-- Show registered customer representatives --%>
<form method="post" action="retrieveCR.jsp">
	<h4>Check registered customer representatives</h4>
	<input type="submit" value="Show" name="check"/>
	<br>
</form>
<br>

<%-- Back to previous page --%>
	Back to Previous Page
	<button type="button" name="back2" onclick="history.back()">back</button>
<br>

</body>
</html>