<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, util.DBConnection" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("email");
    String dbPassword = "";

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String msg = (String) session.getAttribute("successMsg");
    if (msg != null) {
        session.removeAttribute("successMsg");
    }

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT password FROM ngo WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            dbPassword = rs.getString("password");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("DB error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Change Password - NGO | ResQPet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #DFD0B8;
        }

        .navbar {
            background-color: #222831;
            padding: 15px 20px;
            color: #DFD0B8;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
            z-index: 1001;
        }
        .navbar-left {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .brand-title {
                font-size: 20px;
                font-weight: bold;
                color: #DFD0B8;
                margin: 0;
            }

        .logout-btn {
            background-color: #948979;
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 6px 12px;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            margin-right: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #4A3B2F;
        }

        .menu-icon {
            font-size: 18px;
            cursor: pointer;
            color: #DFD0B8;
            display: block;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: -220px;
            width: 220px;
            height: 100%;
            background-color: #393E46;
            padding-top: 60px;
            transition: left 0.3s ease;
            z-index: 1000;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #DFD0B8;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #948979;
            color: #222831;
        }

        .sidebar.show {
            left: 0;
        }

        @media (min-width: 769px) {
            .sidebar {
                left: 0;
            }

            .main-content {
                margin-left: 220px;
            }

            .menu-icon {
                display: none;
            }
        }

        .main-content {
            padding: 10px;
            padding-top: 20px;
            transition: margin-left 0.3s ease;
        }

        .id-card-wrapper {
            max-width: 360px;
            margin: 15px auto;
            margin-left: 250px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border: 6px solid #948979;
        }

        .id-card-header {
            background: #948979;
            color: white;
            padding: 10px;
            text-align: center;
            position: relative;
        }

        .profile-pic {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 4px solid white;
            position: absolute;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            object-fit: cover;
            background: #fff;
        }

        .form-body {
            padding: 30px 16px 16px 16px;
        }

        .form-body label {
            font-weight: 500;
            font-size: 14px;
            display: block;
            margin-bottom: 3px;
            color: #222831;
        }

        .form-body input {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .submit-btn {
            background: #222831;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            font-size: 14px;
            border-radius: 8px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #393E46;
        }

        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="navbar-left">
        <span class="menu-icon" onclick="toggleSidebar()"><i class="fas fa-bars"></i></span>
        <h2 class="brand-title">ResQPet</h2>
    </div>
    <a href="logout.jsp" class="logout-btn">Logout</a>
</div>

<div class="sidebar" id="sidebar">
    <a href="editprofile.jsp">Edit Profile</a>
    <a href="changepassword.jsp">Change Password</a>
</div>

<div class="main-content">
    <div class="id-card-wrapper">
        <div class="id-card-header">
            <h3>Admin Profile</h3>
            <img class="profile-pic" src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Profile Icon">
        </div>

        <form class="form-body" action="ChangePasswordServlet" method="post">
            <% if (msg != null) { %>
                <div class="success-message"><%= msg %></div>
                <script>alert("<%= msg.replace("\"", "\\\"") %>");</script>
            <% } %>

            <label>Old Password</label>
            <input type="password" name="oldPassword" required>

            <label>New Password</label>
            <input type="password" name="newPassword" required>

            <label>Confirm Password</label>
            <input type="password" name="confirmPassword" required>

            <button type="submit" class="submit-btn">Update Password</button>
        </form>
    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById("sidebar");
        sidebar.classList.toggle("show");
    }

    document.addEventListener("click", function (e) {
        const sidebar = document.getElementById("sidebar");
        const menuIcon = document.querySelector(".menu-icon");

        if (!sidebar.contains(e.target) && !menuIcon.contains(e.target)) {
            sidebar.classList.remove("show");
        }
    });
</script>

</body>
</html>
