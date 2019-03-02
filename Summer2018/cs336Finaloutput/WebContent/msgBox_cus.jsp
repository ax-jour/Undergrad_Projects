<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alert Box</title>
</head>
<body>

		<button type="button" onclick="javascript:history.back()">Back</button>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			String bstr;
			ResultSet bres;
			String userID = (String)session.getAttribute("userid");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String alert = "SELECT * FROM alert_for_item where username = '"+userID+"'order by alert_at (asc);";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(alert);

			//Make an HTML table to show the results in:
			out.print("<table class=\"sortable\">");

			//make a row
			out.print("<thead>");
			out.print("<tr>");
			//Itemnames
			out.print("<th width=\"20%\">");
			out.print("Related IDs");
			out.print("</th>");
			//title
			out.print("<th width=\"20%\">");
			out.print("Title");
			out.print("</th>");
			
			out.print("</tr>");
			out.print("</thead>");

			//parse out the results
			while (result.next()) {
				out.print("<tbody>");
				out.print("<tr>");
				
				out.print("<td align=\"center\">");
				int itemid = result.getInt("itemNo");
				String name = result.getString("username");
				out.print(
						"<form action=\"itemDetails.jsp\" method=\"get\"> <button name=\"itemid\" type=\"submit\" value=\""
								+ itemid + "\">" + itemid + "</button> </form>");
				out.print("</td>");
				
				bstr = "select * from items where itemNo = " + itemid + ";";
				bres = stmt.executeQuery(bstr);
				bres.next();
				String itemName = bres.getString("iName");
				
				//material
				out.print("<td align=\"center\">");
				out.print(itemName);
				out.print("</td>");


				out.print("</tr>");

			}
			out.print("</tbody>");
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("No alert message.");
		}
	%>


</body>
</html>