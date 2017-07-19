(function() {
  "use strict";

  angular.module("app").controller("usersCtrl", function($scope, $window, $http){

    var user_id;
    var map_id;

    $scope.setup = function (id, mapId) {
      user_id = id;
      map_id = mapId;
    }

    $window.initMap = function() {
      $http.get("http://localhost:3000/api/v1/users/" + user_id).then(function(response){
          $scope.maps = response.data.maps;
          console.log($scope.maps);

          var map = $scope.maps.find(function(map) {
            return map.id == map_id
          });
          var pins = map.pins;

          var locations = [];

          var infowindow = new google.maps.InfoWindow({});

          pins.forEach(function(pin){
            locations.push([pin.pin_name, pin.latitude, pin.longitude, [pin.pin_name, pin.description]]);
          });
          console.log(locations);

          var lat_center = locations[0][1];
          var lng_center = locations[0][2];

          var map = new google.maps.Map(document.getElementById('map'), {
            center: new google.maps.LatLng(lat_center, lng_center),
            zoom: 14
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
      });
    }
    window.$scope = $scope;
  });


}());