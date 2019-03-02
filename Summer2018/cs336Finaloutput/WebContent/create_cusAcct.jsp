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
	try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		
		String userid = request.getParameter("username");
		String pwd = request.getParameter("password");
		Calendar dt = Calendar.getInstance();
		java.sql.Timestamp ts = new java.sql.Timestamp(dt.getTimeInMillis());
		
		String insert = "INSERT INTO users(username, upassword, d_o_r, user_type)" + " VALUES (?, ?, ?, 'customer')";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setString(1, userid);
		ps.setString(2, pwd);
		ps.setTimestamp(3, ts);
		ps.executeUpdate();
		con.close();

		session.setAttribute("user",userid);
		response.sendRedirect("loginSuccess.jsp");
		
			} catch (Exception ex) {
		out.println("Invalid username or password <a href='RegLog.jsp'>try again</a>"); 
			}
		%>
</body>
</html>