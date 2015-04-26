window.DataManager = {}

DataManager.loadData = (url, callback) ->
	$.getJSON HOST + url, (json) =>
			callback(json)

DataManager.getAllEntitiesTypes = (callback) ->
	DataManager.loadData 'entities', callback

DataManager.getEntityType = (entityId, callback) ->
	DataManager.loadData 'entities/' + entityId, callback

DataManager.getEntities = (entityTypeResource, callback) ->
	DataManager.loadData 'api/' + entityTypeResource, callback

DataManager.createEntity = (entityTypeResource, entity, success, error) ->
	$.ajax
		url: HOST + "api/" + entityTypeResource
		type: "POST"
		data: JSON.stringify(entity)
		contentType: "application/json; charset=utf-8"
		error: (jqXHR, textStatus, errorThrown) ->
			error(textStatus)
		success: (data, textStatus, jqXHR) ->
			success(data)
	

DataManager.updateEntity = (entityTypeResource, entity, success, error) ->
	$.ajax
		url: HOST + "api/" + entityTypeResource + "/" + entity.id
		type: "PUT"
		data: JSON.stringify(entity)
		error: (jqXHR, textStatus, errorThrown) ->
			error(textStatus)
		success: (data, textStatus, jqXHR) ->
			success(data)

DataManager.deleteEntity = (entityTypeResource, entityID, success, error) ->
	$.ajax
		url: HOST + "api/" + entityTypeResource + "/" + entityID
		type: "DELETE"
		error: (jqXHR, textStatus, errorThrown) ->
			error(textStatus)
		success: (data, textStatus, jqXHR) ->
			success(data)
