import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Your dreams are here", "Spend Small", "Win big"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
