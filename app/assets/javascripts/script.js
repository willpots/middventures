var MV = angular.module('mv', [])
  .directive("textEditor", function($parse) {
  return function(scope, element, attrs) {
    var model = $parse(attrs.textEditor);
    // Take care of reading value from TextArea
    scope.editor = $(element).wysihtml5({
      "events": {
        "load": function(e) {
          $doc = $($(element).data("wysihtml5").editor.composer.doc);
          $doc.keyup(function(evt){
            model.assign(scope, evt.target.innerHTML);
          });
        }
      }
    });

    scope.$watch(attrs.textEditor, function(value) {
      scope.editor.data("wysihtml5").editor.setValue(value);
    });
  };
}).directive("mvToggleButton", function($parse) {
  return function(scope, element, attrs) {
    var model = $parse(attrs.mvToggleButton);

    $(element).click(function(e) {
      var checked = $(this).hasClass("checked");
      $(this).toggleClass("checked");
      model.assign(scope, !checked);
    });

    scope.$watch(attrs.mvToggleButton, function(value) {
      if(value === true) {
        $(element).addClass("checked");
      } else {
        $(element).removeClass("checked");
      }
    });
  };
});

function MVController(scope) {

}

$(document).ready(function() {
  $window = $(window);
  $('[data-type="parallax"]').each(function() {
    var $bgobj = $(this); // assigning the object
    $(window).scroll(function() {
      var yPos = ($window.scrollTop()) / 2 + $bgobj.data("offset");
      var coords = '50% ' + yPos + 'px';
      $bgobj.css({
        backgroundPosition: coords
      });
    });
  });
});