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

  RederingEngine.peformContext = function(view, entityType, context) {
    var rule, widget,
      _this = this;
    rule = RulesManager.getRule(context);
    widget = eval(rule.widget.code);
    if (rule.providedContext.type === "EntitySet") {
      return DataManager.getEntityType(entityType.id, function(entityTypeFull) {
        return DataManager.getEntities(entityTypeFull.resource, function(instances) {
          return widget.render(view, entityTypeFull, instances, rule.configuration);
        });
      });
    }
  };

  $(function() {
    RulesManager.downloadAllRules();
    return RederingEngine.openApp(View.emptyPage());
  });

}).call(this);
