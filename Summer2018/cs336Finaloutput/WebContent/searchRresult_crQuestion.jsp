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

	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			String info = request.getParameter("keyword").toString();
			String str;
			String str1;
			if (info == null) {
				str = "SELECT * FROM cr_questions where answer <> null;";
			} else {
				str = "SELECT unique * FROM cr_questions where answer <> null and (title = '*"+info+"*' or question = '*"+info+"*' or answer = '*"+info+"*');";
			} 
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			//Run the query against the database.
			ResultSet rs = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table class=\"sortable\">");

			//make a row
			out.print("<thead>");
			out.print("<tr>");
			//title
			out.print("<th width=\"20%\">");
			out.print("Title");
			out.print("</th>");
			//question
			out.print("<th width=\"20%\">");
			out.print("Question");
			out.print("</th>");
			//answer
			out.print("<th width=\"20%\">");
			out.print("Answer");
			out.print("</th>");
			//
			out.print("</tr>");
			out.print("</thead>");

			//parse out the results
			while (rs.next()) {
				out.print("<tbody>");
				out.print("<tr>");

				out.print("<td align=\"center\">");
				String title = rs.getString("title");
				String ques = rs.getString("question");
				int id = rs.getInt("qID");
				out.print(
						"<form action=\"qeustion_cr.jsp\" method=\"get\"> <button name=\"qID\" type=\"submit\" value=\""
								+ id + "\">" + title + "</button> </form>");
				out.print("</td>");

				out.print("</tr>");

			}
			out.print("</tbody>");
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
			out.print("No satisfied result.");
		}
	%>


</body>
</html>