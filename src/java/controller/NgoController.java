package controller;

import dao.NgoDAO;
import model.Ngo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/NgoController")
public class NgoController extends HttpServlet {

    /* =================  GET  ================= */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Default action – list all NGOs for admin dashboard
        if (action == null || "viewAll".equalsIgnoreCase(action)) {
            listAllNgos(request, response);
            return;
        }

        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action in GET: " + action);
    }

    /* =================  POST  ================= */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing action parameter.");
            return;
        }

        switch (action) {
            case "register":
                registerNgo(request, response);
                break;
            case "login":
                loginUser(request, response);
                break;
            case "updateStatus":
                updateNgoStatus(request, response);
                break;
            case "delete":
                deleteNgo(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action in POST: " + action);
        }
    }

    /* ============ 1. LIST ALL NGOs (Admin view) ============ */
    private void listAllNgos(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Ngo> ngoList = NgoDAO.getAllNgos();
        long totalNgos   = ngoList.size();
        long pendingNgos = ngoList.stream().filter(n -> n.getStatus() == 0).count();

        req.setAttribute("ngoList", ngoList);
        req.setAttribute("totalNgos", totalNgos);
        req.setAttribute("pendingNgos", pendingNgos);

        req.getRequestDispatcher("admin.jsp").forward(req, res);
    }

    /* ============ 2. REGISTRATION ============ */
    private void registerNgo(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        Ngo ngo = new Ngo();
        ngo.setName(req.getParameter("name"));
        ngo.setEmail(req.getParameter("email"));
        ngo.setMobile(req.getParameter("mobile"));
        ngo.setAddress(req.getParameter("address"));
        ngo.setPincode(req.getParameter("pincode"));
        ngo.setCity(req.getParameter("city"));
        ngo.setPassword(req.getParameter("password"));
        ngo.setStatus(0);       // pending
        ngo.setRole("ngo");     // default

        boolean success = NgoDAO.registerNgo(ngo);
        req.setAttribute("output",
                success ? "✅ Registration successful. Await admin approval."
                        : "❌ Registration failed. Please try again.");
        req.getRequestDispatcher("register.jsp").forward(req, res);
    }

    /* ============ 3. LOGIN (Admin or Approved NGO) ============ */
    private void loginUser(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Ngo ngo = NgoDAO.loginNgo(email, password);

        if (ngo == null) {
            req.setAttribute("output", "❌ Invalid email or password.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
            return;
        }

        if ("ngo".equalsIgnoreCase(ngo.getRole()) && ngo.getStatus() != 1) {
            req.setAttribute("output", "⚠️ Your NGO is not approved by admin yet.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
            return;
        }

        HttpSession session = req.getSession();
        session.setAttribute("userObj", ngo);
        session.setAttribute("userName", ngo.getName());
        session.setAttribute("role", ngo.getRole());
        session.setAttribute("email", ngo.getEmail());
        

        if ("admin".equalsIgnoreCase(ngo.getRole())) {
            res.sendRedirect("NgoController?action=viewAll");   // admin dashboard
        } else {
            res.sendRedirect("RescueController?action=viewAll");  // NGO dashboard with data
        }

    }

    /* ============ 4. UPDATE STATUS (Admin) ============ */
    private void updateNgoStatus(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id          = Integer.parseInt(req.getParameter("id"));
            String status   = req.getParameter("status");          // "approved" / "pending"
            int statusValue = "approved".equalsIgnoreCase(status) ? 1 : 0;

            boolean ok = NgoDAO.updateNgoStatus(id, statusValue);
            req.getSession().setAttribute("output",
                    ok ? "✅ NGO status updated." : "❌ Could not update status.");

        } catch (Exception e) {
            req.getSession().setAttribute("output", "❌ Error: " + e.getMessage());
        }

        // ✅ Prevent resubmission warning
        res.sendRedirect("NgoController?action=viewAll");
    }

    /* ============ 5. DELETE NGO (Admin) ============ */
    private void deleteNgo(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            boolean ok = NgoDAO.deleteNgo(id);
            req.getSession().setAttribute("output",
                    ok ? "✅ NGO deleted." : "❌ Failed to delete NGO.");
        } catch (Exception e) {
            req.getSession().setAttribute("output", "❌ Error: " + e.getMessage());
        }

        // ✅ Prevent resubmission warning
        res.sendRedirect("NgoController?action=viewAll");
    }
}
