<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/onlineloan";%>
<%!String user = "root";%>
<%!String psw = "1234";%>
<%
String id = request.getParameter("id");
String bName =request.getParameter("bName");
String bDate =request.getParameter("bDate");



if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update brands_table set id=?,bName=?,bDate=?  where id="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,bName);
ps.setString(3,bDate);
int i = ps.executeUpdate();
if(i > 0)
{
	
	 
RequestDispatcher rd = request.getRequestDispatcher("ManageBrands.jsp");
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