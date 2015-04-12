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

RederingEngine.peformContext = (view, entityType, context) ->
	rule = RulesManager.getRule(context)
	widget = eval rule.widget.code
	if(rule.providedContext.type == "EntitySet")
		DataManager.getEntityType entityType.id, (entityTypeFull) =>
			DataManager.getEntities entityTypeFull.resource, (instances) =>
				widget.render view, entityTypeFull, instances, rule.configuration

$ -> 
	RulesManager.downloadAllRules()
	RederingEngine.openApp View.emptyPage()
