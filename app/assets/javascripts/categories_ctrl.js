(function() {
  "use strict";

  angular.module("app").controller("categoriesCtrl", function($scope, $window, $http){

    var category_id;
    var pin_id;

    $scope.setup = function (catId) {
      category_id = catId;
    }

    $window.initMap = function() {
      $http.get("http://localhost:3000/api/v1/categories/" + category_id).then(function(response){
          $scope.category = response.data;
          console.log($scope.category);

          var map = $scope.maps.find(function(map) {
            return map.id == map_id
          });
          var pins = map.pins;

          var locations = [];

          pins.forEach(function(pin){
            locations.push([pin.pin_name, pin.latitude, pin.longitude]);
          })
          console.log(locations);

          var lat_center = locations[0][1];
          var lng_center = locations[0][2];

          var map = new google.maps.Map(document.getElementById('map'), {
            center: new google.maps.LatLng(lat_center, lng_center),
            zoom: 8
          });

          var marker, i;

          for (i=0; i<locations.length; i++) {
            marker = new google.maps.Marker({
              position: new google.maps.LatLng(locations[i][1], locations[i][2]),
              map: map
            })
          }
      });
        
    }

    window.$scope = $scope;
  });


}());