(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.PropertyWidget = (function() {

    function PropertyWidget() {
      this.createInputElement = __bind(this.createInputElement, this);

    }

    PropertyWidget.prototype.render = function(view) {};

    PropertyWidget.prototype.injectValue = function(entity) {};

    PropertyWidget.prototype.createInputElement = function() {
      var input;
      input = $("<input>");
      input.attr("id", this.propertyType.name);
      return input;
    };

    return PropertyWidget;

  })();

}).call(this);
