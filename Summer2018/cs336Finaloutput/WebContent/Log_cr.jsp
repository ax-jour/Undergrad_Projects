<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log-in Form</title>
</head>
<body>
Admin Log-In
<br>
	<form method="post" action="check_admin_loginDetails.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username" maxlength=20></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password" maxlength=20></td>
	</tr>
	</table>
	<input type="submit" value="Log in">  <button type="button" onclick="javascript:history.back()">Back</button>
	</form>
<br>
Staff Member Log-In
<br>
	<form method="post" action="check_cr_loginDetails.jsp">
	<table>
	<tr>    
	<td>Username</td><td><input type="text" name="username" maxlength=20></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password" maxlength=20></td>
	</tr>
	</table>
	<input type="submit" value="Log in">  <button type="button" onclick="javascript:history.back()">Back</button>
	</form>
<br>

		
</body>
</html>