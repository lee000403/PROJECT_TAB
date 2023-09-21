const prev = document.querySelector(".prev");
const next = document.querySelector(".next");

const container = document.querySelector(".slider")
slider.style.transform = `translateX(${direction * (100 / 5)}%)`;
slider.ontransitionend = (selectbtn) => {
    slider.removeAttribute('style');
    (selectbtn === 'prev') ?
    container.insertBefore(slider.lastElementChild, slider.firstElementChild)
    : slider.appendChild(slider.firstElementChild);
}   