package com.finalProject.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import com.finalProject.dbc.dbConnection;
import com.finalProject.vo.sellVo;


public class sellDao {
	public void insertSelling (sellVo selling) {
	    // 用户注册方法
	    dbConnection sellConnection = new dbConnection();
	    Connection conn = null;
	    Statement sta = null;

	    try {
	        conn = sellConnection.getConnection();
	        sta = conn.createStatement();
	        System.out.println("juju");
	        String sql = "INSERT INTO `buyMe`.`seller_sell_items` (`auctionID`, `uName`, `itemID`)  VALUES ('"
	        		+ selling.getAid()
	                + "','"
	                + selling.getSid()
	                + "','"	        		
	                + selling.getIid()	                
	                + "')";
	     
	        
	        System.out.println(sql);
	       

	        sta.executeUpdate(sql);


	    } catch (SQLException e) {

	        e.printStackTrace();
	    } finally {
	        // 执行完关闭数据库
	        sellConnection.closeConnection(sta, conn);
	    }
	    
	}
	    
	    	    
	    public int getauctionid (int iid) {
	    	int aid = 100;
	    	
		    // 用户注册方法
		    dbConnection sellConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = sellConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select auctionID from buyMe.seller_sell_items where itemID="+iid;
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        aid = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        sellConnection.closeConnection(sta, conn);
		    }
			return aid;
	}
	    
	    public int getmaxid () {
	    	int newid = 100;
	    	
		    // 用户注册方法
		    dbConnection sellConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = sellConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select max(itemID) from buyMe.seller_sell_items";
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        newid = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        sellConnection.closeConnection(sta, conn);
		    }
			return newid;
	}

	    
	  
}



