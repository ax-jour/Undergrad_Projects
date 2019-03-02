<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Accounts</title>
</head>
<body>
	<%
		String userid = request.getParameter("username");
		String pwd = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://hefauc.cjyxrm2iq20k.us-east-2.rds.amazonaws.com:3306/hefauc", "Natsu", "TheMeme0731");

		String insert = "INSERT INTO users(username, upassword, user_type)" + "VALUES (?, ?, 'cr')";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, userid);
		ps.setString(2, pwd);
		ps.executeUpdate();
		con.close();

		out.println("Success");
		out.println("<a href='logout.jsp'>Log out</a>");
		/* 
			} catch (Exception ex) {
		out.println("Invalid username or password <a href='RegLog.jsp'>try again</a>"); */
	%>
</body>
</html>