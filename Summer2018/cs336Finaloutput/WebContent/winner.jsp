<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.finalProject.dao.sellDao"%>
<%@page import="com.finalProject.dao.bidDao"%>
<%@page import="com.finalProject.dao.itemDao"%>
<%@page import="com.finalProject.dao.auctionDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Auctions - buyMe</title>
</head>
<body>
<%
auctionDao auctiondao = new auctionDao();
Timestamp start = auctiondao.getstart(100);
Timestamp end = auctiondao.getend(100);    
Timestamp currenttime = Timestamp.valueOf(LocalDateTime.now());
if (currenttime.equals(end) ) {

    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
               
    // searching session sets that every time a user browses an item page, the itemid is submit to servlet
    int itemid = Integer.parseInt(request.getParameter("itemid"));
 
    
    //get auctionid of the item the buyer is bidding     
    sellDao sellingdao = new sellDao();
    int auctionid = sellingdao.getauctionid(itemid);
    
    //get reverse price
    auctionDao audao = new auctionDao();
    float reverse = audao.getreverse(itemid);
    
    //get the max current bid
    itemDao itemdao = new itemDao();
    float maxbid = itemdao.getprice(itemid);
    
    //define winner
    if (reverse < maxbid) {
    	bidDao biddao = new bidDao();
        String winnerid = biddao.getwinner(auctionid);
    	
    } 
    
           
        // forward to bidConfirm page
}
	
	

%>


</body>
</html>
