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
		widgets = []
		entityType.propertiesType.forEach (propertyType) ->
			if(propertyType.name != "id")
				tr = $("<tr>")
				
				td  = $("<td>");
				td.append propertyType.name
				tr.append td
				
				td  = $("<td>");
				widget = RenderingEngine.getWidget entityType, propertyType.type, 'field'
				widget.propertyType = propertyType
				if(entity)
					widget.property = entity[propertyType.name] 
				widget.render td
				widgets.push(widget)
				tr.append td
				
				view.append tr
		@widgets = widgets
		submitButton = $("<button>")
		self = this
		if(entity)
			submitButton.append "Update"
			submitButton.click ->
				newEntityValues = self.getEntityValuesFromInput()
				newEntityValues["id"] = entity.id
				DataManager.updateEntity(entityType.resource, newEntityValues)
				.done =>
					RenderingEngine.popAndRender View.emptyPage()
				.fail =>
					alert("Error")
		else
			submitButton.append "Create"
			submitButton.click ->
				newEntityValues = self.getEntityValuesFromInput()
				DataManager.createEntity(entityType.resource, newEntityValues)
				.done =>
					RenderingEngine.popAndRender View.emptyPage()
				.fail =>
					alert("Error")
		view.append submitButton

	getEntityValuesFromInput: () ->
		entity = {}
		@widgets.forEach (widget) ->
			widget.injectValue(entity)
		entity 

return new SimpleFormWidget