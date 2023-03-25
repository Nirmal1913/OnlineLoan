package brands;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BrandAdd") 
public class BrandAdd extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
		

		String bName = request.getParameter("bName");
		String bDate = request.getParameter("bDate");
		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into brands_table(bName,bDate) values(?,?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan","root","");
			    PreparedStatement st = conn.prepareStatement(sql);
			   		
			    
			    st.setString(1, bName);
			    st.setString(2, bDate);
			   
			    
			    int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		         		
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/ManageBrands.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();
				
			}
		    
		
		
	} 
	

	} 
	



