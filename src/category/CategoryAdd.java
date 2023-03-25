package category;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CategoryAdd") 
public class CategoryAdd extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{ 
		
		String cName = request.getParameter("cName");
		
		 Connection conn = null;
		    
		    try {
		    	String sql = "insert into categories(cName) values(?)";
		    	Class.forName("com.mysql.cj.jdbc.Driver");
			     conn =  DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan","root","1234");
			    PreparedStatement st = conn.prepareStatement(sql);
			   		
			    
			    st.setString(1, cName);
			   
			    
			    int row = st.executeUpdate();
			     
			    System.out.println("db connected!!");

		        if (row > 0) {
		          System.out.println("File uploaded and saved into database");
		          
		          
		          RequestDispatcher rd = request.getRequestDispatcher("/ManageCategory.jsp");
		          
		          rd.include(request, response);
		        }
		       
		    }catch (Exception e) {
				e.printStackTrace();
				
			}
		    
		
		
	} 
	

	} 
	




