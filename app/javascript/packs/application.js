/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
import "bootstrap";

require('jquery-countdown');

import { loadDynamicBannerText } from '../components/banner';

if (document.getElementById('banner-typed-text') != null) {
  loadDynamicBannerText();
}
console.log("hello")

$('document').ready(function(){
 $('[data-countdown]').each(function() {
  var $this = $(this), finalDate = $(this).data('countdown');
  $this.countdown(finalDate, function(event) {
    if (event.offset.days === 0) {
      $this.html(event.strftime('%H:%M:%S'));
    } else {
      $this.html(event.strftime('%-D day%!D %H:%M:%S'));
    }
  });
});
  // $('.your-clock').each(function(){
  // //   var seconds = $(this).data('endsInSeconds');
  // //   var clock = $(this).FlipClock(seconds, {
  // //     countdown: true
  // //   });
  // // });

});
