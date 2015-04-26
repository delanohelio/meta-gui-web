class SimpleFormWidget extends EntityWidget

	render: (view, entityType, entity) ->
		title = $("<h2>")
		title.append entityType.name
		view.append title
		table = $("<table>")
		view.append table
		entityType.propertiesType.forEach (property) ->
			if(property.name != "id")
				tr = $("<tr>")
				
				td  = $("<td>");
				td.append property.name
				tr.append td
				
				td  = $("<td>");
				textField = $("<input>")
				textField.attr "id", entityType.resource + "_" + property.name
				if(entity)
					textField.val(entity[property.name])
				
				td.append textField
				tr.append td
				
				view.append tr
		submitButton = $("<button>")
		self = this
		if(entity)
			submitButton.append "Update"
			submitButton.click ->
				newEntityValues = self.getEntityValuesFromInput(entityType)
				newEntityValues["id"] = entity.id
				DataManager.updateEntity entityType.resource, newEntityValues
		else
			submitButton.append "Create"
			submitButton.click ->
				newEntityValues = self.getEntityValuesFromInput(entityType)
				DataManager.createEntity entityType.resource, newEntityValues
		view.append submitButton

	getEntityValuesFromInput: (entityType) ->
		entity = {}
		entityType.propertiesType.forEach (property) ->
			if(property.name != "id")
				value = $("#" + entityType.resource + "_" + property.name).val()
				if(value && property.type == "int")
					value = parseInt(value)
				else if(value && property.type == "real")
					value = parseFloat(value)
				else if(value && property.type == "date")
					value = new Date(value)
				else if(value)
					entity[property.name] = value
		entity 

return new SimpleFormWidget