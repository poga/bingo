angular.module \MSDirectives []
.directive \msSkill ->
  restrict: \E
  scope: true
  templateUrl: 'partials/skill.html'
  controller: ($scope, $attrs) ->
    $scope{label, id} = $attrs
    $scope.activated = $scope.skills[$scope.label]
    $scope.click = ->
      $scope.activated = !$scope.activated
      $scope.skills[$scope.label] = $scope.activated

app = angular.module \masteries <[angularLocalStorage MSDirectives]>
app.controller \msCtrl, ($scope, storage) ->
  storage.bind $scope, \skills
  $scope.skills ||= {}

  <- $scope.$watch \skills, _, true
  console.log $scope.skills

