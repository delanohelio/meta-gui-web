class SimpleFormWidget extends EntityWidget

	render: (view) ->
		self = this
		if(@entityID)
			DataManager.getEntity @entityType.resource, @entityID, (entity) =>
				self.draw(view, self.entityType, entity)
		else
			self.draw(view, @entityType)

	draw: (view, entityType, entity) ->
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
				DataManager.updateEntity(entityType.resource, newEntityValues)
				.done =>
					RenderingEngine.popAndRender View.emptyPage()
				.fail =>
					alert("Error")
		else
			submitButton.append "Create"
			submitButton.click ->
				newEntityValues = self.getEntityValuesFromInput(entityType)
				DataManager.createEntity(entityType.resource, newEntityValues)
				.done =>
					RenderingEngine.popAndRender View.emptyPage()
				.fail =>
					alert("Error")
		view.append submitButton

	getEntityValuesFromInput: (entityType) ->
		entity = {}
		entityType.propertiesType.forEach (property) ->
			if(property.name != "id")
				entity[property.name] = $("#" + entityType.resource + "_" + property.name).value()
		entity 

return new SimpleFormWidget