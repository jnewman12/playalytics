App.controller('UserCtrl', function($scope, $http) {
	$scope.data = [];
	$http.get('').success(function(data){
		console.log('success');
	}
})

App.controller('HotCtrl', function($scope, $http) {
  $scope.data = [];
  $http.get('http://infinigag.eu01.aws.af.cm/hot/all').success(function(data){
     console.log("success");
      return $scope.data = data;
    });
});