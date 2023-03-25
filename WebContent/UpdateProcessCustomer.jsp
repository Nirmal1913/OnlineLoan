<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/onlineloan";%>
<%!String user = "root";%>
<%!String psw = "1234";%>
<%
String cID = request.getParameter("cID");
String email =request.getParameter("email");
String name =request.getParameter("name");
String dateOfBirth =request.getParameter("dateOfBirth");



if(cID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(cID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update customer set cID=?,email=?,name=?,dateOfBirth=? where cID="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,email);
ps.setString(3,name);
ps.setString(4,dateOfBirth);


int i = ps.executeUpdate();
if(i > 0)
{
	
	 
RequestDispatcher rd = request.getRequestDispatcher("ManageCustomer.jsp");
rd.include(request, response);
}
else
{
out.print("There is a problem in updating Record.");

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 