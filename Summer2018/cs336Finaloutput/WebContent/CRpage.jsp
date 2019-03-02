<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Representative Page</title>
</head>
	
<body>
	<h1><% out.println("Customer Representative Management Page"); %></h1>
	<%	Date date = new Date();
		out.print( "<h2 align = \"center\">" +date.toString()+"</h2>");%>
	<h4><% out.println("Hello CR!"); %></h4>
	
	<%-- choose different question sources --%>
	<form method="post" action="questions.jsp">
		Check questions from users<br>
		<input type="submit" value="Show" />
	</form>
	<br>
	
	<%-- Retrieve auction information --%>
	<form method="post" action="auctionPageRetrieve.jsp">
		Search auction<br>
		Keyword:
		<input type="text" name="keyword"/><br>
		Item Auction No.:
		<input type="text" name="auctionNo"/><br>	
		Start Time:
		<input type="text" name="startTime"/><br>
		End Time:
		<input type="text" name="endTime"/><br>
		Posted Date:
		<input type="text" name="createTime"/><br>
		
		<input type="submit" value="Search"/><br>
	</form>
	<br>
	
	<%-- Retrieve auction reports --%>
	<form method="post" action="illegalReport.jsp">
		Check user reports:<br>
		<input type="submit" value="Check"/><br>
	</form>
	<br>
	
	<form method="post" action="logout.jsp">
		<input type="Submit" value="Logout"/>
	</form>
</body>

<body>
	
</body>
</html>