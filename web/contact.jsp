<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us – ResQPet</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    html, body {
      height: 100%;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: url('images/background.jpg') center/cover no-repeat fixed;
      position: relative;
    }

    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(255, 248, 220, 0.4); /* light cream tint */
      z-index: -1;
    }

    /* Navbar */
    #header {
      background-color: #2b2b3c;
      padding: 10px 30px;
      font-family: Georgia, serif;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    #header .nav-left {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    #header .nav-left img {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      border: 2px solid white;
    }

    #header .nav-left span {
      color: white;
      font-size: 18px;
      font-weight: bold;
    }

    #header .nav-right {
      list-style: none;
      display: flex;
      gap: 40px;
    }

    #header .nav-right li a {
      text-decoration: none;
      color: white;
      font-size: 15px;
      position: relative;
    }

    #header .nav-right li a::after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0%;
      height: 2px;
      background-color: white;
      transition: width 0.3s ease;
    }

    #header .nav-right li a:hover::after {
      width: 100%;
    }

    /* Main Layout */
    .contact-wrapper {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      padding: 60px;
      min-height: calc(100vh - 60px);
    }

    /* Left Panel */
    .contact-info {
      background: rgba(255, 248, 220, 0.95); /* light creamy box */
      padding: 35px 40px;
      border-radius: 14px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
      max-width: 420px;
    }

    .contact-info h2 {
      font-size: 24px;
      color: #5c1a1a;
      margin-bottom: 20px;
      font-family: Georgia, serif;
    }

    .contact-info .contact-name {
      font-size: 16px;
      color: #7b4f28;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .contact-item {
      display: flex;
      align-items: center;
      margin-bottom: 14px;
    }

    .contact-item i {
      color: #5c1a1a;
      font-size: 18px;
      width: 26px;
    }

    .contact-item span {
      color: #2b2b3c;
      font-size: 15px;
    }

    /* Right Panel */
    .contact-form {
      background: rgba(255, 250, 240, 0.97); /* soft cream */
      padding: 35px;
      border-radius: 14px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
      width: 420px;
    }

    .contact-form h3 {
      font-size: 22px;
      margin-bottom: 20px;
      color: #5c1a1a;
      text-align: center;
      font-family: Georgia, serif;
    }

    .contact-form input,
    .contact-form textarea {
      width: 100%;
      padding: 12px 14px;
      margin-bottom: 14px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
      font-family: inherit;
    }

    .contact-form textarea {
      resize: vertical;
      height: 100px;
    }

    .contact-form button {
      width: 100%;
      padding: 12px;
      background: #a46b53; /* deep coffee */
      color: white;
      border: none;
      font-size: 15px;
      border-radius: 8px;
      cursor: pointer;
    }

    .contact-form button:hover {
      background: #8a5542;
    }

    @media (max-width: 768px) {
      .contact-wrapper {
        flex-direction: column;
        padding: 30px 20px;
      }
      .contact-info, .contact-form {
        width: 100%;
        margin-bottom: 20px;
      }
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <header id="header">
    <div class="nav-left">
      <img src="images/logo.jpg" alt="Logo">
      <span>ResQPet</span>
    </div>
    <ul class="nav-right">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="Aboutus.jsp">About</a></li>
      <li><a href="contact.jsp">Contact</a></li>
    </ul>
  </header>

  <!-- Contact Section -->
  <div class="contact-wrapper">
    <!-- Contact Info -->
    <div class="contact-info">
      <div class="contact-name">Trisha Mishra – Founder</div>
      <h2>Contact Information</h2>
      <div class="contact-item">
        <i class="fas fa-map-marker-alt"></i><span>123, ResQPet Street, Indore, MP</span>
      </div>
      <div class="contact-item">
        <i class="fas fa-envelope"></i><span>trishamishra115@gmail.com</span>
      </div>
      <div class="contact-item">
        <i class="fas fa-phone"></i><span>+91‑9876543210</span>
      </div>
    </div>

    <!-- Send Message Form -->
    <!-- Send Message Form -->
<div class="contact-form">
  <h3>Send Message</h3>
  <form onsubmit="handleSubmit(event)">
    <input type="text" name="name" placeholder="Your Name" required />
    <input type="email" name="email" placeholder="Your Email" required />
    <textarea name="message" placeholder="Your Message" required></textarea>
    <button type="submit">Send</button>
  </form>
</div>

<script>
  function handleSubmit(e) {
    e.preventDefault(); // Stop form from submitting
    alert("Thank you! Your message has been noted."); // You can replace this with any custom message
  }
</script>

  </div>

</body>
</html>
