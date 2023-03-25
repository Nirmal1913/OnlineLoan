<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  String url = "jdbc:mysql://localhost:3306/mydb";
  String user = "root";
  String password = "password";

  try {
    // Connect to the database
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);

    // Clear the cart data
    String sql = "DELETE FROM cart_items";
    stmt = conn.prepareStatement(sql);
    stmt.executeUpdate();

    // Redirect back to the cart page
    response.sendRedirect("cart.jsp");
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // Close the database resources
    if (rs != null) {
      rs.close();
    }
    if (stmt != null) {
      stmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }
%>
