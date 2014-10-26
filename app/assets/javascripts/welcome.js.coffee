# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( ->
  console.log 'test'
  options =
      zoom: 14
      center: new google.maps.LatLng(51.5052654,-0.125355)
      mapTypeId: google.maps.MapTypeId.ROADMAP
      styles: [
        {"featureType":"poi","elementType":"all","stylers":[{"hue":"#000000"},{"saturation":-100},{"lightness":-100},{"visibility":"off"}]},
        {"featureType":"poi","elementType":"all","stylers":[{"hue":"#000000"},{"saturation":-100},{"lightness":-100},{"visibility":"off"}]},
        {"featureType":"administrative","elementType":"all","stylers":[{"hue":"#000000"},{"saturation":0},{"lightness":-100},{"visibility":"off"}]},
        {"featureType":"road","elementType":"labels","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":100},{"visibility":"off"}]},
        {"featureType":"water","elementType":"labels","stylers":[{"hue":"#000000"},{"saturation":-100},{"lightness":-100},{"visibility":"off"}]},
        {"featureType":"road.local","elementType":"all","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":100},{"visibility":"on"}]},
        {"featureType":"water","elementType":"geometry","stylers":[{"hue":"#ffffff"},{"saturation":-100},{"lightness":-70},{"visibility":"on"}]},
        {"featureType":"transit","elementType":"labels","stylers":[{"visibility":"on"}]},
        {"featureType":"landscape","elementType":"labels","stylers":[{"hue":"#000000"},{"saturation":-100},{"lightness":-100},{"visibility":"off"}]},
        {"featureType":"road","elementType":"geometry","stylers":[{"hue":"#bbbbbb"},{"saturation":-100},{"lightness":26},{"visibility":"on"}]},
        {"featureType":"landscape","elementType":"geometry","stylers":[{"hue":"#dddddd"},{"saturation":-100},{"lightness":-3},{"visibility":"on"}]},
        {"featureType": "transit.line","elementType": "geometry","stylers":[{ "visibility": "off" }]}]
      disableDefaultUI: true
      draggable: false
      zoomControl: false
      scrollwheel: false
      disableDoubleClickZoom: true

  map = new google.maps.Map(document.getElementById('map'), options)

)
