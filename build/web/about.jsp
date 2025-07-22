<!-- about.jsp -->
<section class="box special" style="margin-bottom: 30px;">
  <header class="major">
    <h2>"Your click can save a life. Help strays get home"</h2>
    <p>
      ResQPet began with a simple goal to help injured street animals quickly. 
      Today, we connect people and NGOs to save more lives, faster.
    </p>
  </header>

  <div class="slider-container" style="text-align: center;">
    <img class="slider-image" src="images/banner4.jpg" alt="Rescue Banner"
         style="width: 100%; max-height: 450px; object-fit: cover; border-radius: 8px; transition: opacity 0.5s;">
    <button class="slider-btn prev" onclick="prevSlide()" 
            style="position: absolute; top: 50%; left: 10px;">&#10094;</button>
    <button class="slider-btn next" onclick="nextSlide()" 
            style="position: absolute; top: 50%; right: 10px;">&#10095;</button>
  </div>

  <script>
    const images = ["images/banner4.jpg", "images/banner6.jpg", "images/banner5.jpg"];
    let current = 0;
    const slider = document.querySelector(".slider-image");

    function showSlide(index) {
      current = (index + images.length) % images.length;
      slider.style.opacity = 0;
      setTimeout(() => {
        slider.src = images[current];
        slider.style.opacity = 1;
      }, 300);
    }

    function nextSlide() {
      showSlide(current + 1);
    }

    function prevSlide() {
      showSlide(current - 1);
    }

    setInterval(() => {
      nextSlide();
    }, 3000);
  </script>
</section>
