class MultiSelectBoxWidget extends RelationshipWidget

	render: (view) ->
		@multiSelectField = $("<select multiple>")
		view.append @multiSelectField
		multiSelectField = @multiSelectField
		configuration = @configuration
		relationship = []
		if(@relationship)
			@relationship.forEach (entity) =>
				relationship.push entity.id
		DataManager.getEntities @relationshipType.targetType.resource, (entities) =>
			entities.forEach (entity) ->
				option = new Option(entity.id)
				if(configuration)
					option = new Option(entity[configuration.propertyKey], entity.id)
				multiSelectField.append option
				if(relationship.indexOf(entity.id) != -1)
					option.selected = true 
	
	injectValue: (entity) ->
		value = []
		if(@multiSelectField.val())
			@multiSelectField.val().forEach (selected) =>
				value.push {id: parseInt(selected)}
		entity[@relationshipType.name] = value 

return new MultiSelectBoxWidget