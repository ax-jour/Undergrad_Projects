package com.finalProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.finalProject.dbc.dbConnection;
import com.finalProject.vo.bidVo;
import com.finalProject.vo.priceAlertVo;

public class bidDao {
	public void insertbid (bidVo bid) {
	    // 用户注册方法
	    dbConnection bidConnection = new dbConnection();
	    Connection conn = null;
	    Statement sta = null;

	    try {
	        conn = bidConnection.getConnection();
	        sta = conn.createStatement();
	        System.out.println("juju");
	        String sql = "INSERT INTO `buyMe`.`bid` (`bidID`,  `bidPrice`, `bidTime`, `username`)  VALUES ('"
	        		+ bid.getBid()
	                + "','"	  
	                + bid.getMoney()
	                + "','"	        		
	                + bid.getTime()
	                + "','"	        		
	                + bid.getBuid()	               
	                + "')";
	     
	        
	        System.out.println(sql);
	       

	        sta.executeUpdate(sql);


	    } catch (SQLException e) {

	        e.printStackTrace();
	    } finally {
	        // 执行完关闭数据库
	        bidConnection.closeConnection(sta, conn);
	    }
	    
	}
	    
	    	    
	    public int getmaxid () {
	    	int newid = 100;
	    	
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select max(bidId) from buyMe.bid";
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        newid = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
			return newid;
	}
	    
	    public void insertmanualbid (bidVo bid) {
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        System.out.println("juju");
		        String sql = "INSERT INTO `buyMe`.`manualBid` (`bidNo`, `bid`, `username`)  VALUES ('"
		        		+ bid.getBid()
		                + "','"	        		
		                + bid.getMoney()
		                + "','"	        		
		                + bid.getBuid()		                             
		                + "')";
		     
		        
		        System.out.println(sql);
		       

		        sta.executeUpdate(sql);


		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
		    
		}
	    
	    
	    public void insertbuy (bidVo bid) {
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        System.out.println("juju");
		        String sql = "INSERT INTO `buyMe`.`buyer_bid_auction` ((`busername`, `bidID`, `aid`, `susername`)  VALUES ('"
		        		+ bid.getBuid()
		                + "','"	
		                + bid.getBid()
		                + "','"	        		
		                + bid.getAid()
		                + "','"	        		
		                + bid.getSid()		                             
		                + "')";
		     
		        
		        System.out.println(sql);
		       

		        sta.executeUpdate(sql);


		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
		    
		}
	    
	    
	    
        public List<bidVo> getbid (int bidNo) {
	    	
	    	
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    List<bidVo> bidinfo = new ArrayList<bidVo>();
		    System.out.println("juju");


		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select * from buyMe.id where bidID where bidID=" +bidNo;
		        ResultSet rs =  sta.executeQuery(sql);
		        while(rs.next()){
					bidVo bid = new bidVo();
					bid.setBuid(rs.getString(2));
				    bid.setMoney(rs.getFloat(4));
				    bid.setBid(rs.getInt(1));
				    bid.setTime(rs.getTimestamp(3));				    
				    bidinfo.add(bid);
				   					
				}		        		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
			return bidinfo;

			
	}
	    
	    
        public String getwinner (int aid) {
	    	String winnerid = null;
	    	
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select busername from buyMe.bid and buyMe.buyer_bid_auction S where bid.bidID = S.bidID and bid.bidPrice = max(bid.bidPrice） and S.auctionID="+aid ;
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        winnerid = rs.getString(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
			return winnerid;
	}
        
        public ArrayList<String> getitembuyer (int iid) {
	    		    	
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    ArrayList<String> names = new ArrayList<String>();
		    
		    


		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select B.username from buyMe.buyer_bid_acution B and buyMe.seller_sell_items S where B.auctionid = S.auctionID and B.bid="+iid ;
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        
			    while (rs.next()) { 
			        names.add(rs.getString(1));
			    }
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
			return names;
	}
        
        public Float getbuyerbid (String buyerid, int itemid) {
	    	
	    	
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    Float buyerbid = null;

		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        PreparedStatement ps = conn.prepareStatement("select max(bidPrice) from buyMe.bid where bid. username = ? and bid.itemID =?");
		        ps.setString(1, buyerid);
		        ps.setInt(2, itemid);
		        ResultSet rs = ps.executeQuery();
		        
		        rs.next();
		        buyerbid  = rs.getFloat(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
			
			return buyerbid;
	}

        

        
        public void updateprice (float price, int itemid) {
	    	
	    	
		    // 用户注册方法
		    dbConnection bidConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    

		    try {
		        conn = bidConnection.getConnection();
		        sta = conn.createStatement();
		        
		        PreparedStatement ps = conn.prepareStatement("UPDATE `buyMe`.`items` SET `price`='?' WHERE `itemID`='?'") ; 
		        ps.setFloat(1, price);
		        ps.setInt(2, itemid);
		        ps.executeUpdate();
		        		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        bidConnection.closeConnection(sta, conn);
		    }
			
	}
        
        public void insertalert (priceAlertVo alert) {
    	    // 用户注册方法
    	    dbConnection bidConnection = new dbConnection();
    	    Connection conn = null;
    	    Statement sta = null;

    	    try {
    	        conn = bidConnection.getConnection();
    	        sta = conn.createStatement();
    	        System.out.println("juju");
    	        String sql = "INSERT INTO `buyMe`.`priceAlert` (`username`,  `itemid`, `alertprice`)  VALUES ('"
    	        		+ alert.getBuyerid()
    	                + "','"	  
    	                + alert.getItemid()
    	                + "','"	        		
    	                + alert.getNewprice()    	                	               
    	                + "')";
    	     
    	        
    	        System.out.println(sql);
    	       

    	        sta.executeUpdate(sql);


    	    } catch (SQLException e) {

    	        e.printStackTrace();
    	    } finally {
    	        // 执行完关闭数据库
    	        bidConnection.closeConnection(sta, conn);
    	    }
    	    
    	}



}
