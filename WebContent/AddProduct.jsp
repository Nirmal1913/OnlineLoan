<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">
<script>

function validateForm() {
  
  var b = document.forms["AddProduct"]["name"].value;
  if (b == "") {
	    alert("Product Name cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["AddProduct"]["price"].value;
  if (c == "") {
	    alert("Price cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddProduct"]["image"].value;
  if (d == "") {
	    alert("Image cannot be Empty!!");
	    return false;
	  }
}

</script>


<meta charset="ISO-8859-1">
<title>Add Product</title>
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
<h2>Add Product</h2>



<div class="container">
  <form action="ProductAdd" method="post" name="AddProduct" onsubmit="return validateForm()" enctype="multipart/form-data">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Product name</label>
    </div>
    <div class="col-65">
      <input type="text" id="name" name="name"  >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Price</label>
    </div>
    <div class="col-65">
      <input type="text" id="price" name="price"  >
    </div>
  </div>
   <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Image</label>
    </div>
    <div class="col-65">
      <input type="file" id="image" name="image"  >
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