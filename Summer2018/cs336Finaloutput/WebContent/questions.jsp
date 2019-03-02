<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>question</title>
</head>


<body>

<%
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();		
		String str = "SELECT * FROM cr_questions where cr_id = '0' ";
		ResultSet result = stmt.executeQuery(str);
			
        out.print("<table border='1'>");
		out.print("<tr>");
		out.print("<td>");
		out.print("<h4>qID</h4>");
		out.print("</td>");
		out.print("<td>");
		out.print("<h4>Title</h4>");
		out.print("</td>");
		out.print("<td>");
		out.print("<h4>Question</h4>");
		out.print("</td>");
		out.print("<td>");
		out.print("<h4>Answer</h4>");
		out.print("</td>");
		out.print("<td>");
		out.print("<br>");
        while (result.next()){
        	session.setAttribute("qID", result.getString("qID"));
        	out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("qID"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("title"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("answer"));
			out.print("</td>");
			out.print("<td>");
%> 
			<form  method="post" action="CRanswer.jsp">
				<input type="submit" name="<%result.getInt("qID"); %>">  
			</form> 
<%
			/* out.print("</td>");
			out.print("<td>");
			int qid = result.getInt("qID");
			out.print("<form action=\"CRanswer.jsp\" method=\"get\">"+
						"<button name=\"qID\" type=\"submit\" value=\"" + qid + "\">" + "</button> </form>");
			
			out.print("</td>");	
        	out.print("</tr>"); */
			
        }
        out.print("</table>");
        
        		
		db.closeConnection(con);
		
		
		
	} catch (Exception e) {
		out.print(e);
	}
		
%>
			<button type="button" onclick="javascript:history.back()">Back</button>
</body>
</html>