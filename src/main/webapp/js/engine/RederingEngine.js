(function() {

  window.HOST = 'http://localhost:8081/';

  window.RederingEngine = {};

  RederingEngine.downloadWidgets = function() {
    var _this = this;
    return $.getJSON('http://localhost:8081/widgets', function(json) {
      return alert(json);
    });
  };

  RederingEngine.loadData = function(url, callback) {
    var _this = this;
    return $.getJSON('http://localhost:8081/' + url, function(json) {
      return callback(json);
    });
  };

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
    widget = eval(rule.widget.code);
    return widget;
  };

  $(function() {
    RulesManager.downloadAllRules();
    return RederingEngine.openApp(View.emptyPage());
  });

}).call(this);
