<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AuctionRetrieve</title>
</head>
<body>

<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		String kWord = request.getParameter("Keyword");
		String auctionNo = request.getParameter("auctionNo");
		String sTime = request.getParameter("startTime");
		String eTime = request.getParameter("endTime");
		String pDate = request.getParameter("createTime");

		String str = "SELECT * FROM auction WHILE";
		ResultSet result = stmt.executeQuery(str);

		out.print("<table>");

		out.print("</table>");
		db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
%>
</body>

</body>
</html>