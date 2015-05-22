(function() {
  var _this = this;

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

  DataManager.getEntity = function(entityTypeResource, entityID, callback) {
    return DataManager.loadData('api/' + entityTypeResource + '/' + entityID, callback);
  };

  DataManager.createEntity = function(entityTypeResource, entity) {
    return $.ajax({
      url: HOST + "api/" + entityTypeResource,
      type: "POST",
      data: JSON.stringify(entity),
      contentType: "application/json; charset=utf-8"
    });
  };

  DataManager.updateEntity = function(entityTypeResource, entity) {
    return $.ajax({
      url: HOST + "api/" + entityTypeResource + "/" + entity.id,
      type: "PUT",
      data: JSON.stringify(entity)
    });
  };

  DataManager.deleteEntity = function(entityTypeResource, entityID, success, error) {
    return $.ajax({
      url: HOST + "api/" + entityTypeResource + "/" + entityID,
      type: "DELETE"
    });
  };

}).call(this);
