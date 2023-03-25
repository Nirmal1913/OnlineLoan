<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
	<title>cartItems</title>
	<link rel="stylesheet" type="text/css" href="css/card.css">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	
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
<%
// Retrieve payment form data

int installmentPlan = Integer.parseInt(request.getParameter("installmentPlan"));
double total = Double.parseDouble(request.getParameter("total"));


String name = null;
String email = null;
Object sessionObj = session.getAttribute("name");
Object sessionObj1 = session.getAttribute("email");
if(sessionObj instanceof String) {
    name = (String) sessionObj;
    email = (String) sessionObj1;
} else {
    // handle error case
}




// Retrieve cart information from session
Object cartItemsObj = session.getAttribute("cartItems");
ArrayList<String[]> cartItems = null;
if(cartItemsObj instanceof ArrayList) {
  cartItems = (ArrayList<String[]>) cartItemsObj;
}


//Retrieve product information from MySQL database and calculate total price
double totalPrice = 0;
if(cartItems != null) {
for (String[] cartItem : cartItems) {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan","root","");
Statement stmt = con.createStatement();
String query = "SELECT * FROM total_table WHERE id = ?";
PreparedStatement ps = con.prepareStatement(query);
ResultSet rs = stmt.executeQuery(query);

double productPrice = rs.getDouble("total");
totalPrice += productPrice;
}
}

//Calculate installment amounts

double installmentAmount = total / installmentPlan;
double finalInstallmentAmount = installmentAmount + (total % 3);
double LoanBalance = 15000 - total;

Locale locale = new Locale("si");
NumberFormat formatter = NumberFormat.getCurrencyInstance(locale);
String moneyString = formatter.format(finalInstallmentAmount);					
String money1String = formatter.format(installmentAmount);

//Output payment receipt
out.println("<h1>Payment Receipt</h1>");
out.println("<p>Name: " + name + "</p>");
out.println("<p>Email: " + email + "</p>");
out.println("<p>Installment Plan: " + installmentPlan + " months</p>");
out.println("<p>Total Price: Rs." + total + "</p>");
out.println("<p>Available Loan Balance: Rs." + LoanBalance + "</p>");
out.println("<p>Installment Amount (per month): Rs." + money1String + "</p>");
out.println("<p>Final Installment Amount (if applicable): Rs." + moneyString + "</p>");


//Save order information to MySQL database
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan","root","");
PreparedStatement pstmt = con.prepareStatement("INSERT INTO orders (name, email, installmentPlan, total,LoanBalance, installmentAmount, finalInstallmentAmount) VALUES (?, ?, ?, ?, ?, ?, ?)");
//Replace the placeholders with actual values
pstmt.setString(1, name); // The ID of the customer who made the purchase
pstmt.setString(2, email); // The ID of the owner of the products in the cart
pstmt.setInt(3, installmentPlan);
pstmt.setDouble(4, total);
pstmt.setDouble(5, LoanBalance);
pstmt.setDouble(6, installmentAmount);
pstmt.setDouble(7, finalInstallmentAmount);
pstmt.executeUpdate();



//Clear cart information from session
session.removeAttribute("cartItems");
%>
<br>
<br>
<br><br><br><br><br><br><br><br><br><br><br>
	<footer>
		<p>&copy; 2023 Bumble bee Online Store</p>
	</footer>
	</body>
</html>