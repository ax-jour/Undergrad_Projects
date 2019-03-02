<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<button type="button" onclick="item_filter.jsp">Item filter
</button>
<br>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM cr_questions where ;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//Itemnames
			out.print("<td>");
			out.print("Items");
			out.print("</td>");
			/* //auctions
			out.print("<td>");
			out.print("Auction");
			out.print("</td>"); */
			/* //prices
			out.print("<td>");
			out.print("Price");
			out.print("</td>"); */
			//Materials
			out.print("<td>");
			out.print("Material");
			out.print("</td>");
			//Sellers
			out.print("<td>");
			out.print("Seller");
			out.print("</td>");
			//conditions
			out.print("<td>");
			out.print("Condition");
			out.print("</td>");
			//
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("iName"));
				out.print("</td>");
				out.print("<td>");
				/* //auction:
				out.print(result.getString("auctionNo"));
				out.print("</td>");
				out.print("<td>"); */
				//Print out current price
				/* out.print(result.getString("itemPrice"));
				out.print("</td>"); */
				//material
				out.print(result.getString("iMaterial"));
				out.print("</td>");
				//sellers
				out.print(result.getString("username"));
				out.print("</td>");
				//condition
				out.print(result.getString("iCondition"));
				out.print("</td>");
				
				
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print("No satisfied result.");
		}
	%>
	

</body>
</html>