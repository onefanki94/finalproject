
let currentSlide = 0;

function moveSlide(direction) {
    const slides = document.querySelector('.carousel-images');
    const totalSlides = document.querySelectorAll('.carousel-images a').length;
    const slideWidth = document.querySelector('.carousel-images a').offsetWidth;

    currentSlide += direction;

    if (currentSlide < 0) {
        currentSlide = totalSlides - 1;
    } else if (currentSlide >= totalSlides) {
        currentSlide = 0;
    }

    slides.style.transform = `translateX(-${currentSlide * slideWidth}px)`;    
}


