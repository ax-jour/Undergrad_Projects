<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create</title>
</head>
<body>

<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();	
		String uName = request.getParameter("username");
		String passWord = request.getParameter("password");
		
		String insert = "INSERT INTO users(username,upassword,user_type)"
				+ "VALUES (?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, uName);
		ps.setString(2, passWord);
		ps.setString(3,"cr");
		ps.executeUpdate();
		
		con.close();
		out.print("Insert succeeded");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
</body>

</body>
</html>