<!DOCTYPE html>
<html>
<head>
	<title>Customer Dashboard</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/admin.css">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
<style>
img {
			max-width: 60%;
			height: auto;
			display: block;
  			transition: transform 0.2s ease-in-out;
		}
</style>	
</head>

<body>
	<header>
		<nav>
			<ul>
				<li><a href="Index.jsp">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<lii><a href="Card.jsp">Cart</a></liii>
				<% if (session.getAttribute("name") != null) { %>
  				<liii><span>Welcome, <%= session.getAttribute("name") %></span></liii>
				<% } %>
			</ul>
		</nav>
	</header>
<br><br>

 <h2>Customer Dashboard</h2>
 <br>
	<section class="dashboard">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">				
							<h5><a class="nav-link" href="ProductView.jsp">All Product</a></h5>					
							<p class="card-text">Select Your Product</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<h5> <a class="nav-link" href="BrandView.jsp">All Brand</a></h5>
							<p class="card-text">Select Your Brands</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<h5> <a class="nav-link" href="CategoryView.jsp">All Category</a></h5>
							<p class="card-text">Select Category</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<h5><a class="nav-link" href="ProfileView.jsp">Customer Profile</a></h5>
							<p class="card-text">View Your Profile</p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
		<br><br><br><br><br><br><br><br><br><br><br>
	<footer>
		<p>&copy; 2023 Bumble bee Online Store</p>
	</footer>

</body>
</html>
	
