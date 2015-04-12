(function() {

  window.DataManager = {};

  DataManager.loadData = function(url, callback) {
    var _this = this;
    return $.getJSON(HOST + url, function(json) {
      return callback(json);
    });
  };

  DataManager.getAllEntitiesTypes = function(callback) {
    return DataManager.loadData('entities', callback);
  };

  DataManager.getEntityType = function(entityId, callback) {
    return DataManager.loadData('entities/' + entityId, callback);
  };

  DataManager.getEntities = function(entityTypeResource, callback) {
    return DataManager.loadData('api/' + entityTypeResource, callback);
  };

  DataManager.deleteEntity = function(entityTypeResource, entityID, success, error) {
    return $.ajax({
      url: HOST + "api/" + entityTypeResource + "/" + entityID,
      type: "DELETE",
      error: function(jqXHR, textStatus, errorThrown) {
        return error(textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        return success(data);
      }
    });
  };

}).call(this);
