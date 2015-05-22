(function() {

  window.WidgetManager = {};

  WidgetManager.STORAGE_TAG = "WIDGETS";

  WidgetManager.downloadAllWidgets = function() {
    var _this = this;
    return $.getJSON(HOST + 'widgets', function(widgetsSpec) {
      return widgetsSpec.forEach(function(widgetSpec) {
        var widget;
        simpleStorage.set(WidgetManager.STORAGE_TAG + widgetSpec.id + widgetSpec.version, widgetSpec);
        widget = eval(widgetSpec.code);
        if (widget.require && !window[widget.require.name]) {
          return $.getScript(widget.require.url);
        }
      });
    });
  };

  WidgetManager.getWidget = function(id, version) {
    var widget, widgetSpec;
    widgetSpec = simpleStorage.get(WidgetManager.STORAGE_TAG + id + version);
    widget = eval(widgetSpec.code);
    widget.id = widgetSpec.id;
    widget.version = widgetSpec.version;
    widget.name = widgetSpec.name;
    widget.type = widgetSpec.type;
    return widget;
  };

  WidgetManager.getRootRenderer = function(callback) {
    return callback(new RootRenderer);
  };

}).call(this);
