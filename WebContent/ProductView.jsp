<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.imageio.ImageIO" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.math.BigDecimal"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "onlineloan";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>All Products</title>
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<style>
.button{

	height: 40px;
	margin: 85px 0;
	margin-top: -15px;
	margin-left: 240px 
}

.button{

height: 100%;
width: 40%;
padding: 10px 15px;
outline: none;
color: #fff;
background: #b30047;
border: none;
font-size: 10px;
font-weight: 500;
border-radius: 5px;
letter-spacing: 1px;
margin: 10px;
}

	.grid-container {
			display: grid;
			grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
			grid-gap: 10px;
			padding: 10px;
		}
		.grid-item {
			background-color: #f2f2f2;
			border: 1px solid #ddd;
			padding: 10px;
			text-align: center;
			overflow: hidden;
			position: relative;
		}
		.grid-item:hover img {
			transform: scale(1.1);
		}
		img {
			width: 180px;
  			height: 160px;
  			
		}
	
		.name {
			font-weight: bold;
			margin-bottom: 10px;
		}
		.price {
			font-size: 1.2em;
		}
		

		
	</style>
</head>
<body>
	<header>
		<nav>
			<ul>
				<li><a href="Index.jsp">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="ItemDashboard.jsp">Dashboard</a></li>
				<lii><a href="Card.jsp">Cart</a></liii>
				<% if (session.getAttribute("name") != null) { %>
  				<liii><span>Welcome, <%= session.getAttribute("name") %></span></liii>
				<% } %>
			</ul>
		</nav>
	</header>
<h2>All Products</h2>
	<div class="grid-container">

				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product_table";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
	int id = resultSet.getInt("id");
	String name = resultSet.getString("name");
	BigDecimal price = resultSet.getBigDecimal("price");
	InputStream in = new ByteArrayInputStream(resultSet.getBytes("image"));
	BufferedImage image = ImageIO.read(in); 
	
%>
    <div class="grid-item">
         <img src="data:image/jpg;base64,<%= javax.xml.bind.DatatypeConverter.printBase64Binary(resultSet.getBytes("image")) %>" alt="<%= resultSet.getString("name") %>">
        <h3><%= name %></h3>
        <p class="price">Rs.<%= price %></p>
         <form action="Card.jsp" method="POST">
         				<input type="hidden" name="productId" value="<%=id%>" />
						<input type="hidden" name="product" value="<%=name%>">
						<input type="hidden" name="price" value="<%=price%>">
						<input type="number" name="quantity" value="1">
						<input type="submit" class="button" value="Add to Cart">
					</form>
    </div>
   
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
      </div>    
</body>
</html>
