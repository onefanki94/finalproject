let currentSlides = {};

function initSlide(section) {
    currentSlides[section] = 0;
}

function moveSlide(section, direction) {
    const slides = document.querySelector(`.${section} .carousel-images`);
    const totalSlides = document.querySelectorAll(`.${section} .carousel-images .product`).length;
    const slideWidth = document.querySelector(`.${section} .carousel-images .product`).offsetWidth;

    currentSlides[section] += direction;

    if (currentSlides[section] < 0) {
        currentSlides[section] = totalSlides - 1;
    } else if (currentSlides[section] >= totalSlides) {
        currentSlides[section] = 0;
    }

    slides.style.transform = `translateX(-${currentSlides[section] * slideWidth}px)`;
}

document.addEventListener('DOMContentLoaded', function() {
    initSlide('featured-products');
    initSlide('more-products');
    initSlide('original-goods');
    initSlide('md_pick');
});