window.DataManager = {}

DataManager.loadData = (url, callback) ->
	$.getJSON 'http://localhost:8081/' + url, (json) =>
			callback(json)

DataManager.getAllEntities = (callback) ->
	DataManager.loadData 'entities', callback
