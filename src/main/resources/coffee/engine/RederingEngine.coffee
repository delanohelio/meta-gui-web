window.HOST = 'http://localhost:8081/'
window.RederingEngine = {}

RederingEngine.openApp = (view) ->
	WidgetManager.getRootRenderer (rootRenderer) =>
		DataManager.getAllEntitiesTypes (allEntitiesTypes) =>
			rootRenderer.render view, allEntitiesTypes

RederingEngine.getWidget = (entityType, propertyTypeType, context) ->
	rule = RulesManager.getRule(context, propertyTypeType)
	widget = WidgetManager.getWidget(rule.widgetID, rule.widgetVersion)
	widget.configuration = $.parseJSON(rule.configuration)
	widget

$ -> 
	RulesManager.downloadAllRules()
	WidgetManager.downloadAllWidgets()
	RederingEngine.openApp View.emptyPage()
