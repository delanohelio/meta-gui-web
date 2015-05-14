window.HOST = 'http://localhost:8081/'
window.RenderingEngine = {}
window.WidgetStack = []

Date.prototype.toISO8601 = () =>
	`this.toISOString().slice(0, 19) + 'Z'`

Date.prototype.toJSON = () =>
	`this.toISO8601()`

RenderingEngine.pushWidget = (widget) ->
	WidgetStack.push(widget)

RenderingEngine.popAndRender = (view) ->
	WidgetStack.pop().render(view)

RenderingEngine.openApp = (view) ->
	WidgetManager.getRootRenderer (rootRenderer) =>
		DataManager.getAllEntitiesTypes (allEntitiesTypes) =>
			rootRenderer.render view, allEntitiesTypes

RenderingEngine.getWidget = (contextName, contextType, entityType, propertyType, propertyTypeType, relationshipTargetCardinality) =>
	rule = RulesManager.getRule(contextName, contextType, entityType, propertyType, propertyTypeType, relationshipTargetCardinality)
	widget = WidgetManager.getWidget(rule.widget.id, rule.widget.version)
	widget.configuration = $.parseJSON(rule.configuration)
	widget

RenderingEngine.geRelationshipWidget = (context, entityType, propertyType, relationshipTargetCardinality) =>
	RenderingEngine.getWidget(context, 'Relationship', entityType, propertyType, propertyTypeType, null)

RenderingEngine.getPropertyWidget = (context, entityType, propertyType) =>
	RenderingEngine.getWidget(context, 'Property', entityType, propertyType.name, propertyType.type, null)

RenderingEngine.getEntityWidget = (context, entityType) =>
	RenderingEngine.getWidget(context, 'Entity', entityType.name, null, null, null)

RenderingEngine.getEntitySetWidget = (context, entityType) =>
	RenderingEngine.getWidget(context, 'Entity', entityType.name, null, null, null)

$ ->
	$.getScript "https://dl.dropboxusercontent.com/u/14874989/Mestrado/metaguiweb/js/simpleStorage.js", () =>
		RulesManager.downloadAllRules()
		WidgetManager.downloadAllWidgets()
		RenderingEngine.openApp View.emptyPage()
