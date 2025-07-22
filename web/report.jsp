<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Animal - ResQPet</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Fonts + Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        html, body { height: 100%; font-family: 'Poppins', sans-serif; background: #fefbf6; }

        /* ===== Navbar ===== */
        .navbar {
            background-color: #2b2b3c;
            height: 52px;
            padding: 0 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h1 {
            font-family: Georgia, serif;
            font-size: 20px;
            color: white;
            margin: 0;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 40px;
            margin: 0;
            padding: 0;
            align-items: center;
        }

        .navbar a {
            font-family: Georgia, serif;
            font-size: 15px;
            text-decoration: none;
            color: white;
            position: relative;
            padding: 6px 0;
        }

        .navbar a::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0%;
            height: 2px;
            background-color: white;
            transition: width 0.3s ease;
        }

        .navbar a:hover::after {
            width: 100%;
        }

        .navbar a.button {
            background-color: white;
            color: #2b2b3c;
            padding: 6px 16px;
            border-radius: 6px;
            font-weight: 500;
            font-size: 14px;
        }

        .navbar a.button:hover {
            background-color: #fcebd5;
            color: #2b2b3c;
        }

        /* ===== Layout ===== */
        .container {
            display: flex;
            height: calc(100vh - 52px);
        }

        .left-panel {
            flex: 0.6;
            background: url('images/petgallery6.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: flex-start;
            padding: 40px;
        }

        .left-panel::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .left-content {
            z-index: 2;
            position: relative;
            color: #fcebd5;
        }

        .left-content h3 {
            font-family: Georgia, serif;
            font-size: 26px;
            margin-bottom: 10px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        .left-content p {
            font-family: Georgia, serif;
            font-size: 16px;
            color: #f5d7ae;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        /* ===== Right panel / Form ===== */
        .right-panel {
            flex: 1;
            position: relative;
            background: url('images/rightpanelreport.jpg') no-repeat center center;
            background-size: cover;
            display: flex;                    /* for centering */
            align-items: center;             /* vertical center */
            justify-content: center;         /* horizontal center */
            padding: 40px;
            overflow: hidden;
        }

        /* Transparent white or brown overlay (adjust to your theme) */
        .right-panel::before {
            content: "";
            position: absolute;
            inset: 0;                        /* shorthand for top: 0; right: 0; bottom: 0; left: 0; */
            background: rgba(255, 255, 255, 0.3);  /* light transparent white */
            /* Or brown shade example: background: rgba(139, 69, 19, 0.2); */
            z-index: 1;
        }

        /* Make sure form or content stays above overlay */
        .right-panel > * {
            position: relative;
            z-index: 2;
        }

        .form-box {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 8px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 18px;
            color: #333;
            font-size: 22px;
            font-family: Georgia, serif;
        }

        .form-box p {
            font-size: 13px;
            text-align: center;
            margin-bottom: 10px;
        }

        .form-box .success { color: green; }
        .form-box .error { color: red; }

        .input-wrap {
            position: relative;
            margin-bottom: 15px;
        }

        .input-wrap i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
            font-size: 14px;
        }

        .form-box input[type="email"],
        .form-box input[type="file"],
        .form-box input[type="text"],
        .form-box select,
        .form-box textarea {
            width: 100%;
            padding: 12px 14px 12px 38px;
            font-size: 13px;
            background: #f7f9fa;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .form-box textarea {
            resize: vertical;
        }

        .form-box input:focus,
        .form-box select:focus,
        .form-box textarea:focus {
            border-color: #a47148;
            background: #fff;
            outline: none;
        }

        .form-box input[type="submit"] {
            background-color: #a47148;
            color: white;
            border: none;
            font-weight: 600;
            padding: 10px;
            border-radius: 30px;
            width: 100%;
            font-size: 14px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .form-box input[type="submit"]:hover {
            background-color: #814f27;
        }

        .ngo-banner, .no-ngo-banner {
            font-size: 14px;
            margin-bottom: 15px;
            padding: 10px 12px;
            border-radius: 6px;
            line-height: 1.5;
        }

        .ngo-banner {
            background-color: #eafaf1;
            color: #218c74;
            border-left: 5px solid #20bf6b;
        }

        .no-ngo-banner {
            background-color: #ffe6e3;
            color: #c23616;
            border-left: 5px solid #e84118;
        }

        @media(max-width: 768px) {
            .container { flex-direction: column; height: auto; }
            .left-panel, .right-panel { width: 100%; }
            .form-box { margin: 20px auto; }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h1>ResQPet</h1>
    <ul>
    <li><a href="index.jsp">Home</a></li>
    <li><a href="Aboutus.jsp">About</a></li>
    <li><a href="contact.jsp">Contact Us</a></li>
</ul>

</div>

<!-- Main Panels -->
<div class="container">
    <!-- Left -->
    <div class="left-panel">
        <div class="left-content">
            <h3>Save a Life</h3>
            <p>Report an injured or stray animal and we'll alert nearby NGOs.</p>
        </div>
    </div>

    <!-- Right -->
    <div class="right-panel">
        <div class="form-box">
            <h2>Report Injured Animal</h2>

            <% String msg = (String) request.getAttribute("msg"); %>
            <% if (msg != null) { %>
                <p class="success"><%= msg %></p>
            <% } %>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <p class="error"><%= error %></p>
            <% } %>

            <% 
                Boolean matched = (Boolean) request.getAttribute("matched");
                if (matched != null && matched) {
                    String ngoName = (String) request.getAttribute("matchedNgoName");
                    String ngoEmail = (String) request.getAttribute("matchedNgoEmail");
                    String status = (String) request.getAttribute("reqStatus");
                    if (status == null || status.trim().isEmpty()) {
                        status = "pending";
                    }
            %>
            <div class="ngo-banner">
                🐾 NGO Assigned: <strong><%= ngoName %></strong>
                <% if (ngoEmail != null && !ngoEmail.isEmpty()) { %>
                    | Contact: <strong><%= ngoEmail %></strong>
                <% } %>
                | Status: <strong><%= status %></strong>
            </div>
            <% } else if (matched != null && !matched) { %>
            <div class="no-ngo-banner">
                ❌ No registered NGO found in this city.
            </div>
            <% } %>

            <form method="post" action="RescueController?action=submit" enctype="multipart/form-data">
                <div class="input-wrap">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Your Email" required />
                </div>

                <div class="input-wrap">
                    <i class="fas fa-image"></i>
                    <input type="file" name="animalImage" accept="image/*" required />
                </div>

                <div class="input-wrap">
                    <i class="fas fa-align-left"></i>
                    <textarea name="description" placeholder="Describe the condition (optional, max 200 words)" rows="3"></textarea>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-map-marker-alt"></i>
                    <input type="text" name="location" placeholder="Rescue Location" required />
                </div>

                <div class="input-wrap">
                    <i class="fas fa-city"></i>
                    <select name="city" required>
                        <option value="">📍 Select Your City</option>
                        <option>Indore</option>
                        <option>Ujjain</option>
                        <option>Dewas</option>
                        <option>Bhopal</option>
                        <option>Jabalpur</option>
                        <option>Rewa</option>
                    </select>
                </div>

                <input type="submit" value="Submit Report" />
            </form>
        </div>
    </div>
</div>
</body>
</html>
