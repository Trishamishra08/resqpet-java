<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Feedback - ResQPet</title>
  <style>
    body {
      font-family: "Segoe UI", sans-serif;
      background-color: #B8CFCE;
      margin: 0;
      padding: 0;
    }
    
    .box.special.features {
      margin: 3em auto;
      max-width: 1000px;
      padding: 0 2em;
    }

    .box.special.features header.major {
      text-align: center;
      margin-bottom: 2em;
      color: #DFD0B8;
    }

    .box.special.features header.major h2 {
      font-family: "Times New Roman", Times, serif;
      font-weight: bold;
      font-size: 2em;
      margin-bottom: 0.5em;
    }

    .features-row-wrapper {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      gap: 2em;
    }

    .features-row section {
      flex: 0 0 calc(50% - 1em);
      max-width: calc(50% - 1em);
      padding: 1.5em 1em;
      border: 1px solid #444;
      border-radius: 10px;
      background-color: #2f2f3f;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .features-row section:hover {
      transform: translateY(-5px);
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.4);
    }

    .feedback-img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      display: block;
      margin: 0 auto 1em auto;
      box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
    }

    .features-row h3 {
      font-family: "Times New Roman", Times, serif;
      color: #DFD0B8;
      font-weight: bold;
      font-size: 1.2em;
      margin: 0.5em 0;
    }

    .features-row p {
      font-family: "Times New Roman", Times, serif;
      color: #dddddd;
      font-style: italic;
      font-size: 0.95em;
      line-height: 1.4;
      margin: 0.5em 1em 0 1em;
    }

    @media screen and (max-width: 768px) {
      .features-row section {
        flex: 1 1 100%;
        max-width: 100%;
      }
    }
  </style>
</head>
<body>

  <section class="box special features">
    <header class="major">
      <h2>What People Say</h2>
    </header>

    <div class="features-row-wrapper features-row">
      <section>
        <img src="images/trisha.jpg" alt="Trisha Mishra" class="feedback-img" />
        <h3>Trisha Mishra</h3>
        <p>"ResQPet made reporting so easy. One click, and help arrived!"</p>
      </section>

      <section>
        <img src="images/sakshi.jpg" alt="Sakshi Lakhotiya" class="feedback-img" />
        <h3>Sakshi Lakhotiya</h3>
        <p>"The NGO partnership feature helps us reach animals faster than ever."</p>
      </section>

      <section>
        <img src="images/shrey.jpg" alt="Shrey Gupta" class="feedback-img" />
        <h3>Shrey Gupta</h3>
        <p>"I reported a dog hit by a car—someone rescued it in minutes. Thank you!"</p>
      </section>

      <section>
        <img src="images/yashbir.jpg" alt="Yashbir Singh" class="feedback-img" />
        <h3>Yashbir Singh</h3>
        <p>"Clean interface, fast alerts—it's the rescue tool every city needs."</p>
      </section>
    </div>
  </section>

</body>
</html>
