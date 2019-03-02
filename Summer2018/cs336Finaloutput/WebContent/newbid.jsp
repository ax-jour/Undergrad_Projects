<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.finalProject.vo.auctionVo"%>
<%@page import="com.finalProject.vo.createItemVo"%>
<%@page import="com.finalProject.vo.sellVo"%>
<%@page import="com.finalProject.vo.bidVo"%>
<%@page import="com.finalProject.dao.bidDao"%>

<%@page import="com.finalProject.dao.sellDao"%>
<%@page import="com.finalProject.dao.itemDao"%>
<%@page import="com.finalProject.dao.auctionDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.finalProject.vo.priceAlertVo"%>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

auctionDao auctiondao = new auctionDao();        
Timestamp start = auctiondao.getstart(100);
Timestamp end = auctiondao.getend(100);    
Timestamp currenttime = Timestamp.valueOf(LocalDateTime.now());

if (currenttime.before (end) && currenttime.after(start)) {

    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
               
    
    Float money = Float.parseFloat(request.getParameter("money"));        
    Timestamp time = Timestamp.valueOf(LocalDateTime.now());
    // searching session sets that every time a user browses an item page, the itemid is submit to servlet
    int itemid = Integer.parseInt(request.getParameter("itemid"));
    
    
    bidVo bid = new bidVo();        
    bid.setMoney(money);
    bid.setTime(time);
    Object uid = session.getAttribute("userid");
    String username = uid.toString();
    bid.setBuid(username);
    
    

    
    
    bidDao biddao = new bidDao();
    
    
    //insert into bid table, assume that bid table is the same as manual bid table because we aborb the auto bid function
    biddao.insertbid(bid);
    bid.setBid(biddao.getmaxid()); 
    System.out.println(bid.getBid());
    
    //get auctionid of the item buyer is bidding     
    sellDao sellingdao = new sellDao();                       
    bid.setAid(sellingdao.getauctionid(itemid));
    
    //insert into buye_bid_auction table
    biddao.insertbuy(bid);
    
    //update item's current price
    biddao.updateprice(bid.getMoney(), bid.getBid());
    
    
    
    //check if the new bid price is larger than other buyers' bids, if true, insert the message into priceAlertVo
    ArrayList<String> userid = new ArrayList<String>();
    userid = biddao.getitembuyer (itemid);
    for (int j = 0; j < userid.size(); j++) {
    	Float userbid = biddao.getbuyerbid(userid.get(j), itemid);
    	if (userbid < money){
    		priceAlertVo alert = new priceAlertVo();
    		biddao.insertalert(alert);
    	}
    	
    }
    
                
    response.sendRedirect("bidConfirm.jsp");    
    // forward to bidConfirm page
}
%>

</body>
</html>