function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-homepage');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-homepage-blue');
      } else {
        navbar.classList.remove('navbar-homepage-blue');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
