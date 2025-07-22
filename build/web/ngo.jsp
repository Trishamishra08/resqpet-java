<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="model.RescueRequest" %>
<%
    Object role = session.getAttribute("role");
    if (role == null || !"ngo".equals(role.toString())) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<RescueRequest> rescueList = (List<RescueRequest>) request.getAttribute("rescueList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>NGO Dashboard - ResQPet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="icon" href="images/logo.jpg" type="image/jpeg">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #F5F5DC;
            overflow-x: hidden;
        }
        .sidebar {
            width: 220px;
            background-color: #343a40;
            height: 100vh;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 70px;
            transition: transform 0.3s ease-in-out;
            z-index: 999;
        }
        .sidebar.hidden { transform: translateX(-100%); }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .sidebar a:hover {
            background-color: #495057;
            color: #DFD0B8;
        }
        .topbar {
            height: 60px;
            background-color: #333446;
            color: #DFD0B8;
            padding: 0 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        .profile-btn {
            background: none;
            border: none;
            cursor: pointer;
        }
        .profile-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #fff;
        }
        .admin-popup {
            display: none;
            position: absolute;
            top: 50%;
            left: 55px;
            transform: translateY(-50%);
            background: white;
            padding: 5px 10px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.3);
            font-size: 13px;
            font-weight: 500;
            z-index: 1001;
            color: black;
            white-space: nowrap;
        }
        .logout-btn {
            background-color: #6c5c4d;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }
        .logout-btn:hover { background-color: #948979; }
        .content {
            margin-top: 60px;
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }
        .content.full-width { margin-left: 0; }
        .dashboard-card {
            background-color: #6c5c4d;
            border-radius: 15px;
            padding: 25px 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            height: 100%;
        }
        .dashboard-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
        }
        .dashboard-card img {
            width: 70px;
            height: 70px;
            margin-bottom: 15px;
            border-radius: 50%;
            object-fit: cover;
            background-color: white;
            border: 2px solid #eaeaea;
        }
        .dashboard-card h5 { color: #fff; font-size: 18px; margin-bottom: 8px; }
        .dashboard-card h2 { font-size: 26px; font-weight: bold; }
        .dashboard-title {
            font-size: 30px;
            font-weight: bold;
            font-family: 'Georgia', serif;
            color: #DFD0B8;
        }
        .dashboard-heading {
            font-family: Georgia, serif;
            font-size: 28px;
            font-weight: bold;
            color: #333446;
            text-decoration: underline;
        }
        table.custom-rescue-table {
            background-color: #fefcf7;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 100%;
        }

        .custom-rescue-table th {
            background-color: #333446; /* match your topbar color */
            color: #DFD0B8;
            padding: 12px;
            font-size: 15px;
        }

        .custom-rescue-table td {
            background-color: #B8CFCE;
            color: #333;
            padding: 10px;
            font-size: 14px;
        }

        .custom-rescue-table tr:nth-child(even) td {
            background-color: #f3eee6;
        }

        .custom-rescue-table tr:hover td {
            background-color: #e1e3d8;
        }

        .custom-rescue-table img {
            border-radius: 6px;
            object-fit: cover;
        }

        .badge.bg-warning {
            background-color: #f0ad4e !important;
            color: #333 !important;
        }

        .badge.bg-info {
            background-color: #5bc0de !important;
            color: #fff !important;
        }

        .badge.bg-success {
            background-color: #28a745 !important;
            color: #fff !important;
        }
        .custom-modal-bg {
            background-color: #f8f4e6 !important; /* Light beige matching your theme */
            border-radius: 12px;
        }

    </style>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar hidden" id="ngoSidebar">
    <a href="editprofilengo.jsp">Edit Profile</a>
    <a href="changepasswordngo.jsp">Change Password</a>
    <a href="#" data-bs-toggle="modal" data-bs-target="#reportsModal">Manage Reports</a>
</div>

<!-- Topbar -->
<div class="topbar">
    <div style="position: relative;">
        <button class="profile-btn" onclick="toggleNgoSidebar()">
            <img src="images/admin-icon.png" class="profile-img" alt="NGO" />
        </button>
        <div id="ngoPopup" class="admin-popup">
            <%= session.getAttribute("ngoName") != null ? session.getAttribute("ngoName") : "NGO" %>
        </div>
    </div>
    <div class="dashboard-title text-center flex-grow-1">NGO Dashboard</div>
    <a href="logout.jsp" class="logout-btn">Logout</a>
</div>

<!-- Main Content -->
<div class="content" id="mainContent">
    <div class="text-center mb-4 mt-2">
        <h2 class="dashboard-heading">
            Welcome <%= session.getAttribute("ngoName") != null ? session.getAttribute("ngoName") : "NGO" %>
        </h2>
        <p class="text-muted">Track and manage animal rescue requests</p>
    </div>

    <!-- Cards -->
    <div class="row justify-content-center gx-4 gy-4">
        <div class="col-md-4 col-lg-3">
            <div class="dashboard-card">
                <img src="images/total.jpg" alt="Total Requests">
                <h5>Total Requests</h5>
                <h2 class="text-success"><%= rescueList != null ? rescueList.size() : 0 %></h2>
            </div>
        </div>
        <div class="col-md-4 col-lg-3">
            <div class="dashboard-card">
                <img src="images/inprogress.jpg" alt="In Progress">
                <h5>In Progress</h5>
                <h2 class="text-warning">
                    <%
                        int count = 0;
                        if (rescueList != null) {
                            for (RescueRequest r : rescueList) {
                                if ("in-progress".equalsIgnoreCase(r.getStatus())) count++;
                            }
                        }
                        out.print(count);
                    %>
                </h2>
            </div>
        </div>
        <div class="col-md-4 col-lg-3">
            <div class="dashboard-card" data-bs-toggle="modal" data-bs-target="#reportsModal">
                <img src="images/manage.jpg" alt="Manage Reports">
                <h5>Manage Reports</h5>
            </div>
        </div>
    </div>
</div>

<!-- Rescue Reports Modal -->
<div class="modal fade" id="reportsModal" tabindex="-1">
  <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content custom-modal-bg">
      <div class="modal-header">
        <h4 class="modal-title text-center w-100" style="font-family: Georgia, serif; font-weight: bold; color: #6c5c4d; text-decoration: underline;">
         Request Panel
       </h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table custom-rescue-table align-middle text-center shadow-sm rounded">
          <thead class="table-dark">
            <tr>
              <th>Req ID</th>
              <th>Email</th>
              <th>Location</th>
              <th>City</th>
              <th>Description</th>
              <th>Image</th>
              <th>Status</th>
              <th>Time</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <%
              if (rescueList != null && !rescueList.isEmpty()) {
                  for (RescueRequest r : rescueList) {
            %>
            <tr>
              <td>#REQ<%= r.getId() %></td>
              <td><%= r.getEmail() %></td>
              <td><%= r.getLocation() %></td>
              <td><%= r.getCity() %></td>
              <td><%= r.getDescription() %></td>
              <td><img src="petimages/<%= r.getImagePath() %>" style="width: 60px; height: 60px;"></td>
              <td>
                <span class="badge 
                    <%= 
                        "pending".equalsIgnoreCase(r.getStatus()) ? "bg-warning text-dark" :
                        "in-progress".equalsIgnoreCase(r.getStatus()) ? "bg-info" :
                        "bg-success" 
                    %>">
                  <%= r.getStatus() %>
                </span>
              </td>
              <td><%= r.getRequestDate() != null ? r.getRequestDate().toString() : "N/A" %></td>
              <td>
                <form action="RescueController" method="post" style="display:inline;">
                  <input type="hidden" name="id" value="<%= r.getId() %>" />
                  <% if ("pending".equalsIgnoreCase(r.getStatus())) { %>
                    <input type="hidden" name="status" value="in-progress" />
                    <button class="btn btn-sm btn-primary">Mark In-Progress</button>
                  <% } else if ("in-progress".equalsIgnoreCase(r.getStatus())) { %>
                    <input type="hidden" name="status" value="resolved" />
                    <button class="btn btn-sm btn-primary">Mark Resolved</button>
                  <% } %>
                </form>
                <form action="RescueController" method="post" style="display:inline;">
                  <input type="hidden" name="action" value="delete" />
                  <input type="hidden" name="id" value="<%= r.getId() %>" />
                  <button class="btn btn-sm btn-outline-danger">Delete</button>
                </form>
              </td>
            </tr>
            <%
                  }
              } else {
            %>
            <tr><td colspan="9">No rescue requests found.</td></tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function toggleNgoSidebar() {
        const sidebar = document.getElementById("ngoSidebar");
        const content = document.getElementById("mainContent");
        const popup = document.getElementById("ngoPopup");

        sidebar.classList.toggle("hidden");
        content.classList.toggle("full-width");
        popup.style.display = popup.style.display === "block" ? "none" : "block";
    }

    window.addEventListener("click", function (e) {
        const popup = document.getElementById("ngoPopup");
        const profile = document.querySelector(".profile-btn");
        if (!profile.contains(e.target)) {
            popup.style.display = "none";
        }
    });
</script>
</body>
</html>
