package com.finalProject.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import com.finalProject.dbc.dbConnection;
import com.finalProject.vo.createItemVo;

public class itemDao {
	public void insertItem (createItemVo item) {
	    // 用户注册方法
	    dbConnection itemConnection = new dbConnection();
	    Connection conn = null;
	    Statement sta = null;

	    try {
	        conn = itemConnection.getConnection();
	        sta = conn.createStatement();
	        System.out.println("juju");
	        String sql = "INSERT INTO `buyMe`.`items` (`material`, `color`, `condition`, `description`, `iName`,  `currentBid`)  VALUES ('"
	        		+ item.getMaterial()
	                + "','"
	                + item.getColor()
	                + "','"	        		
	                + item.getCondition()
	                + "','"	                
	                + item.getDescription()
	                + "','"	        		
	                + item.getName()
	                + "','"	        		
	                + item.getPrice()
	                + "')";
	     
	        
	        System.out.println(sql);
	       

	        sta.executeUpdate(sql);


	    } catch (SQLException e) {

	        e.printStackTrace();
	    } finally {
	        // 执行完关闭数据库
	        itemConnection.closeConnection(sta, conn);
	    }
	    
	}
	    
	    	    
	    public int getmaxid () {
	    	int newid = 100;
	    	
		    // 用户注册方法
		    dbConnection itemConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = itemConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select max(IID) from buyMe.items";
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        newid = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        itemConnection.closeConnection(sta, conn);
		    }
			return newid;
	}
	    
	    public float getprice (int iid) {
	    	float price = 0;
	    	
		    // 用户注册方法
		    dbConnection itemConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;

		    try {
		        conn = itemConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select currentBid from buyMe.items";
		        ResultSet rs =  sta.executeQuery(sql);
		        rs.next();
		        price = rs.getInt(1);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        itemConnection.closeConnection(sta, conn);
		    }
			return price;
	}

	    
	    
	    
	    
	    
	    public void insertItemType (createItemVo item) {
		    // 用户注册方法
		    dbConnection itemConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    

		    try {
		        conn = itemConnection.getConnection();
		        sta = conn.createStatement();		 
		        
		       		        		     
		        String sql = "INSERT INTO `buyMe`.`itemType` (`type`, `subType`, `iID`) VALUES ('"
		        	    + item.getType()
		                + "','"
		                + item.getSubType()
		                + "','"	        		
		                + item.getiid()
		                + "')";


		        System.out.println(sql);
		        

		        sta.executeUpdate(sql);
		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        itemConnection.closeConnection(sta, conn);
		    }
	}
	    
	    
	    
      public List<createItemVo> getitem (int iid) {
	    	
	    	
		    // 用户注册方法
		    dbConnection itemConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    List<createItemVo> iteminfo = new ArrayList<createItemVo>();
		    System.out.println("juju");


		    try {
		        conn = itemConnection.getConnection();
		        sta = conn.createStatement();
		        String sql = "select * from buyMe.items, buyMe.itemType where items.IID = itemType.iID and items.IID="+iid;
		        ResultSet rs =  sta.executeQuery(sql);
		        while(rs.next()){
					createItemVo item = new createItemVo();
					item.setName(rs.getString(6));
				    item.setMaterial(rs.getString(1));
				    item.setCondition(rs.getString(4));
				    item.setColor(rs.getString(3));
				    item.setPrice(rs.getFloat(7));        
				    item.setDescription(rs.getString(5));
				    item.setiid(rs.getInt(2));
				    item.setType(rs.getString(10));
				    item.setSubType(rs.getString(11));
				    iteminfo.add(item);
				    					
				}		        		     

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        itemConnection.closeConnection(sta, conn);
		    }
			return iteminfo;

			
	}
	    
	    
	    	    
	    
	    
	    /*public String getitemm (int iid) {
	    	System.out.println("********6666666  9999999    8888  *****************");
	        ResultSet rs = null;
	        int i = iid;
	        //String tempIID="161";
	        //tempIID = Integer,toString(i);
		    // 用户注册方法
		    dbConnection itemConnection = new dbConnection();
		    Connection conn = null;
		    Statement sta = null;
		    String result = "test";
		    int result2 = 0;
		    //int result3 = 1;
		    System.out.println("juju");


		    try {
		        conn = itemConnection.getConnection();
		        sta = conn.createStatement();
		        String sql1 = "select * from buyMe.items, buyMe.itemType where items.IID = itemType.iID and items.IID="+iid;
		        rs =  sta.executeQuery(sql1);
		        //sta = conn.prepareStatement(sql1);
		        //sta.setString(1,iid);
		        System.out.println("###########   result rs #################");
		        System.out.println(rs);
		        rs.first();
		        
		        //int temp = rs.getInt(1);
		        result = rs.getString(2);
		        result2 = rs.getInt(2);
		        //result3 = rs.getInt(3);
		        System.out.println("result:"+result);
		        System.out.println("result2:"+result2);
		        //System.out.println("result3:"+result3);
		        
		        System.out.println("############################");

		    } catch (SQLException e) {

		        e.printStackTrace();
		    } finally {
		        // 执行完关闭数据库
		        itemConnection.closeConnection(sta, conn);
		        
		    }
		    System.out.println("*************************");
			return result;

			
	}	
*/	    

	    
	    
	    
	    

	  

	  
}



