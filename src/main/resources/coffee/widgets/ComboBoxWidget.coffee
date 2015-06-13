class ComboBoxWidget extends RelationshipWidget

	render: (view) ->
		selectField = $("<select>")
		@selectField = selectField
		view.append @selectField
		DataManager.getEntities @relationshipType.targetType.resource, (entities) =>
			entities.forEach (entity) ->
				option = new Option(entity.id)
				if(@configuration)
					option = new Option(entity[@configuration.propertyKey], entity.id)
				selectField.append option

return new ComboBoxWidget