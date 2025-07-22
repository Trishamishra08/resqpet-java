package controller;

import dao.RescueDAO;
import model.Ngo;
import model.RescueRequest;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/RescueController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class RescueRequestController extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || "viewAll".equalsIgnoreCase(action)) {
            listByNgoLocation(req, res);
        } else {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action in GET: " + action);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("submit".equalsIgnoreCase(action)) {
            submitRescueReport(req, res);
        } else if ("delete".equalsIgnoreCase(action)) {
            deleteRequest(req, res);
        } else if (req.getParameter("status") != null) {
            updateStatus(req, res);
        } else {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid POST action");
        }
    }

    private void submitRescueReport(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String location = req.getParameter("location");
            String city = req.getParameter("city");
            String description = req.getParameter("description");
            String status = "pending";

            Ngo matchedNgo = RescueDAO.getMatchingNgo(city);
            if (matchedNgo == null) {
                req.setAttribute("matched", false);
                req.setAttribute("msg", "❌ No registered NGO found in this city.");
                req.getRequestDispatcher("report.jsp").forward(req, res);
                return;
            }

            // Upload image
            Part filePart = req.getPart("animalImage");
            String fileName = new java.io.File(filePart.getSubmittedFileName()).getName();
            String uploadDir = getServletContext().getRealPath("") + "petimages";
            java.io.File uploadFolder = new java.io.File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdirs();
            String fullPath = uploadDir + java.io.File.separator + fileName;
            filePart.write(fullPath);

            RescueRequest r = new RescueRequest();
            r.setEmail(email);
            r.setLocation(location);
            r.setCity(city);
            r.setDescription(description);
            r.setImagePath(fileName);
            r.setStatus(status);

            boolean saved = RescueDAO.saveRescueRequest(r);

            req.setAttribute("matched", true);
            req.setAttribute("matchedNgoName", matchedNgo.getName());
            req.setAttribute("matchedNgoEmail", matchedNgo.getEmail());
            req.setAttribute("reqStatus", status);

            if (saved) {
                req.setAttribute("msg", "✅ Rescue request submitted successfully.");
            } else {
                req.setAttribute("msg", "❌ Failed to submit rescue request.");
            }

        } catch (Exception e) {
            req.setAttribute("error", "❌ Error: " + e.getMessage());
        }

        req.getRequestDispatcher("report.jsp").forward(req, res);
    }

    private void listByNgoLocation(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        Ngo ngo = (Ngo) session.getAttribute("userObj");

        if (ngo != null) {
            String ngoCity = ngo.getCity();
            List<RescueRequest> rescueList = RescueDAO.getRescueRequestsByNgoCity(ngoCity);
            req.setAttribute("rescueList", rescueList);
        } else {
            req.setAttribute("rescueList", null);
        }

        req.getRequestDispatcher("ngo.jsp").forward(req, res);
    }

    private void updateStatus(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String status = req.getParameter("status");

            boolean updated = RescueDAO.updateStatus(id, status);
            req.getSession().setAttribute("output", updated ? "✅ Status updated." : "❌ Failed to update.");
        } catch (Exception e) {
            req.getSession().setAttribute("output", "❌ Error: " + e.getMessage());
        }
        res.sendRedirect("RescueController?action=viewAll");
    }

    private void deleteRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean deleted = RescueDAO.deleteRescueRequest(id);
            req.getSession().setAttribute("output", deleted ? "✅ Request deleted." : "❌ Failed to delete.");
        } catch (Exception e) {
            req.getSession().setAttribute("output", "❌ Error: " + e.getMessage());
        }
        res.sendRedirect("RescueController?action=viewAll");
    }
}
