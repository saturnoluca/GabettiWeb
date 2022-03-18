const slideContainer = document.querySelector(".container_slideshow");
const slide = document.querySelector(".slideshow");
const nextButton = document.getElementById("next_button");
const prevButton = document.getElementById("prev_button");
const interval = 3000;


let slides = document.querySelectorAll(".slideshow");
let index = 1;

const firstClone = slides[0].cloneNode(true);
const lastClone = slides[slides.length - 1].cloneNode(true);


slide.append(firstClone);
slide.prepend(lastClone);

const slideWidth = slides[index].clientWidth;

slide.style.transform = 'translateX(${-slideWidth * index}px)';

const start = () => {
    setInterval(() => {
        index++;
        slide.style.transform = 'translateX(${-slideWidth * index}px)';
        slide.style.transition = '.7s';
    }, interval);
}

slide.addEventListener('transitioned', () => {
    if(slides[index].id === firstClone.id){
        slide.style.transition = 'none';
        index = 1;
        slide.style.transform = 'translateX(${-slideWidth * index}px)';
    }
})

startSlide();