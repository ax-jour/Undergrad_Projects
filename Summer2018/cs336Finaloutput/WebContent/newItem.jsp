<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.finalProject.vo.auctionVo"%>
<%@page import="com.finalProject.vo.createItemVo"%>
<%@page import="com.finalProject.vo.sellVo"%>
<%@page import="com.finalProject.dao.sellDao"%>
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
String itemname = request.getParameter("itemname");
String type = request.getParameter("type");
String subType = request.getParameter("subType");
String material = request.getParameter("material");
String condition = request.getParameter("condition");
String color = request.getParameter("color");
Float price = Float.valueOf(request.getParameter("price"));

Object uid = session.getAttribute("userid");

String username = uid.toString();


String description = request.getParameter("description");              
Float reverse = Float.parseFloat(request.getParameter("reversePrice"));
String dt = request.getParameter("startTime");
System.out.println(request.getParameter("startTime"));
System.out.println(dt);
java.sql.Timestamp start = java.sql.Timestamp.valueOf(dt);
String tm = request.getParameter("endTime");
java.sql.Timestamp end = Timestamp.valueOf(tm);
java.sql.Timestamp time = Timestamp.valueOf(LocalDateTime.now());



// input data of jsp page are passed to instances of item, auction, selling 
createItemVo item = new createItemVo();
item.setName(itemname);
item.setMaterial(material);
item.setCondition(condition);
item.setColor(color);
item.setPrice(price);        
item.setDescription(description);
item.setType(type);
item.setSubType(subType);
              
auctionVo auction = new auctionVo();
auction.setReverse(reverse);
auction.setStart(start);
auction.setEnd(end);
auction.setTime(time);
auction.setSid(username);
        
sellVo selling = new sellVo();
selling.setSid(username);              
        
// insert into items table
itemDao itemdao = new itemDao();              
itemdao.insertItem(item);


// get the latest itemid, saved into instances of item, selling
int iid= itemdao.getmaxid();        
item.setiid(iid);
selling.setIid(iid);


// insert into itemType table
 itemdao.insertItemType(item);

//insert into auction table        
auctionDao auctiondao = new auctionDao();         
auctiondao.insertauction(auction); 


//get the latest auctionid, saved into selling instance 
selling.setAid(auctiondao.getmaxid());

//insert into selle_sell_items table
sellDao selldao = new sellDao();       
selldao.insertSelling(selling);

response.sendRedirect("itemConfirm.jsp");

%>


</body>
</html>
