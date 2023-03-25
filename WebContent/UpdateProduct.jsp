<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product_table where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">

//Header and Navigation

<meta charset="ISO-8859-1">
<title>Product</title>
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
  	<li><a href="ManageCustomer.jsp">Manage Users</a></li>
  </ul>
 </div>

    
 </div>
<br>
<br>
<h2>Update Product</h2>



<div class="container">
  <form action="UpdateProcessProduct.jsp" method="post">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">ID</label>
    </div>
    <div class="col-65">
      <input type="text"  name="id" readonly id="id" value="<%=resultSet.getInt("id") %>" >
    </div>
  </div>
    <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product Name</label>
    </div>
    <div class="col-65">
      <input type="text" id="name" name="name" value="<%=resultSet.getString("name") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Price</label>
    </div>
    <div class="col-65">
      <input type="text" id="price" name="price" value="<%=resultSet.getBigDecimal("price") %>">
    </div>
  </div>
   <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Image</label>
    </div>
    <div class="col-65">
      <input type="file" id="image" name="image" value="<%=resultSet.getBytes("image") %>">
    </div>
  </div>
 

  <div class="row">
    <input type="submit" value="Update">
  </div>
  </form>
<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>   
</div>


</body>
</html>