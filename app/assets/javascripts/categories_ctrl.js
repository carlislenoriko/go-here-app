(function() {
  "use strict";

  angular.module("app").controller("categoriesCtrl", function($scope, $window, $http){

    var category_id;
    var pin_id;

    $scope.setup = function (catId) {
      category_id = catId;
    }

    $window.initMap = function() {
      $http.get("https://go-here.herokuapp.com/api/v1/categories/" + category_id).then(function(response){
          $scope.category = response.data;

          var pins = $scope.category.pins;
          console.log(pins);

          var locations = [];

          pins.forEach(function(pin){
            locations.push([pin.pin_name, pin.latitude, pin.longitude],[pin.pin_name, pin.description]);
          })
          console.log(locations);

          var lat_center = locations[0][1];
          var lng_center = locations[0][2];

          var map = new google.maps.Map(document.getElementById('map'), {
            center: new google.maps.LatLng(lat_center, lng_center),
            zoom: 12
          });

          var marker, i;

          for (i=0; i<locations.length; i++) {
            marker = new google.maps.Marker({
              position: new google.maps.LatLng(locations[i][1], locations[i][2]),
              map: map
            });

            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                  infowindow.setContent(locations[i][3][0] + " - " + locations[i][3][1]);
                  infowindow.open(map, marker);
                }
              })(marker, i));
          }
      }).catch(angular.noop);
    }
    window.$scope = $scope;
  });


}());