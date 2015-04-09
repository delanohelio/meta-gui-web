(function() {

  window.RedetingEngine = {};

  RedetingEngine.downloadWidgets = function() {
    var _this = this;
    return $.getJSON('http://localhost:8081/widgets.json', function(json) {
      return alert(json);
    });
  };

  $(function() {
    return RedetingEngine.downloadWidgets();
  });

}).call(this);
