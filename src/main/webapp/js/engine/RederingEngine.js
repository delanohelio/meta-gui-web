(function() {

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
      return DataManager.getAllEntities(function(allEntities) {
        return rootRenderer.render(view, allEntities);
      });
    });
  };

  RederingEngine.entityEvent = function(view, entity, context) {
    var rule, widget;
    rule = RulesManager.getRule(context);
    widget = eval(rule.widget.code);
    return widget.render(view, entity, [], null);
  };

  $(function() {
    RulesManager.downloadAllRules();
    return RederingEngine.openApp(View.emptyPage());
  });

}).call(this);
