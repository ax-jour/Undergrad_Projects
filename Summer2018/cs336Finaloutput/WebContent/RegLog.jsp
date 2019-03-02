
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HEFAuc BuyME</title>
</head>
<body>
Welcome to HEFAuc BuyME! <!-- the usual HTML way -->
<br>
<br>
- I already have an account!
<br>
	<form method="post" action="check_loginDetails.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username" maxlength=20></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password" maxlength=20></td>
	</tr>
	</table>
	<input type="submit" value="Log in"> <button type="button" onclick="javascript:history.back()">Back</button>
	</form>
	
<br>
<br>
- I want to create an account!
<br>
<form method="post" action="create_cusAcct.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username" maxlength=20></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password" maxlength=20></td>
	</tr>
	</table>
	<input type="submit" value="Create account"> <button type="button" onclick="javascript:history.back()">Back</button>
	</form>

</body>
</html>