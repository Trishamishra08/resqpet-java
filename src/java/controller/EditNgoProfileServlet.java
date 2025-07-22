package controller;

import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/EditNgoProfileServlet")
public class EditNgoProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");

        HttpSession session = request.getSession();

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE ngo SET name=?, mobile=?, address=?, city=?, pincode=? WHERE email=?");

            ps.setString(1, name);
            ps.setString(2, mobile);
            ps.setString(3, address);
            ps.setString(4, city);
            ps.setString(5, pincode);
            ps.setString(6, email);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                session.setAttribute("successMsg", "Profile updated successfully!");
            } else {
                session.setAttribute("successMsg", "Failed to update profile.");
            }

        } catch (Exception e) {
            session.setAttribute("successMsg", "Error: " + e.getMessage());
        }

        response.sendRedirect("editprofilengo.jsp");
    }
}
