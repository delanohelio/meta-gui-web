(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.RelationshipWidget = (function(_super) {

    __extends(RelationshipWidget, _super);

    function RelationshipWidget() {
      return RelationshipWidget.__super__.constructor.apply(this, arguments);
    }

    RelationshipWidget.prototype.render = function(view, relationType, relation) {};

    return RelationshipWidget;

  })(Widget);

}).call(this);
