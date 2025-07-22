<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, util.DBConnection" %>
<%@ page session="true" %>
<%
    String email = (String) session.getAttribute("email");
    String name = "", mobile = "", address = "", city = "", pincode = "";

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
        PreparedStatement ps = con.prepareStatement("SELECT * FROM ngo WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            mobile = rs.getString("mobile");
            address = rs.getString("address");
            city = rs.getString("city");
            pincode = rs.getString("pincode");
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
    <title>Edit Profile - NGO | ResQPet</title>
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
            padding: 10px 16px;
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
            font-size: 24px;
            font-weight: bold;
            color: #DFD0B8;
            margin: 0;
        }

        .menu-icon {
            font-size: 18px;
            cursor: pointer;
            color: #DFD0B8;
            display: block;
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

        .main-content {
            padding: 10px;
            padding-top: 0px;
            transition: margin-left 0.3s ease;
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

        .id-card-wrapper {
            max-width: 350px;
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
            padding: 1px;
            text-align: center;
            position: relative;
        }

        .profile-pic {
            width: 55px;
            height: 55px;
            border-radius: 50%;
            border: 4px solid white;
            position: absolute;
            top: 35px;
            left: 50%;
            transform: translateX(-50%);
            object-fit: cover;
            background: #fff;
        }

        .form-body {
            padding: 20px 16px 16px 16px;
        }

        .form-body label {
            font-weight: 500;
            font-size: 12px;
            display: block;
            margin-bottom: 2px;
            color: #222831;
        }

        .form-body input,
        .form-body select,
        .form-body textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 12px;
        }

        .submit-btn {
            background: #222831;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            font-size: 13px;
            border-radius: 8px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #393E46;
        }

        .toast {
            position: fixed;
            top: 70px;
            right: 25px;
            background-color: #28a745;
            color: white;
            padding: 12px 18px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            display: flex;
            align-items: center;
            font-size: 14px;
            z-index: 10000;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.4s ease, transform 0.4s ease;
        }

        .toast.show {
            opacity: 1;
            transform: translateY(0);
        }

        .toast i {
            margin-right: 10px;
            font-size: 18px;
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
    <a href="editprofilengo.jsp">Edit Profile</a>
    <a href="changepasswordngo.jsp">Change Password</a>
</div>

<div class="main-content">
    <div class="id-card-wrapper">
        <div class="id-card-header">
            <h3>NGO Profile</h3>
            <img class="profile-pic" src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Profile Photo">
        </div>

        <form class="form-body" action="EditNgoProfileServlet" method="post">
            <% if (msg != null) { %>
                <div id="successToast" class="toast show">
                    <i class="fas fa-check-circle"></i>
                    <span><%= msg %></span>
                </div>
                <script>
                    setTimeout(() => {
                        document.getElementById("successToast").classList.remove("show");
                    }, 3500);
                </script>
            <% } %>

            <label>Name</label>
            <input type="text" name="name" value="<%=name%>" required>

            <label>Mobile</label>
            <input type="text" name="mobile" value="<%=mobile%>" required>

            <label>Email</label>
            <input type="email" name="email" value="<%=email%>" readonly>

            <label>Address</label>
            <textarea name="address" rows="2" required><%=address%></textarea>

            <label>City</label>
            <select name="city" required>
                <option value="">Select City</option>
                <option <%=city.equals("Indore") ? "selected" : ""%>>Indore</option>
                <option <%=city.equals("Ujjain") ? "selected" : ""%>>Ujjain</option>
                <option <%=city.equals("Dewas") ? "selected" : ""%>>Dewas</option>
            </select>

            <label>Pincode</label>
            <input type="text" name="pincode" value="<%=pincode%>" required>

            <button type="submit" class="submit-btn">Update Profile</button>
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
