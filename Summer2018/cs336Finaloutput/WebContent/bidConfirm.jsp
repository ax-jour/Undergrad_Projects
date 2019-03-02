<%@page import="com.finalProject.vo.auctionVo"%>
<%@page import="com.finalProject.dao.auctionDao"%>
<%@page import="com.finalProject.vo.createItemVo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="com.finalProject.dao.bidDao"%>


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
    bidDao bidconfirm=new bidDao();
	
					
			
	List newbid = bidconfirm.getbid(bidconfirm.getmaxid());
	
	
	
	request.setAttribute("newbid",newbid);
    response.sendRedirect("bidConfirm.jsp");

     %>

  

<table border=1 cellpadding="10" cellspacing="0">
  <c:forEach items="${newbid}" var="bid">

    <tr><td>Bid ID:</td><td>${bid.bid }</td></tr>
	<tr><td>Create Time:</td><td>${bid.timet }</td></tr>
	<tr><td>Bid Price:</td><td>${bid.price }</td></tr>
		
	    	
</c:forEach>

</table>
</form>
 
</body>
</html>