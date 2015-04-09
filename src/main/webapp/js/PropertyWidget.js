(function() {
  var PropertyWidget,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  PropertyWidget = (function(_super) {

    __extends(PropertyWidget, _super);

    function PropertyWidget() {
      return PropertyWidget.__super__.constructor.apply(this, arguments);
    }

    PropertyWidget.prototype.render = function(view, propertyType, property, conf) {};

    return PropertyWidget;

  })(Widget);

}).call(this);
