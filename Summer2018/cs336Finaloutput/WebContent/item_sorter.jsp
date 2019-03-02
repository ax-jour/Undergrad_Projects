<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item List</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<form method="post" action="item_filter.jsp">
					<input type="submit" value="Item Filter" />
				</form>
			</td>
			<td>
				<form method="post" action="item_sort_by_new.jsp">
					<input type="submit" value="Sort by condition (new)" />
				</form>
			</td>
			<td>
				<form method="post" action="item_sort_by_old.jsp">
					<input type="submit" value="Sort by condition (old)" />
				</form>
			</td>
			<td><button type="button" onclick="javascript:history.back()">Back</button></td>
		</tr>
	</table>

	<br>
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
			String bstr;
			String str = "select * from items order by itemNo desc;";
			//Run the query against the database.
			ResultSet bres;
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table class=\"sortable\">");

			//make a row
			out.print("<thead>");
			out.print("<tr>");
			//Itemnames
			out.print("<th width=\"20%\">");
			out.print("Items");
			out.print("</th>");
			//auctions
			out.print("<th width=\"20%\">");
			out.print("Auction");
			out.print("</th>");
			//Materials
			out.print("<th width=\"20%\">");
			out.print("Seller");
			out.print("</th>");
			//Sellers
			out.print("<th width=\"20%\">");
			out.print("Condition");
			out.print("</th>");
			//conditions
			out.print("<th width=\"10%\">");
			out.print("Material");
			out.print("</th>");
			//color
			out.print("<th width=\"20%\">");
			out.print("Color");
			out.print("</th>");
			//
			out.print("</tr>");
			out.print("</thead>");

			//parse out the results
			while (result.next()) {

				int iid = result.getInt("itemNo");
				String name = result.getString("iName");
				String condition = result.getString("condition");
				String material = result.getString("material");
				String color = result.getString("color");

				bstr = "select * from seller_sell_items where itemID = " + iid + ";";
				bres = stmt.executeQuery(bstr);
				bres.next();
				int auctionID = bres.getInt("auctionID");
				String uName = bres.getString("uName");

				out.print("<tbody>");
				out.print("<tr>");
				//itemName with itemID
				out.print("<td align=\"center\">");
				out.print(
						"<form action=\"itemDetails.jsp\" method=\"get\"> <button name=\"itemid\" type=\"submit\" value=\""
								+ iid + "\">" + name + "</button> </form>");
				out.print("</td>");
				//seller
				out.print("<td align=\"center\">");
				out.print(
						"<form action=\"auctionDetails.jsp\" method=\"get\"> <button name=\"auctionID\" type=\"submit\" value=\""
								+ auctionID + "\">" + auctionID + "</button> </form>");
				out.print("</td>");
				//auctionNo
				out.print("<td align=\"center\">");
				out.print(uName);
				out.print("</td>");

				//condition
				out.print("<td align=\"center\">");
				out.print(condition);
				out.print("</td>");

				//material
				out.print("<td align=\"center\">");
				out.print(material);
				out.print("</td>");

				//color
				out.print("<td align=\"center\">");
				out.print(color);
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