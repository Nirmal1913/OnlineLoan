package addProduct;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("serial")
@WebServlet("/ProductAdd")
@MultipartConfig(maxFileSize = 16177215)
public class ProductAdd extends HttpServlet {

    private String dbURL = "jdbc:mysql://localhost:3306/onlineloan";
    private String dbUser = "root";
    private String dbPass = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceString = request.getParameter("price");
        BigDecimal price = new BigDecimal(priceString);

        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "INSERT INTO product_table (name, price, image) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setBigDecimal(2, price);
            if (inputStream != null) {
                statement.setBlob(3, inputStream);
            }

            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Product added successfully";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        request.setAttribute("message", message);
        getServletContext().getRequestDispatcher("/ProductView.jsp").forward(request, response);
    }
}

