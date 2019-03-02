<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search item(s) for sell</title>
</head>
<%Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://hefauc.cjyxrm2iq20k.us-east-2.rds.amazonaws.com:3306/hefauc", "Natsu",
		"TheMeme0731");
session.setAttribute("item_keyword",null);
session.setAttribute("item_type",null);
session.setAttribute("item_subType",null);
session.setAttribute("item_condition",null);
session.setAttribute("item_material",null);
session.setAttribute("item_color",null);
session.setAttribute("item_ceiling",null);
session.setAttribute("item_floor",null);
%>

<script type="text/javascript">
	function getType() {
		var type = document.getElementById("type");
		var types = [ "Not Specified", "bathroom", "bedroom", "dinning&kitchen", "living room",
				"office" ];
		type.length = 0;
		for (var i = 0; i < types.length; i++) {
			var op = document.createElement("option");
			op.value = types[i];
			op.innerHTML = types[i];
			type.appendChild(op);
		}
		getSubType();
	}

	function getSubType() {
		var subType = document.getElementById("subType");
		var subTypes = [
				[ "Not Specified", "Sink&faucets", "bathroom mirrors", "bathroom lighting",
						"showers", "bathroom storage", "bathroom accessories" ],
				[ "Not Specified", "Dinning tables", "dinning chairs", "bar tables",
						"bar chairs", "kitchen sinks&faucets",
						"kitchen cabinets", "countertops",
						"kitchen accessories", "step tools" ],
				[ "Not Specified", "Beds", "mattresses", "bedding", "wardrobes",
						"bedroom storage", "bedroom mirrors",
						"bedroom lighting" ],
				[ "Not Specified", "media furniture", "sofas", "armchairs, side tables",
						"living room storage", "living room lighting",
						"living room decoration" ],
				[ "Not Specified", "Desk", "office chair", "bookshelves&bookcase",
						"office storage&accessories" ] ];
		var typeIndex = document.getElementById("type").selectedIndex;
		subType.length = 0;
		for (var i = 0; i < subTypes[typeIndex].length; i++) {
			var op = document.createElement("option");
			op.value = subTypes[typeIndex][i];
			op.innerHTML = subTypes[typeIndex][i];
			subType.appendChild(op);
		}
	}
</script>


<body onload="getType()">
	What would you like?
	<form action="itemList_filtered.jsp">
		<table>

			<tr>
				<td>Item Keyword: <input type="text" name="iKeyword"
					maxlength=20 />
				<td>
			</tr>

			<tr>
				<td>Price Range:<select name="ceiling">
						<option value="none">(ceiling)</option>
						<option value="500">$500</option>
						<option value="1000">$1000</option>
						<option value="1500">$1500</option>
						<option value="2000">$2000</option>
						<option value="3000">$3000</option>
				</select>&nbsp; <select name="floor">
						<option value="none">(floor)</option>
						<option value="0">$0</option>
						<option value="500">$300</option>
						<option value="1000">$1000</option>
						<option value="1500">$1500</option>
						<option value="2000">$2000</option>
				</select>&nbsp;
				</td>
			</tr>

			<tr>
				Type:
				<SELECT name="type" id="type" onChange="getSubType()"></SELECT>
				Sub-type:
				<SELECT name="subType" id="subType"></SELECT>
			</tr>

			<tr>
				<td>Condition:<select name="iCondition" size=1>
						<option value="none">Not Specified</option>
						<option value="1">Brand New</option>
						<option value="2">Good</option>
				</select>&nbsp;<br>
			</tr>

			<tr>
				<td>Material:<select name="iMaterial" size=1>
						<option value="none">Not Specified</option>
						<option value="leather">Leather</option>
						<option value="fabric">Fabric</option>
						<option value="wood">Wood</option>
						<option value="glass">Glass</option>
						<option value="metal">Metal</option>
				</select>&nbsp;<br>
			</tr>

			<tr>
				<td>Color:<select name="iColor" size=1>
						<option value="none">Not Specified</option>
						<option value="black">Black</option>
						<option value="white">White</option>
						<option value="yellow">Yellow</option>
						<option value="red">Red</option>
						<option value="pink">Pink</option>
						<option value="grey">Grey</option>
				</select>&nbsp;<br>
			</tr>

		</table>
		<input type="reset" value="Reset"> <input type="submit">
		<button type="button" onclick="javascript:history.back()">Back</button>
	</form>

</body>
</html>