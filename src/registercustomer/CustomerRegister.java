package registercustomer;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CustomerRegister") 
public class CustomerRegister extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
		
		

		
		String email = request.getParameter("email");
		
		String name = request.getParameter("name");
		
		String dateOfBirth = request.getParameter("dateOfBirth");
		
		
		
		
		 try {
		    	
			   	
			    Class.forName("com.mysql.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan", "root", "");
		        PreparedStatement st = con.prepareStatement("INSERT INTO customer(email,name,dateOfBirth) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
		        
			    
			    st.setString(1, email);
			    
			    st.setString(2, name);
			    
			    st.setString(3, dateOfBirth);
			    

			     int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");
			    
			    ResultSet rs = st.getGeneratedKeys();
		        if (rs.next()) {
		            rs.getInt(1);
		        }
		        con.close();
		        

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		            
		          HttpSession session = request.getSession();
		          if (session != null) {
		              session.setAttribute("name", name);
		              session.setAttribute("email", email);
		              session.setAttribute("dateOfBirth", dateOfBirth);
		          } else {
		              
		          }
		          
					PrintWriter out = response.getWriter(); 

					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
					out.println("<script>");
					out.println("$(document).ready(function(){");
					out.println("swal ( ' Customer Registration Successfully' ,  '' ,  'success' );");
					out.println("});");
					out.println("</script>");
		          
				 

		          RequestDispatcher rd = request.getRequestDispatcher("/ItemDashboard.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();
				
			}
		    
		
		
	} 
	


}
