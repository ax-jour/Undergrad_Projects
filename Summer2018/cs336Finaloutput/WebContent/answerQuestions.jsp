<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
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
		String ans = request.getParameter("answer");
		String qId = request.getParameter("qID");
		
	
		String update = "UPDATE cr_questions SET answer= '"+ans+"', cr_id= 1 WHERE qID= '"+qId+"'";

		PreparedStatement ps = con.prepareStatement(update);
		ps.executeUpdate(); 
		
		con.close();
		out.print("Answer Recorded");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>Answer failed");
	}
%>
</body>

</body>
</html>