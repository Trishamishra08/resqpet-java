<!-- Font Awesome + Custom CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
  /* Navbar Container */
#header {
  background-color: #2b2b3c;
  padding: 10px 30px;   /* this adds left & right spacing */
  font-family: Georgia, serif;
  overflow: hidden;     
}

.nav-left {
  display: flex;
  align-items: center;
  gap: 10px;
  padding-left: 10px;
   margin-left: 20px; 
}

.nav-left img {
  width: 36px;
  height: 36px;
  object-fit: cover;
  border-radius: 50%;
  border: 2px solid white;
}

  #nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .nav-left span {
    color: white;
    font-size: 18px;
    font-weight: bold;
  }

  /* Right Menu */
.nav-right {
  display: flex;
  list-style: none;
  gap: 10px !important;    
  margin: 0 !important;
  padding: 0 !important;
  align-items: center !important;
}

.nav-right a {
  color: white !important;
  text-decoration: none !important;
  font-size: 15px !important;
  padding: 0 6px !important;  
  margin: 0 !important;
  display: inline-block;
  position: relative;
}

 .nav-right li {
    position: relative;
  }
  
  .nav-right a::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0%;
    height: 2px;
    background-color: white;
    transition: width 0.3s ease;
  }

  .nav-right a:hover::after {
    width: 100%;
  }

  /* Dropdown Menu */
  .nav-right ul {
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #3c3c4c;
    display: none;
    flex-direction: column;
    border-radius: 4px;
    padding: 8px 0;
    z-index: 10;
  }

  .nav-right li:hover > ul {
    display: flex;
  }

  .nav-right ul li {
    width: 160px;
    padding: 6px 16px;
  }

  .nav-right ul li a {
    color: white;
    font-size: 14px;
  }

  .nav-right ul li a:hover {
    background-color: #4b4b5a;
  }
</style>

<!-- Navbar HTML -->
<header id="header">
  <nav id="nav">
    <!-- Left: Logo Image + Text -->
    <div class="nav-left">
      <img src="images/logo.jpg" alt="Logo"> <!-- Replace with your image path -->
      <span>ResQPet</span>
    </div>

    <!-- Right: Navigation Menu -->
    <ul class="nav-right">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="Aboutus.jsp">About</a></li>
      <li><a href="contact.jsp">Contact Us</a></li>
      <li>
        <a href="#">Account <i class="fas fa-angle-down"></i></a>
        <ul>
          <li><a href="register.jsp">Register NGO</a></li>
          <li><a href="login.jsp">Login</a></li>
           <li><a href="report.jsp">Report Animal</a></li>
        </ul>
      </li>

    </ul>
  </nav>
</header>
