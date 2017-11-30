import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["car", "holiday", "home"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
