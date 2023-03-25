<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.*" %>
<%@page import="java.math.BigDecimal"%>
<!DOCTYPE html>
<html>
<head>
	<title>cartItems</title>
	<link rel="stylesheet" type="text/css" href="css/card.css">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<script type="text/javascript">

	$('#buysubmit').on('click', function() {
		alert("button")
	});

</script>
<style>
.button{

	height: 40px;
	margin: 85px 0;
	margin-top: -15px;
	margin-left: 240px 
}

.button{

height: 60%;
width: 20%;
padding: 10px 15px;
outline: none;
color: #fff;
background: #b30047;
border: none;
font-size: 14px;
font-weight: 500;
border-radius: 5px;
letter-spacing: 1px;
margin: 20px;
}


.button1{

height: 40%;
width: 20%;
padding: 10px 15px;
outline: none;
color: #fff;
background: #884dff;
border: none;
font-size: 14px;
font-weight: 500;
border-radius: 5px;
letter-spacing: 1px;
margin: 20px;
margin-left: 800px 
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
	<center><h1>Shopping Cart</h1></center>
	<%
		// Get or create the cartItems map
		Map<String, Integer> cartItems = (Map<String, Integer>) session.getAttribute("cartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
			session.setAttribute("cartItems", cartItems);
		}
		
		Map<String, Integer> cID = (Map<String, Integer>) session.getAttribute("cID");
		if (cID == null) {
			cID = new HashMap<>();
			session.setAttribute("cID", cID);
		}
		
		// Handle add to cartItems form submission
		if (request.getMethod().equalsIgnoreCase("POST")) {
			String product = request.getParameter("product");
			String priceString = request.getParameter("price");
			BigDecimal price = new BigDecimal(priceString);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			cartItems.put(product, cartItems.getOrDefault(product, 0) + quantity);
			out.println("<center><p>" + product + " added to cartItems.</p></center>");
		}
		
		// Display cartItems contents
		if (!cartItems.isEmpty()) {
			out.println("<table>");
			out.println("<thead><tr><th>Product Name</th><th>Quantity</th><th>Price</th><th>Total</th></tr></thead>");
			out.println("<tbody>");
			double grandTotal = 0.0;
			DecimalFormat decimalFormat = new DecimalFormat("#0.00");
			try {
				// Connect to the database
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan", "root", "");
				Statement statement = connection.createStatement();
				
				// Loop through the cartItems and display each item and its total
				for (Map.Entry<String, Integer> entry : cartItems.entrySet()) {
					String product = entry.getKey();
					int quantity = entry.getValue();
					String sql = "SELECT price FROM product_table WHERE name = '" + product + "'";
					ResultSet resultSet = statement.executeQuery(sql);
					if (resultSet.next()) {
						double price = resultSet.getDouble("price");
						double total = price * quantity;
						grandTotal += total;
						out.println("<tr>");
						out.println("<td>" + product + "</td>");
						out.println("<td>" + quantity + "</td>");
						out.println("<td>Rs." + decimalFormat.format(price) + "</td>");
						out.println("<td>Rs." + decimalFormat.format(total) + "</td>");
						out.println("</tr>");
						out.println("<tr><td colspan=\"3\">Grand Total:</td><td>Rs." + decimalFormat.format(grandTotal) + "</td></tr>");
						out.println("</tbody>");
						out.println("</table>");
						
						double installmentAmount = total / 3;
						double installmentAmount1 = total / 2;
						double installmentAmount2 = total / 1;
						double finalInstallmentAmount = installmentAmount + (total % 3);
						
						Locale locale = new Locale("si", "LK");
						NumberFormat formatter = NumberFormat.getCurrencyInstance(locale);
						String moneyString = formatter.format(finalInstallmentAmount);
						
						
						
						// Output payment form with installment plan options
						out.println("<h1>Checkout</h1>");
						out.println("<form action=\"PaymentProcess.jsp\" method=\"post\">");
						out.println("<p>Total Price: Rs." + total + "</p>");
						out.println("<p>Choose your installment plan:</p>");
						out.println("<ul>");
						out.println("<li><input type=\"radio\" name=\"installmentPlan\" value=\"1\" checked> 1 month - 1st Month: Rs." + installmentAmount2 + "</li>");
						out.println("<li><input type=\"radio\" name=\"installmentPlan\" value=\"2\" checked> 2 months - 1st Month: Rs." + installmentAmount1 + " - 2nd Month: Rs." + installmentAmount1 + "</li>");
						out.println("<li><input type=\"radio\" name=\"installmentPlan\" value=\"3\" checked> 3 months - 1st Month: Rs." + moneyString + " - 2nd Month: Rs." + moneyString + " - 3rd Month: Rs." + moneyString + "</li>");
						out.println("</ul>");
						out.println("<input type=\"hidden\" value=\""+total+"\" name=\"total\">");
						//out.println("<input type=\"hidden\" value=\""+installmentAmount+"\" name=\"installmentAmount\">");
						//out.println("<input type=\"hidden\" value=\""+finalInstallmentAmount+"\" name=\"finalInstallmentAmount\">");
						
						
						if(total<=15001){
							out.println("<input type=\"submit\" id=\"buysubmit\" class=\"button\" value=\"Buy\">");
						}else{
							out.println("<p>You can't buy more than Rs.15000.00</p>");
						}
						
						
						
						out.println("</form>");
						
						out.println("<form action=\"ClearCartServlet\" method=\"post\">");
						out.println("<input type=\"submit\" class=\"button1\" value=\"Clear\">");
						out.println("</form>");
						
						// Save order information to MySQL database
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan","root","");
						PreparedStatement pstmt = con.prepareStatement("INSERT INTO total_table (total) VALUES (?)");
						// Replace the placeholders with actual values
		                pstmt.setDouble(1, total);
						pstmt.executeUpdate();
					}
					
					resultSet.close();
				}

				// Display the grand total and close the database connection
				
				statement.close();
				connection.close();
				
							
				
			} catch (ClassNotFoundException e) {
				out.println("<p>Database driver not found.</p>");
			} catch (SQLException e) {
				out.println("<p>Database error: " + e.getMessage() + "</p>");
			}
		} else {
			out.println("<p>Your cartItems is empty.</p>");
		}
		
		
		
	%>


	
	<p><a href="ProductView.jsp">Continue Shopping</a></p>
	
	<br><br><br>
		<footer>
		<p>&copy; 2023 Bumble bee Online Store</p>
	</footer>
	
	</body>
</html>

