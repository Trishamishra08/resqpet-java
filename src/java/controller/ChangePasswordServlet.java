package controller;

import util.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) {
            session.setAttribute("errorMsg", "Session expired. Please login again.");
            response.sendRedirect("login.jsp");
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            session.setAttribute("errorMsg", "New Password and Confirm Password do not match.");
            response.sendRedirect("changepassword.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT password FROM ngo WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String currentPassword = rs.getString("password");

                if (currentPassword.equals(oldPassword)) {
                    PreparedStatement updatePs = con.prepareStatement("UPDATE ngo SET password=? WHERE email=?");
                    updatePs.setString(1, newPassword);
                    updatePs.setString(2, email);
                    int update = updatePs.executeUpdate();

                    if (update > 0) {
                        session.setAttribute("successMsg", "Password changed successfully!");
                    } else {
                        session.setAttribute("errorMsg", "Failed to update password.");
                    }
                } else {
                    session.setAttribute("errorMsg", "Old password is incorrect.");
                }
            } else {
                session.setAttribute("errorMsg", "NGO not found.");
            }

        } catch (Exception e) {
            session.setAttribute("errorMsg", "Error: " + e.getMessage());
        }

        response.sendRedirect("changepassword.jsp");
    }
}
