class ComboBoxWidget extends RelationshipWidget

	render: (view) ->
		@selectField = $("<select>")
		view.append @selectField
		selectField = @selectField
		configuration = @configuration
		relationship = @relationship
		DataManager.getEntities @relationshipType.targetType.resource, (entities) =>
			entities.forEach (entity) ->
				option = new Option(entity.id)
				if(configuration)
					option = new Option(entity[configuration.propertyKey], entity.id)
				selectField.append option
			if(relationship)
				selectField[0].value = relationship.id 
	
	injectValue: (entity) ->
		entity[@relationshipType.name] = {id: parseInt(@selectField.val())}

return new ComboBoxWidget