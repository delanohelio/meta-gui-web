class ComboBoxWidget extends RelationshipWidget

	render: (view) ->
		@selectField = $("<select>")
		view.append @selectField
		selectField = @selectField
		configuration = @configuration
		DataManager.getEntities @relationshipType.targetType.resource, (entities) =>
			entities.forEach (entity) ->
				option = new Option(entity.id)
				if(configuration)
					option = new Option(entity[configuration.propertyKey], entity.id)
				selectField.append option
	
	injectValue: (entity) ->
		entity[@relationshipType.name] = {id: parseInt(@selectField[0].selectedOptions[0].value)}

return new ComboBoxWidget