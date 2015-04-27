window.WidgetManager = {}

WidgetManager.STORAGE_TAG = "WIDGETS"

WidgetManager.downloadAllWidgets = () ->
	$.getJSON HOST + 'widgets', (widgetsSpec) =>
		widgetsSpec.forEach (widgetSpec) =>
			simpleStorage.set(WidgetManager.STORAGE_TAG + widgetSpec.id + widgetSpec.version, widgetSpec)
			widget = eval widgetSpec.code
			if(widget.require && !window[widget.require.name])
				$.getScript widget.require.url


WidgetManager.getWidget = (id, version) ->
	widgetSpec = simpleStorage.get(WidgetManager.STORAGE_TAG + id + version)
	widget = eval widgetSpec.code
	widget.id = widgetSpec.id
	widget.version = widgetSpec.version
	widget.name = widgetSpec.name
	widget.type = widgetSpec.type
	widget

WidgetManager.getRootRenderer = (callback) ->
	callback(new RootRenderer)