import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Car", "Lambo", "Watch"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
