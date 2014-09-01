App.factory('Music', [
  '$resource', function($resource) {
    return $resource('/api/music/:id', {
      id: '@id'
    });
  }
]);