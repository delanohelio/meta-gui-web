(function() {

  window.WidgetManager = {};

  WidgetManager.loadScript = function(type, url, callback) {
    var _this = this;
    return $.getJSON('api/' + type + '/' + url, function(json) {
      var guiElement;
      guiElement = eval(json.script);
      guiElement.id = json.id;
      return callback(guiElement);
    });
  };

  WidgetManager.loadRenderer = function(url, callback) {
    return WidgetManager.loadScript('renderer', url, callback);
  };

  WidgetManager.loadWidget = function(url, callback) {
    return WidgetManager.loadScript('widget', url, callback);
  };

  WidgetManager.getRendererEntity = function(entity, callback) {
    return WidgetManager.loadRenderer('entity/' + entity.fullName, callback);
  };

  WidgetManager.getRendererAttribute = function(entity, attribute, callback) {
    return WidgetManager.loadRenderer('entity/' + entity.fullName + '/' + attribute.name, callback);
  };

  WidgetManager.getWidget = function(renderer, hook, callback) {
    return WidgetManager.loadWidget(renderer.id + '/' + hook, callback);
  };

  WidgetManager.getRootRenderer = function(callback) {
    return callback(new RootRenderer);
  };

}).call(this);
