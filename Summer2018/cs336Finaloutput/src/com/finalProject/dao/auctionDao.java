package com.finalProject.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import com.finalProject.dbc.dbConnection;
import com.finalProject.vo.auctionVo;
import com.finalProject.vo.createItemVo;

public class auctionDao {
	
	public void insertauction (auctionVo auction) {
	    // 用户注册方法
	    dbConnection auctionConnection = new dbConnection();
	    Connection conn = null;
	    Statement sta = null;

	    try {
	        conn = auctionConnection.getConnection();
	        sta = conn.createStatement();
	        System.out.println("juju");
	        String sql = "INSERT INTO `buyMe`.`auction` (`userName`, `startTime`, `endTime`, `createTime`, `reservePrice`,  `username`)  VALUES ('"
	        		+ auction.getSid()
	                + "','"
	        		+ auction.getStart()
	                + "','"
	                + auction.getEnd()
	                + "','"	        		
	                + auction.getTime()
	                + "','"	                
	                + auction.getReverse() 
	                + "','"	                
	                + auction.getAid()                
	                + "')";
	     
	        
	        System.out.println(sql);
	       

	        sta.executeUpdate(sql);


	    } catch (SQLException e) {

	        e.printStackTrace();
	    } finally {
	        // 执行完关闭数据库
	        auctionConnection.closeConnection(sta, conn);
	    }
	    
	}
	    
	    	    
	    public int getmaxid () {
	    	int newid = 100;
	    	
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select max(IID) from buyMe.auction";
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        newid = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
			return newid;
	}
	    
	    public float getreverse (int itemid) {
	    	float reverse = 0;
	    	
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select reversePrice from buyMe.auction where auctionNo="+itemid;
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        reverse = rs.getFloat(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
			return reverse;
	}

	    
	    
	    public Timestamp getstart (int aid) {
	    	Timestamp start = null;
	    	
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select startTime from buyMe.auction where auctionID=?";
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        start = rs.getTimestamp(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
			return start;
	}
	    
	    
	    public Timestamp getend (int aid) {
	    	Timestamp end = null;
	    	
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select endTime from buyMe.auction where auctionID="+aid;
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        end = rs.getTimestamp(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
			return end;
	}
	    
	    
	    public void insertsell (auctionVo auction) {
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        System.out.println("juju");
		        String sql = "INSERT INTO `buyMe`.`seller_sell_items` (`userName`, `auctionId`,`itemID`)  VALUES ('"
		        		+ auction.getSid()
		                + "','"
		                + auction.getAid()
		                + "','"
		        		+ auction.getIid()	           
		                + "')";
		     
		        
		        System.out.println(sql);
		       

		        sta.executeUpdate(sql);


		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
		    
		}
		    
	    
	    
	    public int getaid (int iid) {
	    	int aid = 100;
	    	
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select auctionId from buyMe.seller_sell_items where itemID="+aid;
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        aid = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
			return aid;
	} 
	    
	    
        public List<auctionVo> getauction (int aid) {
	    	
	    	
		    // 用户注册方法
		    dbConnection auctionConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    List<auctionVo> auctioninfo = new ArrayList<auctionVo>();
		    System.out.println("juju");


		    try {
		        conn = auctionConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select * from buyMe.auction where auctionID="+aid;
		        ResultSet rs =  sta.executeQuery(sql);		        
		        while(rs.next()){
					auctionVo auction = new auctionVo();
					auction.setAid(rs.getInt(1));
					auction.setStart(rs.getTimestamp(2));
					auction.setEnd(rs.getTimestamp(3));
					auction.setReverse(rs.getInt(4));
				   auctioninfo.add(auction);
				    System.out.println(auctioninfo);
					
				}		        		     
		        
				   					
		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        auctionConnection.closeConnection(sta, conn);
		    }
			return auctioninfo;

			
	}	
        
        
	    

	  

	    
	    
		    	    
	    
	    
	    
	    

	    
	    
	

}
