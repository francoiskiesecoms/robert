function initUpdateNavbarOnScroll() {
  let navbar = document.querySelector('.navbar-homepage');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= (window.innerHeight - 200)) {
        navbar.classList.add('navbar-homepage-white');
      } else {
        navbar.classList.remove('navbar-homepage-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
