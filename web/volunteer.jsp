<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Volunteer Form</title>
    <style>
    body {
        background-color: #B8CFCE;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        color: #333;
    }

    nav {
        background-color: #333446;
        padding: 1rem 2rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: Georgia, serif;
    }

    nav .logo {
        font-size: 1.5rem;
        color: white;
        font-weight: bold;
    }

    nav ul {
        list-style: none;
        display: flex;
        gap: 25px;
        margin: 0;
        padding: 0;
    }

    nav ul li a {
        color: white;
        text-decoration: none;
        padding: 5px 10px;
        font-size: 16px;
    }

    nav ul li a:hover {
        color: #ffd;
    }

    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px 10px;
    }

    .form-box {
        background-color: #DFD0B8;
        padding: 20px 25px;
        border-radius: 12px;
        width: 100%;
        max-width: 380px;
        border: 1.5px solid #b6a988;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
    }

    .form-box h2 {
        text-align: center;
        margin-bottom: 18px;
        color: #222831;
        font-size: 20px;
        font-family: Georgia, serif;
        text-decoration: underline;
    }

    .form-group {
        margin-bottom: 12px;
    }

    .form-group label {
        display: block;
        margin-bottom: 4px;
        color: #393E46;
        font-weight: 500;
        font-size: 13px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
        width: 100%;
        padding: 6px 8px;
        border-radius: 5px;
        border: 1px solid #b8a47e;
        background-color: #ffffff;
        color: #222831;
        font-size: 13px;
        transition: border 0.3s, box-shadow 0.3s;
    }

    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
        outline: none;
        border-color: #948979;
        box-shadow: 0 0 5px rgba(148, 137, 121, 0.3);
    }

    .form-group textarea {
        resize: none;
        height: 80px;
    }

    .btn {
        width: 100%;
        background-color: #948979;
        color: #fff;
        padding: 8px 0;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s;
    }

    .btn:hover {
        background-color: #393E46;
    }

    .message {
        margin-top: 15px;
        text-align: center;
        background-color: #d4edda;
        color: #155724;
        padding: 10px;
        border-radius: 6px;
        display: none;
        animation: fadeIn 1s ease forwards;
        border: 1px solid #c3e6cb;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }
</style>

    <script>
        function showMessage(e) {
            e.preventDefault();
            document.getElementById("msg").style.display = "block";
            document.getElementById("volunteerForm").reset();
        }
    </script>
</head>
<body>

    <nav>
        <div class="logo">ResQPet</div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="Aboutus.jsp">About</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="form-box">
            <h2>Volunteer Registration</h2>
            <form id="volunteerForm" onsubmit="showMessage(event)">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required />
                </div>
                <div class="form-group">
                    <label for="email">Email ID</label>
                    <input type="email" id="email" name="email" required />
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile Number</label>
                    <input type="text" id="mobile" name="mobile" required />
                </div>
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" required />
                </div>
                <div class="form-group">
                    <label for="interest">Area of Interest</label>
                    <select id="interest" name="interest" required>
                        <option value="">--Select--</option>
                        <option value="animal-care">Animal Care</option>
                        <option value="awareness">Awareness Campaigns</option>
                        <option value="medical">Medical Assistance</option>
                        <option value="tech">Tech Support</option>
                        <option value="fundraising">Fundraising</option>
                    </select>
                </div>
           
                <button type="submit" class="btn">Submit</button>
                <div class="message" id="msg">🎉 Thank you! You're now part of the ResQPet Volunteer team!</div>
            </form>
        </div>
    </div>

</body>
</html>
