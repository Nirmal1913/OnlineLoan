<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String id = request.getParameter("id");
	int no = Integer.parseInt(id);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan","root","1234");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from brands_table where id ='" +id+"'");
	response.sendRedirect("ManageBrands.jsp");
	%>