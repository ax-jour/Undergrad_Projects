<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>illegal Report</title>
</head>


<body>

<h2>Report illegal Auction from Users</h2>
<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "SELECT * FROM auction where illegal = '1' ";
		ResultSet result = stmt.executeQuery(str);
			
        out.print("<table border='1'>");
		out.print("<tr>");
		out.print("<td>");
		out.print("<h4>Auction No.</h4>");
		out.print("</td>");
		out.print("</tr>");

        while (result.next()){
        	out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("auctionNo"));
			out.print("</td>");
			out.print("</tr>");
        }
        out.print("</table>");
        
        		
		db.closeConnection(con);
		
	} catch (Exception e) {
		out.print(e);
	}
		
%>
<br>
<%-- Back to previous page --%>
	Back to Previous Page
	<button type="button" name="back2" onclick="history.back()">back</button>
<br>

</body>
</html>