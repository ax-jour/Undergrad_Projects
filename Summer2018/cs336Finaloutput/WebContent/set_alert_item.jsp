<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set alert for auction</title>
</head>
<body>
	<%
	try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		
		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String cus_id = session.getAttribute("user").toSting();
		int auc_id = Integer.parseInt(session.getAttribute("auctionID"));

		Calendar dt = Calendar.getInstance();
		java.sql.Timestamp ts = new java.sql.Timestamp(dt.getTimeInMillis());


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO alert_for_item(username, itemNo, alert_at) " + "values(?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, cus_id);
		ps.setInt(2, auc_id);
		ps.setTimestamp(3, ts);
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.print("Post alert Succeed.");
		session.removeAttribute("auctionID");
		response.sendRedirect("loginSuccess.jsp");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Post alert failed, please try again.");
	}
%>
</body>
</html>