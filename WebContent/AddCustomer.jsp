<!DOCTYPE html>
<html>
<head>
	<title>Register Form</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<script>

function validateForm() {
  
  var b = document.forms["CusReg"]["email"].value;
  if (b == "") {
	    alert("Email cannot be Empty!!");
	    return false;
	  }
  
  
  var c = document.forms["CusReg"]["name"].value;
  if (c == "") {
	    alert("Name cannot be Empty!!");
	    return false;
	  }
  
  var d= document.forms["CusReg"]["dateOfBirth"].value;
  if (d == "") {
	    alert("Date of Birth cannot be Empty!!");
	    return false;
	  }


}



</script>
<body>
	<img class="wave" src="img/wave.png">
	<div class="container">
		<div class="img">
			<img src="img/.svg">
		</div>
		<div class="login-content">
			<form action="CustomerRegister" method="post" name="CusReg" onsubmit="return validateForm()">
				<img src="img/man.svg">
				<h1>Customer Register</h1>
				<h2 class="title">Welcome</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Email</h5>
           		   		<input type="email" id="uname" name="email" class="input">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Name</h5>
           		    	<input type="text"  id="name" name="name" class="input">
            	   </div>
            	</div>
            	<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5></h5>
           		    	<input type="date"  id="dateOfBirth" name="dateOfBirth" class="input">
            	   </div>
            	</div>
            	
            	<input type="submit" class="btn" value="Submit">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="js/main.js"></script>
</body>
</html>
