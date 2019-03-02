<%@page import="com.finalProject.vo.auctionVo"%>
<%@page import="com.finalProject.dao.auctionDao"%>
<%@page import="com.finalProject.vo.createItemVo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.finalProject.dao.itemDao"%>
<%@page import="com.finalProject.dao.auctionDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>item confirmation</title>
</head>
<body>

 
 <form action="item4buy" name="confirm" method="get">
  <br /> Your just created an auction!

  <%
    itemDao itemconfirm=new itemDao();
	auctionDao auctionconfirm = new auctionDao();
					
			
	List newitems = itemconfirm.getitem(itemconfirm.getmaxid());
	List newacution = auctionconfirm.getauction(auctionconfirm.getmaxid());

	
	
	request.setAttribute("newitems",newitems);
	request.setAttribute("newacution", newacution);
	response.sendRedirect("itemConfirm.jsp");

     %>

  <table border=1 cellpadding="10" cellspacing="0">
  <c:forEach items="${newitems}" var="item">

    <tr><td>Item ID:</td><td>${item.iid }</td></tr>
	<tr><td>Item Name:</td><td>${item.itemname }</td></tr>
	<<tr><td>Category:</td> <td>${item.type }</td> <td>Sub-Category:</td><td>${item.subtype }</td></tr>	
    <tr><td>Material;:</td><td>${item.material}</td></tr>
	<tr><td>Color:</td><td>${item.color}</td></tr>
	<tr><td>Condition:</td><td>${item.condition}</td></tr>
	<tr><td>Start Price:</td><td>${item.price }</td></tr>
	<tr><td>Description:</td><td>${item.description }</td></tr>
	
	    	
</c:forEach>
</table>


<table border=1 cellpadding="10" cellspacing="0">
  <c:forEach items="${newauction}" var="auction">

    <tr><td>Auction ID:</td><td>${auction.aid }</td></tr>
	<tr><td>Start Time:</td><td>${auction.start }</td></tr>
	<tr><td>End Time:</td><td>${auction.end }</td></tr>
	<tr><td>Reverse Price:</td><td>${auction.reverse }</td></tr>
	
	    	
</c:forEach>

</table>
</form>
 
</body>
</html>