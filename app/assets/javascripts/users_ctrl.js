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
          $scope.pins = map.pins;
          console.log($scope.pins);

          window.eqfeed_callback = function($scope.pins) {
            
          }



          // for (var i=0; i<$scope.maps.length; i++) {
          //   $scope.map = $scope.maps[i];
          //   $scope.map.forEach(function(item) {

          //   })
          //   console.log($scope.map);
          // };
          // $scope.map = $scope.maps.map_id;
          // console.log(map_id);
          // console.log($scope.map);
          
          // $scope.maps.forEach(function(map) {
          //   console.log(map);
          // })
      });
       var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: -34.397, lng: 150.644},
            zoom: 8
          });
    }

    // $scope.user = Unirest.get("http://localhost:3000/api/v1/users/1").body;
    window.$scope = $scope;
  });


}());