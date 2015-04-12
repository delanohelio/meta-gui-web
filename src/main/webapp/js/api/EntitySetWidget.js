(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.EntitySetWidget = (function(_super) {

    __extends(EntitySetWidget, _super);

    function EntitySetWidget() {
      return EntitySetWidget.__super__.constructor.apply(this, arguments);
    }

    EntitySetWidget.prototype.render = function(view, entityType, entites, conf) {};

    return EntitySetWidget;

  })(Widget);

}).call(this);
