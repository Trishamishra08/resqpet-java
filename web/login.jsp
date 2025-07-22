<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - ResQPet</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            overflow: hidden;
        }

        /* Navbar */
        .navbar {
            background-color: #2b2b3c;
            height: 50px;
            padding: 6px 30px;
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
            font-size: 14px;
            text-decoration: none;
            color: white;
            position: relative;
            padding: 6px 0;
            transition: color 0.3s;
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
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a.button:hover {
            background-color: #fcecd4;
            color: #2b2b3c;
        }

        /* Layout */
        .container {
            display: flex;
            height: 95vh;
            position: relative;
        }

        /* Left Panel */
       .left-panel {
            flex: 1;
            background: url('images/saved.jpg') no-repeat center center;
            background-size: cover;
            background-position: 40% center;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: flex-start;
            padding: 30px 40px;
        }

        .left-panel::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .left-panel .left-content {
            z-index: 2;
            position: relative;
            margin-bottom: 20px;
        }

        .left-panel h3 {
            font-family: Georgia, serif;
            font-size: 26px;
            color: #fcebd5;
            font-weight: bold;
            margin: 0 0 10px 0;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        .left-panel p {
            font-family: Georgia, serif;
            font-size: 16px;
            color: #f5d7ae;
            margin: 0;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.6);
        }

        /* Right Panel */
        .right-panel {
            flex: 1;
            background: url('images/rightpanel.jpg') no-repeat center center;
            background-size: 100%; /* reduced size */
            background-position: center;
            position: relative;
            overflow: hidden;
        }

        .right-panel::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0); /* no overlay */
            z-index: 1;
        }

        /* Login Box */
        .login-box {
            position: absolute;
            top: 50%;
            left: 53%;
            transform: translate(-50%, -50%);
            z-index: 10;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 320px;
            width: 100%;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 30px;
            color: #333;
            font-size: 24px;
        }

        .login-box input[type=email],
        .login-box input[type=password] {
            width: 100%;
            padding: 12px 15px 12px 40px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            background-repeat: no-repeat;
            background-position: 12px center;
        }

        .login-box input[type=email] {
            background-image: url('https://img.icons8.com/ios-filled/16/000000/new-post.png');
        }

        .login-box input[type=password] {
            background-image: url('https://img.icons8.com/ios-filled/16/000000/lock-2.png');
        }

        .login-box a {
            display: block;
            text-align: right;
            font-size: 0.9em;
            color: #999;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .login-box input[type=submit] {
            width: 100%;
            padding: 12px;
            background: #f35b5b;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
            font-size: 16px;
        }

        .login-box input[type=submit]:hover {
            background: #d94343;
        }

        .login-box .message {
            color: red;
            margin-bottom: 15px;
            text-align: center;
        }
        
        /*password eye */
        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            width: 100%;
            padding-right: 40px; /* space for eye icon */
            padding-left: 40px;  /* if you use an icon on the left too */
            box-sizing: border-box;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            height: 44px;
        }

        /* 👁️ Eye toggle */
        .toggle-password {
           position: absolute;
           right: 12px;
           top: 50%;
           transform: translateY(-50%);
           width: 20px;
           height: 20px;
           cursor: pointer;

           /* ✅ Make sure content inside is centered */
           display: flex;
           align-items: center;
           justify-content: center;
           padding: 0;
           margin: 0;
           z-index: 5;
       }

       .eye-icon {
           width: 16px;
           height: 16px;
           background-image: url('https://img.icons8.com/ios-glyphs/30/8B4513/visible--v1.png');
           background-repeat: no-repeat;
           background-size: contain;
           background-position: center;
           display: block;

           /* 👇 Add this to adjust vertical alignment */
           margin-top: -15px;
       }

       .eye-icon.hidden {
           background-image: url('https://img.icons8.com/ios-glyphs/30/8B4513/closed-eye.png');
           margin-top: 0;
       }

        /* Responsive */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left-panel, .right-panel {
                width: 100%;
                height: auto;
            }

            .navbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            .login-box {
                position: static;
                transform: none;
                margin: 20px auto;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <h1>ResQPet</h1>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="register.jsp">Register NGO</a></li>
        <li><a href="login.jsp" class="button">Login</a></li>
    </ul>
</div>

<!-- Page Layout -->
<div class="container">
    <div class="left-panel">
        <div class="left-content">
            <h3>Welcome to Login Page</h3>
            <p>Login to access your account</p>
        </div>

    </div>
    <div class="right-panel">
        <!-- Background only -->
    </div>

    <!-- Login Box Centered -->
<!-- Login Box Centered -->
<div class="login-box">
    <h2>Login</h2>

    <% String msg = (String) request.getAttribute("output");
       if (msg != null) { %>
       <div class="message"><%= msg %></div>
    <% } %>

    <form method="post" action="NgoController">
        <input type="hidden" name="action" value="login" />
        
        <!-- Email Field -->
        <input type="email" name="email" placeholder="Email" required>

        <!-- Password Field with Toggle -->
       
        <div class="password-wrapper">
            <input type="password" name="password" placeholder="Password" id="passwordInput" required>
            <span class="toggle-password" onclick="togglePassword()">
                <i class="eye-icon" id="eyeIcon"></i>
            </span>
        </div>
    

        <a href="#">Forgot password?</a>
        <input type="submit" value="Log In">
    </form>
</div>

</div>
    
<script>
function togglePassword() {
    const input = document.getElementById("passwordInput");
    const eyeIcon = document.getElementById("eyeIcon");

    if (input.type === "password") {
        input.type = "text";
        eyeIcon.classList.add("hidden");
    } else {
        input.type = "password";
        eyeIcon.classList.remove("hidden");
    }
}
</script>

</body>
</html>
