import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["car", "house", "watch", "trip"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
