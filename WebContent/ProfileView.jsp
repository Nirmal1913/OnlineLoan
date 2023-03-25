<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Customer Profile</title>
     <link rel="stylesheet" type="text/css" href="css/nav.css">
    <style>
      /* CSS styles for the customer profile */
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
      }

      .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
      }

      .customer-info {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
      }

      .customer-info img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 20px;
      }

      .customer-info h1 {
        font-size: 32px;
        margin: 0;
      }

      .customer-info p {
        font-size: 18px;
        margin: 0;
      }

      .customer-details {
        display: flex;
        flex-wrap: wrap;
      }

      .customer-details div {
        flex-basis: calc(50% - 20px);
        margin-right: 20px;
        margin-bottom: 20px;
      }

      .customer-details div:last-child {
        margin-right: 0;
      }

      .customer-details h2 {
        font-size: 24px;
        margin-bottom: 10px;
      }

      .customer-details p {
        font-size: 18px;
        margin: 0;
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
				<% if (session.getAttribute("name") != null) { %>
  				<lii><span>Welcome, <%= session.getAttribute("name") %></span></lii>
				<% } %>
			</ul>
		</nav>
	</header>
  
  <br><br><br><br><br>
  
    <div class="container">
      <div class="customer-info">
        <img src="img/userP.svg" alt="Customer Profile Picture">
        <div>
          <h1><%= session.getAttribute("name") %></h1>
          <p><%= session.getAttribute("email") %></p>
        </div>
      </div>
      <div class="customer-details">
        <div>
          <h2>Personal Information</h2>
          <p>Name:  <%= session.getAttribute("name") %></p>
          <p>Email:  <%= session.getAttribute("email") %></p>
          <p>Date of Birth:  <%= session.getAttribute("dateOfBirth") %></p>
        </div>
        <div>
          <h2>Account Information</h2>
          <p>Account Balance:  Rs.15000.00</p>
          <p>Last Payment:  Pending</p>
          <p>Next Payment Due:  Pending</p>
        </div>
      </div>
    </div>

<br><br><br><br><br><br>
	<footer>
		<p>&copy; 2023 Bumble bee Online Store</p>
	</footer>
  </body>
</html>

