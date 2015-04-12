window.RederingEngine = {}

RederingEngine.downloadWidgets = () ->
	$.getJSON 'http://localhost:8081/widgets', (json) =>
		alert json

RederingEngine.loadData = (url, callback) ->
	$.getJSON 'http://localhost:8081/' + url, (json) =>
			callback(json)

RederingEngine.openApp = (view) ->
	WidgetManager.getRootRenderer (rootRenderer) =>
		DataManager.getAllEntities (allEntities) =>
			rootRenderer.render view, allEntities

RederingEngine.entityEvent = (view, entity, context) ->
	rule = RulesManager.getRule(context)
	widget = eval rule.widget.code
	widget.render view, entity, [], null

$ -> 
	RulesManager.downloadAllRules()
	RederingEngine.openApp View.emptyPage()
