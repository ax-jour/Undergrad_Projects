<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid Histotry</title>
</head>
<body>

		<button type="button" onclick="javascript:history.back()">Back</button>
	
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			/* 
			String s = "1";
			session.setAttribute("auctionID", s); */
			String auctionID = (String)session.getAttribute("auctionID");
			int aucID = Integer.parseInt(auctionID);
			String bstr;
			ResultSet bres;
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM buyer_bidFor_auction where auctionNo = "+auctionID+" group by bidID desc;";
			int bidID;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table class=\"sortable\">");

			//make a row
			out.print("<thead>");
			out.print("<tr>");
			//user name
			out.print("<th width=\"20%\">");
			out.print("User");
			out.print("</th>");
			//bid time
			out.print("<th width=\"20%\">");
			out.print("Bid time");
			out.print("</th>");
			//bid price
			out.print("<th width=\"20%\">");
			out.print("Price");
			out.print("</th>");
			
			//
			out.print("</tr>");
			out.print("</thead>");

			//parse out the results
			while (result.next()) {
				out.print("<tbody>");
				out.print("<tr>");
				bidID = result.getInt("bidID");
				bstr = "select * from bid where bidID = " + bidID + ";";
				bres = stmt.executeQuery(bstr);
				bres.next();
				String price = bres.getString("bidPrice");
				java.sql.Timestamp ts = bres.getTimestamp("bidTime");
				
				//bUsername
				out.print("<td align=\"center\">");
				out.print(result.getString("bUsername"));
				out.print("</td>");
				
				//material
				out.print("<td align=\"center\">");
				out.print(bres.getTimestamp("bidTime"));
				out.print("</td>");

				//condition
				out.print("<td align=\"center\">");
				out.print(bres.getFloat("bidPrice"));
				out.print("</td>");
				
				//color
				out.print("<td align=\"center\">");
				out.print(result.getString("color"));
				out.print("</td>");

				out.print("</tr>");

			}
			out.print("</tbody>");
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("No satisfied result.");
		}
	%>


</body>
</html>