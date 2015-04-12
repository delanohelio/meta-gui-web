(function() {

  window.DataManager = {};

  DataManager.loadData = function(url, callback) {
    var _this = this;
    return $.getJSON('http://localhost:8081/' + url, function(json) {
      return callback(json);
    });
  };

  DataManager.getAllEntities = function(callback) {
    return DataManager.loadData('entities', callback);
  };

}).call(this);
