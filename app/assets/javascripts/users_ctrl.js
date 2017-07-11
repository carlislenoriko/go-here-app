(function() {
  "use strict";

  angular.module("app").controller("usersCtrl", function($scope, $window, $http){

    var user_id;
    var map_id;

    $scope.setup = function (id, mapId) {
      user_id = id;
      map_id = mapId;
      // $http.get("http://localhost:3000/api/v1/users/" + user_id).then(function(response){
      //     $scope.maps = response.data.maps;
      //     $scope.maps.forEach(function(map) {
      //       console.log(map);
      //     })
      // });
    }

    $window.initMap = function() {
      $http.get("http://localhost:3000/api/v1/users/" + user_id).then(function(response){
          $scope.maps = response.data.maps;
          console.log($scope.maps);

          var map = $scope.maps.find(function(map) {
            return map.id == map_id
          });
          var pins = map.pins;
          // console.log($scope.pins);

          var locations = [];
          
          pins.forEach(function(pin){
            locations.push([pin.pin_name, pin.latitude, pin.longitude]);
          })
          console.log(locations);

          var map = new google.maps.Map(document.getElementById('map'), {
            center: new google.maps.LatLng(21.2895657, -157.8434701),
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

    // $scope.user = Unirest.get("http://localhost:3000/api/v1/users/1").body;
    window.$scope = $scope;
  });


}());