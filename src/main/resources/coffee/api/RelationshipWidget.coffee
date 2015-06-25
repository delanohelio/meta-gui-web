class window.RelationshipWidget

	render: (view, relationType, relation) ->
		
	populateSelectField: (selectField, resource, propertyKey, relationshipIds) ->
		DataManager.getEntities resource, (entities) =>
			entities.forEach (entity) ->
				option = new Option(entity.id)
				if(propertyKey)
					option = new Option(entity[propertyKey], entity.id)
				selectField.append option
				if(relationshipIds && relationshipIds.indexOf(entity.id) != -1)
					option.selected = true

