(function() {

  window.HOST = 'http://localhost:8081/';

  window.RederingEngine = {};

  RederingEngine.openApp = function(view) {
    var _this = this;
    return WidgetManager.getRootRenderer(function(rootRenderer) {
      return DataManager.getAllEntitiesTypes(function(allEntitiesTypes) {
        return rootRenderer.render(view, allEntitiesTypes);
      });
    });
  };

  RederingEngine.getWidget = function(entityType, propertyTypeType, context) {
    var rule, widget;
    rule = RulesManager.getRule(context, propertyTypeType);
    widget = WidgetManager.getWidget(rule.widgetID, rule.widgetVersion);
    widget.configuration = $.parseJSON(rule.configuration);
    return widget;
  };

  $(function() {
    RulesManager.downloadAllRules();
    WidgetManager.downloadAllWidgets();
    return RederingEngine.openApp(View.emptyPage());
  });

}).call(this);
