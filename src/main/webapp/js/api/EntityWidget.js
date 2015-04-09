(function() {
  var EntityWidget,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  EntityWidget = (function(_super) {

    __extends(EntityWidget, _super);

    function EntityWidget() {
      return EntityWidget.__super__.constructor.apply(this, arguments);
    }

    EntityWidget.prototype.render = function(view, entityType, entity, conf) {};

    return EntityWidget;

  })(Widget);

}).call(this);
