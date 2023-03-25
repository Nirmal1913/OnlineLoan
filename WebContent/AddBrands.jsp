<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">
<script>

function validateForm() {
  
  var b = document.forms["AddReturn"]["bName"].value;
  if (b == "") {
	    alert("Product No cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["AddReturn"]["bDate"].value;
  if (c == "") {
	    alert("Product type cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddReturn"]["country"].value;
  if (d == "") {
	    alert("QTY cannot be Empty!!");
	    return false;
	  }
}

</script>


<meta charset="ISO-8859-1">
<title>Add Brand</title>
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
  	<li><a href="ManageCustomer">Manage Users</a></li>
  </ul>
 </div>

    
 </div>
<br>
<br>
<h2>Add Brand</h2>



<div class="container">
  <form action="BrandAdd" method="post" name="AddReturn" onsubmit="return validateForm()">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Brand name</label>
    </div>
    <div class="col-65">
      <input type="text" id="bName" name="bName"  >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Date</label>
    </div>
    <div class="col-65">
      <input type="date" id="bDate" name="bDate"  >
    </div>
  </div>
 
  


  <br>
  
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
</div>


</body>
</html>