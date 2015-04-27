window.HOST = 'http://localhost:8081/'
window.RenderingEngine = {}
window.WidgetStack = []

RenderingEngine.pushWidget = (widget) ->
	WidgetStack.push(widget)

RenderingEngine.popAndRender = (view) ->
	WidgetStack.pop().render(view)

RenderingEngine.openApp = (view) ->
	WidgetManager.getRootRenderer (rootRenderer) =>
		DataManager.getAllEntitiesTypes (allEntitiesTypes) =>
			rootRenderer.render view, allEntitiesTypes

RenderingEngine.getWidget = (entityType, propertyTypeType, context) ->
	rule = RulesManager.getRule(context, propertyTypeType)
	widget = WidgetManager.getWidget(rule.widgetID, rule.widgetVersion)
	widget.configuration = $.parseJSON(rule.configuration)
	widget

$ ->
	$.getScript "https://dl.dropboxusercontent.com/u/14874989/Mestrado/metaguiweb/js/simpleStorage.js", () =>
		RulesManager.downloadAllRules()
		WidgetManager.downloadAllWidgets()
		RenderingEngine.openApp View.emptyPage()
