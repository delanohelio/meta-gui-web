window.RedetingEngine = {}

RedetingEngine.downloadWidgets = () ->
	$.getJSON 'http://localhost:8081/widgets.json', (json) =>
		alert json

$ -> 
	RedetingEngine.downloadWidgets()
