package addProduct;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the product ID from the request parameter
        int productId = Integer.parseInt(request.getParameter("id"));

        // Set content type to image/jpg
        response.setContentType("image/jpg");

        // Get input stream for image file
        InputStream is = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineloan", "root", "");
            PreparedStatement stmt = con.prepareStatement("SELECT image FROM product_table WHERE id=?");
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                is = rs.getBinaryStream("image");
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ImageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (is == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Copy image data to output stream
        OutputStream os = response.getOutputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = is.read(buffer)) != -1) {
            os.write(buffer, 0, bytesRead);
        }

        // Close input/output streams
        os.close();
        is.close();
    }
}
