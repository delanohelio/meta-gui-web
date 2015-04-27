(function() {
  var SimpleTextFieldProperty,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  SimpleTextFieldProperty = (function(_super) {

    __extends(SimpleTextFieldProperty, _super);

    function SimpleTextFieldProperty() {
      return SimpleTextFieldProperty.__super__.constructor.apply(this, arguments);
    }

    SimpleTextFieldProperty.prototype.render = function(view) {
      var textField, value,
        _this = this;
      textField = $("<input>");
      textField.attr("id", this.propertyType.name);
      value = this.property;
      if (this.propertyType.type === "date") {
        value = $.datepicker.formatDate("yy-mm-dd", new Date(this.property));
      }
      textField.val(value);
      textField.value(function() {
        if (_this.propertyType.type === "integer") {
          return parseInt(textField.val());
        }
        if (_this.propertyType.type === "real") {
          return parseFloat(textField.val());
        }
        if (_this.propertyType.type === "date") {
          return new Date(textField.val());
        }
        return textField.val();
      });
      return view.append(textField);
    };

    return SimpleTextFieldProperty;

  })(PropertyWidget);

  return new SimpleTextFieldProperty;

}).call(this);
