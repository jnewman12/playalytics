App.controller('MusicCtrl', [
  '$scope', 'Music', function($scope, Music) {
    return $scope.music = Music.query();
  }
]);