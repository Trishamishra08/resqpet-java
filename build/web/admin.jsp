
<%@ page session="true" import="java.util.List, model.Ngo" %>
<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>ResQPet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="icon" type="image/jpeg" href="images/logo.jpg">
    <style>
  body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
    background-color: #F2F2F2;
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

  .sidebar.hidden {
    transform: translateX(-100%);
  }

  .sidebar a {
    display: block;
    padding: 12px 20px;
    color: white;
    text-decoration: none;
  }

  .topbar {
    height: 60px;
    background-color: #212529;
    color: white;
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
    cursor: pointer;
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
    background-color: #948979;
    border: none;
    padding: 6px 12px;
    font-size: 14px;
    color: white;
    border-radius: 5px;
    text-decoration: none;
  }

  .logout-btn:hover {
    background-color: #DFD0B8;
  }

 .content {
  margin-top: 60px;
  margin-left: 0; /* Fix: push content right to show next to sidebar */
  padding: 20px;
  transition: margin-left 0.3s ease-in-out;
}


  .content.full-width {
    margin-left: 0;
  }

  /* Card styles for dashboard stats + manage NGOs */
    .dashboard-card {
      background-color: #6c5c4d;
      border-radius: 15px;
      padding: 25px 20px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      cursor: pointer; /* Makes all cards clickable */
      height: 100%;
    }

    .dashboard-card:hover {
      transform: translateY(-6px);
      box-shadow: 0 12px 20px rgba(0, 0, 0, 0.2);
    }

  .dashboard-card img {
    width: 80px;
    height: 80px;
    margin-bottom: 15px;
    border-radius: 50%;
    object-fit: cover;
    background-color: white;
    border: 2px solid #eaeaea;
  }

  .dashboard-card h5 {
    color: #fff;
    font-size: 18px;
    margin-bottom: 8px;
  }

  .dashboard-card h2 {
    font-size: 26px;
    font-weight: bold;
  }

 .modal-content {
  background-color: #948979; /* Change to your preferred color */
  border-radius: 12px;
  padding: 2rem;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

  .modal-body {
  background-color: #e4d9c6;  /* Match the table */
  border-radius: 12px;
}

.dashboard-heading {
  color: #333446;                /* Your custom text color */
  font-family: Georgia, serif;   /* Georgia font or serif fallback */
  font-weight: bold;             /* Make it bold */
  font-size: 28px;               /* Optional: adjust size */
  padding: 5px 10px;
  border-radius: 5px;
  display: inline-block; 
  text-decoration: underline; /* This adds underline */
}

body {
  background-color: #B8CFCE; 
}

  @media (max-width: 768px) {
    .content {
      margin-left: 0;
      width: 100%;
    }

    .sidebar {
      width: 100%;
      height: auto;
      position: relative;
      transform: translateX(0);
    }
  }
 
  .sidebar a {
  display: block;
  padding: 12px 20px;
  color: white;
  text-decoration: none;
  transition: background-color 0.3s ease;
  cursor: pointer;
}

.sidebar a:hover {
  background-color: #495057; /* dark gray on hover */
  color: #948979;            /* highlight text (optional) */
}
.table thead th {
  background-color: #403b36;
  color: white;
}

.table tbody tr:hover {
  background-color: #f7f5f2;
  transition: 0.3s ease;
}

.badge {
  font-size: 0.85rem;
  border-radius: 10px;
  font-weight: 500;
}

.btn-sm {
  padding: 5px 10px;
}
.table {
  background-color: #f8f1e8; /* Light brown / cream shade */
}
.modal-header-relative {
  position: relative;
  justify-content: center;
}

.modal-close-right {
  position: absolute;
  right: 1rem;
  top: 0.75rem;
}
.modal-title-center {
  width: 100%;
  text-align: center;
  font-size: 26px;               /* Adjust size */
  font-weight: bold;             /* Bold text */
  font-family: 'Georgia', serif; /* Change font style */
  color: #333446;                /* Optional: match your theme */
  text-decoration: underline;    /* Optional underline */
  margin-bottom: 0;
}

</style>

</head>
<body>
        <div class="sidebar hidden" id="sidebar">
            <a href="editprofile.jsp">Edit Profile</a>
            <a href="changepassword.jsp">Change Password</a>
            <a href="#" data-bs-toggle="modal" data-bs-target="#manageNGOModal">Manage NGOs</a>
        </div>


    <div class="topbar">
        <div style="position: relative;">
            <button class="profile-btn" onclick="toggleSidebar()">
                <img src="images/admin-icon.png" class="profile-img" alt="Admin" />
            </button>
            <div id="adminPopup" class="admin-popup">Admin</div>
        </div>
        <div class="flex-grow-1 text-center fw-bold" style="font-size: 30px;">Admin Dashboard</div>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>

    <div class="content" id="mainContent">
        <div class="text-center my-4">
            <h2 class="dashboard-heading">Welcome Admin</h2>
            <p class="text-muted">Manage NGos from this dashboard</p>
        </div>

 <div class="row justify-content-center gx-4 gy-4">
  <!-- Total NGOs -->
  <div class="col-md-4 col-lg-3">
    <div class="dashboard-card">
      <img src="images/saved.jpg" alt="Total NGOs" />
      <h5>Total NGOs</h5>
      <h2 class="text-success">
        <%= request.getAttribute("totalNgos") != null ? request.getAttribute("totalNgos") : 0 %>
      </h2>
    </div>
  </div>

  <!-- Pending Approvals -->
  <div class="col-md-4 col-lg-3">
    <div class="dashboard-card">
      <img src="images/pending.jpg" alt="Pending Approvals" />
      <h5>Pending Approvals</h5>
      <h2 class="text-warning">
        <%= request.getAttribute("pendingNgos") != null ? request.getAttribute("pendingNgos") : 0 %>
      </h2>
    </div>
  </div>

  <!-- Manage NGOs -->
  <div class="col-md-4 col-lg-3">
    <div class="dashboard-card" data-bs-toggle="modal" data-bs-target="#manageNGOModal">
      <img src="images/manage.jpg" alt="Manage NGOs" />
      <h5>Manage NGOs</h5>
    </div>
  </div>
</div>



    <div class="modal fade" id="manageNGOModal" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
            <div class="modal-header modal-header-relative">
                <h5 class="modal-title modal-title-center">Manage NGOs</h5>
                <button type="button" class="btn-close modal-close-right" data-bs-dismiss="modal"></button>
            </div>


                <div class="modal-body">
                    <table class="table table-bordered table-hover align-middle shadow-sm rounded">
    <thead class="table-dark text-center">
        <tr>
            <th>NGO No.</th>
            <th>NGO Name</th>
            <th>Email</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody class="text-center">
        <%
            List<Ngo> ngos = (List<Ngo>) request.getAttribute("ngoList");
            int count = 1;
            if (ngos != null) {
                for (Ngo ngo : ngos) {
        %>
        <tr>
            <td><%= count++ %></td>
            <td><%= ngo.getName() %></td>
            <td><%= ngo.getEmail() %></td>
            <td>
                <%= ngo.getStatus() == 1 
                    ? "<span class='badge bg-success px-3 py-2'>Approved</span>" 
                    : "<span class='badge bg-warning text-dark px-3 py-2'>Pending</span>" 
                %>
            </td>
            <td>
                <% if (ngo.getStatus() == 0) { %>
                <form method="post" action="NgoController" style="display:inline-block;">
                    <input type="hidden" name="action" value="updateStatus" />
                    <input type="hidden" name="id" value="<%= ngo.getId() %>" />
                    <input type="hidden" name="status" value="approved" />
                    <button type="submit" class="btn btn-success btn-sm me-1">Approve</button>
                </form>
                <% } %>
                <form method="post" action="NgoController" style="display:inline-block;">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="id" value="<%= ngo.getId() %>" />
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="5" class="text-center">No NGOs found.</td></tr>
        <%
            }
        %>
    </tbody>
</table>

                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById("sidebar");
            const content = document.getElementById("mainContent");
            const popup = document.getElementById("adminPopup");

            sidebar.classList.toggle("hidden");
            content.classList.toggle("full-width");
            popup.style.display = popup.style.display === "block" ? "none" : "block";
        }

        window.addEventListener("click", function(e) {
            const popup = document.getElementById("adminPopup");
            const profile = document.querySelector(".profile-btn");
            if (!profile.contains(e.target)) {
                popup.style.display = "none";
            }
        });
    </script>
</body>
</html>
