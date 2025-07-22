<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>About - ResQPet</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f4efe8;
    }

    /* NAVBAR */
    #header {
      background-color: #2b2b3c;
      padding: 10px 30px;
      font-family: Georgia, serif;
    }

    #header nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .nav-left {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .nav-left img {
      width: 36px;
      height: 36px;
      object-fit: cover;
      border-radius: 50%;
      border: 2px solid white;
    }

    .nav-left span {
      color: white;
      font-size: 18px;
      font-weight: bold;
    }

    .nav-right {
      display: flex;
      list-style: none;
      gap: 40px;
      margin: 0;
      padding: 0;
    }

    .nav-right li {
      position: relative;
    }

    .nav-right a {
      color: white;
      text-decoration: none;
      font-size: 15px;
      padding: 6px 0;
      position: relative;
    }

    .nav-right a::after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0;
      height: 2px;
      background-color: white;
      transition: width 0.3s ease;
    }

    .nav-right a:hover::after {
      width: 100%;
    }

    /* PANELS */
        .container {
          display: flex;
          padding: 40px 60px;        /* adds top, bottom, left, right spacing */
          gap: 30px;                 /* space between the two panels */
          background: #fdf4ec;       /* light brown background for whole section */
          min-height: calc(100vh - 60px);  /* full height minus navbar */
          align-items: stretch;
        }

.panel {
  flex: 1;
  background-color: white;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  display: flex;
  flex-direction: column;
  height: 100%;
}

    .left-panel {
      background: url('images/logo.jpg') no-repeat center center;
      background-size: cover;
      position: relative;
      min-height: 400px;
      flex:0.5;
    }

    .left-panel::before {
      content: "";
      position: absolute;
      inset: 0;
      background-color: rgba(0, 0, 0, 0.3);
    }

    .left-panel .content {
      position: relative;
      color:#1a2639;
      padding: 40px;
      font-family: Georgia, serif;
    }

    .left-panel h2 {
      font-size: 28px;
      margin-bottom: 12px;
    }

    .left-panel p {
      font-size: 15px;
      line-height: 1.6;
    }

    .right-panel {
      padding: 40px;
      font-family: Georgia, serif;
    }

    .right-panel h2 {
      font-size: 28px;
      color: #5c4033;
      margin-bottom: 20px;
      text-align: center;
    }

    .right-panel p {
      font-size: 15px;
      color: #4d3a2f;
      line-height: 1.8;
      margin-bottom: 12px;
      text-align: justify;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        padding: 20px;
      }

      .panel {
        width: 100%;
      }
    }
  </style>
</head>
<body>

<!-- ✅ NAVBAR -->
<header id="header">
  <nav>
    <div class="nav-left">
      <img src="images/logo.jpg" alt="Logo">
      <span>ResQPet</span>
    </div>
    <ul class="nav-right">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="about.jsp">About</a></li>
      <li><a href="contact.jsp">Contact Us</a></li>
    </ul>
  </nav>
</header>

<!-- ✅ ABOUT PANELS -->
<div class="container">
  <!-- LEFT PANEL -->
  <div class="panel left-panel">
    <div class="content">
        <h2>We Rescue with Care</h2>
    </div>
  </div>

  <!-- RIGHT PANEL -->
  <div class="panel right-panel">
    <h2>About ResQPet</h2>
    <p>ResQPet is a simple and helpful platform created to connect people with nearby NGOs and volunteers who can rescue animals in trouble. Whether it’s an injured puppy on the road, a kitten trapped on a rooftop, or any stray animal that needs help — you can report it quickly through our site.</p>
<p>Just fill out a short form with details like the location and a photo, and our system will instantly match your request with an NGO in your city. It saves time, avoids confusion, and helps animals get rescued faster.</p>
<p>ResQPet makes it easier for everyone to be a part of animal rescue — no special skills needed, just a kind heart. Together, we can create a safer world for animals, one rescue at a time.Our mission is to save, heal, and protect stray and injured animals. </p>

  </div>
</div>

</body>
</html>
