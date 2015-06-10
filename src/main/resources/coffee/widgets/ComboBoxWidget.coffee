class ComboBoxWidget extends RelationshipWidget

	render: (view) ->
		@selectField = $("<select>")
		view.append @selectField
		DataManager.getEntities @relationType.targetType.resource, (entities) =>
			entities.forEach (entity) ->
				option = new Option(entity.id)
				if(@configuration.propertyKey)
					option = new Option(entity[@configuration.propertyKey], entity.id)
				@selectField.add option

return new ComboBoxWidget