<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "onlineloan";
String userid = "root";
String password = "1234";
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
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/table.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">
<style>
.button {
  background-color: #308C6E;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 10px 2px;
  cursor: pointer;
  margin: 0 460px;
}
.button3 {
  background-color: #0080c0;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
.button2 {
  background-color: #ff0000;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>


<meta charset="ISO-8859-1">
<title>Customer</title>
</head>
<body>

<div class="title">
	 <p class= "title-text">Bumble bee</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="img/img.jpeg" alt="" class="img1"></div>
      <ul>
    <li><a href="AdminDashboard.jsp">HOME</a></li>
  	<li><a href="ManageProduct.jsp">Product</a></li>
  	<li><a href="ManageBrands.jsp">Brand</a></li>
  	<li><a href="ManageCategory.jsp">Category</a></li>
  	<li><a href="ManageOrder.jsp">Order</a></li>
  	<li><a href="ManageCustomer.jsp">Manage Users</a></li>
  </ul>

 </div>

    
 </div>
 
 
<br>
<br>
<h2>Order Details</h2>

<div class="">

			  <center>
						
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">ID</th>
								 <th scope="col">Customer Name</th>
								 <th scope="col">Email</th>
								 <th scope="col">Available Loan Balance</th>
								 <th scope="col">Total Price</th>
								 <th scope="col">Installment Plan</th>
								 <th scope="col">Installment Amount (per month)</th>

						
								   
								  
									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from orders";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("id") %></td>
				  <td><%=resultSet.getString("name") %></td>
				  <td><%=resultSet.getString("email") %></td>
				  <td><%=resultSet.getString("LoanBalance") %></td>
				  <td><%=resultSet.getString("total") %></td>
				  <td><%=resultSet.getString("installmentPlan") %></td>
				  <td><%=resultSet.getString("installmentAmount") %></td>
				  

				  				  
				 
				  <td><a href="DeleteOrder.jsp?id=<%=resultSet.getInt("id") %>"><button class="button2" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				  
				  </tbody>
					  
			  </table>
			</center>
			
		</div>




</body>
</html>