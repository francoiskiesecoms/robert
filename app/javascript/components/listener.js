const button = document.querySelector('#clickme');
const audio = new Audio('13770.mp3');

button.addEventListener('click', (e) => {
  audio.plau();
});
