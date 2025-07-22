<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register ‑ ResQPet</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- fonts + icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
/* --------‑‑‑ general ‑‑‑--------- */
*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%;font-family:'Poppins',sans-serif;background:#f0f2f5}

/* --------‑‑‑ navbar ‑‑‑--------- */
.navbar {
    background-color: #2b2b3c;
    height: 50px;  /* slightly increased for better spacing */
    padding: 0 24px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar h1 {
    color: #fff;
    font-family: Georgia, serif;
    font-size: 18px;
    margin: 0;
}

.navbar ul {
    list-style: none;
    display: flex;
    gap: 28px;
    margin: 0;
    padding: 0;
}

.navbar a {
    position: relative;
    color: #fff;
    text-decoration: none;
    font-size: 14px;
    font-family: Georgia, serif;
    padding: 6px 0;
    transition: color 0.3s;
}

/* Underline effect on hover */
.navbar a::after {
    content: "";
    position: absolute;
    bottom: -2px;
    left: 0;
    width: 0%;
    height: 2px;
    background-color: white;
    transition: width 0.3s ease;
}

.navbar a:hover::after {
    width: 100%;
}

/* Special styling for Register button */
.navbar a.button {
    background: #fff;
    color: #2b2b3c;
    padding: 6px 16px;
    border-radius: 6px;
    font-weight: 500;
    font-size: 13px;
    transition: background-color 0.3s, color 0.3s;
}

.navbar a.button:hover {
    background-color: #fcecd4;
    color: #2b2b3c;
}

/* --------‑‑‑ layout panels ‑‑‑--------- */
.container {
    display: flex;
    height: calc(100vh - 50px); /* adjust based on navbar height */
    margin-top: 0;
    padding-top: 0;
}
/* below navbar */
.left-panel {
    flex: 0.75;
    position: relative;
    background: url('images/inprogress.jpg') no-repeat center center;
    background-size: cover;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 60px 40px;
    color: #fff;
    overflow: hidden;
}

/* Transparent overlay */
.left-panel::before {
    content: '';
    position: absolute;
    inset: 0;
    background: rgba(43, 43, 60, 0.5);  /* Dark overlay with slight blue tone */
    z-index: 1;
}

/* Content above overlay */
.left-panel h2,
.left-panel p,
.left-panel .ghost-btn {
    position: relative;
    z-index: 2;
}

/* Welcome Heading */
.left-panel h2 {
    font-family: Georgia, serif;
    font-size: 30px;
    font-weight: bold;
    color: #fcebd5; /* soft beige */
    margin-bottom: 16px;
    text-shadow: 1px 1px 6px rgba(0,0,0,0.6);
}

/* Welcome Subtext */
.left-panel p {
    font-family: Georgia, serif;
    font-size: 16px;
    color: #f5d7ae; /* warm muted gold */
    margin-bottom: 30px;
    line-height: 1.6;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.5);
}

/* Styled Login Button (capsule, hover) */
.ghost-btn {
    padding: 10px 28px;
    background: transparent;
    border: 2px solid #fcebd5;
    color: #fcebd5;
    font-family: Georgia, serif;
    font-weight: bold;
    border-radius: 30px;
    text-decoration: none;
    transition: all 0.3s ease;
}

.ghost-btn:hover {
    background-color: #fcebd5;
    color: #2b2b3c;
}

.right-panel{
    padding: 40px 20px;     /* Top & Bottom padding increased */
    flex:1.2;
    display:flex;
    align-items:center;
    justify-content:center
}

/* --------‑‑‑ form box ‑‑‑--------- */
.form-box {
    background: #f9f4ef;  
    padding: 15px 15px 20px 25px; /* top, right, bottom, left */
    border-radius: 0;                       /* no rounded corners */
    width: 100%;
    max-width: 525px;
    box-shadow: none;                       /* no shadow */
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: stretch;
    text-align: left;
}

.form-box h2 {
    font-size: 22px;
    color: #333446; /* rich brown */
    margin-bottom: 18px;
    text-align: center;
    font-family: Georgia, serif;
}
.form-box p.message {
    color: #5c4033; /* muted brown */
    font-size: 13px;
    margin-bottom: 12px;
    font-family: Georgia, serif;
    text-align: center;
}
/* input wrapper = icon + field */
.input-wrap{position:relative;margin-bottom:15px;width:100%}
.input-wrap i{
    position:absolute;left:12px;top:50%;transform:translateY(-50%);
    color:#888;font-size:14px
}
.form-box input,
.form-box select {
    width: 100%;
    padding: 10px 14px 10px 40px;  /* icon space inside input */
    margin-bottom: 2px;
    border-radius: 6px;
    border: 1px solid #d8bfa3;     /* muted warm brown border */
    background-color: #fffaf5;     /* soft beige background */
    font-size: 13px;
    box-sizing: border-box;
    color: #4d3a2f;                /* dark brown text */
    transition: border-color 0.3s, background-color 0.3s;
}

.form-box input:focus,
.form-box select:focus {
    border-color: #8B4513;         /* strong brown focus */
    background-color: #fff;        /* clean background on focus */
    outline: none;
}

/* submit */
.form-box input[type="submit"] {
    background-color: #5c4033;   /* brown */
    color: white;
    border: none;
    font-weight: 500;
    border-radius: 25px;         /* capsule */
    padding: 10px 20px;
    font-size: 14px;
    cursor: pointer;
    margin-top: 6px;
    transition: background 0.3s ease;
}

.form-box input[type="submit"]:hover {
    background-color: #948979;   /* darker brown on hover */
}


/* login link */
.login-link{font-size:13px;margin-top:10px}
.login-link a{color:#1abc9c;font-weight:600;text-decoration:none}

/* mobile */
@media(max-width:768px){
    .container{flex-direction:column}
}
    </style>
</head>
<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
    <h1>ResQPet</h1>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="register.jsp" class="button">Register NGO</a></li>
    </ul>
</div>

<!-- ===== MAIN PANELS ===== -->
<div class="container">

    <!-- left -->
        <div class="left-panel">
            <h2>Welcome Back!</h2>
            <p>To keep connected with us, please register your personal info.</p>
            <a href="login.jsp" class="ghost-btn">Login</a>
        </div>

    <!-- right -->
    <div class="right-panel">
        <div class="form-box">
            <h2>Register Your NGO</h2>
            <% String msg=(String)request.getAttribute("output");
               if(msg!=null){ %>
               <p class="message"><%=msg %></p>
            <% } %>

            <form method="post" action="NgoController">
                <input type="hidden" name="action" value="register"/>

                <div class="input-wrap">
                    <i class="fas fa-building"></i>
                    <input type="text" name="name" placeholder="NGO Name" required>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email" required>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-phone"></i>
                    <input type="text" name="mobile" placeholder="Mobile Number" required>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-map-marker-alt"></i>
                    <input type="text" name="address" placeholder="Address" required>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-map-pin"></i>
                    <input type="text" name="pincode" placeholder="Area Pincode" required>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-city"></i>
                    <select name="city" required>
                        <option value="" disabled selected>Select City</option>
                        <option>Indore</option><option>Ujjain</option><option>Dewas</option>
                        <option>Bhopal</option><option>Jabalpur</option><option>Rewa</option>
                    </select>
                </div>

                <div class="input-wrap">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Create Password" required>
                </div>

                <input type="submit" value="Register">
            </form>

            <div class="login-link">
                Already registered? <a href="login.jsp">Login here</a>
            </div>
        </div>
    </div>

</div>
</body>
</html>
