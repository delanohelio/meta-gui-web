(function() {
  var _this = this;

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

  RenderingEngine.getWidget = function(contextName, contextType, entityType, propertyType, propertyTypeType, relationshipTargetCardinality) {
    var rule, widget;
    rule = RulesManager.getRule(contextName, contextType, entityType, propertyType, propertyTypeType, relationshipTargetCardinality);
    widget = WidgetManager.getWidget(rule.widget.id, rule.widget.version);
    widget.configuration = $.parseJSON(rule.configuration);
    return widget;
  };

  RenderingEngine.geRelationshipWidget = function(context, entityType, propertyType, relationshipTargetCardinality) {
    return RenderingEngine.getWidget(context, 'Relationship', entityType, propertyType, propertyTypeType, null);
  };

  RenderingEngine.getPropertyWidget = function(context, entityType, propertyType) {
    return RenderingEngine.getWidget(context, 'Property', entityType, propertyType.name, propertyType.type, null);
  };

  RenderingEngine.getEntityWidget = function(context, entityType) {
    return RenderingEngine.getWidget(context, 'Entity', entityType.name, null, null, null);
  };

  RenderingEngine.getEntitySetWidget = function(context, entityType) {
    return RenderingEngine.getWidget(context, 'Entity', entityType.name, null, null, null);
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
