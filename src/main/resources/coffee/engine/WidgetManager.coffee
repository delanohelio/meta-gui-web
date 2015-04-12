window.WidgetManager = {}

WidgetManager.loadScript = (type, url, callback) ->
	$.getJSON 'api/' + type + '/' + url, (json) =>
		guiElement = eval json.script
		guiElement.id = json.id
		callback(guiElement)

WidgetManager.loadRenderer = (url, callback) ->
	WidgetManager.loadScript('renderer', url, callback);

WidgetManager.loadWidget = (url, callback) ->
	WidgetManager.loadScript('widget', url, callback);

WidgetManager.getRendererEntity = (entity, callback) ->
	WidgetManager.loadRenderer 'entity/' + entity.fullName, callback

WidgetManager.getRendererAttribute = (entity, attribute, callback) ->
	WidgetManager.loadRenderer 'entity/' + entity.fullName + '/' + attribute.name, callback

WidgetManager.getWidget = (renderer, hook, callback) ->
	WidgetManager.loadWidget renderer.id + '/' + hook , callback

WidgetManager.getRootRenderer = (callback) ->
	callback(new RootRenderer)