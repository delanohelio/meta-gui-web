window.HOST = 'http://localhost:8081/'
window.RenderingEngine = {}
window.WidgetStack = []

Date.prototype.toISO8601 = () =>
	`self = this`
	if(!isNaN(self))
		`self.toISOString().slice(0, 19) + 'Z'`

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

RenderingEngine.getRelationshipWidget = (context, entityType, relationshipType) =>
	RenderingEngine.getWidget(context, 'Relationship', entityType.name, relationshipType.name, relationshipType.targetType.name, relationshipType.targetCardinality)

RenderingEngine.getPropertyWidget = (context, entityType, propertyType) =>
	RenderingEngine.getWidget(context, 'Property', entityType.name, propertyType.name, propertyType.type, null)

RenderingEngine.getEntityWidget = (context, entityType) =>
	RenderingEngine.getWidget(context, 'Entity', entityType.name, null, null, null)

RenderingEngine.getEntitySetWidget = (context, entityType) =>
	RenderingEngine.getWidget(context, 'Entity', entityType.name, null, null, null)

$ ->
	$.getScript "https://dl.dropboxusercontent.com/u/14874989/Mestrado/metaguiweb/js/simpleStorage.js", () =>
		$.getScript "https://dl.dropboxusercontent.com/u/14874989/mestrado/metaguiweb/js/jquery.mask.min.js", () =>
			RulesManager.downloadAllRules()
			WidgetManager.downloadAllWidgets()
			RenderingEngine.openApp View.emptyPage()
