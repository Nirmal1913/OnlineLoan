<!DOCTYPE html>
<html>
<head>
	<title>Admin Dashboard</title>
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
				<lii><a href="Login.jsp">Login Out</a></lii>
			</ul>
		</nav>
	</header>
<br><br>

 <h2>Admin Dashboard</h2>
 <br>
	<section class="dashboard">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">				
							<h5><a class="nav-link" href="ManageProduct.jsp">Manage Product</a></h5>					
							<p class="card-text">100</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<h5> <a class="nav-link" href="ManageBrands.jsp">Manage Brand</a></h5>
							<p class="card-text">15</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<h5> <a class="nav-link" href="ManageCategory.jsp">Manage Category</a></h5>
							<p class="card-text">30</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card">
						<div class="card-body">
							<h5><a class="nav-link" href="ManageOrder.jsp">Manage Orders</a></h5>
							<p class="card-text">20</p>
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
		<p>&copy; 2023 Rash Online Store</p>
	</footer>

</body>
</html>
	
