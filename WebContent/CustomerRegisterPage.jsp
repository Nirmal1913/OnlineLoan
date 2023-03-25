<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/return.css" rel="stylesheet" text="text/css">
<link href="css/index.css" rel="stylesheet" text="text/css">
<script>

function validateForm() {
  
  var b = document.forms["AddReturn"]["email"].value;
  if (b == "") {
	    alert("Product No cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["AddReturn"]["name"].value;
  if (c == "") {
	    alert("Product type cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["AddReturn"]["dateOfBirth"].value;
  if (d == "") {
	    alert("QTY cannot be Empty!!");
	    return false;
	  }


}



</script>


<meta charset="ISO-8859-1">
<title>Customer Register</title>
</head>
<body>

<div class="title">
	 <p class= "title-text">NEW VEENA PRINTERS</p>
 </div>
  <div class="wrapper1">
 
 <div class="sidebar1">
  <div class="img1-div"><img src="img/img.jpeg" alt="" class="img1"></div>
 
  <ul>
  	<li><a href="ReturnProductCreate.jsp">Add Return Product</a></li>
  	<li><a href="ReturnProductView.jsp">Return Product details</a></li>
  	<li><a href="ProductReport.jsp">Return Product Report</a></li>
  	<li><a href="#">Payment</a></li>
    <li><a href="#">HOME</a></li>
  </ul>
 </div>

    
 </div>
<br>
<br>
<h2>Customer Register</h2>



<div class="container">
  <form action="CustomerRegister" method="post" name="AddReturn" onsubmit="return validateForm()">
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Email</label>
    </div>
    <div class="col-65">
      <input type="text" id="email" name="email"  >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Name</label>
    </div>
    <div class="col-65">
      <input type="text" id="name" name="name"  >
    </div>
  </div>
  <div class="row">
    <div class="col-35">
      <label for="givennames" class="form__label">Date of Birth</label>
    </div>
    <div class="col-65">
      <input type="date" id="dateOfBirth" name="dateOfBirth" >
    </div>
  </div>
  


  <br>
  
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
</div>

//footer
<div class="footer">
	
	<div class="footer-bottom">
			&copy;NewVeenaPrinters.com | Desinged by ITP21_S2_MT_03
	</div>
</div>
</body>
</html>