<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item List Filtered</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			Connection co = db.getConnection();
			Connection con1 = db.getConnection();
			Statement stmt = con.createStatement();
			Statement stm = co.createStatement();
			Statement stmt1 = con1.createStatement();
			ResultSet res1 =stmt1.executeQuery("select * from itemType;");
			//Create a SQL statement
			
			//Get the combobox from the index.jsp
			String st = "select * from items";
			String stt = st;
			String keyword = request.getParameter("iKeyword").toString();
			String price_ceiling = request.getParameter("ceiling").toString();
			String price_floor = request.getParameter("floor").toString();
			String condition = request.getParameter("iCondition").toString();
			String material = request.getParameter("iMaterial").toString();
			String color = request.getParameter("iColor").toString();
			String type = request.getParameter("type").toString();
			String subType = request.getParameter("subType").toString();

			session.setAttribute("item_keyword", keyword);
			session.setAttribute("item_type", type);
			session.setAttribute("item_subType", subType);
			session.setAttribute("item_condition", condition);
			session.setAttribute("item_material", material);
			session.setAttribute("item_color", color);
			session.setAttribute("item_ceiling", price_ceiling);
			session.setAttribute("item_floor", price_floor);

			if (keyword != null) {
				st += " where iName = '*" + keyword + "*' ";
			} else {
				if (price_ceiling != "none") {
					if (st != stt) {
						st += " and currenBid < " + price_ceiling;
					} else {
						st += " where currenBid < " + price_ceiling;
					}
				}
				if (price_floor != "none") {
					if (st != stt) {
						st += " and currenBid > " + price_floor;
					} else {
						st += " where currenBid > " + price_floor;
					}
				}
				if (condition != "none") {
					if (st != stt) {
						st += " and condition = '" + condition + "'";
					} else {
						st += " where condition = '" + condition + "'";
					}
				}
				if (material != "none") {
					if (st != stt) {
						st += " and material = '" + material + "'";
					} else {
						st += " where material = '" + material + "'";
					}
				}
				if (color != "none") {
					if (st != stt) {
						st += " and color = '" + color + "'";
					} else {
						st += " where color = '" + color + "'";
					}
				}
			}
			
			st += ";";
			
			out.print(st);
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(st);

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
			//seller
			out.print("<th align=\"center\">");
			out.print("Seller");
			out.print("</th>");
			//
			out.print("</tr>");
			out.print("</thead>");

			String bstr;
			ResultSet bres;
			
			

			//parse out the results
			while (result.next()) {

				int itemid = result.getInt("itemNo");
				String name = result.getString("iName").toString();
				String itype = res1.getString("type").toString();
				String isubtype = res1.getString("subType").toString();
				if (itype != type){
					continue;
				}else{
					if (isubtype != subType) {
						continue;
					}
				}

				bstr = "select * from seller_sell_items where itemID = " + itemid + ";";
				bres = stm.executeQuery(bstr);
				bres.next();
				int auctionID = bres.getInt("auctionID");
				String uName = bres.getString("uName");

				out.print("<tbody>");
				out.print("<tr>");
				//itemName with itemID
				out.print("<td align=\"center\">");
				out.print(
						"<form action=\"itemDetails.jsp\" method=\"get\"> <button name=\"itemid\" type=\"submit\" value=\""
								+ itemid + "\">" + name + "</button> </form>");
				out.print("</td>");
				//auction number
				out.print("<td align=\"center\">");
				out.print(
						"<form action=\"auctionDetails.jsp\" method=\"get\"> <button name=\"auctionID\" type=\"submit\" value=\""
								+ auctionID + "\">" + auctionID + "</button> </form>");
				out.print("</td>");
				//seller
				out.print("<td align=\"center\">");
				out.print(bres.getString("uName"));
				out.print("</td>");

				out.print("</tr>");

			}
			out.print("</tbody>");
			out.print("</table>");

			//close the connection.
			con.close();
			co.close();

		} catch (Exception e) {
			out.print(e);
			out.print("No satisfied result.");
		}
	%>

</body>
</html>