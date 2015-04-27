(function() {

  window.HOST = 'http://localhost:8081/';

  window.RenderingEngine = {};

  window.WidgetStack = [];

  RenderingEngine.pushWidget = function(widget) {
    return WidgetStack.push(widget);
  };

  RenderingEngine.popAndRender = function(view) {
    return WidgetStack.pop().render(view);
  };

  RenderingEngine.openApp = function(view) {
    var _this = this;
    return WidgetManager.getRootRenderer(function(rootRenderer) {
      return DataManager.getAllEntitiesTypes(function(allEntitiesTypes) {
        return rootRenderer.render(view, allEntitiesTypes);
      });
    });
  };

  RenderingEngine.getWidget = function(entityType, propertyTypeType, context) {
    var rule, widget;
    rule = RulesManager.getRule(context, propertyTypeType);
    widget = WidgetManager.getWidget(rule.widgetID, rule.widgetVersion);
    widget.configuration = $.parseJSON(rule.configuration);
    return widget;
  };

  $(function() {
    var _this = this;
    return $.getScript("https://dl.dropboxusercontent.com/u/14874989/Mestrado/metaguiweb/js/simpleStorage.js", function() {
      RulesManager.downloadAllRules();
      WidgetManager.downloadAllWidgets();
      return RenderingEngine.openApp(View.emptyPage());
    });
  });

}).call(this);
