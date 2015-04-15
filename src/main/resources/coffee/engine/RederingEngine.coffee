window.HOST = 'http://localhost:8081/'
window.RederingEngine = {}

RederingEngine.downloadWidgets = () ->
	$.getJSON 'http://localhost:8081/widgets', (json) =>
		alert json

RederingEngine.loadData = (url, callback) ->
	$.getJSON 'http://localhost:8081/' + url, (json) =>
			callback(json)

RederingEngine.openApp = (view) ->
	WidgetManager.getRootRenderer (rootRenderer) =>
		DataManager.getAllEntitiesTypes (allEntitiesTypes) =>
			rootRenderer.render view, allEntitiesTypes

RederingEngine.getWidget = (entityType, propertyTypeType, context) ->
	rule = RulesManager.getRule(context, propertyTypeType)
	widget = eval rule.widget.code
	widget

$ -> 
	RulesManager.downloadAllRules()
	RederingEngine.openApp View.emptyPage()
