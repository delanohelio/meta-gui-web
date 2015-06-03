(function() {
  var NumberFormatter,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  NumberFormatter = (function(_super) {

    __extends(NumberFormatter, _super);

    function NumberFormatter() {
      return NumberFormatter.__super__.constructor.apply(this, arguments);
    }

    NumberFormatter.prototype.render = function(view) {
      var format, textField;
      if (this.configuration.editable) {
        textField = $("<input>");
        textField.mask(this.configuration.format);
        return textField.val(this.property);
      } else {
        format = this.configuration.format;
        return view.append(this.property);
      }
    };

    return NumberFormatter;

  })(PropertyWidget);

  return new NumberFormatter;

}).call(this);
