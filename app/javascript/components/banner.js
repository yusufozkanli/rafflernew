import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["car", "holiday", "girl"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
